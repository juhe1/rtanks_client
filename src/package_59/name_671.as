package package_59
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.battlefield.IBattleField;
   import package_176.DialogWindowsDispatcherServiceEvent;
   import package_176.name_549;
   import package_218.BlurServiceEvent;
   import package_218.name_637;
   import package_283.LobbyLayoutServiceEvent;
   import package_32.name_245;
   import package_32.name_665;
   import package_46.name_138;
   import package_46.name_153;
   import package_46.name_96;
   import package_53.name_94;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class name_671 implements AutoClosable
   {
      
      public static var dialogWindowsDispatcherService:name_549 = OSGi.getInstance().getService(name_549) as name_549;
      
      public static var lobbyLayoutService:name_94 = OSGi.getInstance().getService(name_94) as name_94;
      
      public static var blurService:name_637 = OSGi.getInstance().getService(name_637) as name_637;
      
      public static var battleInputService:name_245 = OSGi.getInstance().getService(name_245) as name_245;
      
      public static var battleService:IBattleField = OSGi.getInstance().getService(IBattleField) as IBattleField;
      
      public static var battleEventDispatcher:name_96 = OSGi.getInstance().getService(name_96) as name_96;
      
      private static var var_1437:Boolean;
       
      
      public function name_671()
      {
         super();
         init();
      }
      
      private static function init() : void
      {
         dialogWindowsDispatcherService.addEventListener(DialogWindowsDispatcherServiceEvent.OPEN,method_1643);
         dialogWindowsDispatcherService.addEventListener(DialogWindowsDispatcherServiceEvent.CLOSE,method_1642);
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,method_1645);
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,method_1376);
         blurService.addEventListener(BlurServiceEvent.CLICK_OVERLAY_BATTLE_CONTENT,method_1644);
         if(!lobbyLayoutService.isSwitchInProgress())
         {
            method_1642();
         }
      }
      
      private static function method_1647() : void
      {
         if(var_1437)
         {
            return;
         }
         var_1437 = true;
         battleEventDispatcher.dispatchEvent(new name_138(0));
      }
      
      private static function method_1646() : void
      {
         if(!var_1437 || Boolean(lobbyLayoutService.name_215()))
         {
            return;
         }
         var_1437 = false;
         battleEventDispatcher.dispatchEvent(new name_153());
      }
      
      private static function method_1643(param1:DialogWindowsDispatcherServiceEvent = null) : void
      {
         battleInputService.lock(name_665.name_770);
         method_1647();
      }
      
      private static function method_1642(param1:DialogWindowsDispatcherServiceEvent = null) : void
      {
         if(!lobbyLayoutService.name_215())
         {
            battleInputService.unlock(name_665.name_770);
            battleService.getBattlefieldData().viewport.setFocus();
         }
         method_1646();
      }
      
      private static function method_1645(param1:LobbyLayoutServiceEvent) : void
      {
         blurService.method_1586();
         method_1643();
      }
      
      private static function method_1376(param1:LobbyLayoutServiceEvent) : void
      {
         if(!lobbyLayoutService.name_215())
         {
            blurService.method_1590();
            method_1642();
         }
      }
      
      private static function method_1644(param1:BlurServiceEvent) : void
      {
         lobbyLayoutService.method_742();
      }
      
      public function close() : void
      {
         dialogWindowsDispatcherService.removeEventListener(DialogWindowsDispatcherServiceEvent.OPEN,method_1643);
         dialogWindowsDispatcherService.removeEventListener(DialogWindowsDispatcherServiceEvent.CLOSE,method_1642);
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,method_1645);
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,method_1376);
         blurService.removeEventListener(BlurServiceEvent.CLICK_OVERLAY_BATTLE_CONTENT,method_1644);
         blurService.method_1590();
      }
   }
}
