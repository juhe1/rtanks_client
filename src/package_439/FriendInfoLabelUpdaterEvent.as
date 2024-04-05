package package_439
{
   import flash.events.Event;
   
   public class FriendInfoLabelUpdaterEvent extends Event
   {
      
      public static const CHANGE_STATE:String = "FriendInfoLabelUpdaterEvent.CHANGE_STATE";
       
      
      public function FriendInfoLabelUpdaterEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
