package package_27
{
   import flash.events.Event;
   
   public class ClanPanelNotificationEvent extends Event
   {
      
      public static const UPDATE:String = "ClanPanelNotificationEvent.UPDATE";
       
      
      private var var_1636:int;
      
      public function ClanPanelNotificationEvent(param1:String, param2:int, param3:Boolean = false, param4:Boolean = false)
      {
         this.var_1636 = param2;
         super(param1,param3,param4);
      }
      
      public function get notification() : int
      {
         return this.var_1636;
      }
      
      public function set notification(param1:int) : void
      {
         this.var_1636 = param1;
      }
   }
}
