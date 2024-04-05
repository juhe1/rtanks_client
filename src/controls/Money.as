package controls
{
   public class Money
   {
      
      public static const const_1610:String = " ¤";
       
      
      public function Money()
      {
         super();
      }
      
      public static function method_1839(param1:Number) : String
      {
         var _loc2_:Array = new Array();
         var _loc3_:String = String(param1);
         var _loc4_:int = _loc3_.length - int(_loc3_.length / 3) * 3;
         var _loc5_:int = 0;
         if(_loc4_ > 0)
         {
            _loc3_ = (_loc4_ == 1 ? "  " : " ") + _loc3_;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc2_.push(_loc3_.substr(_loc5_,3));
            _loc5_ += 3;
         }
         _loc3_ = _loc2_.join(" ");
         if(_loc4_ > 0)
         {
            _loc3_ = _loc3_.substr(3 - _loc4_);
         }
         return _loc3_ + " ¤";
      }
      
      public static function name_876(param1:Number, param2:Boolean = true) : String
      {
         var _loc3_:Array = new Array();
         var _loc4_:String = param2 ? String(int(param1)) : String(Math.round(param1));
         var _loc5_:int = _loc4_.length - int(_loc4_.length / 3) * 3;
         var _loc6_:int = 0;
         if(_loc5_ > 0)
         {
            _loc4_ = (_loc5_ == 1 ? "  " : " ") + _loc4_;
         }
         _loc6_ = 0;
         while(_loc6_ < _loc4_.length)
         {
            _loc3_.push(_loc4_.substr(_loc6_,3));
            _loc6_ += 3;
         }
         _loc4_ = _loc3_.join(" ");
         if(_loc5_ > 0)
         {
            _loc4_ = _loc4_.substr(3 - _loc5_);
         }
         return _loc4_ + (param2 ? param1.toFixed(10).substr(-11,3) : "");
      }
   }
}
