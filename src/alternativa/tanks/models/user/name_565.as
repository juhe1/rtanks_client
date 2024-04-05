package alternativa.tanks.models.user
{
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.name_1973;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.name_569;
   import package_13.Long;
   import package_207.name_561;
   import package_25.name_52;
   import package_26.name_62;
   import package_54.name_102;
   import platform.client.fp10.core.model.name_141;
   import platform.client.fp10.core.model.name_170;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.client.clans.user.ClanUserModelBase;
   import projects.tanks.client.clans.user.name_614;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_565 extends ClanUserModelBase implements name_614, name_580, name_170, name_141, name_569
   {
      
      public static var clanUserService:name_65;
      
      public static var clanService:name_62;
      
      public static var clanUserInfoService:name_52;
      
      public static var userPropertiesService:name_561;
      
      public static var localeService:name_102;
      
      private static const const_1538:String = "%CLANNAME%";
       
      
      private var var_1305:name_1973;
      
      public function name_565()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         if(!method_771().loadingInServiceSpace)
         {
            return;
         }
         clanUserService.userObject = object;
         clanUserInfoService.restrictionTime = method_771().restrictionTimeJoinClanInSec;
         clanUserInfoService.clanMember = method_771().clan;
         clanUserInfoService.giveBonusesClan = method_771().giveBonusesClan;
         clanUserService.otherClan = method_771().showOtherClan;
         clanUserService.showBuyLicenseButton = method_771().showBuyLicenseButton;
      }
      
      public function loadingInServiceSpace() : Boolean
      {
         return method_771().loadingInServiceSpace;
      }
      
      public function objectLoadedPost() : void
      {
         clanUserInfoService.selfClan = !method_771().showOtherClan;
         if(!method_771().loadingInServiceSpace)
         {
            return;
         }
      }
      
      public function name_1968(param1:int) : void
      {
         clanUserInfoService.clanMember = false;
         if(clanService.clanManagementPanel != null)
         {
            clanService.clanManagementPanel.destroy();
         }
         clanUserInfoService.restrictionTime = param1;
      }
      
      public function name_1966(param1:String) : void
      {
      }
      
      public function method_1411() : void
      {
         server.method_1411();
      }
      
      public function method_1413(param1:name_70) : void
      {
         server.method_1413(param1);
      }
      
      public function method_1410(param1:name_70) : void
      {
         server.method_1410(param1);
      }
      
      public function method_1412(param1:name_70) : void
      {
         server.add(param1);
      }
      
      public function method_346(param1:name_70) : void
      {
         server.accept(param1);
      }
      
      public function accept(param1:Long) : void
      {
         var _loc2_:name_70 = object.space.getObject(param1);
         server.accept(_loc2_);
      }
      
      public function method_1520(param1:String) : void
      {
         server.name_1980(param1);
      }
      
      public function method_1521(param1:String) : void
      {
         server.name_1979(param1);
      }
      
      public function method_1522(param1:name_1973) : void
      {
         this.var_1305 = param1;
      }
      
      public function clanExist() : void
      {
         this.var_1305.name_1978();
      }
      
      public function clanNotExist() : void
      {
         this.var_1305.name_1981();
      }
      
      public function name_1969() : void
      {
         var _loc1_:String = String(localeService.getText(name_390.const_1172));
         this.var_1305.name_1977(_loc1_);
      }
      
      public function method_349() : void
      {
         var _loc1_:String = String(localeService.getText(name_390.const_793));
         this.var_1305.method_349(_loc1_);
      }
      
      public function name_1965() : void
      {
         var _loc1_:String = String(localeService.getText(name_390.const_1255));
         this.var_1305.name_1982(_loc1_);
      }
      
      public function method_342(param1:String, param2:name_70) : void
      {
         var _loc3_:String = String(localeService.getText(name_390.const_872));
         _loc3_ = _loc3_.replace("%CLANNAME%",param1);
         this.var_1305.name_1975(param2.id,_loc3_);
      }
      
      public function name_1970(param1:String) : void
      {
         var _loc2_:String = String(localeService.getText(name_390.const_619));
         _loc2_ = _loc2_.replace("%CLANNAME%",param1);
         this.var_1305.name_1974(_loc2_);
      }
      
      public function method_1523(param1:name_70) : void
      {
      }
      
      public function name_1971() : void
      {
      }
      
      public function method_383() : void
      {
         var _loc1_:String = String(localeService.getText(name_390.const_1222));
         this.var_1305.name_1976(_loc1_);
      }
      
      public function method_350(param1:String, param2:name_70) : void
      {
         var _loc3_:String = String(localeService.getText(name_390.const_619));
         _loc3_ = _loc3_.replace("%CLANNAME%",param1);
         this.var_1305.name_1974(_loc3_);
      }
      
      public function name_863() : void
      {
         if(clanService.notInClanPanel != null)
         {
            clanService.notInClanPanel.destroy();
         }
         clanUserInfoService.clanMember = true;
      }
      
      public function name_1972() : void
      {
         clanUserInfoService.giveBonusesClan = false;
      }
      
      public function name_1967(param1:Boolean) : void
      {
         clanUserInfoService.giveBonusesClan = param1;
      }
      
      public function method_1508() : void
      {
         clanService.notInClanPanel.method_1508();
      }
   }
}
