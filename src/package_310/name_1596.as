package package_310
{
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class name_1596
   {
       
      
      private var var_2374:SoundResource;
      
      private var var_2377:SoundResource;
      
      private var var_2373:SoundResource;
      
      private var var_2372:SoundResource;
      
      private var var_2375:SoundResource;
      
      private var var_2378:SoundResource;
      
      private var var_2376:SoundResource;
      
      private var var_2379:SoundResource;
      
      public function name_1596(param1:SoundResource = null, param2:SoundResource = null, param3:SoundResource = null, param4:SoundResource = null, param5:SoundResource = null, param6:SoundResource = null, param7:SoundResource = null, param8:SoundResource = null)
      {
         super();
         this.var_2374 = param1;
         this.var_2377 = param2;
         this.var_2373 = param3;
         this.var_2372 = param4;
         this.var_2375 = param5;
         this.var_2378 = param6;
         this.var_2376 = param7;
         this.var_2379 = param8;
      }
      
      public function get enemiesWinSound() : SoundResource
      {
         return this.var_2374;
      }
      
      public function set enemiesWinSound(param1:SoundResource) : void
      {
         this.var_2374 = param1;
      }
      
      public function get flagDropSound() : SoundResource
      {
         return this.var_2377;
      }
      
      public function set flagDropSound(param1:SoundResource) : void
      {
         this.var_2377 = param1;
      }
      
      public function get flagDroppedByEnemiesSound() : SoundResource
      {
         return this.var_2373;
      }
      
      public function set flagDroppedByEnemiesSound(param1:SoundResource) : void
      {
         this.var_2373 = param1;
      }
      
      public function get flagReturnSound() : SoundResource
      {
         return this.var_2372;
      }
      
      public function set flagReturnSound(param1:SoundResource) : void
      {
         this.var_2372 = param1;
      }
      
      public function get flagReturnedByEnemiesSound() : SoundResource
      {
         return this.var_2375;
      }
      
      public function set flagReturnedByEnemiesSound(param1:SoundResource) : void
      {
         this.var_2375 = param1;
      }
      
      public function get flagTakeSound() : SoundResource
      {
         return this.var_2378;
      }
      
      public function set flagTakeSound(param1:SoundResource) : void
      {
         this.var_2378 = param1;
      }
      
      public function get flagTakenByEnemiesSound() : SoundResource
      {
         return this.var_2376;
      }
      
      public function set flagTakenByEnemiesSound(param1:SoundResource) : void
      {
         this.var_2376 = param1;
      }
      
      public function get winSound() : SoundResource
      {
         return this.var_2379;
      }
      
      public function set winSound(param1:SoundResource) : void
      {
         this.var_2379 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "CaptureTheFlagSoundFX [";
         _loc1_ += "enemiesWinSound = " + this.enemiesWinSound + " ";
         _loc1_ += "flagDropSound = " + this.flagDropSound + " ";
         _loc1_ += "flagDroppedByEnemiesSound = " + this.flagDroppedByEnemiesSound + " ";
         _loc1_ += "flagReturnSound = " + this.flagReturnSound + " ";
         _loc1_ += "flagReturnedByEnemiesSound = " + this.flagReturnedByEnemiesSound + " ";
         _loc1_ += "flagTakeSound = " + this.flagTakeSound + " ";
         _loc1_ += "flagTakenByEnemiesSound = " + this.flagTakenByEnemiesSound + " ";
         _loc1_ += "winSound = " + this.winSound + " ";
         return _loc1_ + "]";
      }
   }
}
