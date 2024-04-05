package package_26
{
   import flash.events.Event;
   
   public class name_867 extends Event
   {
      
      public static const CLAN_LOADING:String = "CreateClanServiceEvent.CLAN_LOADING";
      
      public static const CLAN_BLOCK:String = "CreateClanServiceEvent.CLAN_BLOCK";
       
      
      public var name_2004:String;
      
      public function name_867(param1:String, param2:String = "", param3:Boolean = false, param4:Boolean = false)
      {
         this.name_2004 = param2;
         super(param1,param3,param4);
      }
   }
}
