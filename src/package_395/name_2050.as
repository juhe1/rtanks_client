package package_395
{
   import package_13.Long;
   import package_26.ClanNotificationsManager;
   
   public class name_2050 extends name_2051
   {
       
      
      private var userId:Long;
      
      private var var_2702:Boolean = true;
      
      public function name_2050(param1:Long)
      {
         super();
         this.userId = param1;
      }
      
      override public function hide() : void
      {
         this.var_2702 = false;
      }
      
      override public function show() : void
      {
         this.var_2702 = true;
      }
      
      override public function updateNotifications() : void
      {
         visible = ClanNotificationsManager.name_1949(this.userId) && this.var_2702;
      }
   }
}
