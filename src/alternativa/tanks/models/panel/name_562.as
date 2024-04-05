package alternativa.tanks.models.panel
{
   import package_207.UserPropertiesServiceEvent;
   import package_207.name_561;
   import package_229.ClanLoadingPanelModelBase;
   import package_229.name_607;
   import package_26.name_62;
   import package_27.name_56;
   import package_31.name_115;
   import package_90.ContextMenuServiceEvent;
   import package_90.name_308;
   import platform.client.fp10.core.model.name_170;
   import platform.client.fp10.core.model.name_287;
   
   public class name_562 extends ClanLoadingPanelModelBase implements name_607, name_170, name_287
   {
      
      public static var contextMenuService:name_308;
      
      public static var userPropertiesService:name_561;
      
      public static var panel:name_115;
      
      public static var clanService:name_62;
      
      public static var clanPanelNotification:name_56;
       
      
      public function name_562()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         userPropertiesService.addEventListener(UserPropertiesServiceEvent.UPDATE_RANK,method_39(this.name_1040));
         clanService.minRankForCreateClan = method_771().minRankForCreateClan;
         clanPanelNotification.clanButtonVisible = method_771().clanButtonVisible;
      }
      
      private function name_1040(param1:UserPropertiesServiceEvent) : void
      {
         clanPanelNotification.clanButtonVisible = userPropertiesService.rank >= method_771().minRankForCreateClan;
      }
      
      private function method_1447(param1:ContextMenuServiceEvent) : void
      {
      }
      
      public function objectUnloaded() : void
      {
      }
   }
}
