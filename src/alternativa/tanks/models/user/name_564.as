package alternativa.tanks.models.user
{
   import alternativa.tanks.gui.notinclan.name_568;
   import alternativa.tanks.loader.name_13;
   import package_25.name_52;
   import package_26.name_62;
   import package_280.MainButtonBarEvents;
   import package_31.PanelModel;
   import package_31.name_115;
   import platform.client.fp10.core.model.name_141;
   import platform.client.fp10.core.model.name_287;
   import projects.tanks.client.clans.user.class_145;
   import projects.tanks.client.clans.user.name_650;
   
   public class name_564 extends class_145 implements name_650, name_141, name_287
   {
      
      public static var clanUserService:name_65;
      
      public static var clanService:name_62;
      
      public static var clanUserInfoService:name_52;
      
      public static var loaderWindowService:name_13;
      
      public static var panelView:name_115;
       
      
      public function name_564()
      {
         super();
      }
      
      public function objectLoadedPost() : void
      {
         if(name_580(object.name_176(name_580)).loadingInServiceSpace())
         {
            PanelModel(panelView).getPanel().buttonBar.addEventListener(MainButtonBarEvents.name_1024,method_39(this.method_515));
            clanUserService.addEventListener(ClanUserServiceEvent.HIDE_CLAN_WINDOW,method_39(this.method_1571));
         }
      }
      
      private function method_1571(param1:ClanUserServiceEvent) : void
      {
         server.name_2034();
         PanelModel(panelView).getPanel().buttonBar.clanButton.enable = true;
      }
      
      private function method_515(param1:MainButtonBarEvents) : void
      {
         if(param1.name_982 == MainButtonBarEvents.CLAN && !clanUserInfoService.clanMember)
         {
            PanelModel(panelView).getPanel().buttonBar.clanButton.enable = false;
            loaderWindowService.show();
            server.showClan();
         }
      }
      
      public function showWindow() : void
      {
         loaderWindowService.hideForcibly();
         var _loc1_:name_568 = new name_568(object);
         clanService.notInClanPanel = _loc1_;
      }
      
      public function objectUnloaded() : void
      {
         PanelModel(panelView).getPanel().buttonBar.removeEventListener(MainButtonBarEvents.name_1024,method_39(this.method_515));
         clanUserService.removeEventListener(ClanUserServiceEvent.HIDE_CLAN_WINDOW,method_39(this.method_1571));
         if(clanService.notInClanPanel != null)
         {
            clanService.notInClanPanel.destroy();
         }
      }
   }
}
