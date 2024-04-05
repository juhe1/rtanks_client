package alternativa.tanks.gui.clanmanagement
{
   import alternativa.osgi.service.command.name_43;
   import alternativa.tanks.gui.TabPanel;
   import alternativa.tanks.gui.name_649;
   import flash.events.Event;
   import forms.name_1838;
   import package_12.name_24;
   import package_124.name_42;
   import package_13.Long;
   import package_212.name_604;
   import package_26.ClanInfoUpdateEvent;
   import package_26.ClanNotificationsManager;
   import package_26.ClanUserNotificationsManager;
   import package_26.name_62;
   import package_27.name_59;
   import package_54.name_102;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_563 extends name_649
   {
      
      public static var display:name_24;
      
      public static var alertService:name_42;
      
      public static var localeService:name_102;
      
      public static var clanService:name_62;
      
      public static var clanFriendsService:name_59;
      
      public static var commandService:name_43;
      
      private static const const_1530:int = 30;
      
      private static const const_422:int = 11;
      
      private static const const_1529:int = 7;
       
      
      private var clanObject:name_70;
      
      private var var_1170:TabPanel;
      
      private var var_1173:ClanUsersWindow;
      
      public var var_1174:name_604;
      
      public var var_1171:ClanTopManagementPanel;
      
      private var var_1172:name_566;
      
      public function name_563(param1:name_70)
      {
         this.var_1170 = new TabPanel();
         super();
         var_1169 = name_1838.name_1844(name_390.const_1169);
         this.clanObject = param1;
         addChild(var_1169);
         this.init();
      }
      
      private function init() : void
      {
         var_1169.addChild(this.var_1170);
         this.var_1171 = new ClanTopManagementPanel(this.clanObject);
         var_1169.addChild(this.var_1171);
         this.var_1173 = new ClanUsersWindow(this.clanObject);
         this.var_1172 = new name_566(this.clanObject);
         this.var_1170.name_1876(localeService.getText(name_390.const_732),this.var_1172,ClanStateButton);
         this.var_1174 = name_604(this.var_1170.name_1876(localeService.getText(name_390.const_528),this.var_1173,name_604));
         ClanNotificationsManager.name_1883(this.var_1174);
         ClanNotificationsManager.name_1878(this.var_1174);
         addEventListener(ClanInfoUpdateEvent.UPDATE,this.method_1424);
         this.var_1174.updateNotifications();
         this.var_1170.name_1879(0);
         this.onResize();
      }
      
      private function method_1424(param1:ClanInfoUpdateEvent) : void
      {
         this.var_1172.name_1375(param1);
         this.var_1171.name_1877(param1.name_1881);
      }
      
      override public function onResize(param1:Event = null) : void
      {
         super.onResize(param1);
         var_1169.height = 30 + 2 * 11 + 7 + this.var_1171.height;
         this.var_1171.x = 11;
         this.var_1171.y = 7 + 11 + 30;
         this.var_1171.width = width - 2 * 11;
         this.var_1170.width = width;
         this.var_1170.height = height;
         this.var_1170.onResize();
      }
      
      public function method_1426(param1:Long) : void
      {
         clanService.clanMembers.push(param1);
         this.var_1173.addUser(param1);
         this.var_1171.name_1875();
         this.var_1172.name_1875();
      }
      
      public function method_1425(param1:Long) : void
      {
         var _loc2_:int = int(clanService.clanMembers.indexOf(param1));
         if(_loc2_ >= 0)
         {
            clanService.clanMembers.splice(_loc2_,1);
            this.var_1173.removeUser(param1);
            this.var_1171.name_1874();
            this.var_1172.name_1874();
         }
      }
      
      override public function destroy() : void
      {
         ClanNotificationsManager.name_1882();
         ClanUserNotificationsManager.name_1880();
         ClanPermissionsManager.method_91();
         ClanActionsManager.method_91();
         if(var_1169 != null)
         {
            var_1169.removeChild(this.var_1170);
            this.var_1170.destroy();
            this.var_1170 = null;
         }
         super.destroy();
      }
      
      public function maxMembers() : void
      {
         this.var_1173.maxMembers();
      }
   }
}
