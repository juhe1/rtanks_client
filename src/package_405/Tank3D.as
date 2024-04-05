package package_405
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Object3DContainer;
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import package_302.AnimatedPaintMaterial;
   import package_302.PaintMaterial;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class Tank3D extends Object3DContainer
   {
      
      public static const name_2187:RegExp = /(box.*|fmnt|muzzle.*|laser|rocket)/i;
      
      public static const name_1201:String = "tankPart";
      
      private static const const_2215:int = 0;
      
      private static const const_2216:int = 1;
      
      private static var var_2832:BitmapData;
       
      
      private var var_2833:Tanks3DSResource;
      
      private var var_2835:Tanks3DSResource;
      
      private var hull:Mesh;
      
      private var turret:MeshContainer;
      
      private var var_2834:BitmapData;
      
      private var materials:Vector.<TextureMaterial>;
      
      private var var_2831:MultiframeImageResource;
      
      public function Tank3D()
      {
         this.materials = new Vector.<TextureMaterial>(2);
         super();
      }
      
      private static function method_2677() : BitmapData
      {
         if(var_2832 == null)
         {
            var_2832 = new BitmapData(1,1,false,6710886);
         }
         return var_2832;
      }
      
      public static function method_734(param1:Mesh) : Mesh
      {
         var _loc2_:Mesh = Mesh(param1.clone());
         _loc2_.name = "tankPart";
         _loc2_.colorTransform = new ColorTransform();
         _loc2_.shadowMapAlphaThreshold = 0.1;
         _loc2_.calculateVerticesNormalsBySmoothingGroups(0.01);
         return _loc2_;
      }
      
      public function method_1072(param1:BitmapData) : void
      {
         this.var_2831 = null;
         this.method_2675();
         this.var_2834 = param1 != null ? param1 : method_2677();
         this.method_2674(this.var_2835,this.turret);
         this.method_2673(this.var_2833,this.hull,0);
      }
      
      public function method_2679(param1:MultiframeImageResource) : void
      {
         this.var_2834 = null;
         this.method_2675();
         this.var_2831 = param1;
         this.method_2674(this.var_2835,this.turret);
         this.method_2673(this.var_2833,this.hull,0);
      }
      
      public function method_1074(param1:Tanks3DSResource) : void
      {
         if(this.hull != null)
         {
            this.hull.setMaterialToAllFaces(null);
            removeChild(this.hull);
         }
         if(param1 == null)
         {
            return;
         }
         this.var_2833 = param1;
         this.hull = this.method_764(method_734(param1.objects[0] as Mesh));
         addChild(this.hull);
         if(this.turret != null)
         {
            addChild(this.turret);
         }
         this.hull.x = 0;
         this.hull.y = 0;
         this.hull.z = 0;
         this.method_2673(param1,this.hull,0);
         this.method_2676();
      }
      
      public function method_1073(param1:Tanks3DSResource) : void
      {
         var _loc2_:Mesh = null;
         if(this.turret != null)
         {
            for each(_loc2_ in this.turret.method_2108())
            {
               _loc2_.setMaterialToAllFaces(null);
            }
            removeChild(this.turret);
         }
         if(param1 == null)
         {
            return;
         }
         this.var_2835 = param1;
         this.turret = new MeshContainer();
         this.turret.name_2870(this.method_2108(param1));
         addChild(this.turret);
         this.method_2674(param1,this.turret);
         this.method_2676();
      }
      
      private function method_2108(param1:Tanks3DSResource) : Vector.<Mesh>
      {
         var _loc2_:Object3D = null;
         var _loc3_:Vector.<Mesh> = new Vector.<Mesh>();
         for each(_loc2_ in param1.objects)
         {
            if(_loc2_ is Mesh && !name_2187.test(_loc2_.name))
            {
               _loc3_.push(this.method_764(method_734(_loc2_ as Mesh)));
            }
         }
         return _loc3_;
      }
      
      private function method_2674(param1:Tanks3DSResource, param2:MeshContainer) : void
      {
         if(param2 == null)
         {
            return;
         }
         var _loc3_:Vector.<Mesh> = param2.method_2108();
         var _loc4_:TextureMaterial = this.method_2673(param1,_loc3_[0],1);
         var _loc5_:int = 1;
         while(_loc5_ < _loc3_.length)
         {
            _loc3_[_loc5_].setMaterialToAllFaces(_loc4_);
            _loc5_++;
         }
      }
      
      private function method_2673(param1:Tanks3DSResource, param2:Mesh, param3:int) : TextureMaterial
      {
         var _loc4_:TextureMaterial = null;
         if(param1 == null || param2 == null || this.var_2834 == null && this.var_2831 == null)
         {
            return null;
         }
         if(this.var_2831 != null)
         {
            _loc4_ = this.method_2678(param1,param3);
         }
         else
         {
            _loc4_ = this.createTexture(param1,param3);
         }
         param2.setMaterialToAllFaces(_loc4_);
         return _loc4_;
      }
      
      private function method_2678(param1:Tanks3DSResource, param2:int) : TextureMaterial
      {
         var _loc3_:BitmapData = param1.textures["lightmap.jpg"];
         var _loc4_:BitmapData = param1.textures["details.png"];
         var _loc5_:int = this.var_2831.data.width / this.var_2831.frameWidth;
         var _loc6_:int = this.var_2831.data.height / this.var_2831.frameHeight;
         var _loc7_:AnimatedPaintMaterial = new AnimatedPaintMaterial(this.var_2831.data,_loc3_,_loc4_,_loc5_,_loc6_,this.var_2831.fps,this.var_2831.numFrames);
         if(this.materials[param2] != null)
         {
            this.materials[param2].dispose();
         }
         this.materials[param2] = _loc7_;
         return _loc7_;
      }
      
      private function createTexture(param1:Tanks3DSResource, param2:int) : TextureMaterial
      {
         var _loc3_:BitmapData = param1.textures["lightmap.jpg"];
         var _loc4_:BitmapData = param1.textures["details.png"];
         var _loc5_:TextureMaterial = new PaintMaterial(this.var_2834,_loc3_,_loc4_);
         if(this.materials[param2] != null)
         {
            this.materials[param2].dispose();
         }
         this.materials[param2] = _loc5_;
         return _loc5_;
      }
      
      private function method_2676() : void
      {
         if(this.hull == null || this.turret == null)
         {
            return;
         }
         var _loc1_:Object3D = this.var_2833.method_766(/mount/i)[0];
         this.turret.x = _loc1_.x;
         this.turret.y = _loc1_.y;
         this.turret.z = _loc1_.z;
      }
      
      public function destroy() : void
      {
         this.method_2675();
         this.materials = null;
         this.var_2831 = null;
         this.hull = null;
         this.turret = null;
         this.var_2834 = null;
         this.var_2833 = null;
         this.var_2835 = null;
      }
      
      private function method_2675() : void
      {
         if(this.materials[0] != null)
         {
            this.materials[0].dispose();
            this.materials[0] = null;
         }
         if(this.materials[1] != null)
         {
            this.materials[1].dispose();
            this.materials[1] = null;
         }
      }
      
      protected function method_764(param1:Mesh) : Mesh
      {
         if(param1.sorting != Sorting.DYNAMIC_BSP)
         {
            param1.sorting = Sorting.DYNAMIC_BSP;
            param1.calculateFacesNormals(true);
            param1.optimizeForDynamicBSP();
            param1.threshold = 0.01;
         }
         return param1;
      }
   }
}
