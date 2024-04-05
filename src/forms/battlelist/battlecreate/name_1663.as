package forms.battlelist.battlecreate
{
   import forms.battlelist.MapTheme;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_1663
   {
      
      public static var localeService:name_102;
       
      
      public function name_1663()
      {
         super();
      }
      
      public static function get method_2435() : String
      {
         return localeService.getText(name_390.const_916);
      }
      
      public static function get method_2430() : String
      {
         return localeService.getText(name_390.const_1444);
      }
      
      public static function get method_2427() : String
      {
         return localeService.getText(name_390.const_1316);
      }
      
      public static function get method_2438() : String
      {
         return localeService.getText(name_390.const_1043);
      }
      
      public static function get method_2446() : String
      {
         return localeService.getText(name_390.const_847);
      }
      
      public static function get method_2452() : String
      {
         return localeService.getText(name_390.const_1272);
      }
      
      public static function get method_2422() : String
      {
         return localeService.getText(name_390.const_1004);
      }
      
      public static function get method_2445() : String
      {
         return localeService.getText(name_390.const_1083);
      }
      
      public static function get method_2443() : String
      {
         return localeService.getText(name_390.const_567);
      }
      
      public static function get method_2428() : String
      {
         return localeService.getText(name_390.const_665);
      }
      
      public static function get method_2421() : String
      {
         return "Зависимые припасы";
      }
      
      public static function get method_2429() : String
      {
         return localeService.getText(name_390.const_1392);
      }
      
      public static function get method_2447() : String
      {
         return localeService.getText(name_390.const_1395);
      }
      
      public static function get method_2433() : String
      {
         return localeService.getText(name_390.const_1252);
      }
      
      public static function get method_2449() : String
      {
         return localeService.getText(name_390.const_760);
      }
      
      public static function get method_2434() : String
      {
         return localeService.getText(name_390.const_760);
      }
      
      public static function get method_2442() : String
      {
         return localeService.getText(name_390.const_1215);
      }
      
      public static function get method_2425() : String
      {
         return localeService.getText(name_390.const_933);
      }
      
      public static function get method_2450() : String
      {
         return localeService.getText(name_390.const_844);
      }
      
      public static function get method_2423() : String
      {
         return localeService.getText(name_390.const_652);
      }
      
      public static function get method_2439() : String
      {
         return localeService.getText(name_390.const_739);
      }
      
      public static function get method_2436() : String
      {
         return "DM";
      }
      
      public static function get method_2440() : String
      {
         return "TDM";
      }
      
      public static function get method_2426() : String
      {
         return "CTF";
      }
      
      public static function get method_2431() : String
      {
         return "CP";
      }
      
      public static function get method_2451() : String
      {
         return localeService.getText(name_390.const_1137);
      }
      
      public static function get method_2441() : String
      {
         return localeService.getText(name_390.const_750);
      }
      
      public static function get method_2448() : String
      {
         return "Автозавершение";
      }
      
      public static function get method_2424() : String
      {
         return localeService.getText(name_390.const_1407);
      }
      
      public static function get method_2432() : String
      {
         return localeService.getText(name_390.const_1268);
      }
      
      public static function get method_2444() : String
      {
         return localeService.getText(name_390.const_1066);
      }
      
      public static function method_2437(param1:MapTheme) : String
      {
         switch(param1.value)
         {
            case MapTheme.SUMMER.value:
               return localeService.getText(name_390.const_1315);
            case MapTheme.WINTER.value:
               return localeService.getText(name_390.const_1384);
            case MapTheme.SPACE.value:
               return localeService.getText(name_390.const_1000);
            case MapTheme.DAY.value:
               return localeService.getText(name_390.const_824);
            case MapTheme.NIGHT.value:
               return localeService.getText(name_390.const_914);
            case MapTheme.SUMMER_DAY.value:
               return localeService.getText(name_390.const_659);
            case MapTheme.SUMMER_NIGHT.value:
               return localeService.getText(name_390.const_914);
            case MapTheme.WINTER_DAY.value:
               return localeService.getText(name_390.const_988);
            case MapTheme.WINTER_NIGHT.value:
               return localeService.getText(name_390.const_692);
            default:
               return null;
         }
      }
   }
}
