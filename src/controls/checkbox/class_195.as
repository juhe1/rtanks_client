package controls.checkbox
{
   import controls.base.name_1134;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class class_195 extends Sprite
   {
      
      private static const const_2165:Class = name_2839;
      
      private static const const_2166:BitmapData = Bitmap(new const_2165()).bitmapData;
      
      private static const const_2159:Class = name_2841;
      
      private static const const_2164:BitmapData = Bitmap(new const_2159()).bitmapData;
      
      private static const const_2160:Class = name_2840;
      
      private static const const_2161:BitmapData = Bitmap(new const_2160()).bitmapData;
      
      private static const const_2162:Class = name_2838;
      
      private static const const_2163:BitmapData = Bitmap(new const_2162()).bitmapData;
       
      
      private var var_2773:Bitmap;
      
      private var var_2774:Bitmap;
      
      private var var_2777:Bitmap;
      
      private var var_2775:Bitmap;
      
      private var var_2778:Array;
      
      private var var_2681:Boolean;
      
      private var var_2776:Boolean;
      
      private var _enabled:Boolean;
      
      protected var var_2772:name_1134;
      
      public function class_195(param1:BitmapData = null)
      {
         super();
         this.var_2774 = new Bitmap(const_2164);
         addChild(this.var_2774);
         this.var_2777 = new Bitmap(const_2161);
         addChild(this.var_2777);
         this.var_2775 = new Bitmap(const_2163);
         addChild(this.var_2775);
         this.var_2773 = new Bitmap(param1 != null ? param1 : const_2166);
         addChild(this.var_2773);
         this.var_2773.visible = false;
         this.var_2778 = [this.var_2774,this.var_2777,this.var_2775];
         tabEnabled = false;
         this.method_2612(this.var_2774);
         this.enabled = true;
         this.var_2772 = new name_1134();
         this.var_2772.x = 29;
         this.var_2772.y = 7;
         addChild(this.var_2772);
      }
      
      private function method_2612(param1:Bitmap) : void
      {
         var _loc2_:Bitmap = null;
         for each(_loc2_ in this.var_2778)
         {
            _loc2_.visible = false;
         }
         param1.visible = true;
      }
      
      public function get checked() : Boolean
      {
         return this.var_2681;
      }
      
      public function method_2613(param1:Boolean) : void
      {
         if(this.var_2681 != param1)
         {
            this.var_2681 = param1;
            this.var_2773.visible = this.var_2681;
         }
      }
      
      public function set checked(param1:Boolean) : void
      {
         if(this.var_2681 != param1)
         {
            this.method_530();
         }
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(this._enabled != param1)
         {
            this._enabled = param1;
            if(this._enabled)
            {
               buttonMode = true;
               mouseEnabled = true;
               this.method_1472();
            }
            else
            {
               buttonMode = false;
               mouseEnabled = false;
               this.method_91();
            }
         }
      }
      
      public function set label(param1:String) : void
      {
         this.var_2772.text = param1;
      }
      
      public function method_2614(param1:int) : void
      {
         this.var_2772.y += param1;
      }
      
      private function method_1472() : void
      {
         addEventListener(MouseEvent.MOUSE_OVER,this.method_1470);
         addEventListener(MouseEvent.MOUSE_OUT,this.method_1470);
         addEventListener(MouseEvent.MOUSE_DOWN,this.method_1470);
         addEventListener(MouseEvent.MOUSE_UP,this.method_1470);
      }
      
      private function method_91() : void
      {
         removeEventListener(MouseEvent.MOUSE_OVER,this.method_1470);
         removeEventListener(MouseEvent.MOUSE_OUT,this.method_1470);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.method_1470);
         removeEventListener(MouseEvent.MOUSE_UP,this.method_1470);
      }
      
      private function method_1470(param1:MouseEvent) : void
      {
         this.var_2773.y = 0;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.method_2612(this.var_2775);
               break;
            case MouseEvent.MOUSE_OUT:
               this.var_2776 = false;
               this.method_2612(this.var_2774);
               break;
            case MouseEvent.MOUSE_DOWN:
               if(this.var_2681)
               {
                  this.var_2773.y = 2;
               }
               this.var_2776 = true;
               this.method_2612(this.var_2777);
               break;
            case MouseEvent.MOUSE_UP:
               this.method_2612(this.var_2775);
               if(this.var_2776)
               {
                  this.var_2776 = false;
                  this.method_530();
                  break;
               }
         }
      }
      
      private function method_530() : void
      {
         this.var_2681 = !this.var_2681;
         this.var_2773.visible = this.var_2681;
         dispatchEvent(new name_2018(name_2018.name_2025));
      }
   }
}
