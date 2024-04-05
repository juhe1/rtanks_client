package package_135
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.logging.name_26;
   import alternativa.tanks.loader.name_13;
   import package_264.class_61;
   import package_264.name_814;
   import package_283.LobbyLayoutServiceEvent;
   import package_53.name_94;
   import platform.client.fp10.core.model.name_287;
   import projects.tanks.client.commons.models.layout.LayoutState;
   
   public class LobbyLayoutNotifyModel extends class_61 implements name_814, name_793, name_287
   {
      
      public static var lobbyLayoutService:name_94 = OSGi.getInstance().name_6(name_94) as name_94;
      
      public static var loaderWindowService:name_13 = OSGi.getInstance().name_6(name_13) as name_13;
      
      public static var logService:name_26 = OSGi.getInstance().name_6(name_26) as name_26;
      
      private static const const_27:String = "LobbyLayoutNotifyModel";
      
      private static const const_1455:String = "BattleLoad:start";
      
      private static const const_1454:String = "LobbyLoad:finish";
      
      private static const const_1456:String = "LobbyLoad:start";
      
      private static const const_1457:String = "BattleLoad:finish";
       
      
      private var var_970:Boolean = false;
      
      private var const_114:LayoutState;
      
      private var var_969:LayoutState;
      
      public function LobbyLayoutNotifyModel()
      {
         super();
      }
      
      public function beginLayoutSwitch(param1:LayoutState) : void
      {
         if(param1 != null)
         {
            this.var_969 = param1;
         }
         this.method_1184();
      }
      
      public function endLayoutSwitch(param1:LayoutState, param2:LayoutState) : void
      {
         this.const_114 = param1;
         this.var_969 = param2;
         this.method_1183();
      }
      
      public function layoutSwitchPredicted() : void
      {
         loaderWindowService.show();
      }
      
      public function name_1673() : void
      {
         this.method_1183();
      }
      
      public function isSwitchInProgress() : Boolean
      {
         return this.var_970;
      }
      
      public function getCurrentState() : LayoutState
      {
         return this.var_969;
      }
      
      public function inBattle() : Boolean
      {
         return this.const_114 == LayoutState.BATTLE;
      }
      
      private function method_1184() : void
      {
         if(!this.var_970)
         {
            this.var_970 = true;
            if(this.var_969 != LayoutState.BATTLE || !lobbyLayoutService.method_652())
            {
               loaderWindowService.show();
            }
            lobbyLayoutService.dispatchEvent(new LobbyLayoutServiceEvent(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,this.var_969));
         }
      }
      
      private function method_1183() : void
      {
         if(this.var_970)
         {
            this.var_970 = false;
            if(this.var_969 != LayoutState.BATTLE)
            {
               loaderWindowService.hide();
            }
            lobbyLayoutService.dispatchEvent(new LobbyLayoutServiceEvent(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.var_969));
         }
      }
      
      public function objectUnloaded() : void
      {
         loaderWindowService.hideForcibly();
      }
   }
}
