package package_26
{
   import flash.events.Event;
   import package_275.name_865;
   
   public class ClanInfoUpdateEvent extends Event
   {
      
      public static const UPDATE:String = "ClanInfoUpdateEvent.UPDATE";
       
      
      public var clanName:String = "";
      
      public var clanTag:String = "";
      
      public var name_1929:String = "";
      
      public var name_1881:name_865;
      
      public var name_1961:Boolean = true;
      
      public var name_1957:int = 0;
      
      public function ClanInfoUpdateEvent()
      {
         super("ClanInfoUpdateEvent.UPDATE",true,false);
      }
   }
}
