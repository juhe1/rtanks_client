package package_395
{
   import package_13.Long;
   import package_26.ClanUserNotificationsManager;
   
   public class name_2048 extends name_2051
   {
       
      
      private var clanId:Long;
      
      public function name_2048(param1:Long)
      {
         super();
         this.clanId = param1;
      }
      
      override public function updateNotifications() : void
      {
         visible = ClanUserNotificationsManager.name_1873(this.clanId);
      }
   }
}
