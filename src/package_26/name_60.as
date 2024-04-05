package package_26
{
   import alternativa.tanks.models.clan.name_572;
   import flash.events.EventDispatcher;
   import package_13.Long;
   import package_25.name_55;
   
   public class name_60 extends EventDispatcher implements name_55
   {
      
      public static var clanService:name_62;
       
      
      public function name_60()
      {
         super();
      }
      
      public function method_372(param1:Long) : void
      {
         clanService.clanPanelModel.sendInviteToClan(param1);
      }
      
      public function method_369() : void
      {
         this.method_391().name_882();
      }
      
      public function method_368(param1:Long) : void
      {
         this.method_391().name_883(param1);
      }
      
      public function method_340(param1:Long) : void
      {
         this.method_391().method_340(param1);
      }
      
      public function method_346(param1:Long) : void
      {
         this.method_391().method_346(param1);
      }
      
      public function method_371(param1:Long) : void
      {
         this.method_391().method_371(param1);
      }
      
      public function method_370() : void
      {
         this.method_391().method_370();
      }
      
      private function method_391() : name_572
      {
         return name_572(clanService.clanObject.name_176(name_572));
      }
   }
}
