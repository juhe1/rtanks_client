package alternativa.tanks.models.sfx
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.tanks.sfx.name_2314;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_37.Matrix4;
   import package_37.Vector3;
   import package_76.name_735;
   
   public class name_1716 extends class_30 implements name_2314
   {
      
      private static const var_515:Matrix4 = new Matrix4();
      
      private static const const_2020:Vector3 = new Vector3();
       
      
      private var turret:Object3D;
      
      private var var_2122:Vector3;
      
      public function name_1716(param1:ObjectPool)
      {
         this.var_2122 = new Vector3();
         super(param1);
      }
      
      public function init(param1:Object3D, param2:Vector3, param3:Number = 0) : void
      {
         this.turret = param1;
         this.var_2122.vCopy(param2);
         this.var_2122.y += param3;
      }
      
      public function name_2316(param1:Object3D) : void
      {
      }
      
      public function name_2315(param1:Object3D, param2:name_735, param3:int) : void
      {
         var_515.name_943(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         var_515.name_890(this.var_2122,const_2020);
         param1.x = const_2020.x;
         param1.y = const_2020.y;
         param1.z = const_2020.z;
      }
      
      override protected function getClass() : Class
      {
         return name_1716;
      }
      
      public function destroy() : void
      {
         this.turret = null;
         method_584();
      }
   }
}
