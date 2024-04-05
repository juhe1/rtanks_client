package package_401
{
   import flash.events.Event;
   
   public class name_2154 extends Event
   {
      
      public static const CHANGE_RANK:String = "UserLabelUpdaterEvent.CHANGE_RANK";
      
      public static const CHANGE_UID:String = "UserLabelUpdaterEvent.CHANGE_UID";
      
      public static const const_2200:String = "UserLabelUpdaterEvent.CHANGE_STATUS";
      
      public static const CHANGE_BATTLE_LINK:String = "UserLabelUpdaterEvent.CHANGE_BATTLE_LINK";
      
      public static const CHANGE_PREMIUM_STATUS:String = "UserLabelUpdaterEvent.CHANGE_PREMIUM_STATUS";
       
      
      public var premium:Boolean;
      
      public var user:String;
      
      public function name_2154(param1:String, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false, param5:String = null)
      {
         super(param1,param2,param3);
         this.premium = param4;
         this.user = param5;
      }
   }
}
