package package_198
{
   import alternativa.tanks.models.user.name_65;
   import package_128.ClanNotifierModelBase;
   import package_128.name_354;
   import package_128.name_636;
   import package_207.name_561;
   import package_25.name_353;
   import package_25.name_52;
   import platform.client.fp10.core.model.name_170;
   
   public class name_567 extends ClanNotifierModelBase implements name_636, name_170
   {
      
      public static var clanUserInfoService:name_52;
      
      public static var clanUserService:name_65;
      
      public static var userPropertyService:name_561;
       
      
      public function name_567()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         var _loc1_:name_354 = method_771();
         var _loc2_:name_353 = new name_353(_loc1_);
         clanUserInfoService.updateUserClanInfo(_loc2_);
      }
      
      public function method_1430(param1:Vector.<name_354>) : void
      {
         var _loc2_:name_354 = null;
         var _loc3_:name_353 = null;
         for each(_loc2_ in param1)
         {
            _loc3_ = new name_353(_loc2_);
            clanUserInfoService.updateUserClanInfo(_loc3_);
         }
         if(clanUserInfoService.updateFriendsClanButtonFunction != null)
         {
            clanUserInfoService.updateFriendsClanButtonFunction.call(null);
         }
      }
   }
}
