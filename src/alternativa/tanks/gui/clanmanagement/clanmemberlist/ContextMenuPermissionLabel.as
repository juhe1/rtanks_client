package alternativa.tanks.gui.clanmanagement.clanmemberlist
{
   import alternativa.tanks.gui.clanmanagement.ClanPermissionsManager;
   import base.class_122;
   import controls.base.name_1134;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import forms.name_1139;
   import package_13.Long;
   import package_217.name_351;
   import package_228.ClanAction;
   import package_228.ClanPermission;
   import package_25.name_52;
   import package_26.name_62;
   import package_28.name_57;
   import package_29.name_64;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class ContextMenuPermissionLabel extends class_122 implements class_140, class_138
   {
      
      public static var clanService:name_62;
      
      public static var clanUserInfoService:name_52;
      
      public static var clanMembersData:name_64;
      
      public static var foreignClanService:name_57;
      
      public static var localeService:name_102;
      
      public static const const_1532:int = 18;
       
      
      protected var id:Long;
      
      protected var var_1311:Boolean;
      
      private var label:name_1134;
      
      private var _width:Number;
      
      public var currentUserId:Long;
      
      public var permission:ClanPermission;
      
      public var data:Object;
      
      public function ContextMenuPermissionLabel(param1:ClanPermission)
      {
         super();
         this.permission = param1;
         this.label = method_1528(param1);
         this.method_1531();
         addChild(this.label);
         this.var_1311 = true;
      }
      
      public static function name_1947(param1:ClanPermission) : ContextMenuPermissionLabel
      {
         return new ContextMenuPermissionLabel(param1);
      }
      
      private static function method_1528(param1:ClanPermission) : name_1134
      {
         var _loc2_:name_1134 = new name_1134();
         _loc2_.autoSize = TextFieldAutoSize.LEFT;
         _loc2_.color = name_1139.name_1894;
         _loc2_.text = method_1527(param1);
         return _loc2_;
      }
      
      public static function method_1527(param1:ClanPermission) : String
      {
         switch(param1)
         {
            case ClanPermission.SUPREME_COMMANDER:
               return localeService.getText(name_390.const_1154);
            case ClanPermission.COMMANDER:
               return localeService.getText(name_390.const_1271);
            case ClanPermission.OFFICER:
               return localeService.getText(name_390.const_670);
            case ClanPermission.SERGEANT:
               return localeService.getText(name_390.const_1020);
            case ClanPermission.VETERAN:
               return localeService.getText(name_390.const_1278);
            case ClanPermission.PRIVATE:
               return localeService.getText(name_390.const_1105);
            case ClanPermission.NOVICE:
               return localeService.getText(name_390.const_669);
            default:
               return "EMPTY";
         }
      }
      
      public function method_1531() : void
      {
         this.label.addEventListener(MouseEvent.MOUSE_OVER,this.method_1530,false,0,true);
         this.label.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut,false,0,true);
      }
      
      private function method_1530(param1:MouseEvent = null) : void
      {
         if(this.var_1311)
         {
            Mouse.cursor = MouseCursor.BUTTON;
            this.label.color = name_1139.name_2012;
         }
         else if(this.method_1532())
         {
            Mouse.cursor = MouseCursor.BUTTON;
         }
      }
      
      private function method_1532() : Boolean
      {
         return this.permission != ClanPermission.SUPREME_COMMANDER && this.currentUserId != this.id && Boolean(clanUserInfoService.method_375(ClanAction.PERMISSION_DISTRIBUTION)) && !clanService.isBlocked && this.permission.value > clanMembersData.method_363(this.currentUserId).value && !foreignClanService.method_343();
      }
      
      private function onMouseOut(param1:MouseEvent = null) : void
      {
         Mouse.cursor = MouseCursor.AUTO;
         if(this.var_1311)
         {
            this.label.color = name_1139.name_1894;
         }
      }
      
      public function method_1486(param1:name_351) : void
      {
         this.label.text = method_1527(param1.permission);
         this.data.permission = param1.permission;
         this.width = this._width;
      }
      
      public function method_1459() : void
      {
         if(foreignClanService.method_343())
         {
            return;
         }
         this.permission = clanMembersData.method_363(this.userId);
         if(Boolean(clanUserInfoService.method_375(ClanAction.PERMISSION_DISTRIBUTION)) && !clanService.isBlocked && this.permission.value > clanMembersData.method_363(this.currentUserId).value)
         {
            if(this.permission != ClanPermission.SUPREME_COMMANDER && this.currentUserId != this.id)
            {
               addEventListener(MouseEvent.CLICK,this.method_1529,false,0,true);
            }
         }
         else if(hasEventListener(MouseEvent.CLICK))
         {
            removeEventListener(MouseEvent.CLICK,this.method_1529);
         }
      }
      
      public function get userId() : Long
      {
         return this.id;
      }
      
      private function method_1529(param1:MouseEvent) : void
      {
         ClanPermissionsManager.show(this.userId,this.currentUserId,this);
      }
      
      public function destroy() : void
      {
         this.label.removeEventListener(MouseEvent.MOUSE_OVER,this.method_1530);
         this.label.removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = param1;
         this.label.x = param1 - this.label.width >> 1;
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
   }
}
