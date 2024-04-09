package package_254
{
   import alternativa.osgi.OSGi;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_1544 extends name_2100
   {
       
      
      public function name_1544()
      {
         super();
         text = name_102(OSGi.getInstance().getService(name_102)).getText(name_390.const_1387);
         arrowLehgth = int(name_102(OSGi.getInstance().getService(name_102)).getText(name_390.const_841));
         arrowAlign = name_2221.TOP_RIGHT;
         var_601 = 3;
      }
   }
}
