package alternativa.tanks.engine3d
{
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.tanks.vehicles.tanks.TankSkinPart;
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   import package_302.AnimatedPaintMaterial;
   import package_302.PaintMaterial;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class TextureMaterialRegistry implements name_966
   {
       
      
      private var var_1873:name_2321;
      
      private var var_1874:Boolean;
      
      private const materials:Vector.<TextureMaterial> = new Vector.<TextureMaterial>();
      
      private const const_1695:Dictionary = new Dictionary();
      
      private const const_1696:Dictionary = new Dictionary();
      
      public function TextureMaterialRegistry(param1:int)
      {
         this.var_1873 = new name_2321();
         super();
      }
      
      public function set timerInterval(param1:int) : void
      {
      }
      
      public function name_1193(param1:MultiframeImageResource, param2:TankSkinPart) : AnimatedPaintMaterial
      {
         var _loc3_:name_2317 = null;
         ++this.var_1873.name_2320;
         var _loc4_:String = param1.id.toString() + param2.var_1717;
         if(_loc4_ in this.const_1695)
         {
            _loc3_ = this.const_1695[_loc4_];
            ++_loc3_.name_2318;
            return _loc3_.material as AnimatedPaintMaterial;
         }
         var _loc5_:int = param1.data.width / param1.frameWidth;
         var _loc6_:int = param1.data.height / param1.frameHeight;
         var _loc7_:AnimatedPaintMaterial = new AnimatedPaintMaterial(param1.data,param2.lightmap,param2.details,_loc5_,_loc6_,param1.fps,param1.numFrames,this.var_1874 ? MipMapping.PER_PIXEL : 0);
         _loc3_ = this.method_2032(_loc4_,_loc7_);
         ++_loc3_.name_2318;
         this.materials.push(_loc7_);
         ++this.var_1873.name_2319;
         return _loc7_;
      }
      
      public function name_1191(param1:ImageResource, param2:TankSkinPart) : PaintMaterial
      {
         var _loc3_:name_2317 = null;
         ++this.var_1873.name_2320;
         var _loc4_:String = param1.id.toString() + param2.var_1717;
         if(_loc4_ in this.const_1695)
         {
            _loc3_ = this.const_1695[_loc4_];
            ++_loc3_.name_2318;
            return _loc3_.material as PaintMaterial;
         }
         var _loc5_:PaintMaterial = new PaintMaterial(param1.data,param2.lightmap,param2.details,this.var_1874 ? int(MipMapping.PER_PIXEL) : int(0));
         _loc3_ = this.method_2032(_loc4_,_loc5_);
         ++_loc3_.name_2318;
         this.materials.push(_loc5_);
         ++this.var_1873.name_2319;
         return _loc5_;
      }
      
      private function method_2032(param1:String, param2:TextureMaterial) : name_2317
      {
         var _loc3_:name_2317 = new name_2317(param1,param2);
         this.const_1695[param1] = _loc3_;
         this.const_1696[param2] = _loc3_;
         return _loc3_;
      }
      
      public function set resoluion(param1:Number) : void
      {
         var _loc2_:TextureMaterial = null;
         for each(_loc2_ in this.materials)
         {
            _loc2_.resolution = param1;
         }
      }
      
      public function get useMipMapping() : Boolean
      {
         return this.var_1874;
      }
      
      public function set useMipMapping(param1:Boolean) : void
      {
         if(this.var_1874 != param1)
         {
            if(param1)
            {
               this.method_2034();
            }
            else
            {
               this.method_2039();
            }
         }
      }
      
      private function method_2034() : void
      {
         if(!this.var_1874)
         {
            this.var_1874 = true;
            this.method_2031(this.disposeResource);
            this.method_2031(this.method_2038);
         }
      }
      
      private function method_2038(param1:TextureMaterial) : void
      {
         param1.mipMapping = MipMapping.PER_PIXEL;
      }
      
      private function method_2039() : void
      {
         if(this.var_1874)
         {
            this.var_1874 = false;
            this.method_2031(this.disposeResource);
            this.method_2031(this.method_2037);
         }
      }
      
      private function disposeResource(param1:TextureMaterial) : void
      {
         param1.disposeResource();
      }
      
      private function method_2037(param1:TextureMaterial) : void
      {
         param1.mipMapping = MipMapping.NONE;
      }
      
      public function getMaterial(param1:name_1076, param2:BitmapData, param3:Number, param4:Boolean = true) : TextureMaterial
      {
         if(param2 == null)
         {
            throw new ArgumentError("Texture is null");
         }
         ++this.var_1873.name_2320;
         var _loc5_:name_2317 = this.method_2040(param2,param4);
         ++_loc5_.name_2318;
         return _loc5_.material;
      }
      
      private function method_2040(param1:BitmapData, param2:Boolean) : name_2317
      {
         var _loc3_:TextureMaterial = null;
         var _loc4_:name_2317 = this.const_1695[param1];
         if(_loc4_ == null)
         {
            _loc3_ = this.method_1277(param1,param2);
            _loc4_ = this.method_2033(param1,_loc3_);
         }
         return _loc4_;
      }
      
      private function method_1277(param1:BitmapData, param2:Boolean) : TextureMaterial
      {
         var _loc3_:BitmapData = this.method_670(param1,param2);
         var _loc4_:TextureMaterial = name_2325.name_2326(_loc3_,this.var_1874);
         this.materials.push(_loc4_);
         ++this.var_1873.name_2319;
         return _loc4_;
      }
      
      private function method_2033(param1:BitmapData, param2:TextureMaterial) : name_2317
      {
         var _loc3_:name_2317 = new name_2317(param1,param2);
         this.const_1695[param1] = _loc3_;
         this.const_1696[param2] = _loc3_;
         return _loc3_;
      }
      
      public function addMaterial(param1:TextureMaterial) : void
      {
         var _loc2_:name_2317 = this.method_2033(null,param1);
         ++_loc2_.name_2318;
         this.const_1696[param1] = _loc2_;
         this.materials.push(param1);
      }
      
      protected function method_670(param1:BitmapData, param2:Boolean) : BitmapData
      {
         return param1;
      }
      
      public function name_2166() : String
      {
         var _loc1_:String = "=== TextureMaterialRegistry ===\n";
         return _loc1_ + ("Total mipmaps: " + 0 + "\n" + "Total size: " + 0 + "\n" + "Scheduled materials: " + 0 + "\n");
      }
      
      public function disposeMaterial(param1:TextureMaterial) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:name_2317 = this.const_1696[param1];
         if(_loc2_ != null)
         {
            ++this.var_1873.name_2322;
            --_loc2_.name_2318;
            if(_loc2_.name_2318 == 0)
            {
               this.method_2035(_loc2_);
            }
         }
      }
      
      private function method_2035(param1:name_2317) : void
      {
         ++this.var_1873.name_2323;
         var _loc2_:TextureMaterial = param1.material;
         if(param1.name_2324 in this.const_1695)
         {
            delete this.const_1695[param1.name_2324];
         }
         delete this.const_1696[_loc2_];
         param1.material = null;
         var _loc3_:int = this.materials.indexOf(_loc2_);
         this.materials.splice(_loc3_,1);
         _loc2_.dispose();
         _loc2_ = null;
      }
      
      protected function method_2031(param1:Function) : void
      {
         var _loc2_:TextureMaterial = null;
         for each(_loc2_ in this.materials)
         {
            param1(_loc2_);
         }
      }
      
      public function clear() : void
      {
         this.method_2031(this.method_2036);
         this.materials.length = 0;
         clearDictionary(this.const_1695);
         clearDictionary(this.const_1696);
         this.var_1873.clear();
      }
      
      private function method_2036(param1:TextureMaterial) : void
      {
         param1.texture = null;
      }
      
      protected function method_2041(param1:TextureMaterial) : name_2317
      {
         return this.const_1696[param1];
      }
   }
}
