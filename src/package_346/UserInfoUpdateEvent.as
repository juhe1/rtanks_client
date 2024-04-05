package package_346
{
   import flash.events.Event;
   
   public class UserInfoUpdateEvent extends Event
   {
      
      public static const INFO_UPDATED:String = "UserInfoUpdateEvent.INFO_UPDATED";
       
      
      public var userId:String;
      
      public var rank:int;
      
      public var premium:Boolean;
      
      public var online:Boolean;
      
      public function UserInfoUpdateEvent(param1:String, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         this.userId = param2;
         this.rank = param3;
         this.premium = param4;
         this.online = param5;
         super(param1,param6,param7);
      }
   }
}
