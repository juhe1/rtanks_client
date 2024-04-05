package alternativa.tanks.model.friends
{
   import flash.events.EventDispatcher;
   import package_347.name_1666;
   import package_439.FriendInfoLabelUpdaterEvent;
   
   public class name_1667 extends EventDispatcher
   {
       
      
      public function name_1667()
      {
         super();
      }
      
      public function name_1668(param1:name_1666) : void
      {
         dispatchEvent(new FriendInfoLabelUpdaterEvent(FriendInfoLabelUpdaterEvent.CHANGE_STATE));
      }
      
      public function name_1670(param1:String) : void
      {
         dispatchEvent(new NewFriendEvent(NewFriendEvent.ACCEPTED_CHANGE,param1));
      }
      
      public function name_1671(param1:String) : void
      {
         dispatchEvent(new NewFriendEvent(NewFriendEvent.INCOMING_CHANGE,param1));
      }
   }
}
