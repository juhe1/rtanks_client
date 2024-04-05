package package_90
{
   import flash.events.Event;
   
   public class ContextMenuServiceEvent extends Event
   {
      
      public static const WRITE_IN_CHAT:String = "ContextMenuServiceEvent.WRITE_IN_CHAT";
      
      public static const REMOVE_FROM_FRIENDS:String = "ContextMenuServiceEvent.REMOVE_FROM_FRIENDS";
      
      public static const REJECT_REQUEST:String = "ContextMenuServiceEvent.REJECT_REQUEST";
      
      public static const ACCEPT_REQUEST:String = "ContextMenuServiceEvent.ACCEPT_REQUEST";
      
      public static const CANCEL_REQUEST:String = "ContextMenuServiceEvent.CANCEL_REQUEST";
      
      public static const FOCUS_ON_USER:String = "ContextMenuServiceEvent.FOCUS_ON_USER";
      
      public static const VOTE_USER:String = "ContextMenuServiceEvent.VOTE_USER";
       
      
      public var userId:String;
      
      public var uid:String;
      
      public function ContextMenuServiceEvent(param1:String, param2:String, param3:String, param4:Boolean = false, param5:Boolean = false)
      {
         this.userId = param2;
         this.uid = param3;
         super(param1,param4,param5);
      }
   }
}
