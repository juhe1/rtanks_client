package package_427
{
   import flash.display.Sprite;
   import package_47.BattleTeamType;
   
   public class class_179 extends Sprite
   {
      
      private static const const_1885:uint = 4691967;
      
      private static const const_1884:uint = 15741974;
      
      private static const const_45:uint = 65280;
       
      
      protected var var_2217:int = 3;
      
      protected var var_170:Sprite;
      
      protected var shift:Number;
      
      public function class_179()
      {
         this.var_170 = new Sprite();
         super();
         addChild(this.var_170);
      }
      
      public static function method_2283(param1:BattleTeamType) : uint
      {
         switch(param1)
         {
            case BattleTeamType.BLUE:
               return 4691967;
            case BattleTeamType.RED:
               return 15741974;
            default:
               return 65280;
         }
      }
      
      public function name_1352(param1:Boolean = false) : name_2537
      {
         var _loc2_:int = this.var_170.numChildren;
         if(_loc2_ == 0)
         {
            return null;
         }
         var _loc3_:name_2537 = name_2537(this.var_170.getChildAt(0));
         this.shift = int(_loc3_.height + _loc3_.y + this.var_2217);
         this.var_170.removeChild(_loc3_);
         _loc2_--;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_170.getChildAt(_loc4_).y = this.var_170.getChildAt(_loc4_).y - this.shift;
            _loc4_++;
         }
         return _loc3_;
      }
      
      protected function method_2284(param1:name_2537) : void
      {
         param1.y = 0;
         param1.alpha = 1;
         this.var_170.addChildAt(param1,0);
         var _loc2_:int = this.var_170.numChildren;
         var _loc3_:int = 1;
         while(_loc3_ < _loc2_)
         {
            this.var_170.getChildAt(_loc3_).y = this.var_170.getChildAt(_loc3_).y + int(param1.height + this.var_2217);
            _loc3_++;
         }
      }
      
      protected function method_2285(param1:name_2537) : void
      {
         var _loc2_:int = this.var_170.numChildren > 0 ? int(this.var_170.height + this.var_2217) : 0;
         param1.y = _loc2_;
         this.var_170.addChild(param1);
      }
   }
}
