package alternativa.tanks.service.settings
{
   import flash.events.Event;
   
   public class SettingsServiceEvent extends Event
   {
      
      public static const SETTINGS_CHANGED:String = "SettingsServiceEvent.SETTINGS_CHANGED";
       
      
      private var var_1753:name_1086;
      
      public function SettingsServiceEvent(param1:String, param2:name_1086)
      {
         super(param1,true,false);
         this.var_1753 = param2;
      }
      
      public function name_1383() : name_1086
      {
         return this.var_1753;
      }
   }
}
