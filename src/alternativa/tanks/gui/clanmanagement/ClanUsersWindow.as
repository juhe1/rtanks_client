package alternativa.tanks.gui.clanmanagement
{
   import alternativa.tanks.models.clan.name_570;
   import base.class_122;
   import controls.name_1922;
   import controls.windowinner.WindowInner;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import package_124.AlertServiceEvent;
   import package_124.name_42;
   import package_13.Long;
   import package_191.name_579;
   import package_212.name_2029;
   import package_212.name_587;
   import package_213.ClanMembersList;
   import package_228.ClanAction;
   import package_25.name_52;
   import package_25.name_55;
   import package_26.ClanNotificationsManager;
   import package_26.name_62;
   import package_27.ClanMembersListEvent;
   import package_29.name_64;
   import package_54.name_102;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class ClanUsersWindow extends class_122
   {
      
      public static var clanUserInfoService:name_52;
      
      public static var alertService:name_42;
      
      public static var clanService:name_62;
      
      public static var localeService:name_102;
      
      public static var clanFunctionsService:name_55;
      
      public static var clanMembersData:name_64;
      
      private static const const_422:int = 11;
      
      private static const const_1529:int = 7;
      
      private static const const_1530:int = 30;
      
      private static var currentUserId:Long;
      
      private static var var_1332:Long;
       
      
      private var var_1330:WindowInner;
      
      private var var_1331:name_1922;
      
      private var list:ClanMembersList;
      
      private var var_1329:name_587;
      
      private var var_1328:name_2029;
      
      private var _width:int;
      
      private var _height:int;
      
      private var clanObject:name_70;
      
      public function ClanUsersWindow(param1:name_70)
      {
         var _loc2_:Long = null;
         super();
         this.clanObject = param1;
         this.var_1331 = new name_1922();
         addChild(this.var_1331);
         this.var_1330 = new WindowInner(this._width,this._height,WindowInner.name_1428);
         this.var_1330.name_1895 = true;
         this.var_1331.addChild(this.var_1330);
         var _loc3_:name_579 = name_579(param1.name_176(name_579));
         this.list = new ClanMembersList();
         var _loc4_:Vector.<Object> = new Vector.<Object>();
         for each(_loc2_ in _loc3_.name_1930())
         {
            _loc4_.push(clanMembersData.method_360(_loc2_));
         }
         this.list.method_1479(_loc4_);
         this.list.addEventListener(ClanMembersListEvent.REMOVE_USER,this.method_1558);
         this.var_1330.addChild(this.list);
         this.var_1329 = new name_587(ClanAction.INVITE_TO_CLAN);
         this.var_1328 = new name_2029(this.var_1329,this);
         this.var_1329.width = 120;
         this.var_1328.width = 120;
         ClanActionsManager.name_1931(this.var_1329);
         this.var_1329.label = localeService.getText(name_390.const_1208);
         this.var_1329.method_1459();
         this.var_1329.addEventListener(MouseEvent.CLICK,this.method_1556);
         addChild(this.var_1329);
         ClanActionsManager.name_1931(this.var_1328);
         ClanNotificationsManager.name_1878(this.var_1328);
         this.var_1328.label = localeService.getText(name_390.const_1375);
         this.var_1328.method_1459();
         this.var_1328.updateNotifications();
         this.var_1328.addEventListener(MouseEvent.CLICK,this.method_1557);
         addChild(this.var_1328);
         addEventListener(Event.ADDED_TO_STAGE,this.method_1554);
      }
      
      private static function method_1432() : Long
      {
         if(currentUserId == null)
         {
            currentUserId = Long.getLong(0,0);
         }
         return currentUserId;
      }
      
      private function method_1557(param1:MouseEvent) : void
      {
         new ClanIncomingRequestsDialog(this.clanObject);
      }
      
      private function method_1556(param1:MouseEvent) : void
      {
         new name_594(this.clanObject);
      }
      
      private function method_1558(param1:ClanMembersListEvent) : void
      {
         if(param1.userId == method_1432())
         {
            alertService.showAlert(localeService.getText(name_390.const_1396),Vector.<String>([localeService.getText(name_390.const_757),localeService.getText(name_390.const_579)]));
            alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.method_1435);
         }
         else
         {
            alertService.showAlert(localeService.getText(name_390.const_862).replace(name_570.name_2030,param1.name_2031),Vector.<String>([localeService.getText(name_390.const_757),localeService.getText(name_390.const_579)]));
            alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.method_1555);
            var_1332 = param1.userId;
         }
      }
      
      private function method_1435(param1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.method_1435);
         if(param1.name_982 == localeService.getText(name_390.const_757))
         {
            clanFunctionsService.method_369();
         }
      }
      
      private function method_1555(param1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.method_1555);
         if(param1.name_982 == localeService.getText(name_390.const_757) && var_1332 != null)
         {
            clanFunctionsService.method_368(var_1332);
            var_1332 = null;
         }
      }
      
      private function method_1554(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.method_1554);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
         stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize();
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onRemoveFromStage);
         stage.removeEventListener(Event.RESIZE,this.onResize);
         addEventListener(Event.ADDED_TO_STAGE,this.method_1554);
      }
      
      private function onResize(param1:Event = null) : void
      {
         this.var_1331.y = ClanTopManagementPanel.const_1532 + 11 - 3;
         this.var_1331.width = this.width;
         this.var_1331.height = this.height - this.var_1331.y;
         this.var_1330.x = 11;
         this.var_1330.y = 11;
         this.var_1330.width = this.var_1331.width - 2 * 11;
         this.var_1330.height = this.var_1331.height - 2 * 11 - 7 - 30;
         this.list.x = 3;
         this.list.y = 3;
         this.list.width = this.var_1330.width - 6;
         this.list.height = this.var_1330.height - 4;
         this.var_1328.x = this.width - this.var_1328.width - 11;
         this.var_1328.y = this.height - this.var_1329.height - 11 - 1;
         this.var_1329.x = (this.var_1328.visible ? this.var_1328.x : this.width - 11) - 7 - this.var_1329.width;
         this.var_1329.y = this.var_1328.y;
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = param1;
         this.onResize();
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = param1;
         this.onResize();
      }
      
      public function addUser(param1:Long) : void
      {
         this.list.addUser(clanMembersData.method_360(param1));
      }
      
      public function removeUser(param1:Long) : void
      {
         this.list.removeUser(param1);
      }
      
      public function maxMembers() : void
      {
         alertService.method_1143(localeService.getText(name_390.const_1124));
      }
   }
}
