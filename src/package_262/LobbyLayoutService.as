package package_262
{
   import alternativa.osgi.OSGi;
   import flash.events.EventDispatcher;
   import flash.external.ExternalInterface;
   import flash.net.SharedObject;
   import package_10.StartupSettings;
   import package_124.AlertServiceEvent;
   import package_124.name_42;
   import package_135.name_793;
   import package_137.Alert;
   import package_137.name_358;
   import package_176.name_549;
   import package_53.name_94;
   import package_54.name_102;
   import package_75.name_274;
   import package_95.name_298;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.clients.flash.commons.models.layout.name_790;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class LobbyLayoutService extends EventDispatcher implements name_94
   {
      
      public static var alertService:name_42 = OSGi.getInstance().name_6(name_42) as name_42;
      
      public static var storageService:name_298 = OSGi.getInstance().name_6(name_298) as name_298;
      
      public static var localeService:name_102 = OSGi.getInstance().name_6(name_102) as name_102;
      
      public static var battleInfoService:name_274 = OSGi.getInstance().name_6(name_274) as name_274;
      
      public static var dialogWindowsDispatcherService:name_549 = OSGi.getInstance().name_6(name_549) as name_549;
       
      
      private var var_1582:name_70;
      
      private var var_1583:Boolean;
      
      public function LobbyLayoutService()
      {
         super();
      }
      
      private static function method_1771() : void
      {
         alertService.name_1038(Alert.name_1049);
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,method_1768);
      }
      
      private static function method_1768(param1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,method_1768);
         if(param1.name_982 == name_358.name_990)
         {
            method_1770();
            if(ExternalInterface.available)
            {
               ExternalInterface.call("goToMainPage");
            }
            if(StartupSettings.method_129)
            {
               StartupSettings.method_130();
            }
         }
      }
      
      private static function method_1770() : void
      {
         var _loc1_:SharedObject = storageService.getStorage();
         _loc1_.data.userHash = null;
         _loc1_.flush();
      }
      
      public function showGarage() : void
      {
         this.layoutSwitchPredicted();
         name_790(this.var_1582.name_176(name_790)).showGarage();
      }
      
      public function showBattleSelect() : void
      {
         this.layoutSwitchPredicted();
         name_790(this.var_1582.name_176(name_790)).showBattleSelect();
      }
      
      public function showMatchmaking() : void
      {
         this.layoutSwitchPredicted();
         name_790(this.var_1582.name_176(name_790)).showMatchmaking();
      }
      
      public function showBattleLobby() : void
      {
         this.layoutSwitchPredicted();
         name_790(this.var_1582.name_176(name_790)).showBattleLobby();
      }
      
      public function showClan() : void
      {
         this.layoutSwitchPredicted();
         name_790(this.var_1582.name_176(name_790)).showClan();
      }
      
      public function exitFromBattle() : void
      {
         if(battleInfoService.name_1016())
         {
            this.showExitFromBattleAlert();
         }
         else
         {
            this.showExitFromBattleAlert();
         }
      }
      
      private function showExitFromBattleAlert() : void
      {
         var _loc1_:String = this.method_538();
         alertService.showAlert(_loc1_,Vector.<String>([localeService.getText(name_390.name_1018),localeService.getText(name_390.name_1061)]));
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.method_532);
      }
      
      private function method_538() : String
      {
         return localeService.getText(name_390.name_1033);
      }
      
      private function method_532(param1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.method_532);
         if(param1.name_982 == localeService.getText(name_390.name_1018))
         {
            this.method_741();
         }
      }
      
      public function method_741() : void
      {
         this.layoutSwitchPredicted();
         name_790(this.var_1582.name_176(name_790)).exitFromBattle();
      }
      
      public function exitFromBattleToState(param1:LayoutState) : void
      {
         this.layoutSwitchPredicted();
         name_790(this.var_1582.name_176(name_790)).exitFromBattleToState(param1);
      }
      
      public function method_744() : void
      {
         if(StartupSettings.method_129)
         {
            method_1771();
         }
      }
      
      public function name_2146() : name_70
      {
         return this.var_1582;
      }
      
      public function name_2145(param1:name_70) : void
      {
         this.var_1582 = param1;
      }
      
      private function method_1769() : void
      {
         if(this.var_1582 == null)
         {
            throw new Error("Service object isn\'t loaded");
         }
      }
      
      public function isSwitchInProgress() : Boolean
      {
         this.method_1769();
         return name_793(this.var_1582.name_176(name_793)).isSwitchInProgress();
      }
      
      public function getCurrentState() : LayoutState
      {
         this.method_1769();
         return name_793(this.var_1582.name_176(name_793)).getCurrentState();
      }
      
      public function inBattle() : Boolean
      {
         if(this.var_1582 == null)
         {
            return false;
         }
         return name_793(this.var_1582.name_176(name_793)).inBattle();
      }
      
      private function layoutSwitchPredicted() : void
      {
         this.method_1769();
         name_793(this.var_1582.name_176(name_793)).layoutSwitchPredicted();
      }
      
      public function name_215() : Boolean
      {
         return this.inBattle() && (this.getCurrentState() != LayoutState.BATTLE || Boolean(dialogWindowsDispatcherService.name_1065()));
      }
      
      public function method_742() : void
      {
         if(!this.isSwitchInProgress() && this.method_1772())
         {
            this.returnToBattle();
         }
      }
      
      private function method_1772() : Boolean
      {
         return this.inBattle() && this.getCurrentState() != LayoutState.BATTLE;
      }
      
      public function returnToBattle() : void
      {
         name_790(this.var_1582.name_176(name_790)).returnToBattle();
      }
      
      public function method_743(param1:Boolean) : void
      {
         this.var_1583 = param1;
      }
      
      public function method_652() : Boolean
      {
         return this.var_1583;
      }
   }
}
