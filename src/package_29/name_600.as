package package_29
{
   import package_217.ClanMembersDataModelBase;
   import package_217.name_351;
   import package_217.name_623;
   import platform.client.fp10.core.model.name_170;
   
   public class name_600 extends ClanMembersDataModelBase implements name_623, name_170
   {
      
      public static var clanMembersService:name_64;
       
      
      public function name_600()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         var _loc1_:name_351 = null;
         for each(_loc1_ in method_771().users)
         {
            clanMembersService.name_452(_loc1_);
         }
      }
      
      public function method_1430(param1:name_351) : void
      {
         clanMembersService.name_452(param1);
      }
   }
}
