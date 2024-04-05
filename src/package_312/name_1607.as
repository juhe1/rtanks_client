package package_312
{
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class name_1607
   {
       
      
      private var var_2385:SoundResource;
      
      private var var_2383:SoundResource;
      
      private var var_2389:SoundResource;
      
      private var var_2387:SoundResource;
      
      private var var_2390:SoundResource;
      
      private var var_2388:SoundResource;
      
      private var var_2382:SoundResource;
      
      private var var_2386:SoundResource;
      
      private var var_2384:SoundResource;
      
      private var var_2381:SoundResource;
      
      public function name_1607(param1:SoundResource = null, param2:SoundResource = null, param3:SoundResource = null, param4:SoundResource = null, param5:SoundResource = null, param6:SoundResource = null, param7:SoundResource = null, param8:SoundResource = null, param9:SoundResource = null, param10:SoundResource = null)
      {
         super();
         this.var_2385 = param1;
         this.var_2383 = param2;
         this.var_2389 = param3;
         this.var_2387 = param4;
         this.var_2390 = param5;
         this.var_2388 = param6;
         this.var_2382 = param7;
         this.var_2386 = param8;
         this.var_2384 = param9;
         this.var_2381 = param10;
      }
      
      public function get pointCaptureStartNegativeSound() : SoundResource
      {
         return this.var_2385;
      }
      
      public function set pointCaptureStartNegativeSound(param1:SoundResource) : void
      {
         this.var_2385 = param1;
      }
      
      public function get pointCaptureStartPositiveSound() : SoundResource
      {
         return this.var_2383;
      }
      
      public function set pointCaptureStartPositiveSound(param1:SoundResource) : void
      {
         this.var_2383 = param1;
      }
      
      public function get pointCaptureStopNegativeSound() : SoundResource
      {
         return this.var_2389;
      }
      
      public function set pointCaptureStopNegativeSound(param1:SoundResource) : void
      {
         this.var_2389 = param1;
      }
      
      public function get pointCaptureStopPositiveSound() : SoundResource
      {
         return this.var_2387;
      }
      
      public function set pointCaptureStopPositiveSound(param1:SoundResource) : void
      {
         this.var_2387 = param1;
      }
      
      public function get pointCapturedNegativeSound() : SoundResource
      {
         return this.var_2390;
      }
      
      public function set pointCapturedNegativeSound(param1:SoundResource) : void
      {
         this.var_2390 = param1;
      }
      
      public function get pointCapturedPositiveSound() : SoundResource
      {
         return this.var_2388;
      }
      
      public function set pointCapturedPositiveSound(param1:SoundResource) : void
      {
         this.var_2388 = param1;
      }
      
      public function get pointNeutralizedNegativeSound() : SoundResource
      {
         return this.var_2382;
      }
      
      public function set pointNeutralizedNegativeSound(param1:SoundResource) : void
      {
         this.var_2382 = param1;
      }
      
      public function get pointNeutralizedPositiveSound() : SoundResource
      {
         return this.var_2386;
      }
      
      public function set pointNeutralizedPositiveSound(param1:SoundResource) : void
      {
         this.var_2386 = param1;
      }
      
      public function get pointScoreDecreasingSound() : SoundResource
      {
         return this.var_2384;
      }
      
      public function set pointScoreDecreasingSound(param1:SoundResource) : void
      {
         this.var_2384 = param1;
      }
      
      public function get pointScoreIncreasingSound() : SoundResource
      {
         return this.var_2381;
      }
      
      public function set pointScoreIncreasingSound(param1:SoundResource) : void
      {
         this.var_2381 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "DominationSounds [";
         _loc1_ += "pointCaptureStartNegativeSound = " + this.pointCaptureStartNegativeSound + " ";
         _loc1_ += "pointCaptureStartPositiveSound = " + this.pointCaptureStartPositiveSound + " ";
         _loc1_ += "pointCaptureStopNegativeSound = " + this.pointCaptureStopNegativeSound + " ";
         _loc1_ += "pointCaptureStopPositiveSound = " + this.pointCaptureStopPositiveSound + " ";
         _loc1_ += "pointCapturedNegativeSound = " + this.pointCapturedNegativeSound + " ";
         _loc1_ += "pointCapturedPositiveSound = " + this.pointCapturedPositiveSound + " ";
         _loc1_ += "pointNeutralizedNegativeSound = " + this.pointNeutralizedNegativeSound + " ";
         _loc1_ += "pointNeutralizedPositiveSound = " + this.pointNeutralizedPositiveSound + " ";
         _loc1_ += "pointScoreDecreasingSound = " + this.pointScoreDecreasingSound + " ";
         _loc1_ += "pointScoreIncreasingSound = " + this.pointScoreIncreasingSound + " ";
         return _loc1_ + "]";
      }
   }
}
