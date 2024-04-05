package alternativa.tanks.gui.clanmanagement
{
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.ContextMenuPermissionLabel;
   import package_13.Long;
   import package_228.ClanPermission;
   
   public class name_2047 extends ContextMenuPermissionLabel
   {
       
      
      public function name_2047(param1:ClanPermission, param2:Object, param3:Long, param4:Long)
      {
         super(param1);
         this.data = param2;
         this.id = param3;
         this.currentUserId = param4;
         this.var_1311 = false;
         ClanPermissionsManager.method_1492(this);
      }
   }
}
