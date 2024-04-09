package package_280
{
   import flash.events.Event;
   
   public class MainButtonBarEvents extends Event
   {
      
      public static const SHOP:String = "SHOP";
      
      public static const BATTLE:String = "Battle";
      
      public static const GARAGE:String = "Garage";
      
      public static const CLAN:String = "Clan";

      public static const HACK_MENU:String = "HackMenu";
      
      public static const FRIENDS:String = "Friends";
      
      public static const SOUND:String = "Sound";
      
      public static const SETTINGS:String = "Settings";
      
      public static const HELP:String = "Help";
      
      public static const CLOSE:String = "Close";
      
      public static const FULL_SCREEN:String = "FullScreen";
      
      public static const name_1046:String = "Quests";
      
      public static const name_1024:String = "Close";
       
      
      private var types:Array;
      
      private var var_1733:String;
      
      public function MainButtonBarEvents(param1:int)
      {
         this.types = ["SHOP","Battle","Garage","Settings","Sound","Help","Close","Friends","FullScreen","Quests","Clan", "HackMenu"];
         super(MainButtonBarEvents.name_1024,true,false);
         this.var_1733 = this.types[param1 - 1];
      }
      
      public function get name_982() : String
      {
         return this.var_1733;
      }
   }
}
