package package_213
{
   import alternativa.tanks.gui.clanmanagement.ClanActionsManager;
   import alternativa.tanks.gui.clanmanagement.ClanPermissionsManager;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.*;
   import alternativa.tanks.gui.clanmanagement.name_2047;
   import controls.base.name_1134;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import forms.name_1139;
   import package_13.Long;
   import package_215.DeleteIndicator;
   import package_215.class_147;
   import package_228.ClanPermission;
   import package_26.ClanNotificationsManager;
   import package_27.ClanMembersListEvent;
   import package_393.name_2002;
   import package_395.NewClanMemberIndicator;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   import utils.name_1952;
   
   public class ClanMemberItem extends class_147
   {
      
      public static var localeService:name_102;
       
      
      public var var_1371:ContextMenuPermissionLabel;
      
      private var var_1376:name_1134;
      
      private var var_1374:name_1134;
      
      private var var_1375:name_1134;
      
      private var var_1373:name_1134;
      
      private var var_1372:name_1134;
      
      private var lastOnlineDate:name_1134;
      
      public var newIndicator:NewClanMemberIndicator;
      
      public var userId:Long;
      
      public var currentUserId:Long;
      
      private var permission:ClanPermission;
      
      private var items:Vector.<DisplayObject>;
      
      public var data:Object;
      
      public function ClanMemberItem(param1:Object)
      {
         this.items = new Vector.<DisplayObject>();
         super();
         this.data = param1;
         this.userId = param1.id;
         this.currentUserId = param1.currentUserId;
         var_1370 = method_1595(this.userId);
         param1.uid = var_1367.uid;
         addChild(var_1370);
         this.permission = param1.permission;
         this.var_1371 = new name_2047(this.permission,param1,this.userId,param1.currentUserId);
         this.var_1371.method_1459();
         addChild(this.var_1371);
         this.var_1376 = method_582();
         this.var_1376.text = param1.score;
         addChild(this.var_1376);
         this.var_1374 = method_582();
         this.var_1374.text = param1.kills;
         addChild(this.var_1374);
         this.var_1375 = method_582();
         this.var_1375.text = param1.deaths;
         addChild(this.var_1375);
         this.var_1373 = method_582();
         this.var_1373.text = param1.kd;
         addChild(this.var_1373);
         this.var_1372 = method_582();
         this.var_1372.text = name_1952.format(param1.date);
         addChild(this.var_1372);
         this.lastOnlineDate = method_582();
         this.lastOnlineDate.text = name_2002.name_2009(new Date(param1.lastOnlineDate));
         addChild(this.lastOnlineDate);
         this.items.push(var_1370);
         this.items.push(this.var_1371);
         this.items.push(this.var_1376);
         this.items.push(this.var_1374);
         this.items.push(this.var_1375);
         this.items.push(this.var_1373);
         this.items.push(this.var_1372);
         this.items.push(this.lastOnlineDate);
         var_1369 = new DeleteIndicator(this.permission == ClanPermission.SUPREME_COMMANDER || this.userId == this.currentUserId,this.userId,this.currentUserId);
         method_1598.visible = false;
         addChild(method_1598);
         this.newIndicator = this.method_1599(param1);
         this.newIndicator.updateNotifications();
         ClanNotificationsManager.name_1883(this.newIndicator);
         addChild(this.newIndicator);
         method_1598.addEventListener(MouseEvent.CLICK,this.method_1600,false,0,true);
         this.onResize();
         addEventListener(Event.ADDED_TO_STAGE,this.method_1601,false,0,true);
         addEventListener(Event.REMOVED_FROM_STAGE,this.method_886,false,0,true);
      }
      
      private static function method_582() : name_1134
      {
         var _loc1_:name_1134 = new name_1134();
         _loc1_.autoSize = TextFieldAutoSize.LEFT;
         _loc1_.align = TextFormatAlign.LEFT;
         _loc1_.multiline = true;
         _loc1_.wordWrap = true;
         _loc1_.color = name_1139.name_1894;
         return _loc1_;
      }
      
      private function method_1601(param1:Event) : void
      {
         ClanActionsManager.name_1931(this.var_1371);
         this.var_1371.method_1531();
         this.newIndicator.updateNotifications();
      }
      
      public function method_886(param1:Event) : void
      {
         ClanActionsManager.name_1937(this.var_1371);
         this.var_1371.destroy();
      }
      
      private function method_1599(param1:Object) : NewClanMemberIndicator
      {
         var _loc2_:NewClanMemberIndicator = null;
         _loc2_ = new NewClanMemberIndicator(this.userId,param1);
         _loc2_.autoSize = TextFieldAutoSize.LEFT;
         _loc2_.align = TextFormatAlign.LEFT;
         _loc2_.color = name_1139.name_1894;
         _loc2_.text = localeService.getText(name_390.const_575);
         _loc2_.mouseEnabled = false;
         _loc2_.visible = false;
         return _loc2_;
      }
      
      private function method_1600(param1:MouseEvent) : void
      {
         dispatchEvent(new ClanMembersListEvent(ClanMembersListEvent.REMOVE_USER,Long.getLong(0,0),var_1367.uid,true,true));
      }
      
      override protected function onResize(param1:Event = null) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.items.length)
         {
            this.method_1602(this.items[_loc2_],_loc2_);
            _loc2_++;
         }
         var_1369.x = width - var_1369.width - 6;
         var_1369.y = 1;
         this.newIndicator.x = width - this.newIndicator.width - 10;
         ClanPermissionsManager.method_1487(this.var_1371);
         ClanPermissionsManager.resize(HeaderClanMemberList.method_1416());
         if(width > 0)
         {
            graphics.clear();
            graphics.beginFill(0,0);
            graphics.drawRect(0,0,width - 1,20);
            graphics.endFill();
         }
      }
      
      private function method_1602(param1:DisplayObject, param2:int) : void
      {
         param1.x = HeaderClanMemberList.method_1415(param2);
         param1.y = 1;
         param1.width = HeaderClanMemberList.method_1414(param2);
         if(param2 != 0)
         {
            param1.x -= 5;
         }
      }
   }
}
