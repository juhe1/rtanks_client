package controls
{
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.TextEvent;
   import flash.system.Capabilities;
   import flash.text.TextField;
   
   public class name_2777 extends TextField
   {
      
      private static const const_2358:int = -1;
      
      private static const const_2098:int = -2;
       
      
      private var var_3140:int = 0;
      
      private var var_3139:int = 0;
      
      private var utf32_char:int = -1;
      
      public function name_2777()
      {
         super();
         if(Boolean(Capabilities.os.search("Linux") != -1) && Capabilities.playerType != "StandAlone")
         {
            addEventListener(TextEvent.TEXT_INPUT,this.method_2905,false,1);
            addEventListener(KeyboardEvent.KEY_DOWN,this.keyDownHandler,false,1);
         }
      }
      
      private function utf8Decode(param1:int) : int
      {
         if(this.var_3139 == 0)
         {
            if((param1 & 128) == 0)
            {
               return param1 & 127;
            }
            if((param1 & 224) == 192)
            {
               this.var_3140 = (param1 & 31) << 6;
               this.var_3139 = 6;
            }
            else if((param1 & 240) == 224)
            {
               this.var_3140 = (param1 & 15) << 12;
               this.var_3139 = 12;
            }
            else if((param1 & 248) == 240)
            {
               this.var_3140 = (param1 & 7) << 18;
               this.var_3139 = 18;
            }
            else if((param1 & 252) == 248)
            {
               this.var_3140 = (param1 & 3) << 24;
               this.var_3139 = 24;
            }
            else
            {
               if((param1 & 254) != 252)
               {
                  return -2;
               }
               this.var_3140 = (param1 & 1) << 30;
               this.var_3139 = 30;
            }
            return -1;
         }
         if((param1 & 192) != 128)
         {
            return -2;
         }
         this.var_3139 -= 6;
         this.var_3140 |= (param1 & 63) << this.var_3139;
         if(this.var_3139 == 0)
         {
            return this.var_3140;
         }
         if(this.var_3139 > 30)
         {
            this.var_3139 = 0;
            return -2;
         }
         return -1;
      }
      
      private function keyDownHandler(param1:KeyboardEvent) : void
      {
         this.utf32_char = this.utf8Decode(param1.charCode);
      }
      
      private function method_2905(param1:TextEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:int = 0;
         if(this.utf32_char == 10 && !this.multiline)
         {
            param1.preventDefault();
            param1.stopImmediatePropagation();
            return;
         }
         if(param1.text.length == 1)
         {
            if(this.utf32_char != -1 && this.utf32_char != -2)
            {
               if(this.selectionBeginIndex == this.selectionEndIndex)
               {
                  _loc2_ = this.text.substr(0,this.caretIndex);
                  _loc3_ = this.text.substr(this.caretIndex);
                  _loc4_ = this.caretIndex + 1;
               }
               else
               {
                  _loc2_ = this.text.substr(0,this.selectionBeginIndex);
                  _loc3_ = this.text.substr(this.selectionEndIndex);
                  _loc4_ = this.selectionBeginIndex + 1;
               }
               param1.text = this.text = _loc2_ + String.fromCharCode(this.utf32_char) + _loc3_;
               this.setSelection(_loc4_,_loc4_);
               this.dispatchEvent(new Event(Event.CHANGE));
            }
            else
            {
               param1.stopImmediatePropagation();
            }
            param1.preventDefault();
         }
      }
   }
}
