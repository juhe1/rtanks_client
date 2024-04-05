package package_200
{
   import alternativa.tanks.models.user.name_580;
   import flash.events.Event;
   import package_13.Long;
   import package_231.ClanUserAcceptedNotificatorModelBase;
   import package_231.name_621;
   import package_27.name_56;
   import platform.client.fp10.core.model.name_170;
   import platform.client.fp10.core.model.name_287;
   
   public class ClanUserAcceptedNotificatorModel extends ClanUserAcceptedNotificatorModelBase implements name_621, name_170, name_287
   {
      
      public static var clanPanelNotificationService:name_56;
       
      
      private var clanId:Long;
      
      public function ClanUserAcceptedNotificatorModel()
      {
         super();
      }
      
      public function method_1409(param1:Long) : void
      {
         this.clanId = param1;
         clanPanelNotificationService.add();
      }
      
      public function method_1408(param1:Long) : void
      {
         this.clanId = null;
         clanPanelNotificationService.remove();
      }
      
      public function objectLoaded() : void
      {
         if(!this.method_1427())
         {
            return;
         }
         if(method_771().objects.length > 0)
         {
            this.clanId = method_771().objects[0];
         }
      }
      
      private function method_1484() : void
      {
         if(this.clanId != null)
         {
            server.method_1484(this.clanId);
         }
      }
      
      private function method_1485(param1:Event) : void
      {
         this.method_1484();
      }
      
      private function method_1427() : Boolean
      {
         return name_580(object.name_176(name_580)).loadingInServiceSpace();
      }
      
      public function objectUnloaded() : void
      {
         if(!this.method_1427())
         {
            return;
         }
      }
   }
}
