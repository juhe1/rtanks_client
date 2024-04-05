package package_25
{
   import flash.events.Event;
   
   public class RestrictionJoinClanEvent extends Event
   {
      
      public static const UPDATE:String = "RestrictionJoinClanEvent.UPDATE";
       
      
      public function RestrictionJoinClanEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
