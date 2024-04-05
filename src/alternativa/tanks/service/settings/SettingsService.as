package alternativa.tanks.service.settings
{
   import flash.events.EventDispatcher;
   import flash.media.SoundMixer;
   import flash.media.SoundTransform;
   import flash.net.SharedObject;
   import package_1.Main;
   import package_95.name_298;
   import package_95.name_526;
   
   public class SettingsService extends EventDispatcher implements name_108
   {
      
      public static var storageService:name_298 = Main.osgi.name_6(name_298) as name_526;
      
      private static const const_90:Number = 0.7;
      
      private static const const_1651:int = 8;
       
      
      private var email:String;
      
      private var var_377:Boolean;
      
      private var var_1741:Boolean = false;
      
      public function SettingsService()
      {
         super();
      }
      
      private static function method_1929(param1:Boolean, param2:Number) : void
      {
         SoundMixer.soundTransform = new SoundTransform(param1 ? Number(0) : Number(param2));
      }
      
      public function get showDropZones() : Boolean
      {
         return this.method_1928(name_1086.name_2202,true);
      }
      
      public function set showDropZones(param1:Boolean) : void
      {
         this.method_588(name_1086.name_2202,param1);
      }
      
      public function get showSkyBox() : Boolean
      {
         return this.method_1928(name_1086.name_2211,true);
      }
      
      public function get showFPS() : Boolean
      {
         return this.method_1928(name_1086.name_2215,true);
      }
      
      public function get showChat() : Boolean
      {
         return this.method_1928(name_1086.name_2209,true);
      }
      
      public function get mipMapping() : Boolean
      {
         return this.method_1928(name_1086.name_2216,true);
      }
      
      public function get alternateCamera() : Boolean
      {
         return this.method_1928(name_1086.name_1381,false);
      }
      
      public function get adaptiveFPS() : Boolean
      {
         return this.method_1928(name_1086.name_2206,false);
      }
      
      public function get inverseBackDriving() : Boolean
      {
         return this.method_1928(name_1086.name_2208,false);
      }
      
      public function get bgSound() : Boolean
      {
         return this.method_1928(name_1086.name_2214,true);
      }
      
      public function get muteSound() : Boolean
      {
         return this.method_1928(name_1086.name_2203,false);
      }
      
      public function set muteSound(param1:Boolean) : void
      {
         SettingsService.method_1929(param1,this.soundVolume);
         this.method_588(name_1086.name_2203,param1);
      }
      
      public function get shadows() : Boolean
      {
         return this.method_1928(name_1086.name_2205,true);
      }
      
      public function get softParticles() : Boolean
      {
         return this.method_1928(name_1086.name_2204,false);
      }
      
      public function get dust() : Boolean
      {
         return this.method_1928(name_1086.name_2204,false) && this.method_1928(name_1086.name_2217,false);
      }
      
      public function get ssao() : Boolean
      {
         return this.method_1928(name_1086.SSAO,false);
      }
      
      public function get fog() : Boolean
      {
         return this.method_1928(name_1086.FOG,true);
      }
      
      public function get dynamicShadows() : Boolean
      {
         return this.method_1928(name_1086.name_2207,false);
      }
      
      public function get dynamicLighting() : Boolean
      {
         var _loc1_:Boolean = this.dynamicShadows || this.ssao || this.softParticles;
         return this.method_1928(name_1086.name_2210,_loc1_);
      }
      
      public function get antialiasing() : Boolean
      {
         return this.method_1928(name_1086.name_2218,false);
      }
      
      public function get graphicsAutoQuality() : Boolean
      {
         if(this.method_1930(name_1086.name_2201))
         {
            return this.method_1928(name_1086.name_2201,false);
         }
         return false;
      }
      
      private function method_1930(param1:name_1086) : Boolean
      {
         return storageService.getStorage().data[param1.name] != null;
      }
      
      public function get soundVolume() : Number
      {
         return this.name_900(name_1086.const_1480,0.7);
      }
      
      public function set soundVolume(param1:Number) : void
      {
         method_1929(this.muteSound,param1);
         this.method_588(name_1086.const_1480,param1);
      }
      
      public function method_593() : void
      {
         method_1929(this.muteSound,this.soundVolume);
      }
      
      private function method_1928(param1:name_1086, param2:Boolean) : Boolean
      {
         var _loc3_:* = storageService.getStorage().data[param1.name];
         return _loc3_ == null ? Boolean(param2) : Boolean(_loc3_);
      }
      
      private function method_1931(param1:name_1086, param2:Boolean) : void
      {
         storageService.getStorage().data[param1.name] = param2;
      }
      
      private function name_900(param1:name_1086, param2:Number = 0) : Number
      {
         var _loc3_:Number = Number(storageService.getStorage().data[param1.name]);
         return isNaN(_loc3_) ? Number(param2) : Number(_loc3_);
      }
      
      private function method_1932(param1:name_1086, param2:Number) : void
      {
         storageService.getStorage().data[param1.name] = param2;
      }
      
      public function method_590(param1:String, param2:Boolean) : void
      {
         this.email = param1;
         this.var_377 = param2;
      }
      
      public function method_587() : Boolean
      {
         return this.email != null && this.email != "";
      }
      
      public function method_592() : Boolean
      {
         return !this.method_591();
      }
      
      public function method_589() : String
      {
         return this.email != null ? this.email : "";
      }
      
      public function method_591() : Boolean
      {
         return this.var_377;
      }
      
      public function method_586(param1:Boolean) : void
      {
         this.var_377 = param1;
      }
      
      public function get mouseControl() : Boolean
      {
         return this.method_1928(name_1086.name_2212,true);
      }
      
      public function get mouseSensitivity() : int
      {
         return this.name_900(name_1086.name_2219,8);
      }
      
      public function get mouseYInverse() : Boolean
      {
         return this.method_1928(name_1086.name_2213,false);
      }
      
      public function get mouseYInverseShaftAim() : Boolean
      {
         return this.method_1928(name_1086.name_2220,false);
      }
      
      public function get isPasswordSet() : Boolean
      {
         return this.var_1741;
      }
      
      public function set isPasswordSet(param1:Boolean) : void
      {
         this.var_1741 = param1;
      }
      
      public function get showDamage() : Boolean
      {
         return this.method_1928(name_1086.SHOW_DAMAGE,true);
      }
      
      public function method_588(param1:name_1086, param2:Object) : void
      {
         var _loc3_:SharedObject = storageService.getStorage();
         _loc3_.data[param1.name] = param2;
         _loc3_.flush();
         dispatchEvent(new SettingsServiceEvent(SettingsServiceEvent.SETTINGS_CHANGED,param1));
      }
   }
}
