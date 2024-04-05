package alternativa.tanks.utils
{
   public class name_75
   {
      
      public static const PI2:Number = 6.283185307179586;
       
      
      public function name_75()
      {
         super();
      }
      
      public static function method_218(param1:Number, param2:Number, param3:Number) : Number
      {
         if(param1 < param2)
         {
            return param2;
         }
         if(param1 > param3)
         {
            return param3;
         }
         return param1;
      }
      
      public static function method_612(param1:Number) : Number
      {
         param1 %= 6.283185307179586;
         if(param1 < -Math.PI)
         {
            return 6.283185307179586 + param1;
         }
         if(param1 > Math.PI)
         {
            return param1 - 6.283185307179586;
         }
         return param1;
      }
      
      public static function method_611(param1:Number) : Number
      {
         if(param1 < -Math.PI)
         {
            return 6.283185307179586 + param1;
         }
         if(param1 > Math.PI)
         {
            return param1 - 6.283185307179586;
         }
         return param1;
      }
      
      public static function method_614(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = param1 - param2;
         if(_loc3_ <= -Math.PI)
         {
            return _loc3_ + 6.283185307179586;
         }
         if(_loc3_ > Math.PI)
         {
            return _loc3_ - 6.283185307179586;
         }
         return _loc3_;
      }
      
      public static function method_610(param1:Number) : Number
      {
         return param1 * 180 / Math.PI;
      }
      
      public static function method_604(param1:Number) : Number
      {
         return param1 * Math.PI / 180;
      }
      
      public static function method_605(param1:int, param2:int) : int
      {
         return param1 >> param2 & 1;
      }
      
      public static function method_606(param1:int, param2:int, param3:Boolean) : int
      {
         if(param3)
         {
            return param1 | 1 << param2;
         }
         return param1 & ~(1 << param2);
      }
      
      public static function name_85(param1:int, param2:int, param3:Boolean) : int
      {
         if(param3)
         {
            return param1 | param2;
         }
         return param1 & ~param2;
      }
      
      public static function method_615(param1:int) : int
      {
         return 1 << Math.ceil(Math.log(param1) / Math.LN2);
      }
      
      public static function method_609(param1:Number, param2:Number, param3:Number) : Number
      {
         if(param1 < param2)
         {
            param1 += param3;
            return param1 > param2 ? Number(param2) : Number(param1);
         }
         if(param1 > param2)
         {
            param1 -= param3;
            return param1 < param2 ? Number(param2) : Number(param1);
         }
         return param1;
      }
      
      public static function method_608(param1:Number, param2:Number, param3:Number) : Number
      {
         if(param1 > param2 - param3 && param1 < param2 + param3)
         {
            return param2;
         }
         return param1;
      }
      
      public static function method_613(param1:Number) : Number
      {
         if(param1 < 0)
         {
            return -1;
         }
         if(param1 > 0)
         {
            return 1;
         }
         return 0;
      }
      
      public static function method_607(param1:Number, param2:Number) : Number
      {
         if(param1 < 0)
         {
            return param1 < -param2 ? Number(-1) : Number(0);
         }
         if(param1 > 0)
         {
            return param1 > param2 ? Number(1) : Number(0);
         }
         return 0;
      }
      
      public static function method_603(param1:Number, param2:Number, param3:Number) : Boolean
      {
         var _loc4_:Number = param1 - param2;
         if(_loc4_ < 0)
         {
            return _loc4_ > -param3;
         }
         return _loc4_ < param3;
      }
   }
}
