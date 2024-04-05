package alternativa.tanks.gui.settings.controls
{
   import alternativa.tanks.gui.settings.SettingsCategoryEnum;
   import controls.buttons.class_201;
   
   public class name_2875 extends class_201
   {
       
      
      private var category:SettingsCategoryEnum;
      
      public function name_2875(param1:SettingsCategoryEnum, param2:String, param3:Class)
      {
         super(param2,param3);
         this.category = param1;
      }
      
      public function getCategory() : SettingsCategoryEnum
      {
         return this.category;
      }
   }
}
