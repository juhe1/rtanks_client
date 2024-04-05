package package_207
{
   import flash.events.Event;
   
   public class UserPropertiesServiceEvent extends Event
   {
      
      public static const UPDATE_RANK:String = "UserPropertiesServiceEvent.UPDATE_RANK";
      
      public static const UPDATE_SCORE:String = "UserPropertiesServiceEvent.UPDATE_SCORE";
       
      
      public var var_2618:name_2141;
      
      public function UserPropertiesServiceEvent(param1:String, param2:name_2141, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.var_2618 = param2;
      }
   }
}
