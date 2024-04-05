package package_26
{
   import flash.events.Event;
   import package_13.Long;
   
   public class ClanNotificationEvent extends Event
   {
      
      public static const REMOVE_ACCEPTED_NOTIFICATION:String = "ClanNotificationEvent.REMOVE_ACCEPTED_NOTIFICATION";
      
      public static const REMOVE_INCOMING_NOTIFICATION:String = "ClanNotificationEvent.REMOVE_INCOMING_NOTIFICATION";
       
      
      public var id:Long;
      
      public function ClanNotificationEvent(param1:String, param2:Long, param3:Boolean = false, param4:Boolean = false)
      {
         this.id = param2;
         super(param1,param3,param4);
      }
   }
}
