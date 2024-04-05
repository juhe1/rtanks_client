package alternativa.tanks.gui.settings
{
   import alternativa.tanks.class_18;
   
   public class SettingsCategoryEnum extends class_18
   {
      
      private static var var_292:Vector.<SettingsCategoryEnum>;
      
      public static const GRAPHIC:SettingsCategoryEnum = new SettingsCategoryEnum(0,"GRAPHIC");
      
      public static const ACCOUNT:SettingsCategoryEnum = new SettingsCategoryEnum(1,"ACCOUNT");
      
      public static const SOUND:SettingsCategoryEnum = new SettingsCategoryEnum(2,"SOUND");
      
      public static const GAME:SettingsCategoryEnum = new SettingsCategoryEnum(3,"GAME");
      
      public static const CONTROL:SettingsCategoryEnum = new SettingsCategoryEnum(4,"CONTROL");
       
      
      public function SettingsCategoryEnum(param1:int, param2:String)
      {
         super(param1,param2);
      }
      
      public static function get method_393() : Vector.<SettingsCategoryEnum>
      {
         if(!var_292)
         {
            var_292 = new Vector.<SettingsCategoryEnum>(5,true);
            var_292[GRAPHIC.value] = GRAPHIC;
            var_292[ACCOUNT.value] = ACCOUNT;
            var_292[SOUND.value] = SOUND;
            var_292[GAME.value] = GAME;
            var_292[CONTROL.value] = CONTROL;
         }
         return var_292;
      }
   }
}
