package package_300
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class name_1189
   {
       
      
      private var var_2020:SoundResource;
      
      private var var_2022:ImageResource;
      
      private var var_2013:ImageResource;
      
      private var var_2021:ImageResource;
      
      private var var_2011:ImageResource;
      
      private var var_2015:SoundResource;
      
      private var var_2017:SoundResource;
      
      private var var_2016:SoundResource;
      
      private var var_2012:SoundResource;
      
      private var var_2014:ImageResource;
      
      private var var_2010:ImageResource;
      
      private var var_2008:SoundResource;
      
      private var var_2018:ImageResource;
      
      private var var_2009:ImageResource;
      
      private var var_2019:SoundResource;
      
      public function name_1189(param1:SoundResource = null, param2:ImageResource = null, param3:ImageResource = null, param4:ImageResource = null, param5:ImageResource = null, param6:SoundResource = null, param7:SoundResource = null, param8:SoundResource = null, param9:SoundResource = null, param10:ImageResource = null, param11:ImageResource = null, param12:SoundResource = null, param13:ImageResource = null, param14:ImageResource = null, param15:SoundResource = null)
      {
         super();
         this.var_2020 = param1;
         this.var_2022 = param2;
         this.var_2013 = param3;
         this.var_2021 = param4;
         this.var_2011 = param5;
         this.var_2015 = param6;
         this.var_2017 = param7;
         this.var_2016 = param8;
         this.var_2012 = param9;
         this.var_2014 = param10;
         this.var_2010 = param11;
         this.var_2008 = param12;
         this.var_2018 = param13;
         this.var_2009 = param14;
         this.var_2019 = param15;
      }
      
      public function get chainStartSound() : SoundResource
      {
         return this.var_2020;
      }
      
      public function set chainStartSound(param1:SoundResource) : void
      {
         this.var_2020 = param1;
      }
      
      public function get crumbsTexture() : ImageResource
      {
         return this.var_2022;
      }
      
      public function set crumbsTexture(param1:ImageResource) : void
      {
         this.var_2022 = param1;
      }
      
      public function get dustTexture() : ImageResource
      {
         return this.var_2013;
      }
      
      public function set dustTexture(param1:ImageResource) : void
      {
         this.var_2013 = param1;
      }
      
      public function get fireAcrossTexture() : ImageResource
      {
         return this.var_2021;
      }
      
      public function set fireAcrossTexture(param1:ImageResource) : void
      {
         this.var_2021 = param1;
      }
      
      public function get fireAlongTexture() : ImageResource
      {
         return this.var_2011;
      }
      
      public function set fireAlongTexture(param1:ImageResource) : void
      {
         this.var_2011 = param1;
      }
      
      public function get hitSound() : SoundResource
      {
         return this.var_2015;
      }
      
      public function set hitSound(param1:SoundResource) : void
      {
         this.var_2015 = param1;
      }
      
      public function get longFailSound() : SoundResource
      {
         return this.var_2017;
      }
      
      public function set longFailSound(param1:SoundResource) : void
      {
         this.var_2017 = param1;
      }
      
      public function get shootEndSound() : SoundResource
      {
         return this.var_2016;
      }
      
      public function set shootEndSound(param1:SoundResource) : void
      {
         this.var_2016 = param1;
      }
      
      public function get shootSound() : SoundResource
      {
         return this.var_2012;
      }
      
      public function set shootSound(param1:SoundResource) : void
      {
         this.var_2012 = param1;
      }
      
      public function get smokeTexture() : ImageResource
      {
         return this.var_2014;
      }
      
      public function set smokeTexture(param1:ImageResource) : void
      {
         this.var_2014 = param1;
      }
      
      public function get sparklesTexture() : ImageResource
      {
         return this.var_2010;
      }
      
      public function set sparklesTexture(param1:ImageResource) : void
      {
         this.var_2010 = param1;
      }
      
      public function get tankHitSound() : SoundResource
      {
         return this.var_2008;
      }
      
      public function set tankHitSound(param1:SoundResource) : void
      {
         this.var_2008 = param1;
      }
      
      public function get tankSparklesTexture() : ImageResource
      {
         return this.var_2018;
      }
      
      public function set tankSparklesTexture(param1:ImageResource) : void
      {
         this.var_2018 = param1;
      }
      
      public function get tracerTexture() : ImageResource
      {
         return this.var_2009;
      }
      
      public function set tracerTexture(param1:ImageResource) : void
      {
         this.var_2009 = param1;
      }
      
      public function get turbineStartSound() : SoundResource
      {
         return this.var_2019;
      }
      
      public function set turbineStartSound(param1:SoundResource) : void
      {
         this.var_2019 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "MachineGunSFXCC [";
         _loc1_ += "chainStartSound = " + this.chainStartSound + " ";
         _loc1_ += "crumbsTexture = " + this.crumbsTexture + " ";
         _loc1_ += "dustTexture = " + this.dustTexture + " ";
         _loc1_ += "fireAcrossTexture = " + this.fireAcrossTexture + " ";
         _loc1_ += "fireAlongTexture = " + this.fireAlongTexture + " ";
         _loc1_ += "hitSound = " + this.hitSound + " ";
         _loc1_ += "longFailSound = " + this.longFailSound + " ";
         _loc1_ += "shootEndSound = " + this.shootEndSound + " ";
         _loc1_ += "shootSound = " + this.shootSound + " ";
         _loc1_ += "smokeTexture = " + this.smokeTexture + " ";
         _loc1_ += "sparklesTexture = " + this.sparklesTexture + " ";
         _loc1_ += "tankHitSound = " + this.tankHitSound + " ";
         _loc1_ += "tankSparklesTexture = " + this.tankSparklesTexture + " ";
         _loc1_ += "tracerTexture = " + this.tracerTexture + " ";
         _loc1_ += "turbineStartSound = " + this.turbineStartSound + " ";
         return _loc1_ + "]";
      }
   }
}
