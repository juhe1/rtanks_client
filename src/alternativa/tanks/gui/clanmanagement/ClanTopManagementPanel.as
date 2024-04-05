package alternativa.tanks.gui.clanmanagement
{
   import alternativa.tanks.models.user.name_65;
   import base.class_122;
   import controls.base.name_1134;
   import controls.base.name_1890;
   import controls.name_1891;
   import controls.windowinner.WindowInner;
   import flash.display.Bitmap;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import forms.name_1139;
   import package_124.AlertServiceEvent;
   import package_124.name_42;
   import package_13.Long;
   import package_190.name_571;
   import package_207.name_561;
   import package_214.name_634;
   import package_228.ClanPermission;
   import package_25.name_52;
   import package_25.name_55;
   import package_26.name_62;
   import package_275.name_865;
   import package_29.name_64;
   import package_390.name_1889;
   import package_54.name_102;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class ClanTopManagementPanel extends class_122
   {
      
      public static var userPropertiesService:name_561;
      
      public static var clanService:name_62;
      
      public static var clanUserService:name_65;
      
      public static var clanUserInfoService:name_52;
      
      public static var alertService:name_42;
      
      public static var localeService:name_102;
      
      public static var clanFunctionsService:name_55;
      
      public static var clanMembersService:name_64;
      
      private static const const_422:int = 10;
      
      public static const const_1532:int = 120;
      
      private static var currentUserId:Long;
      
      private static const const_1531:Class = name_1892;
       
      
      private var var_1188:Bitmap;
      
      private var var_1182:WindowInner;
      
      private var var_1181:name_1134;
      
      private var var_1187:name_1134;
      
      private var var_1184:name_1134;
      
      private var var_1191:name_1889;
      
      private var var_1186:name_1134;
      
      private var var_1190:name_634;
      
      private var var_1185:name_1134;
      
      private var var_1189:name_1134;
      
      private var var_1183:name_1890;
      
      private var _width:int;
      
      private var _height:int = 120;
      
      public function ClanTopManagementPanel(param1:name_70)
      {
         this.var_1188 = new const_1531().bitmapData;
         this.var_1181 = new name_1134();
         this.var_1187 = new name_1134();
         this.var_1184 = new name_1134();
         this.var_1190 = new name_634();
         this.var_1185 = new name_1134();
         this.var_1189 = new name_1134();
         this.var_1183 = new name_1890();
         super();
         var _loc2_:name_571 = name_571(param1.name_176(name_571));
         this.var_1182 = new WindowInner(this._width,this._height,name_1891.name_1428);
         this.var_1182.name_1895 = true;
         addChild(this.var_1182);
         this.var_1181.bold = true;
         this.var_1181.size = 16;
         var _loc3_:String = String(_loc2_.getClanName());
         this.var_1181.text = _loc3_;
         this.var_1191 = new name_1889("RTanks",false);
         this.var_1190.name_1877(_loc2_.name_1893());
         this.var_1187.text = "[" + _loc2_.name_1897() + "]";
         this.method_1433();
         this.var_1189.text = localeService.getText(name_390.const_940) + " " + clanService.creationDate;
         this.var_1186 = new name_1134();
         this.var_1186.text = localeService.getText(name_390.const_987);
         this.var_1184.text = localeService.getText(name_390.const_1142);
         this.var_1187.color = name_1139.name_1894;
         this.var_1182.addChild(this.var_1188);
         this.var_1182.addChild(this.var_1181);
         this.var_1182.addChild(this.var_1190);
         this.var_1182.addChild(this.var_1186);
         this.var_1182.addChild(this.var_1191);
         this.var_1182.addChild(this.var_1184);
         this.var_1182.addChild(this.var_1187);
         this.var_1182.addChild(this.var_1185);
         this.var_1182.addChild(this.var_1189);
         var _loc4_:Boolean = clanMembersService.method_363(method_1432()) == ClanPermission.SUPREME_COMMANDER;
         if(!_loc4_)
         {
            this.var_1183.label = localeService.getText(name_390.const_743);
            this.var_1182.addChild(this.var_1183);
            this.var_1183.addEventListener(MouseEvent.CLICK,this.method_1438);
         }
         if(_loc4_ && _loc2_.name_1896() == 1)
         {
            this.var_1183.label = localeService.getText(name_390.const_1054);
            this.var_1182.addChild(this.var_1183);
            this.var_1183.addEventListener(MouseEvent.CLICK,this.method_1437);
         }
         addEventListener(Event.ADDED_TO_STAGE,this.method_1436);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
      }
      
      private static function method_1432() : Long
      {
         if(currentUserId == null)
         {
            currentUserId = Long.getLong(0,0);
         }
         return currentUserId;
      }
      
      public function name_1877(param1:name_865) : void
      {
         this.var_1190.name_1877(param1);
      }
      
      private function method_1437(param1:MouseEvent) : void
      {
         alertService.showAlert(localeService.getText(name_390.const_1134),Vector.<String>([localeService.getText(name_390.const_757),localeService.getText(name_390.const_579)]));
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.method_1434);
      }
      
      private function method_1438(param1:MouseEvent) : void
      {
         alertService.showAlert(localeService.getText(name_390.const_1396),Vector.<String>([localeService.getText(name_390.const_757),localeService.getText(name_390.const_579)]));
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.method_1435);
      }
      
      private function method_1435(param1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.method_1435);
         if(param1.name_982 == localeService.getText(name_390.const_757))
         {
            this.var_1183.enabled = false;
            clanFunctionsService.method_369();
         }
      }
      
      private function method_1434(param1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.method_1434);
         if(param1.name_982 == localeService.getText(name_390.const_757))
         {
            this.var_1183.enabled = false;
            clanFunctionsService.method_369();
         }
      }
      
      private function method_1436(param1:Event) : void
      {
         stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize();
      }
      
      private function onResize(param1:Event = null) : void
      {
         this.var_1182.width = this.width;
         this.var_1188.x = 10;
         this.var_1188.y = 10;
         this.var_1181.mouseEnabled = false;
         this.var_1181.color = 16777215;
         this.var_1181.x = this.var_1188.x + this.var_1188.width + 10;
         this.var_1181.y = 10;
         this.var_1190.x = this.var_1181.x + this.var_1181.width + 5;
         this.var_1190.y = this.var_1181.y + 2;
         this.var_1186.x = this.var_1181.x;
         this.var_1186.y = this.var_1181.y + this.var_1181.height;
         this.var_1191.mouseEnabled = false;
         this.var_1191.x = this.var_1186.x + this.var_1186.width;
         this.var_1191.y = this.var_1186.y;
         this.var_1185.mouseEnabled = false;
         this.var_1185.x = this.var_1181.x;
         this.var_1185.y = 120 - this.var_1185.height - 10;
         this.var_1184.x = this.var_1181.x;
         this.var_1184.y = this.var_1185.y - this.var_1184.height;
         this.var_1187.mouseEnabled = false;
         this.var_1187.x = this.var_1184.x + this.var_1184.width;
         this.var_1187.y = this.var_1184.y;
         this.var_1189.mouseEnabled = false;
         this.var_1189.x = this.var_1181.x;
         this.var_1189.y = this.var_1184.y - this.var_1184.height;
         this.var_1183.x = this.width - this.var_1183.width - 10;
         this.var_1183.y = 10;
      }
      
      private function method_1433() : void
      {
         var _loc1_:int = int(clanService.membersCount);
         if(clanMembersService.method_363(method_1432()) == ClanPermission.SUPREME_COMMANDER)
         {
            this.var_1183.visible = _loc1_ == 1;
         }
         this.var_1185.text = localeService.getText(name_390.const_671) + " " + _loc1_.toString();
      }
      
      public function name_1875() : void
      {
         this.method_1433();
      }
      
      public function name_1874() : void
      {
         this.method_1433();
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         stage.removeEventListener(Event.RESIZE,this.onResize);
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
   }
}
