package alternativa.tanks.gui.settings
{
   import flash.events.Event;
   
   public class SelectTabEvent extends Event
   {
      
      public static var name_2199:String = "SelectTabEvent";
       
      
      private var var_2862:SettingsCategoryEnum;
      
      public function SelectTabEvent(param1:SettingsCategoryEnum)
      {
         super(name_2199);
         this.var_2862 = param1;
      }
      
      public function name_2200() : SettingsCategoryEnum
      {
         return this.var_2862;
      }
   }
}
