package alternativa.tanks.sfx
{
   import alternativa.engine3d.core.Object3D;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_37.Vector3;
   import package_76.name_735;
   
   public class name_1095 extends class_30 implements name_2314
   {
       
      
      private var var_1888:Vector3;
      
      private var name_187:Vector3;
      
      private var acceleration:Number;
      
      public function name_1095(param1:ObjectPool)
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
      }
      
      public function init(param1:Vector3, param2:Vector3, param3:Number) : void
      {
         this.var_1888.copy(param1);
         this.name_187.copy(param2);
         this.acceleration = param3;
      }
      
      public function name_2315(param1:Object3D, param2:name_735, param3:int) : void
      {
         var _loc4_:Number = NaN;
         _loc4_ = 0.001 * param3;
         param1.x += this.name_187.x * _loc4_;
         param1.y += this.name_187.y * _loc4_;
         param1.z += this.name_187.z * _loc4_;
         var _loc5_:Number = this.name_187.vLength();
         _loc5_ += this.acceleration * _loc4_;
         if(_loc5_ <= 0)
         {
            this.name_187.reset();
         }
         else
         {
            this.name_187.vNormalize();
            this.name_187.scale(_loc5_);
         }
      }
      
      public function destroy() : void
      {
      }
   }
}
