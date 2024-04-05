package package_180
{
   import flash.events.Event;
   
   public class SocialNetworkServiceEvent extends Event
   {
      
      public static const CREATE_LINK:String = "SocialNetworkServiceEvent.CREATE_LINK";
      
      public static const UNLINK:String = "SocialNetworkServiceEvent.UNLINK";
      
      public static const LINK_SUCCESS:String = "SocialNetworkServiceEvent.LINK_SUCCESS";
      
      public static const UNLINK_SUCCESS:String = "SocialNetworkServiceEvent.UNLINK_SUCCESS";
       
      
      public var name_2104:String;
      
      public function SocialNetworkServiceEvent(param1:String, param2:String)
      {
         this.name_2104 = param2;
         super(param1);
      }
   }
}
