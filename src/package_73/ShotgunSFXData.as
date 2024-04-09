package package_73
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.engine3d.TextureMaterialRegistry;
   import alternativa.tanks.engine3d.name_1072;
   import alternativa.tanks.engine3d.name_966;
   import alternativa.tanks.models.sfx.LightAnimation;
   import alternativa.tanks.services.materialregistry.IMaterialRegistry;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.media.Sound;
   import package_91.name_1246;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class ShotgunSFXData implements AutoClosable
   {
      
      public static var var_58:name_966 = IMaterialRegistry(OSGi.getInstance().getService(IMaterialRegistry)).textureMaterialRegistry;
       
      
      public var shotSound:Sound;
      
      public var reloadSound:Sound;
      
      public var magazineReloadSound:Sound;
      
      public var var_2094:name_1072;
      
      public var var_2092:name_1072;
      
      public var smokeAnimation:name_1072;
      
      public var var_2091:TextureMaterial;
      
      public var var_2093:TextureMaterial;
      
      public var var_2090:Vector.<TextureMaterial>;
      
      public var name_2468:LightAnimation;
      
      public function ShotgunSFXData(param1:name_1246, param2:LightAnimation)
      {
         var _loc3_:ImageResource = null;
         var _loc4_:TextureMaterial = null;
         super();
         this.shotSound = param1.shotSound.sound;
         this.reloadSound = param1.reloadSound.sound;
         this.magazineReloadSound = param1.magazineReloadSound.sound;
         this.var_2094 = this.name_1818(param1.shotAcrossTexture);
         this.var_2092 = this.name_1818(param1.shotAlongTexture);
         this.smokeAnimation = GraphicsUtils.name_1073(var_58 as TextureMaterialRegistry,param1.smokeTexture.data,param1.smokeTexture.frameWidth,param1.smokeTexture.frameHeight,param1.smokeTexture.numFrames);
         this.smokeAnimation.fps = param1.smokeTexture.fps;
         this.var_2091 = this.method_1045(param1.pelletTrailTexture);
         this.var_2093 = this.method_1045(param1.sparkleTexture);
         this.var_2090 = new Vector.<TextureMaterial>();
         for each(_loc3_ in param1.explosionMarkTextures)
         {
            _loc4_ = var_58.getMaterial(null,_loc3_.data,1);
            this.var_2090.push(_loc4_);
         }
         this.name_2468 = param2;
      }
      
      private function method_1045(param1:ImageResource) : TextureMaterial
      {
         return var_58.getMaterial(null,param1.data,1);
      }
      
      private function name_1818(param1:MultiframeImageResource) : name_1072
      {
         var _loc2_:name_1072 = GraphicsUtils.name_1073(var_58 as TextureMaterialRegistry,param1.data,param1.frameWidth,param1.frameHeight,param1.numFrames);
         _loc2_.fps = param1.fps;
         return _loc2_;
      }
      
      public function close() : void
      {
         var _loc1_:TextureMaterial = null;
         this.shotSound = null;
         this.reloadSound = null;
         this.magazineReloadSound = null;
         var_58.disposeMaterial(this.var_2094.material);
         var_58.disposeMaterial(this.var_2092.material);
         var_58.disposeMaterial(this.smokeAnimation.material);
         var_58.disposeMaterial(this.var_2091);
         var_58.disposeMaterial(this.var_2093);
         for each(_loc1_ in this.var_2090)
         {
            var_58.disposeMaterial(_loc1_);
         }
      }
   }
}
