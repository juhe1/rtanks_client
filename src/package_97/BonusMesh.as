package package_97
{
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.osgi.OSGi;
   import flash.geom.ColorTransform;
   import package_37.Vector3;
   import package_74.name_272;
   
   public class BonusMesh extends Mesh
   {
      
      public static var lightingService:name_272 = OSGi.getInstance().name_6(name_272) as name_272;
       
      
      private var var_2332:String;
      
      private var var_2312:Number = 1;
      
      private var alphaMultiplier:Number = 1;
      
      private var var_2331:ColorTransform;
      
      private var var_2330:ColorTransform;
      
      public function BonusMesh(param1:String, param2:Mesh)
      {
         super();
         this.var_2332 = param1;
         clonePropertiesFrom(param2);
         var _loc3_:Face = param2.faces[0];
         setMaterialToAllFaces(_loc3_.material);
         sorting = Sorting.DYNAMIC_BSP;
         name = "bonus";
         rotationX = 0;
         rotationY = 0;
         rotationZ = 0;
         scaleX = 1;
         scaleY = 1;
         scaleZ = 1;
         this.var_2312 = 1;
         this.alphaMultiplier = 1;
         this.method_2342();
      }
      
      public function name_1196(param1:ColorTransform) : void
      {
         if(this.var_2331 != null)
         {
            if(param1 == null)
            {
               colorTransform = this.var_2331;
            }
            else
            {
               this.method_728(this.var_2331,this.var_2330);
               this.var_2330.concat(param1);
               colorTransform = this.var_2330;
            }
         }
         else
         {
            colorTransform = param1;
         }
      }
      
      public function name_2608() : String
      {
         return this.var_2332;
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
      
      public function name_2609() : Number
      {
         return scaleX;
      }
      
      public function name_2606(param1:Number) : void
      {
         scaleX = param1;
         scaleY = param1;
         scaleZ = param1;
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
      
      private function method_2342() : void
      {
         alpha = this.alphaMultiplier * this.var_2312;
      }
      
      public function name_1336() : void
      {
         this.var_2312 = 1;
         this.alphaMultiplier = 1;
         colorTransform = null;
         BonusCache.method_2345(this);
      }
      
      private function method_728(param1:ColorTransform, param2:ColorTransform) : void
      {
         param2.redMultiplier = param1.redMultiplier;
         param2.greenMultiplier = param1.greenMultiplier;
         param2.blueMultiplier = param1.blueMultiplier;
         param2.alphaMultiplier = param1.alphaMultiplier;
         param2.redOffset = param1.redOffset;
         param2.greenOffset = param1.greenOffset;
         param2.blueOffset = param1.blueOffset;
         param2.alphaOffset = param1.alphaOffset;
      }
   }
}
