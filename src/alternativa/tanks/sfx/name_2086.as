package alternativa.tanks.sfx
{
   import alternativa.engine3d.core.Object3D;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_37.Vector3;
   import package_76.name_735;
   
   public class name_2086 extends class_30 implements name_2314
   {
       
      
      private var var_1888:Vector3;
      
      private var name_187:Vector3;
      
      private var var_2720:Number;
      
      public function name_2086(param1:ObjectPool)
      {
         this.var_1888 = new Vector3();
         this.name_187 = new Vector3();
         super(param1);
      }
      
      public function name_2316(param1:Object3D) : void
      {
         param1.x = this.var_1888.x;
         param1.y = this.var_1888.y;
         param1.z = this.var_1888.z;
         param1.scaleX = 1;
         param1.scaleY = 1;
         param1.scaleZ = 1;
      }
      
      public function init(param1:Vector3, param2:Vector3, param3:Number) : void
      {
         this.var_1888.vCopy(param1);
         this.name_187.vCopy(param2);
         this.var_2720 = param3;
      }
      
      public function name_2315(param1:Object3D, param2:name_735, param3:int) : void
      {
         var _loc4_:Number = 0.001 * param3;
         param1.x += this.name_187.x * _loc4_;
         param1.y += this.name_187.y * _loc4_;
         param1.z += this.name_187.z * _loc4_;
         param1.scaleX += this.var_2720;
         param1.scaleY += this.var_2720;
         param1.scaleZ += this.var_2720;
      }
      
      override protected function getClass() : Class
      {
         return name_2086;
      }
      
      public function destroy() : void
      {
         method_584();
      }
   }
}
