package package_245
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.tanks.models.battlefield.name_1229;
   import package_37.Vector3;
   import package_37.name_86;
   
   public class name_683 implements name_1229
   {
      
      private static const const_64:Vector3 = new Vector3();
       
      
      private var object:Object3D;
      
      private var axis:Vector3;
      
      private var var_1401:Number;
      
      private var orientation:name_86;
      
      public function name_683(param1:Object3D, param2:Vector3, param3:Number)
      {
         this.orientation = new name_86();
         super();
         this.object = param1;
         this.axis = param2.vClone().vNormalize();
         this.var_1401 = param3 / 1000;
         this.orientation.name_222(param1.rotationX,param1.rotationY,param1.rotationZ);
      }
      
      public function method_1626(param1:Number, param2:Number, param3:Number) : void
      {
         this.axis.reset(param1,param2,param3).vNormalize();
      }
      
      public function method_1625(param1:Number) : void
      {
         this.var_1401 = param1 / 1000;
      }
      
      public function render(param1:int, param2:int) : void
      {
         if(this.var_1401 != 0)
         {
            this.orientation.name_895(this.axis,this.var_1401 * param2);
            this.orientation.name_182(const_64);
            this.object.rotationX = const_64.x;
            this.object.rotationY = const_64.y;
            this.object.rotationZ = const_64.z;
         }
      }
   }
}
