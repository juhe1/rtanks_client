package package_395
{
   import package_13.Long;
   import package_26.ClanNotificationsManager;
   
   public class NewClanMemberIndicator extends name_2051
   {
       
      
      private var userId:Long;
      
      private var data:Object;
      
      public function NewClanMemberIndicator(param1:Long, param2:Object)
      {
         super();
         this.userId = param1;
         this.data = param2;
      }
      
      override public function updateNotifications() : void
      {
         visible = ClanNotificationsManager.name_869(this.userId) || this.isNew;
         if(visible && Boolean(stage))
         {
            ClanNotificationsManager.method_1828(this.userId);
            this.isNew = true;
         }
      }
      
      public function get isNew() : Boolean
      {
         return this.data.isNew;
      }
      
      public function set isNew(param1:Boolean) : void
      {
         this.data.isNew = param1;
         visible = param1;
      }
   }
}
