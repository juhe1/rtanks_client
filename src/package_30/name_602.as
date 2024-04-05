package package_30
{
   import package_221.ClanCreateModelBase;
   import package_221.name_642;
   import platform.client.fp10.core.model.name_170;
   import platform.client.fp10.core.model.name_287;
   
   public class name_602 extends ClanCreateModelBase implements name_642, name_170, name_287
   {
      
      public static var createClanService:name_63;
       
      
      public function name_602()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         createClanService.addEventListener(CreateClanServiceEvent.CREATE,method_39(this.method_1458));
         createClanService.addEventListener(CreateClanServiceEvent.VALIDATE_NAME,method_39(this.method_1457));
         createClanService.addEventListener(CreateClanServiceEvent.VALIDATE_TAG,method_39(this.method_1456));
      }
      
      private function method_1458(param1:CreateClanServiceEvent) : void
      {
         server.method_386(param1.clanName,param1.clanTag,param1.name_1881.id);
      }
      
      private function method_1457(param1:CreateClanServiceEvent) : void
      {
         server.method_384(param1.clanName);
      }
      
      private function method_1456(param1:CreateClanServiceEvent) : void
      {
         server.method_378(param1.clanTag);
      }
      
      public function method_1428() : void
      {
         createClanService.method_388();
      }
      
      public function method_381() : void
      {
         createClanService.method_381();
      }
      
      public function method_387() : void
      {
         createClanService.method_387();
      }
      
      public function method_1429() : void
      {
         createClanService.method_379();
      }
      
      public function method_380() : void
      {
         createClanService.method_380();
      }
      
      public function method_382() : void
      {
         createClanService.method_382();
      }
      
      public function method_385() : void
      {
         createClanService.method_385();
      }
      
      public function method_383() : void
      {
         createClanService.method_383();
      }
      
      public function objectUnloaded() : void
      {
         createClanService.removeEventListener(CreateClanServiceEvent.CREATE,method_39(this.method_1458));
         createClanService.removeEventListener(CreateClanServiceEvent.VALIDATE_NAME,method_39(this.method_1457));
         createClanService.removeEventListener(CreateClanServiceEvent.VALIDATE_TAG,method_39(this.method_1456));
      }
   }
}
