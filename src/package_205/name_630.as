package package_205
{
   import alternativa.tanks.models.user.name_580;
   import package_13.Long;
   import package_219.ClanAcceptedNotificatorModelBase;
   import package_219.name_605;
   import package_26.ClanNotificationEvent;
   import package_26.ClanNotificationsManager;
   import platform.client.fp10.core.model.name_170;
   import platform.client.fp10.core.model.name_287;
   
   public class name_630 extends ClanAcceptedNotificatorModelBase implements name_170, name_287, name_605
   {
       
      
      public function name_630()
      {
         super();
      }
      
      public function method_1409(param1:Long) : void
      {
         if(!this.method_1427())
         {
            return;
         }
         ClanNotificationsManager.name_1906(param1);
      }
      
      public function method_1408(param1:Long) : void
      {
         if(!this.method_1427())
         {
            return;
         }
         ClanNotificationsManager.name_1907(param1);
      }
      
      public function objectLoaded() : void
      {
         if(!this.method_1427())
         {
            return;
         }
         ClanNotificationsManager.name_1908(method_771().objects);
         ClanNotificationsManager.dispatcher.addEventListener(ClanNotificationEvent.REMOVE_ACCEPTED_NOTIFICATION,method_39(this.method_1448));
      }
      
      public function objectUnloaded() : void
      {
         if(!this.method_1427())
         {
            return;
         }
         ClanNotificationsManager.dispatcher.removeEventListener(ClanNotificationEvent.REMOVE_ACCEPTED_NOTIFICATION,method_39(this.method_1448));
      }
      
      private function method_1448(param1:ClanNotificationEvent) : void
      {
         server.remove(param1.id);
      }
      
      private function method_1427() : Boolean
      {
         return name_580(object.name_176(name_580)).loadingInServiceSpace();
      }
   }
}
