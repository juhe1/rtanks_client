package alternativa.tanks.models.weapon.machinegun
{
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.engine3d.TextureMaterialRegistry;
   import alternativa.tanks.engine3d.name_1072;
   import alternativa.tanks.services.materialregistry.name_100;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import flash.media.Sound;
   import package_300.name_1189;
   import package_371.BCSHFilter;
   
   public class name_2410
   {
      
      public static var var_58:TextureMaterialRegistry = TextureMaterialRegistry(name_100(OSGi.getInstance().name_6(name_100)).textureMaterialRegistry);
       
      
      private var var_2020:Sound;
      
      private var var_2019:Sound;
      
      private var var_2016:Sound;
      
      private var var_2012:Sound;
      
      private var var_2017:Sound;
      
      private var var_2015:Sound;
      
      private var var_2008:Sound;
      
      private var var_2013:name_1072;
      
      private var var_2021:name_1072;
      
      private var var_2011:name_1072;
      
      private var var_2014:name_1072;
      
      private var var_2010:name_1072;
      
      private var var_2018:name_1072;
      
      private var var_2009:TextureMaterial;
      
      private var var_2022:TextureMaterial;
      
      public function name_2410(param1:name_1189)
      {
         super();
         this.var_2020 = param1.chainStartSound.sound;
         this.var_2019 = param1.turbineStartSound.sound;
         this.var_2016 = param1.shootEndSound.sound;
         this.var_2012 = param1.shootSound.sound;
         this.var_2017 = param1.longFailSound.sound;
         this.var_2015 = param1.hitSound.sound;
         this.var_2008 = param1.tankHitSound.sound;
         var _loc2_:BitmapFilter = BCSHFilter.name_1776(10,3,34,2.4);
         var _loc3_:BitmapFilter = BCSHFilter.name_1776(10,3,34,2.4);
         var _loc4_:BitmapFilter = BCSHFilter.name_1776(10,3,34,2.4);
         this.var_2021 = this.name_1818(param1.fireAcrossTexture.data,128,_loc2_,30);
         this.var_2011 = this.name_1818(param1.fireAlongTexture.data,128,_loc2_,30);
         this.var_2013 = this.name_1073(param1.dustTexture.data,64,30);
         this.var_2014 = this.name_1073(param1.smokeTexture.data,128,30);
         this.var_2010 = this.name_1073(param1.sparklesTexture.data,512 / 4,30);
         this.var_2018 = this.name_1073(param1.tankSparklesTexture.data,512 / 4,30);
         this.var_2009 = method_2848(param1.tracerTexture.data,_loc4_);
         this.var_2022 = var_58.getMaterial(null,param1.crumbsTexture.data,1);
      }
      
      private static function method_2848(param1:BitmapData, param2:BitmapFilter) : TextureMaterial
      {
         var _loc3_:BitmapData = GraphicsUtils.name_1786(param1,param2);
         var _loc4_:TextureMaterial = var_58.getMaterial(null,_loc3_,2);
         _loc4_.mipMapping = MipMapping.NONE;
         _loc4_.repeat = true;
         return _loc4_;
      }
      
      private function name_1073(param1:BitmapData, param2:int, param3:int = 30) : name_1072
      {
         var _loc4_:name_1072 = GraphicsUtils.name_1073(var_58,param1,param2,param2);
         _loc4_.fps = param3;
         return _loc4_;
      }
      
      private function name_1818(param1:BitmapData, param2:int, param3:BitmapFilter, param4:int = 30) : name_1072
      {
         var _loc5_:name_1072 = GraphicsUtils.name_1818(var_58,param1,param3,param2,param2);
         _loc5_.fps = param4;
         return _loc5_;
      }
      
      public function get chainStartSound() : Sound
      {
         return this.var_2020;
      }
      
      public function get turbineStartSound() : Sound
      {
         return this.var_2019;
      }
      
      public function get shootEndSound() : Sound
      {
         return this.var_2016;
      }
      
      public function get shootSound() : Sound
      {
         return this.var_2012;
      }
      
      public function get longFailSound() : Sound
      {
         return this.var_2017;
      }
      
      public function get hitSound() : Sound
      {
         return this.var_2015;
      }
      
      public function get tankHitSound() : Sound
      {
         return this.var_2008;
      }
      
      public function get dustTexture() : name_1072
      {
         return this.var_2013;
      }
      
      public function get fireAcrossTexture() : name_1072
      {
         return this.var_2021;
      }
      
      public function get fireAlongTexture() : name_1072
      {
         return this.var_2011;
      }
      
      public function get smokeTexture() : name_1072
      {
         return this.var_2014;
      }
      
      public function get sparklesTexture() : name_1072
      {
         return this.var_2010;
      }
      
      public function get tankSparklesTexture() : name_1072
      {
         return this.var_2018;
      }
      
      public function get tracerTexture() : TextureMaterial
      {
         return this.var_2009;
      }
      
      public function get crumbsTexture() : TextureMaterial
      {
         return this.var_2022;
      }
      
      public function close() : void
      {
         var_58.disposeMaterial(this.dustTexture.material);
         var_58.disposeMaterial(this.fireAcrossTexture.material);
         var_58.disposeMaterial(this.fireAlongTexture.material);
         var_58.disposeMaterial(this.smokeTexture.material);
         var_58.disposeMaterial(this.sparklesTexture.material);
         var_58.disposeMaterial(this.tankSparklesTexture.material);
         var_58.disposeMaterial(this.tracerTexture);
         var_58.disposeMaterial(this.crumbsTexture);
         this.var_2020 = null;
         this.var_2019 = null;
         this.var_2016 = null;
         this.var_2012 = null;
         this.var_2017 = null;
         this.var_2015 = null;
         this.var_2008 = null;
      }
   }
}
