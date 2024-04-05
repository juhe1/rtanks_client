package alternativa.tanks.sfx
{
   import alternativa.engine3d.core.Object3D;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_37.Vector3;
   import package_76.name_735;
   
   public class name_1071 extends class_30 implements name_2314
   {
      
      private static const const_1697:Vector3 = new Vector3();
       
      
      private var position:Vector3;
      
      private var var_1875:Number;
      
      public function name_1071(param1:ObjectPool)
      {
         this.position = new Vector3();
         super(param1);
      }
      
      public function init(param1:Vector3, param2:Number) : void
      {
         this.position.copy(param1);
         this.var_1875 = param2;
      }
      
      public function name_2316(param1:Object3D) : void
      {
         param1.x = this.position.x;
         param1.y = this.position.y;
         param1.z = this.position.z;
      }
      
      public function name_2315(param1:Object3D, param2:name_735, param3:int) : void
      {
         const_1697.x = param2.x - this.position.x;
         const_1697.y = param2.y - this.position.y;
         const_1697.z = param2.z - this.position.z;
         const_1697.vNormalize();
         param1.x = this.position.x + this.var_1875 * const_1697.x;
         param1.y = this.position.y + this.var_1875 * const_1697.y;
         param1.z = this.position.z + this.var_1875 * const_1697.z;
      }
      
      override protected function getClass() : Class
      {
         return name_1071;
      }
      
      public function destroy() : void
      {
         method_584();
      }
   }
}
