package package_393
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.logging.name_26;
   import flash.globalization.DateTimeFormatter;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_2002
   {
      
      public static var localeService:name_102 = OSGi.getInstance().getService(name_102) as name_102;
      
      public static var logService:name_26;
      
      private static var var_2676:DateTimeFormatter;
      
      private static var var_2677:DateTimeFormatter;
      
      private static var var_2678:DateTimeFormatter;
       
      
      public function name_2002()
      {
         super();
      }
      
      public static function name_2009(param1:Date) : String
      {
         if(var_2676 == null)
         {
            var_2676 = new DateTimeFormatter("");
            var_2676.setDateTimePattern(localeService.getText(name_390.const_1233));
         }
         return var_2676.format(param1);
      }
      
      public static function method_2583(param1:Date) : String
      {
         if(var_2677 == null)
         {
            var_2677 = new DateTimeFormatter("");
            var_2677.setDateTimePattern("HH:mm");
         }
         return var_2677.format(param1);
      }
      
      public static function method_2584(param1:Date) : String
      {
         if(var_2678 == null)
         {
            var_2678 = new DateTimeFormatter("");
            var_2678.setDateTimePattern("HH:mm");
         }
         return var_2678.format(param1);
      }
   }
}
