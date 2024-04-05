package alternativa.tanks.sfx
{
   import alternativa.engine3d.core.Object3D;
   import package_37.Matrix3;
   import package_37.Vector3;
   
   public class name_2500
   {
      
      private static var axis1:Vector3 = new Vector3();
      
      private static var axis2:Vector3 = new Vector3();
      
      private static var const_64:Vector3 = new Vector3();
      
      private static var var_3110:Vector3 = new Vector3();
      
      private static var var_3111:Vector3 = new Vector3();
      
      private static var matrix1:Matrix3 = new Matrix3();
      
      private static var matrix2:Matrix3 = new Matrix3();
       
      
      public function name_2500()
      {
         super();
      }
      
      public static function name_2503(param1:Object3D, param2:Vector3, param3:Vector3, param4:Vector3) : void
      {
         var _loc5_:Number = NaN;
         if(param3.y < -0.99999 || param3.y > 0.99999)
         {
            axis1.x = 0;
            axis1.y = 0;
            axis1.z = 1;
            _loc5_ = param3.y < 0 ? Math.PI : 0;
         }
         else
         {
            axis1.x = param3.z;
            axis1.y = 0;
            axis1.z = -param3.x;
            axis1.vNormalize();
            _loc5_ = Math.acos(param3.y);
         }
         matrix1.name_1097(axis1,_loc5_);
         var_3110.x = param4.x - param2.x;
         var_3110.y = param4.y - param2.y;
         var_3110.z = param4.z - param2.z;
         var _loc6_:Number = var_3110.x * param3.x + var_3110.y * param3.y + var_3110.z * param3.z;
         var_3110.x -= _loc6_ * param3.x;
         var_3110.y -= _loc6_ * param3.y;
         var_3110.z -= _loc6_ * param3.z;
         var_3110.vNormalize();
         matrix1.name_890(Vector3.Z_AXIS,var_3111);
         _loc6_ = var_3111.x * var_3110.x + var_3111.y * var_3110.y + var_3111.z * var_3110.z;
         axis2.x = var_3111.y * var_3110.z - var_3111.z * var_3110.y;
         axis2.y = var_3111.z * var_3110.x - var_3111.x * var_3110.z;
         axis2.z = var_3111.x * var_3110.y - var_3111.y * var_3110.x;
         axis2.vNormalize();
         _loc5_ = Math.acos(_loc6_);
         matrix2.name_1097(axis2,_loc5_);
         matrix1.append(matrix2);
         matrix1.name_182(const_64);
         param1.rotationX = const_64.x;
         param1.rotationY = const_64.y;
         param1.rotationZ = const_64.z;
         param1.x = param2.x;
         param1.y = param2.y;
         param1.z = param2.z;
      }
      
      public static function method_2887(param1:Object3D) : void
      {
         param1.softAttenuation = 80;
         param1.useLight = false;
         param1.shadowMapAlphaThreshold = 2;
         param1.depthMapAlphaThreshold = 2;
         param1.useShadowMap = false;
      }
      
      public static function name_3074(param1:Object3D, param2:Vector3, param3:Vector3, param4:Boolean, param5:Number, param6:Number) : void
      {
         var _loc7_:Number = param2.x - param1.x;
         var _loc8_:Number = param2.y - param1.y;
         var _loc9_:Number = param2.z - param1.z;
         var _loc10_:Number = Math.sqrt(_loc7_ * _loc7_ + _loc8_ * _loc8_ + _loc9_ * _loc9_);
         _loc7_ /= _loc10_;
         _loc8_ /= _loc10_;
         _loc9_ /= _loc10_;
         var _loc11_:Number = Math.abs(_loc7_ * param3.x + _loc8_ * param3.y + _loc9_ * param3.z);
         if(param4)
         {
            _loc11_ = 1 - _loc11_;
         }
         _loc11_ = Math.pow(_loc11_,param5);
         param1.alpha = 1 - _loc11_ / param6;
         if(param1.alpha < 0)
         {
            param1.alpha = 0;
         }
      }
   }
}
