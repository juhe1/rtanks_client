package package_124
{
   import flash.events.Event;
   
   public class AlertServiceEvent extends Event
   {
      
      public static const ALERT_BUTTON_PRESSED:String = "AlertServiceEvent.ALERT_BUTTON_PRESSED";
       
      
      public var name_982:String;
      
      public function AlertServiceEvent(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.name_982 = param2;
      }
   }
}
