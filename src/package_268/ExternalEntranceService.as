package package_268
{
   import alternativa.tanks.service.name_554;
   import flash.system.Capabilities;
   import flash.utils.Dictionary;
   import package_10.StartupSettings;
   
   public class ExternalEntranceService implements name_554
   {
      
      public static const const_1584:String = "vkontakte";
      
      public static const const_1582:String = "discord";
      
      public static const const_1583:String = "google";
       
      
      private var var_1116:Dictionary;
      
      public function ExternalEntranceService()
      {
         this.var_1116 = new Dictionary();
         super();
      }
      
      public function get method_1403() : Boolean
      {
         if(Boolean(this.var_1116["vkontakte"]))
         {
            return this.var_1116["vkontakte"];
         }
         return false;
      }
      
      public function get method_1402() : Boolean
      {
         if(Boolean(this.var_1116["discord"]))
         {
            return this.var_1116["discord"];
         }
         return false;
      }
      
      public function get method_1404() : Boolean
      {
         if(Boolean(this.var_1116["google"]))
         {
            return Boolean(this.var_1116["google"]) && !StartupSettings.method_129 && Capabilities.playerType != "StandAlone";
         }
         return false;
      }
      
      public function setEnabled(param1:String, param2:Boolean) : void
      {
         this.var_1116[param1] = param2;
      }
   }
}
