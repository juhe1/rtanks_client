package alternativa.tanks.models.panel
{
   import package_222.ClanPanelNotificationModelBase;
   import package_222.name_618;
   import package_27.name_56;
   import platform.client.fp10.core.model.name_170;
   
   public class name_590 extends ClanPanelNotificationModelBase implements name_618, name_170
   {
      
      public static var clanPanelNotificationService:name_56;
       
      
      public function name_590()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         clanPanelNotificationService.init(method_771().numberNotifications);
         clanPanelNotificationService.restrictionTimeJoinClanInSec = method_771().restrictionTimeJoinClanInSec;
      }
      
      public function added() : void
      {
         clanPanelNotificationService.add();
      }
      
      public function removed() : void
      {
         clanPanelNotificationService.remove();
      }
      
      public function name_1900(param1:int) : void
      {
         clanPanelNotificationService.restrictionTimeJoinClanInSec = param1;
      }
   }
}
