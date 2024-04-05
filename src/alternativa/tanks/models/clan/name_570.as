package alternativa.tanks.models.clan
{
   import alternativa.tanks.gui.clanmanagement.ClanPermissionsManager;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.name_1973;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.name_569;
   import package_13.Long;
   import package_25.name_52;
   import package_26.name_62;
   import package_54.name_102;
   import platform.client.fp10.core.model.name_141;
   import platform.client.fp10.core.model.name_287;
   import projects.tanks.client.clans.clan.class_146;
   import projects.tanks.client.clans.clan.name_619;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_570 extends class_146 implements name_619, name_572, name_569, name_287, name_141
   {
      
      public static var clanService:name_62;
      
      public static var clanUserInfoService:name_52;
      
      public static var localeService:name_102;
      
      public static const name_2030:String = "%USERNAME%";
       
      
      private var var_1305:name_1973;
      
      public function name_570()
      {
         super();
      }
      
      public function objectLoadedPost() : void
      {
         clanService.clanObject = object;
      }
      
      public function name_1966(param1:String) : void
      {
         var _loc2_:String = null;
         if(this.var_1305 != null)
         {
            _loc2_ = String(localeService.getText(name_390.const_1365));
            _loc2_ = _loc2_.replace("%USERNAME%",param1);
            this.var_1305.method_1560(_loc2_);
         }
      }
      
      public function name_2040(param1:String, param2:Long) : void
      {
         var _loc3_:String = null;
         if(this.var_1305 != null)
         {
            _loc3_ = String(localeService.getText(name_390.const_917));
            _loc3_ = _loc3_.replace("%USERNAME%",param1);
            this.var_1305.name_1975(param2,_loc3_);
         }
      }
      
      public function method_350(param1:String) : void
      {
         var _loc2_:String = null;
         if(this.var_1305 != null)
         {
            _loc2_ = String(localeService.getText(name_390.const_982));
            _loc2_ = _loc2_.replace("%USERNAME%",param1);
            this.var_1305.name_1974(_loc2_);
         }
      }
      
      public function method_383(param1:String) : void
      {
         var _loc2_:String = null;
         if(clanService.clanManagementPanel != null)
         {
            _loc2_ = String(localeService.getText(name_390.const_1061));
            _loc2_ = _loc2_.replace("%USERNAME%",param1);
            this.var_1305.name_1976(_loc2_);
         }
      }
      
      public function name_2037(param1:String, param2:Long) : void
      {
      }
      
      public function maxMembers() : void
      {
         clanService.maxMembers();
      }
      
      public function name_1969() : void
      {
         var _loc1_:String = String(localeService.getText(name_390.const_1398));
         this.var_1305.name_1977(_loc1_);
      }
      
      public function name_2038() : void
      {
         if(this.var_1305 != null)
         {
            this.var_1305.name_1978();
         }
      }
      
      public function name_2039() : void
      {
         if(this.var_1305 != null)
         {
            this.var_1305.name_1981();
         }
      }
      
      public function accept(param1:Long) : void
      {
         this.method_346(param1);
      }
      
      public function method_1520(param1:String) : void
      {
         server.name_2041(param1);
      }
      
      public function method_1446(param1:Long) : void
      {
         server.add(param1);
      }
      
      public function name_883(param1:Long) : void
      {
         server.name_2043(param1);
      }
      
      public function method_1445(param1:String) : void
      {
         server.name_2041(param1);
      }
      
      public function method_340(param1:Long) : void
      {
         server.method_1413(param1);
      }
      
      public function method_346(param1:Long) : void
      {
         server.accept(param1);
      }
      
      public function method_371(param1:Long) : void
      {
         server.method_1410(param1);
      }
      
      public function method_370() : void
      {
         server.method_1411();
      }
      
      public function method_1521(param1:String) : void
      {
         server.method_1521(param1);
      }
      
      public function name_882() : void
      {
         server.name_2042();
      }
      
      public function objectUnloaded() : void
      {
         ClanPermissionsManager.method_1496();
         clanService.objectUnloaded();
      }
      
      public function method_1522(param1:name_1973) : void
      {
         this.var_1305 = param1;
      }
   }
}
