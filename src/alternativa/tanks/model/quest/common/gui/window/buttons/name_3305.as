package alternativa.tanks.model.quest.common.gui.window.buttons
{
   import alternativa.osgi.OSGi;
   import controls.base.name_1890;
   import controls.labels.name_2551;
   import package_485.name_2937;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_3305 extends name_1890
   {
      
      public static var localeService:name_102 = OSGi.getInstance().getService(name_102) as name_102;
       
      
      private var var_2229:name_2551;
      
      public function name_3305()
      {
         super();
         this.var_2229 = new name_2551();
         this.var_2229.size = 11;
         name_1146(name_2937.name_2940);
         super.name_1342(localeService.getText(name_390.const_1449));
         super.method_2298(var_2223);
      }
   }
}
