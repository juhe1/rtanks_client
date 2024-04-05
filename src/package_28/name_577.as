package package_28
{
   import package_225.ForeignClanModelBase;
   import package_225.name_610;
   import package_225.name_861;
   import package_30.name_63;
   import platform.client.fp10.core.model.name_170;
   import platform.client.fp10.core.model.name_287;
   
   public class name_577 extends ForeignClanModelBase implements name_610, name_170, name_287
   {
      
      public static var foreignClanService:name_57;
      
      public static var createClanService:name_63;
       
      
      public function name_577()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         createClanService.flags = method_771().flags;
         foreignClanService.addEventListener(ForeignClanEvent.SEND_REQUEST,method_39(this.method_1441));
         foreignClanService.addEventListener(ForeignClanEvent.ACCEPT_REQUEST,method_39(this.method_1439));
         foreignClanService.addEventListener(ForeignClanEvent.name_862,method_39(this.method_1440));
      }
      
      private function method_1441(param1:ForeignClanEvent) : void
      {
         server.method_347();
      }
      
      private function method_1439(param1:ForeignClanEvent) : void
      {
         server.method_346();
      }
      
      private function method_1440(param1:ForeignClanEvent) : void
      {
         server.method_340();
      }
      
      public function method_341(param1:name_861) : void
      {
         foreignClanService.method_341(param1);
      }
      
      public function method_339() : void
      {
         foreignClanService.method_339();
      }
      
      public function method_345(param1:String) : void
      {
         foreignClanService.method_345(param1);
      }
      
      public function method_350(param1:String) : void
      {
         foreignClanService.method_350();
      }
      
      public function method_342(param1:String) : void
      {
         foreignClanService.method_342();
      }
      
      public function method_349(param1:String) : void
      {
         foreignClanService.method_349(param1);
      }
      
      public function objectUnloaded() : void
      {
         foreignClanService.removeEventListener(ForeignClanEvent.SEND_REQUEST,method_39(this.method_1441));
         foreignClanService.removeEventListener(ForeignClanEvent.ACCEPT_REQUEST,method_39(this.method_1439));
         foreignClanService.removeEventListener(ForeignClanEvent.name_862,method_39(this.method_1440));
      }
   }
}
