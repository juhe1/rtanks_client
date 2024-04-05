package package_190
{
   import flash.events.EventDispatcher;
   
   public class ClanInfoDelayed extends EventDispatcher
   {
      
      public static const name_2003:String = "ClanInfoDelayed.";
      
      private static var _instance:ClanInfoDelayed;
       
      
      public function ClanInfoDelayed()
      {
         super();
         if(_instance != null)
         {
            throw new Error("More than one instance created!");
         }
      }
      
      public static function getInstance() : ClanInfoDelayed
      {
         if(_instance == null)
         {
            _instance = new ClanInfoDelayed();
         }
         return _instance;
      }
   }
}
