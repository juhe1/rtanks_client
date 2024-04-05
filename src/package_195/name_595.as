package package_195
{
   import package_13.Long;
   import package_234.class_148;
   import package_234.name_633;
   import package_26.name_62;
   import platform.client.fp10.core.model.name_170;
   import platform.client.fp10.core.model.name_287;
   
   public class name_595 extends class_148 implements name_633, name_582, name_170, name_287
   {
      
      public static var clanService:name_62;
       
      
      public function name_595()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         clanService.clanPanelModel = name_582(object.name_176(name_582));
      }
      
      public function sendInviteToClan(param1:Long) : void
      {
         server.sendInviteToClan(param1);
      }
      
      public function objectUnloaded() : void
      {
         clanService.clanPanelModel = null;
      }
   }
}
