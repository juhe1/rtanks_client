package package_194
{
   import alternativa.tanks.gui.clanmanagement.ClanActionsManager;
   import alternativa.tanks.gui.clanmanagement.ClanPermissionsManager;
   import package_13.Long;
   import package_228.ClanAction;
   import package_228.ClanPermission;
   import package_228.ClanPermissionsModelBase;
   import package_228.name_613;
   import package_25.name_52;
   import platform.client.fp10.core.model.name_170;
   
   public class name_603 extends ClanPermissionsModelBase implements name_575, name_613, name_170
   {
      
      public static var clanUserInfoService:name_52;
       
      
      public function name_603()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         clanUserInfoService.actions = method_771().actions;
         ClanPermissionsManager.var_1254 = object.name_176(name_575) as name_575;
      }
      
      public function method_1459(param1:Vector.<ClanAction>) : void
      {
         clanUserInfoService.actions = param1;
         ClanActionsManager.method_1459();
      }
      
      public function name_731(param1:Long, param2:ClanPermission) : void
      {
         server.setPermissionForUser(param1,param2);
      }
   }
}
