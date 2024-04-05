package package_10
{
   import flash.display.Sprite;
   import flash.system.Capabilities;
   
   public class StartupSettings
   {
      
      public static var name_22:Sprite;
       
      
      public function StartupSettings()
      {
         super();
      }
      
      public static function method_130() : void
      {
         if(name_22 != null)
         {
            name_22["closeLauncher"]();
         }
      }
      
      public static function isUserFromTutorial() : Boolean
      {
         if(name_22 != null)
         {
            return name_22["isUserFromTutorial"]();
         }
         return false;
      }
      
      public static function get method_129() : Boolean
      {
         return Capabilities.playerType == "Desktop" || Capabilities.playerType == "External";
      }
   }
}
