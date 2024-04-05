package alternativa.tanks.gui.clanmanagement
{
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.ContextMenuPermissionLabel;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.class_138;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.class_140;
   import base.class_122;
   import controls.name_1891;
   import controls.name_1922;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import package_12.name_24;
   import package_13.Long;
   import package_194.name_575;
   import package_213.HeaderClanMemberList;
   import package_217.name_351;
   import package_228.ClanAction;
   import package_228.ClanPermission;
   import package_25.name_52;
   import package_26.name_62;
   import package_29.name_64;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.name_1015;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.name_1022;
   
   public class ClanPermissionsManager extends class_122 implements class_140, class_138
   {
      
      public static var clanService:name_62;
      
      public static var clanUserInfoService:name_52;
      
      public static var display:name_24;
      
      public static var clanMembersDataService:name_64;
      
      private static var var_1250:Vector.<class_140> = new Vector.<class_140>();
      
      private static var menu:ClanPermissionsManager;
      
      public static var var_1254:name_575;
      
      private static var var_1253:Long;
      
      private static const const_422:int = 6;
       
      
      private var window:name_1922;
      
      private var var_1251:name_1891;
      
      private var id:Long;
      
      private var var_1252:int = 0;
      
      public function ClanPermissionsManager(param1:Long, param2:Long)
      {
         super();
         this.id = param1;
         var_1253 = param2;
         this.window = new name_1922();
         addChild(this.window);
         this.var_1251 = new name_1891(0,0,name_1891.name_1428);
         this.var_1251.x = 6;
         this.var_1251.y = 6;
         this.window.addChild(this.var_1251);
         this.method_1494(clanMembersDataService.method_363(param2));
         method_1492(this);
         ClanActionsManager.name_1931(this);
         addEventListener(MouseEvent.ROLL_OUT,this.method_1488);
         display.stage.addEventListener(MouseEvent.CLICK,this.method_1490);
         display.stage.addEventListener(Event.DEACTIVATE,this.method_1489);
         display.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp,false,name_1015.name_1948);
      }
      
      public static function resize(param1:int) : void
      {
         if(menu != null)
         {
            menu.resize(param1);
         }
      }
      
      public static function method_1487(param1:ContextMenuPermissionLabel) : void
      {
         var _loc2_:Point = null;
         if(menu != null && menu.id == param1.userId)
         {
            _loc2_ = param1.localToGlobal(new Point(0,0));
            menu.method_1487(_loc2_);
         }
      }
      
      public static function method_1492(param1:class_140) : void
      {
         var_1250.push(param1);
      }
      
      public static function method_1491(param1:class_140) : void
      {
         var _loc2_:int = var_1250.indexOf(param1);
         if(_loc2_ >= 0)
         {
            var_1250.splice(_loc2_,1);
         }
      }
      
      public static function method_1496() : void
      {
         var_1250 = new Vector.<class_140>();
      }
      
      public static function name_868(param1:name_351) : void
      {
         var _loc2_:class_140 = null;
         for each(_loc2_ in var_1250)
         {
            if(_loc2_.userId == param1.userId)
            {
               _loc2_.method_1486(param1);
            }
         }
         ClanActionsManager.method_1459();
      }
      
      public static function show(param1:Long, param2:Long, param3:ContextMenuPermissionLabel) : void
      {
         if(menu != null)
         {
            remove();
         }
         menu = new ClanPermissionsManager(param1,param2);
         menu.method_1487(param3.localToGlobal(new Point(0,0)));
         menu.resize(HeaderClanMemberList.method_1416());
         display.stage.addChild(menu);
      }
      
      private static function remove() : void
      {
         menu.parent.removeChild(menu);
         menu.method_91();
         menu = null;
      }
      
      private static function method_1493(param1:int) : ClanPermission
      {
         var _loc2_:ClanPermission = null;
         for each(_loc2_ in ClanPermission.method_393)
         {
            if(_loc2_.value == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public static function method_91() : void
      {
         var_1250 = new Vector.<class_140>();
      }
      
      private function method_1490(param1:MouseEvent) : void
      {
         if(param1.target.parent != null && param1.target.parent as ContextMenuPermissionLabel == null)
         {
            remove();
         }
      }
      
      private function method_1489(param1:Event) : void
      {
         remove();
      }
      
      private function method_1488(param1:MouseEvent) : void
      {
         remove();
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         if(name_1022.name_1036(param1.keyCode))
         {
            param1.stopImmediatePropagation();
            remove();
         }
      }
      
      public function method_1486(param1:name_351) : void
      {
         remove();
      }
      
      public function method_1459() : void
      {
         remove();
      }
      
      private function method_1494(param1:ClanPermission) : void
      {
         var _loc2_:ContextMenuPermissionLabel = null;
         _loc2_ = null;
         var _loc3_:int = 0;
         var _loc4_:int = param1.value + 1;
         while(_loc4_ < ClanPermission.method_393.length - 1)
         {
            _loc2_ = ContextMenuPermissionLabel.name_1947(method_1493(_loc4_));
            _loc2_.y = _loc3_;
            _loc2_.addEventListener(MouseEvent.CLICK,this.method_1495,false,0,true);
            this.var_1251.addChild(_loc2_);
            _loc3_ += ContextMenuPermissionLabel.const_1532;
            ++this.var_1252;
            _loc4_++;
         }
      }
      
      private function method_1495(param1:MouseEvent) : void
      {
         var _loc2_:ContextMenuPermissionLabel = null;
         if(Boolean(clanUserInfoService.method_375(ClanAction.PERMISSION_DISTRIBUTION)) && param1.target.parent != null && param1.target.parent as ContextMenuPermissionLabel != null)
         {
            _loc2_ = param1.target.parent as ContextMenuPermissionLabel;
            var_1254.name_731(menu.id,_loc2_.permission);
            remove();
         }
      }
      
      public function method_1487(param1:Point) : void
      {
         menu.x = param1.x - 6;
         menu.y = param1.y - 6;
         if(menu.y > display.stage.height - 60 - menu.height)
         {
            menu.y = display.stage.height - 60 - menu.height;
         }
      }
      
      public function resize(param1:int) : void
      {
         var _loc2_:ContextMenuPermissionLabel = null;
         this.var_1251.width = param1;
         this.var_1251.height = ContextMenuPermissionLabel.const_1532 * this.var_1252;
         var _loc3_:int = 0;
         while(_loc3_ < this.var_1251.numChildren)
         {
            if(this.var_1251.getChildAt(_loc3_) is ContextMenuPermissionLabel)
            {
               _loc2_ = ContextMenuPermissionLabel(this.var_1251.getChildAt(_loc3_));
               _loc2_.width = this.var_1251.width;
            }
            _loc3_++;
         }
         this.window.width = param1 + 2 * 6;
         this.window.height = 2 * 6 + this.var_1251.height;
      }
      
      public function method_91() : void
      {
         method_1491(this);
         ClanActionsManager.name_1937(this);
         removeEventListener(MouseEvent.ROLL_OUT,this.method_1488);
         display.stage.removeEventListener(MouseEvent.CLICK,this.method_1490);
         display.stage.removeEventListener(Event.DEACTIVATE,this.method_1489);
         display.stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
      }
      
      public function get userId() : Long
      {
         return this.id;
      }
   }
}
