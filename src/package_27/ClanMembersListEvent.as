package package_27
{
   import flash.events.Event;
   import package_13.Long;
   
   public class ClanMembersListEvent extends Event
   {
      
      public static const REMOVE_USER:String = "ClanMembersListEvent.REMOVE_USER";
      
      public static const ACCEPTED_USER:String = "ClanMembersListEvent.ACCEPTED_USER";
      
      public static const REJECT_USER:String = "ClanMembersListEvent.REJECT_USER";
      
      public static const REVOKE_USER:String = "ClanMembersListEvent.REVOKE_USER";
       
      
      public var userId:Long;
      
      public var name_2031:String;
      
      public function ClanMembersListEvent(param1:String, param2:Long, param3:String = "", param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         this.userId = param2;
         this.name_2031 = param3;
      }
   }
}
