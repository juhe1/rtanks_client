package alternativa.tanks.sfx
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_37.Matrix4;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_68.name_175;
   import package_76.name_735;
   
   public class name_1760 extends class_30 implements name_657
   {
      
      private static const const_2025:Vector3 = new Vector3();
      
      private static const const_2010:Vector3 = new Vector3();
      
      private static const var_515:Matrix4 = new Matrix4();
       
      
      private var var_610:SimplePlane;
      
      private var var_2490:int;
      
      private var turret:Object3D;
      
      private var var_2453:Vector3;
      
      private var var_170:name_175;
      
      public function name_1760(param1:ObjectPool)
      {
         this.var_2453 = new Vector3();
         super(param1);
         this.var_610 = new SimplePlane(1,1,0.5,0);
         this.var_610.name_2709(0,0,0,1,1,1,1,0);
         this.var_610.shadowMapAlphaThreshold = 2;
         this.var_610.depthMapAlphaThreshold = 2;
         this.var_610.useShadowMap = false;
         this.var_610.useLight = false;
      }
      
      public function init(param1:Vector3, param2:Object3D, param3:TextureMaterial, param4:int, param5:Number, param6:Number) : void
      {
         this.var_2453.copy(param1);
         this.turret = param2;
         this.var_2490 = param4;
         this.var_610.setMaterialToAllFaces(param3);
         this.var_610.width = param5;
         this.var_610.length = param6;
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         if(this.var_2490 < 0)
         {
            return false;
         }
         this.var_2490 -= param1;
         var_515.name_943(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         var_515.name_890(this.var_2453,const_2010);
         var_515.name_1282(1,const_2025);
         name_2500.name_2503(this.var_610,const_2010,const_2025,param2.pos);
         return true;
      }
      
      public function destroy() : void
      {
         this.var_170.removeChild(this.var_610);
         this.var_170 = null;
         this.turret = null;
         method_584();
      }
      
      override protected function getClass() : Class
      {
         return name_1760;
      }
      
      public function kill() : void
      {
         this.var_2490 = -1;
      }
      
      public function name_742(param1:name_175) : void
      {
         this.var_170 = param1;
         param1.addChild(this.var_610);
      }
      
      public function get owner() : ClientObject
      {
         return null;
      }
   }
}
