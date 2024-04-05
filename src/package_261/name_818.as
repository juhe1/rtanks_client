package package_261
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.gui.name_2107;
   import package_143.class_153;
   import package_143.name_396;
   import package_283.LobbyLayoutServiceEvent;
   import package_398.NewbiesAbonementInfoWindow;
   import package_53.name_94;
   import platform.client.fp10.core.model.name_287;
   import projects.tanks.client.commons.models.layout.LayoutState;
   
   public class name_818 extends class_153 implements name_396, name_287
   {
      
      private static const const_1581:int = 1000;
      
      public static var lobbyLayoutService:name_94 = OSGi.getInstance().name_6(name_94) as name_94;
       
      
      private var var_1497:Date;
      
      private var var_1495:int;
      
      private var var_1496:int;
      
      public function name_818()
      {
         super();
      }
      
      public function showInfoWindow(param1:int, param2:int, param3:int) : void
      {
         this.var_1497 = new Date(new Date().getTime() + param1 * 1000);
         this.var_1495 = param2;
         this.var_1496 = param3;
         if(Boolean(lobbyLayoutService.isSwitchInProgress()) || lobbyLayoutService.getCurrentState() != LayoutState.BATTLE)
         {
            this.method_1691();
         }
         else
         {
            this.method_1690();
         }
      }
      
      private function method_1691() : void
      {
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,method_39(this.method_1376));
      }
      
      private function method_1376(param1:LobbyLayoutServiceEvent) : void
      {
         if(param1.state != LayoutState.BATTLE)
         {
            lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,method_39(this.method_1376));
            this.method_1690();
         }
      }
      
      private function method_1690() : void
      {
         var _loc1_:name_2107 = null;
         _loc1_ = new NewbiesAbonementInfoWindow(this.var_1497,this.var_1495,this.var_1496);
         putData(name_2107,_loc1_);
      }
      
      public function objectUnloaded() : void
      {
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,method_39(this.method_1376));
         var _loc1_:name_2107 = name_2107(getData(name_2107));
         if(_loc1_ != null)
         {
            _loc1_.destroy();
         }
      }
   }
}
