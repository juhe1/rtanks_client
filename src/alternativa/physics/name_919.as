package alternativa.physics
{
   import package_37.Matrix3;
   import package_37.Vector3;
   
   public class name_919
   {
       
      
      public function name_919()
      {
         super();
      }
      
      public static function name_941(param1:Number, param2:Vector3, param3:Matrix3) : void
      {
         if(param1 <= 0)
         {
            throw new ArgumentError();
         }
         param3.copy(Matrix3.ZERO);
         if(param1 == Infinity)
         {
            return;
         }
         var _loc4_:Number = param2.x * param2.x;
         var _loc5_:Number = param2.y * param2.y;
         var _loc6_:Number = param2.z * param2.z;
         param3.m00 = 3 / (param1 * (_loc5_ + _loc6_));
         param3.m11 = 3 / (param1 * (_loc6_ + _loc4_));
         param3.m22 = 3 / (param1 * (_loc4_ + _loc5_));
      }
      
      public static function method_1871(param1:Number, param2:Number, param3:Number, param4:Matrix3) : void
      {
         if(param1 <= 0)
         {
            throw new ArgumentError();
         }
         param4.copy(Matrix3.ZERO);
         if(param1 == Infinity)
         {
            return;
         }
         param4.m00 = param4.m11 = 1 / (param1 * (param3 * param3 / 12 + param2 * param2 / 4));
         param4.m22 = 2 / (param1 * param2 * param2);
      }
   }
}
