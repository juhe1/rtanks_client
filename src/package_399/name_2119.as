package package_399
{
   import alternativa.osgi.OSGi;
   import package_254.name_2100;
   import package_254.name_2221;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_2119 extends name_2100
   {
      
      public static var localeService:name_102 = name_102(OSGi.getInstance().getService(name_102));
       
      
      public function name_2119()
      {
         super();
         text = localeService.getText(name_390.const_650);
         arrowLehgth = 20;
         arrowAlign = name_2221.TOP_LEFT;
         var_601 = 3;
      }
   }
}
