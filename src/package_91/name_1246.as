package package_91
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class name_1246
   {
       
      
      private var var_2084:Vector.<ImageResource>;
      
      private var var_2089:SoundResource;
      
      private var var_2085:ImageResource;
      
      private var var_2087:SoundResource;
      
      private var var_2086:MultiframeImageResource;
      
      private var var_2088:MultiframeImageResource;
      
      private var var_2082:SoundResource;
      
      private var var_2014:MultiframeImageResource;
      
      private var var_2083:ImageResource;
      
      public function name_1246(param1:Vector.<ImageResource> = null, param2:SoundResource = null, param3:ImageResource = null, param4:SoundResource = null, param5:MultiframeImageResource = null, param6:MultiframeImageResource = null, param7:SoundResource = null, param8:MultiframeImageResource = null, param9:ImageResource = null)
      {
         super();
         this.var_2084 = param1;
         this.var_2089 = param2;
         this.var_2085 = param3;
         this.var_2087 = param4;
         this.var_2086 = param5;
         this.var_2088 = param6;
         this.var_2082 = param7;
         this.var_2014 = param8;
         this.var_2083 = param9;
      }
      
      public function get explosionMarkTextures() : Vector.<ImageResource>
      {
         return this.var_2084;
      }
      
      public function set explosionMarkTextures(param1:Vector.<ImageResource>) : void
      {
         this.var_2084 = param1;
      }
      
      public function get magazineReloadSound() : SoundResource
      {
         return this.var_2089;
      }
      
      public function set magazineReloadSound(param1:SoundResource) : void
      {
         this.var_2089 = param1;
      }
      
      public function get pelletTrailTexture() : ImageResource
      {
         return this.var_2085;
      }
      
      public function set pelletTrailTexture(param1:ImageResource) : void
      {
         this.var_2085 = param1;
      }
      
      public function get reloadSound() : SoundResource
      {
         return this.var_2087;
      }
      
      public function set reloadSound(param1:SoundResource) : void
      {
         this.var_2087 = param1;
      }
      
      public function get shotAcrossTexture() : MultiframeImageResource
      {
         return this.var_2086;
      }
      
      public function set shotAcrossTexture(param1:MultiframeImageResource) : void
      {
         this.var_2086 = param1;
      }
      
      public function get shotAlongTexture() : MultiframeImageResource
      {
         return this.var_2088;
      }
      
      public function set shotAlongTexture(param1:MultiframeImageResource) : void
      {
         this.var_2088 = param1;
      }
      
      public function get shotSound() : SoundResource
      {
         return this.var_2082;
      }
      
      public function set shotSound(param1:SoundResource) : void
      {
         this.var_2082 = param1;
      }
      
      public function get smokeTexture() : MultiframeImageResource
      {
         return this.var_2014;
      }
      
      public function set smokeTexture(param1:MultiframeImageResource) : void
      {
         this.var_2014 = param1;
      }
      
      public function get sparkleTexture() : ImageResource
      {
         return this.var_2083;
      }
      
      public function set sparkleTexture(param1:ImageResource) : void
      {
         this.var_2083 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ShotgunSFXCC [";
         _loc1_ += "explosionMarkTextures = " + this.explosionMarkTextures + " ";
         _loc1_ += "magazineReloadSound = " + this.magazineReloadSound + " ";
         _loc1_ += "pelletTrailTexture = " + this.pelletTrailTexture + " ";
         _loc1_ += "reloadSound = " + this.reloadSound + " ";
         _loc1_ += "shotAcrossTexture = " + this.shotAcrossTexture + " ";
         _loc1_ += "shotAlongTexture = " + this.shotAlongTexture + " ";
         _loc1_ += "shotSound = " + this.shotSound + " ";
         _loc1_ += "smokeTexture = " + this.smokeTexture + " ";
         _loc1_ += "sparkleTexture = " + this.sparkleTexture + " ";
         return _loc1_ + "]";
      }
   }
}
