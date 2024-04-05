package package_396
{
   public class name_3381
   {
      
      private static const const_2827:Number = 6.283185307179586;
       
      
      public function name_3381()
      {
         super();
      }
      
      public static function method_2595(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number = 0, param6:Number = 0) : Number
      {
         var _loc7_:Number = NaN;
         if(param1 == 0)
         {
            return param2;
         }
         if((param1 = param1 / param4) == 1)
         {
            return param2 + param3;
         }
         if(!param6)
         {
            param6 = param4 * 0.3;
         }
         if(!param5 || param3 > 0 && param5 < param3 || param3 < 0 && param5 < -param3)
         {
            param5 = param3;
            _loc7_ = param6 / 4;
         }
         else
         {
            _loc7_ = param6 / 6.283185307179586 * Math.asin(param3 / param5);
         }
         return -(param5 * Math.pow(2,10 * (param1 = param1 - 1)) * Math.sin((param1 * param4 - _loc7_) * 6.283185307179586 / param6)) + param2;
      }
      
      public static function method_2593(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number = 0, param6:Number = 0) : Number
      {
         var _loc7_:Number = NaN;
         if(param1 == 0)
         {
            return param2;
         }
         if((param1 = param1 / param4) == 1)
         {
            return param2 + param3;
         }
         if(!param6)
         {
            param6 = param4 * 0.3;
         }
         if(!param5 || param3 > 0 && param5 < param3 || param3 < 0 && param5 < -param3)
         {
            param5 = param3;
            _loc7_ = param6 / 4;
         }
         else
         {
            _loc7_ = param6 / 6.283185307179586 * Math.asin(param3 / param5);
         }
         return param5 * Math.pow(2,-10 * param1) * Math.sin((param1 * param4 - _loc7_) * 6.283185307179586 / param6) + param3 + param2;
      }
      
      public static function method_2594(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number = 0, param6:Number = 0) : Number
      {
         var _loc7_:Number = NaN;
         if(param1 == 0)
         {
            return param2;
         }
         if((param1 = param1 / (param4 * 0.5)) == 2)
         {
            return param2 + param3;
         }
         if(!param6)
         {
            param6 = param4 * (0.3 * 1.5);
         }
         if(!param5 || param3 > 0 && param5 < param3 || param3 < 0 && param5 < -param3)
         {
            param5 = param3;
            _loc7_ = param6 / 4;
         }
         else
         {
            _loc7_ = param6 / 6.283185307179586 * Math.asin(param3 / param5);
         }
         if(param1 < 1)
         {
            return -0.5 * (param5 * Math.pow(2,10 * (param1 = param1 - 1)) * Math.sin((param1 * param4 - _loc7_) * 6.283185307179586 / param6)) + param2;
         }
         return param5 * Math.pow(2,-10 * (param1 = param1 - 1)) * Math.sin((param1 * param4 - _loc7_) * 6.283185307179586 / param6) * 0.5 + param3 + param2;
      }
   }
}
