package package_256
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.quest.challenge.name_547;
   import package_104.class_154;
   import package_104.name_385;
   import package_175.name_2128;
   import package_175.name_539;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_806 extends class_154 implements name_385
   {
      
      public static var var_382:name_539 = OSGi.getInstance().getService(name_539) as name_539;
      
      public static var localeService:name_102 = OSGi.getInstance().getService(name_102) as name_102;
      
      public static var var_1521:name_547 = OSGi.getInstance().getService(name_547) as name_547;
       
      
      public function name_806()
      {
         super();
      }
      
      public function rewardNotify(param1:int) : void
      {
         var _loc2_:String = String(localeService.getText(name_390.const_850).replace("%number%",var_1521.method_1369(param1)));
         var_382.addNotification(new name_2128(_loc2_));
      }
   }
}
