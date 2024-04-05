package package_201
{
   import alternativa.tanks.models.user.name_580;
   import alternativa.tanks.models.user.name_65;
   import package_13.Long;
   import package_232.ClanUserIncomingNotificatorModelBase;
   import package_232.name_645;
   import package_26.ClanNotificationEvent;
   import package_26.ClanUserNotificationsManager;
   import platform.client.fp10.core.model.name_170;
   import platform.client.fp10.core.model.name_287;
   import platform.client.fp10.core.type.name_70;
   
   public class name_589 extends ClanUserIncomingNotificatorModelBase implements name_170, name_287, name_645
   {
      
      public static var clanUserService:name_65;
       
      
      public function name_589()
      {
         super();
      }
      
      public function method_1409(param1:Long) : void
      {
         if(!this.method_1427())
         {
            return;
         }
         ClanUserNotificationsManager.name_1944(param1);
      }
      
      public function method_1408(param1:Long) : void
      {
         if(!this.method_1427())
         {
            return;
         }
         ClanUserNotificationsManager.name_1946(param1);
      }
      
      public function objectLoaded() : void
      {
         if(!this.method_1427())
         {
            return;
         }
         ClanUserNotificationsManager.name_1945(method_771().objects);
         ClanUserNotificationsManager.dispatcher.addEventListener(ClanNotificationEvent.REMOVE_INCOMING_NOTIFICATION,method_39(this.method_1448));
      }
      
      public function objectUnloaded() : void
      {
         if(!this.method_1427())
         {
            return;
         }
         ClanUserNotificationsManager.dispatcher.removeEventListener(ClanNotificationEvent.REMOVE_INCOMING_NOTIFICATION,method_39(this.method_1448));
         ClanUserNotificationsManager.name_1880();
      }
      
      private function method_1448(param1:ClanNotificationEvent) : void
      {
         if(!this.method_1427())
         {
            return;
         }
         var _loc2_:name_70 = clanUserService.method_355(param1.id);
         server.method_1484(_loc2_);
      }
      
      private function method_1427() : Boolean
      {
         return name_580(object.name_176(name_580)).loadingInServiceSpace();
      }
   }
}
