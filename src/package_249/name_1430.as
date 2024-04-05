package package_249
{
   import alternativa.engine3d.core.Object3D;
   import package_37.Vector3;
   
   public class name_1430 implements name_2069
   {
       
      
      private var object:Object3D;
      
      public function name_1430(param1:Object3D)
      {
         super();
         this.object = param1;
      }
      
      public function name_962(param1:Vector3) : void
      {
         param1.x = this.object.x;
         param1.y = this.object.y;
         param1.z = this.object.z;
      }
      
      public function name_2070(param1:Number) : void
      {
         this.object.alpha = param1;
      }
   }
}
