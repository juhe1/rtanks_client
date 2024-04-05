package package_390
{
   import flash.events.Event;
   
   public class UserLabelEvent extends Event
   {
      
      public static const CLICK_WITH_CTRL:String = "UserLabelEvent.CLICK_WITH_CTRL";
       
      
      public var uid:String;
      
      public function UserLabelEvent(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         this.uid = param2;
         super(param1,param3,param4);
      }
   }
}
