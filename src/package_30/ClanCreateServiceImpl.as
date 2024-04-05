package package_30
{
   import flash.events.EventDispatcher;
   import package_275.name_865;
   import package_54.name_102;
   
   public class ClanCreateServiceImpl extends EventDispatcher implements name_63
   {
      
      public static var localeService:name_102;
       
      
      private var var_269:Vector.<name_865>;
      
      public function ClanCreateServiceImpl()
      {
         this.var_269 = new Vector.<name_865>();
         super();
      }
      
      public function method_384(param1:String) : void
      {
         dispatchEvent(new CreateClanServiceEvent(CreateClanServiceEvent.VALIDATE_NAME,param1));
      }
      
      public function method_378(param1:String) : void
      {
         dispatchEvent(new CreateClanServiceEvent(CreateClanServiceEvent.VALIDATE_TAG,null,param1));
      }
      
      public function method_386(param1:String, param2:String, param3:String, param4:name_865) : void
      {
         dispatchEvent(new CreateClanServiceEvent(CreateClanServiceEvent.CREATE,param1,param2,param3,param4));
      }
      
      public function method_388() : void
      {
         dispatchEvent(new CreateClanServiceEvent(CreateClanServiceEvent.INCORRECT_NAME));
      }
      
      public function method_379() : void
      {
         dispatchEvent(new CreateClanServiceEvent(CreateClanServiceEvent.INCORRECT_TAG));
      }
      
      public function method_380() : void
      {
         dispatchEvent(new CreateClanServiceEvent(CreateClanServiceEvent.CORRECT_NAME));
      }
      
      public function method_382() : void
      {
         dispatchEvent(new CreateClanServiceEvent(CreateClanServiceEvent.CORRECT_TAG));
      }
      
      public function method_381() : void
      {
         dispatchEvent(new CreateClanServiceEvent(CreateClanServiceEvent.NOT_UNIQUE_NAME));
      }
      
      public function method_387() : void
      {
         dispatchEvent(new CreateClanServiceEvent(CreateClanServiceEvent.NOT_UNIQUE_TAG));
      }
      
      public function method_385() : void
      {
         dispatchEvent(new CreateClanServiceEvent(CreateClanServiceEvent.OTHER_ERROR));
      }
      
      public function method_383() : void
      {
         dispatchEvent(new CreateClanServiceEvent(CreateClanServiceEvent.ALREADY_IN_CLAN));
      }
      
      public function get flags() : Vector.<name_865>
      {
         return this.var_269;
      }
      
      public function set flags(param1:Vector.<name_865>) : void
      {
         this.var_269 = param1;
      }
      
      public function get defaultFlag() : name_865
      {
         var _loc1_:name_865 = null;
         for each(_loc1_ in this.var_269)
         {
            if(_loc1_.name.toLowerCase() == localeService.language.toLowerCase())
            {
               return _loc1_;
            }
         }
         return this.var_269[0];
      }
   }
}
