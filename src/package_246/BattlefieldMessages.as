package package_246
{
   import controls.Label;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   
   public class BattlefieldMessages extends Sprite
   {
       
      
      private const const_1563:int = 3;
      
      private const const_1564:int = 18;
      
      private var var_1412:int;
      
      private var messages:Vector.<Message>;
      
      private var var_1413:int;
      
      private var var_1414:Vector.<Message>;
      
      public function BattlefieldMessages()
      {
         this.messages = new Vector.<Message>();
         this.var_1414 = new Vector.<Message>();
         super();
         filters = [new GlowFilter(0,0.75,5,5)];
      }
      
      public function addMessage(param1:uint, param2:String) : void
      {
         this.method_1628();
         var _loc3_:Message = this.messages[this.var_1412] = this.method_1629();
         _loc3_.init();
         this.method_1627(_loc3_,param1,param2);
      }
      
      public function method_1632(param1:uint, param2:String, param3:int) : void
      {
         this.method_1628();
         var _loc4_:Message = this.messages[this.var_1412] = this.method_1629();
         _loc4_.name_2077(param3);
         this.method_1627(_loc4_,param1,param2);
      }
      
      private function method_1628() : void
      {
         if(this.var_1412 == 3)
         {
            this.method_1630(0);
         }
      }
      
      private function method_1627(param1:Message, param2:uint, param3:String) : void
      {
         var _loc4_:Label = param1.name_2075();
         addChild(_loc4_);
         _loc4_.color = param2;
         _loc4_.text = param3;
         _loc4_.x = -0.5 * _loc4_.width;
         _loc4_.y = 18 * this.var_1412;
         ++this.var_1412;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:Message = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.var_1412)
         {
            _loc2_ = this.messages[_loc3_];
            if(_loc2_.name_2076)
            {
               this.method_1630(_loc3_);
               _loc3_--;
            }
            else
            {
               _loc2_.update(param1);
            }
            _loc3_++;
         }
      }
      
      public function removeFromParent() : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function method_1630(param1:int) : void
      {
         var _loc2_:Label = null;
         var _loc3_:Message = this.messages[param1];
         this.method_1631(_loc3_);
         var _loc4_:int = param1 + 1;
         while(_loc4_ < this.var_1412)
         {
            _loc3_ = this.messages[int(_loc4_ - 1)] = this.messages[_loc4_];
            _loc2_ = _loc3_.name_2075();
            _loc2_.y -= 18;
            _loc4_++;
         }
         --this.var_1412;
      }
      
      private function method_1631(param1:Message) : void
      {
         removeChild(param1.name_2075());
         var _loc2_:* = this.var_1413++;
         this.var_1414[_loc2_] = param1;
      }
      
      private function method_1629() : Message
      {
         var _loc1_:Message = null;
         if(this.var_1413 == 0)
         {
            _loc1_ = new Message();
         }
         else
         {
            _loc1_ = this.var_1414[--this.var_1413];
            this.var_1414[this.var_1413] = null;
         }
         return _loc1_;
      }
   }
}
