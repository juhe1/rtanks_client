package alternativa.tanks.models.sfx
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.tanks.sfx.name_2314;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_37.Vector3;
   import package_76.name_735;
   
   public class name_2710 extends class_30 implements name_2314
   {
       
      
      private var position:Vector3;
      
      public function name_2710(param1:ObjectPool)
      {
         this.position = new Vector3();
         super(param1);
      }
      
      public function name_731(param1:Vector3) : void
      {
         this.position.vCopy(param1);
      }
      
      public function name_2316(param1:Object3D) : void
      {
         param1.x = this.position.x;
         param1.y = this.position.y;
         param1.z = this.position.z;
      }
      
      public function name_2315(param1:Object3D, param2:name_735, param3:int) : void
      {
         this.name_2316(param1);
      }
      
      public function destroy() : void
      {
         method_584();
      }
      
      override protected function getClass() : Class
      {
         return name_2710;
      }
   }
}
