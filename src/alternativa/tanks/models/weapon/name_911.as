package alternativa.tanks.models.weapon
{
   import alternativa.engine3d.core.Object3D;
   import package_37.Matrix4;
   import package_37.Vector3;
   
   public class name_911
   {
      
      private static var instance:name_911;
      
      private static var var_515:Matrix4 = new Matrix4();
      
      private static var var_1703:Vector3 = new Vector3();
       
      
      public function name_911()
      {
         super();
      }
      
      public static function getInstance() : name_911
      {
         if(instance == null)
         {
            instance = new name_911();
         }
         return instance;
      }
      
      public function name_920(param1:Object3D, param2:Vector3, param3:name_903) : void
      {
         var_515.setFromMatrix3D(param1.concatenatedMatrix);
         var_515.name_890(param2,param3.name_1421);
         var_1703.x = param2.x;
         var_1703.z = param2.z;
         var_515.name_890(var_1703,param3.name_1422);
         param3.const_1614.x = var_515.m00;
         param3.const_1614.y = var_515.m10;
         param3.const_1614.z = var_515.m20;
         param3.direction.x = var_515.m01;
         param3.direction.y = var_515.m11;
         param3.direction.z = var_515.m21;
      }
      
      public function method_797(param1:Object3D, param2:Vector3, param3:Vector3, param4:Vector3, param5:Vector3, param6:Vector3) : void
      {
         var_515.name_943(param1.x,param1.y,param1.z,param1.rotationX,param1.rotationY,param1.rotationZ);
         var_515.name_890(param2,param3);
         var_1703.x = param2.x;
         var_1703.z = param2.z;
         var_515.name_890(var_1703,param4);
         param5.x = var_515.m00;
         param5.y = var_515.m10;
         param5.z = var_515.m20;
         param6.x = var_515.m01;
         param6.y = var_515.m11;
         param6.z = var_515.m21;
      }
      
      public function name_1702(param1:Object3D, param2:Vector3, param3:Vector3, param4:Vector3) : void
      {
         var_515.name_943(param1.x,param1.y,param1.z,param1.rotationX,param1.rotationY,param1.rotationZ);
         var_515.name_890(param2,param3);
         param4.x = var_515.m01;
         param4.y = var_515.m11;
         param4.z = var_515.m21;
      }
   }
}
