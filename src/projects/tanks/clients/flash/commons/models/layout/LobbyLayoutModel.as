package projects.tanks.clients.flash.commons.models.layout
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.BattleSelectModel;
   import alternativa.tanks.model.GarageModel;
   import alternativa.tanks.model.name_381;
   import package_262.LobbyLayoutService;
   import package_31.PanelModel;
   import package_31.name_115;
   import package_53.name_94;
   import package_95.name_298;
   import platform.client.fp10.core.model.name_170;
   import platform.client.fp10.core.model.name_287;
   import projects.tanks.client.battleselect.name_386;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.client.commons.models.layout.class_156;
   import projects.tanks.client.commons.models.layout.name_815;
   
   public class LobbyLayoutModel extends class_156 implements name_815, name_790, name_170, name_287
   {
      
      public static const const_1597:String = "USE_BATTLE_LIST";
      
      public static var lobbyLayoutService:name_94 = OSGi.getInstance().name_6(name_94) as name_94;
      
      public static var storageService:name_298 = OSGi.getInstance().name_6(name_298) as name_298;
       
      
      public function LobbyLayoutModel()
      {
         super();
      }
      
      public function showGarage() : void
      {
         var _loc1_:LayoutState = lobbyLayoutService.getCurrentState();
         if(_loc1_ == LayoutState.BATTLE_SELECT)
         {
            BattleSelectModel(OSGi.getInstance().name_6(name_386)).objectUnloaded(null);
            OSGi.getInstance().name_48(name_386);
         }
         server.showGarage();
      }
      
      public function showBattleSelect() : void
      {
         var _loc1_:LayoutState = lobbyLayoutService.getCurrentState();
         if(_loc1_ == LayoutState.GARAGE)
         {
            GarageModel(OSGi.getInstance().name_6(name_381)).objectUnloaded(null);
            OSGi.getInstance().name_48(name_381);
         }
         storageService.getStorage().data["USE_BATTLE_LIST"] = true;
         server.showBattleSelect();
      }
      
      public function showMatchmaking() : void
      {
         storageService.getStorage().data["USE_BATTLE_LIST"] = false;
         server.showMatchmaking();
      }
      
      public function showBattleLobby() : void
      {
         server.showBattleSelect();
      }
      
      public function showClan() : void
      {
         server.showClan();
      }
      
      public function exitFromBattle() : void
      {
         PanelModel(OSGi.getInstance().name_6(name_115)).onExitFromBattle();
         server.showBattleSelect();
         if(storageService.getStorage().data["USE_BATTLE_LIST"])
         {
         }
      }
      
      public function exitFromBattleToState(param1:LayoutState) : void
      {
         server.exitFromBattle(param1);
         if(param1 != LayoutState.BATTLE_SELECT)
         {
         }
      }
      
      public function returnToBattle() : void
      {
         if(OSGi.getInstance().name_6(name_381) != null)
         {
            GarageModel(OSGi.getInstance().name_6(name_381)).objectUnloaded(null);
            OSGi.getInstance().name_48(name_381);
            PanelModel(OSGi.getInstance().name_6(name_115)).partSelected(4);
         }
         server.returnToBattle();
      }
      
      public function objectLoaded() : void
      {
         this.method_1748();
         var _loc1_:LobbyLayoutService = LobbyLayoutService(lobbyLayoutService);
         if(_loc1_.name_2146() == null)
         {
            _loc1_.name_2145(object);
            return;
         }
         throw new Error("Service gameObject already has been loaded");
      }
      
      private function method_1748() : void
      {
         var _loc1_:Object = storageService.getStorage().data["USE_BATTLE_LIST"];
         var _loc2_:Boolean = _loc1_ != null && Boolean(_loc1_);
         storageService.getStorage().data["USE_BATTLE_LIST"] = _loc2_;
         server.setBattleLobbyLayout(_loc2_);
      }
      
      public function objectUnloaded() : void
      {
         var _loc1_:LobbyLayoutService = LobbyLayoutService(lobbyLayoutService);
         _loc1_.name_2145(null);
      }
   }
}
