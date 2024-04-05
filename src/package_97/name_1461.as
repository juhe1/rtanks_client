package package_97
{
   import alternativa.engine3d.core.Object3DContainer;
   import alternativa.engine3d.objects.Mesh;
   import package_37.Vector3;
   
   public class name_1461 extends Object3DContainer
   {
      
      public static const name_1476:Number = 266;
      
      public static const name_1485:int = 12;
       
      
      private var var_2312:Number = 1;
      
      private var alphaMultiplier:Number = 1;
      
      public function name_1461(param1:Mesh, param2:Mesh)
      {
         super();
         this.addMesh(Mesh(param1.clone()));
         this.addMesh(Mesh(param2.clone()));
      }
      
      private function addMesh(param1:Mesh) : void
      {
         param1.shadowMapAlphaThreshold = 2;
         addChild(param1);
         param1.name = "parachute";
      }
      
      public function name_1336() : void
      {
         this.var_2312 = 1;
         this.alphaMultiplier = 1;
         scaleX = 1;
         scaleY = 1;
         scaleZ = 1;
         alpha = 1;
         BonusCache.name_2607(this);
      }
      
      public function name_2499() : Number
      {
         return this.var_2312;
      }
      
      public function name_1068(param1:Number) : void
      {
         this.var_2312 = param1;
         this.method_2342();
      }
      
      private function method_2342() : void
      {
         alpha = this.alphaMultiplier * this.var_2312;
      }
      
      public function name_962(param1:Vector3) : void
      {
         param1.x = x;
         param1.y = y;
         param1.z = z;
      }
      
      public function name_2070(param1:Number) : void
      {
         this.alphaMultiplier = param1;
         this.method_2342();
      }
   }
}
