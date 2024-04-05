package package_420
{
   import flash.events.Event;
   
   public class StartExternalEntranceEvent extends Event
   {
      
      public static const START_REGISTRATION:String = "StartExternalEntranceEvent.START_REGISTRATION";
      
      public static const START_LOGIN:String = "StartExternalEntranceEvent.START_LOGIN";
       
      
      public var var_3090:Boolean;
      
      public var name_2104:String;
      
      public function StartExternalEntranceEvent(param1:String, param2:String, param3:Boolean)
      {
         this.name_2104 = param2;
         this.var_3090 = param3;
         super(param1);
      }
      
      override public function clone() : Event
      {
         return new StartExternalEntranceEvent(type,this.name_2104,this.var_3090);
      }
   }
}
