package package_319
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class name_1411
   {
       
      
      private var var_2251:SoundResource;
      
      private var var_2247:int;
      
      private var var_2260:ImageResource;
      
      private var var_2245:SoundResource;
      
      private var var_2255:ImageResource;
      
      private var var_2258:ImageResource;
      
      private var var_2248:SoundResource;
      
      private var var_2259:Number;
      
      private var var_2252:ImageResource;
      
      private var var_2256:MultiframeImageResource;
      
      private var var_2249:Number;
      
      private var var_2257:MultiframeImageResource;
      
      private var var_2250:Number;
      
      private var var_2246:Tanks3DSResource;
      
      private var var_2261:Number;
      
      private var var_2253:Number;
      
      private var var_2254:ImageResource;
      
      public function name_1411(param1:SoundResource = null, param2:int = 0, param3:ImageResource = null, param4:SoundResource = null, param5:ImageResource = null, param6:ImageResource = null, param7:SoundResource = null, param8:Number = 0, param9:ImageResource = null, param10:MultiframeImageResource = null, param11:Number = 0, param12:MultiframeImageResource = null, param13:Number = 0, param14:Tanks3DSResource = null, param15:Number = 0, param16:Number = 0, param17:ImageResource = null)
      {
         super();
         this.var_2251 = param1;
         this.var_2247 = param2;
         this.var_2260 = param3;
         this.var_2245 = param4;
         this.var_2255 = param5;
         this.var_2258 = param6;
         this.var_2248 = param7;
         this.var_2259 = param8;
         this.var_2252 = param9;
         this.var_2256 = param10;
         this.var_2249 = param11;
         this.var_2257 = param12;
         this.var_2250 = param13;
         this.var_2246 = param14;
         this.var_2261 = param15;
         this.var_2253 = param16;
         this.var_2254 = param17;
      }
      
      public function get activateSound() : SoundResource
      {
         return this.var_2251;
      }
      
      public function set activateSound(param1:SoundResource) : void
      {
         this.var_2251 = param1;
      }
      
      public function get activateTimeMsec() : int
      {
         return this.var_2247;
      }
      
      public function set activateTimeMsec(param1:int) : void
      {
         this.var_2247 = param1;
      }
      
      public function get blueMineTexture() : ImageResource
      {
         return this.var_2260;
      }
      
      public function set blueMineTexture(param1:ImageResource) : void
      {
         this.var_2260 = param1;
      }
      
      public function get deactivateSound() : SoundResource
      {
         return this.var_2245;
      }
      
      public function set deactivateSound(param1:SoundResource) : void
      {
         this.var_2245 = param1;
      }
      
      public function get enemyMineTexture() : ImageResource
      {
         return this.var_2255;
      }
      
      public function set enemyMineTexture(param1:ImageResource) : void
      {
         this.var_2255 = param1;
      }
      
      public function get explosionMarkTexture() : ImageResource
      {
         return this.var_2258;
      }
      
      public function set explosionMarkTexture(param1:ImageResource) : void
      {
         this.var_2258 = param1;
      }
      
      public function get explosionSound() : SoundResource
      {
         return this.var_2248;
      }
      
      public function set explosionSound(param1:SoundResource) : void
      {
         this.var_2248 = param1;
      }
      
      public function get farVisibilityRadius() : Number
      {
         return this.var_2259;
      }
      
      public function set farVisibilityRadius(param1:Number) : void
      {
         this.var_2259 = param1;
      }
      
      public function get friendlyMineTexture() : ImageResource
      {
         return this.var_2252;
      }
      
      public function set friendlyMineTexture(param1:ImageResource) : void
      {
         this.var_2252 = param1;
      }
      
      public function get idleExplosionTexture() : MultiframeImageResource
      {
         return this.var_2256;
      }
      
      public function set idleExplosionTexture(param1:MultiframeImageResource) : void
      {
         this.var_2256 = param1;
      }
      
      public function get impactForce() : Number
      {
         return this.var_2249;
      }
      
      public function set impactForce(param1:Number) : void
      {
         this.var_2249 = param1;
      }
      
      public function get mainExplosionTexture() : MultiframeImageResource
      {
         return this.var_2257;
      }
      
      public function set mainExplosionTexture(param1:MultiframeImageResource) : void
      {
         this.var_2257 = param1;
      }
      
      public function get minDistanceFromBase() : Number
      {
         return this.var_2250;
      }
      
      public function set minDistanceFromBase(param1:Number) : void
      {
         this.var_2250 = param1;
      }
      
      public function get model3ds() : Tanks3DSResource
      {
         return this.var_2246;
      }
      
      public function set model3ds(param1:Tanks3DSResource) : void
      {
         this.var_2246 = param1;
      }
      
      public function get nearVisibilityRadius() : Number
      {
         return this.var_2261;
      }
      
      public function set nearVisibilityRadius(param1:Number) : void
      {
         this.var_2261 = param1;
      }
      
      public function get radius() : Number
      {
         return this.var_2253;
      }
      
      public function set radius(param1:Number) : void
      {
         this.var_2253 = param1;
      }
      
      public function get redMineTexture() : ImageResource
      {
         return this.var_2254;
      }
      
      public function set redMineTexture(param1:ImageResource) : void
      {
         this.var_2254 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BattleMineCC [";
         _loc1_ += "activateSound = " + this.activateSound + " ";
         _loc1_ += "activateTimeMsec = " + this.activateTimeMsec + " ";
         _loc1_ += "blueMineTexture = " + this.blueMineTexture + " ";
         _loc1_ += "deactivateSound = " + this.deactivateSound + " ";
         _loc1_ += "enemyMineTexture = " + this.enemyMineTexture + " ";
         _loc1_ += "explosionMarkTexture = " + this.explosionMarkTexture + " ";
         _loc1_ += "explosionSound = " + this.explosionSound + " ";
         _loc1_ += "farVisibilityRadius = " + this.farVisibilityRadius + " ";
         _loc1_ += "friendlyMineTexture = " + this.friendlyMineTexture + " ";
         _loc1_ += "idleExplosionTexture = " + this.idleExplosionTexture + " ";
         _loc1_ += "impactForce = " + this.impactForce + " ";
         _loc1_ += "mainExplosionTexture = " + this.mainExplosionTexture + " ";
         _loc1_ += "minDistanceFromBase = " + this.minDistanceFromBase + " ";
         _loc1_ += "model3ds = " + this.model3ds + " ";
         _loc1_ += "nearVisibilityRadius = " + this.nearVisibilityRadius + " ";
         _loc1_ += "radius = " + this.radius + " ";
         _loc1_ += "redMineTexture = " + this.redMineTexture + " ";
         return _loc1_ + "]";
      }
   }
}
