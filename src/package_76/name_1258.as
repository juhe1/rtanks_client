package package_76
{
   public class name_1258
   {
      
      private static const const_1817:Number = 12;
      
      private static const const_1814:Number = 16;
      
      private static const const_1815:Number = 9;
      
      private static const const_1816:Number = 1.5707963267948966;
       
      
      public function name_1258()
      {
         super();
      }
      
      public static function name_1283(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = param2 / 9;
         var _loc7_:Number = param1 / _loc6_;
         if(_loc7_ <= 12)
         {
            return 1.5707963267948966;
         }
         _loc3_ = _loc7_ - (16 - 12);
         if(_loc3_ < 12)
         {
            _loc3_ = 12;
         }
         _loc4_ = _loc3_ * _loc6_;
         _loc5_ = Math.sqrt(_loc4_ * _loc4_ + param2 * param2) * 0.5 / Math.tan(1.5707963267948966 * 0.5);
         return Math.atan(Math.sqrt(param1 * param1 + param2 * param2) * 0.5 / _loc5_) * 2;
      }
   }
}
