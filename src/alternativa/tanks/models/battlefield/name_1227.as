package alternativa.tanks.models.battlefield
{
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.ShadowMap;
   import alternativa.engine3d.lights.DirectionalLight;
   import flash.geom.Vector3D;
   import package_37.Matrix3;
   import package_37.Vector3;
   
   public class name_1227
   {
      
      private static const const_1799:int = 2048;
      
      private static const const_1801:Number = 0.5;
      
      private static const const_1800:Number = 10000;
      
      private static const const_1797:Number = 5000;
      
      private static const const_1798:Number = 10000;
       
      
      private var lightColor:name_2466;
      
      private var shadowColor:name_2466;
      
      private var angleX:Number = 0;
      
      private var angleZ:Number = 0;
      
      private var direction:Vector3D;
      
      private var camera:Camera3D;
      
      public function name_1227(param1:Camera3D)
      {
         this.direction = new Vector3D(1,1,1);
         super();
         this.camera = param1;
      }
      
      public function name_1242() : void
      {
         this.camera.shadowMap = new ShadowMap(2048,5000,10000,0.5,10000);
         this.camera.shadowMapStrength = 1;
      }
      
      public function name_1238() : void
      {
         if(this.camera.shadowMap != null)
         {
            this.camera.shadowMap.dispose();
            this.camera.shadowMap = null;
         }
         this.camera.shadowMapStrength = 0;
      }
      
      public function name_702() : void
      {
         this.camera.directionalLight = new DirectionalLight(this.lightColor.name_1308());
         this.camera.directionalLight.lookAt(this.direction.x,this.direction.y,this.direction.z);
         this.camera.ambientColor = this.shadowColor.name_1308();
      }
      
      public function name_1231() : void
      {
         this.camera.directionalLight = null;
      }
      
      public function name_1230(param1:int, param2:int, param3:Number, param4:Number) : void
      {
         this.lightColor = new name_2466(param1);
         this.shadowColor = new name_2466(param2);
         this.lightColor.method_419(this.shadowColor);
         this.angleX = param3;
         this.angleZ = param4;
         this.method_2183();
      }
      
      private function method_2183() : void
      {
         var _loc1_:Matrix3 = new Matrix3();
         _loc1_.name_932(this.angleX,0,this.angleZ);
         var _loc2_:Vector3 = new Vector3(0,1,0);
         _loc2_.vTransformBy3(_loc1_);
         this.direction.x = _loc2_.x;
         this.direction.y = _loc2_.y;
         this.direction.z = _loc2_.z;
      }
      
      public function toggle() : void
      {
         if(this.camera.shadowMap == null)
         {
            this.name_1242();
         }
         else
         {
            this.name_1238();
         }
      }
   }
}
