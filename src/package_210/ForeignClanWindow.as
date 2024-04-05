package package_210
{
   import alternativa.tanks.gui.clanmanagement.name_1921;
   import alternativa.tanks.gui.clanmanagement.name_1923;
   import alternativa.tanks.gui.notinclan.dialogs.name_573;
   import controls.base.name_1134;
   import controls.base.name_1890;
   import controls.name_1891;
   import controls.windowinner.WindowInner;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   import forms.name_1139;
   import package_124.AlertServiceEvent;
   import package_124.name_42;
   import package_13.Long;
   import package_207.name_561;
   import package_213.ClanMembersList;
   import package_214.name_634;
   import package_217.name_351;
   import package_225.name_861;
   import package_228.ClanPermission;
   import package_275.name_865;
   import package_28.name_57;
   import package_30.name_63;
   import package_390.name_1889;
   import package_393.name_2002;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   import utils.name_1952;
   
   public class ForeignClanWindow extends name_573
   {
      
      public static var createClanService:name_63;
      
      public static var userPropertyService:name_561;
      
      public static var foreignClanService:name_57;
      
      public static var alertService:name_42;
      
      public static var localeService:name_102;
      
      public static const WIDTH:Number = 900;
      
      public static const const_1532:Number = 500;
       
      
      private var const_1531:Class;
      
      private var var_1188:Bitmap;
      
      private var var_1234:Class;
      
      private var var_1231:Class;
      
      private var var_1233:Class;
      
      private var var_1232:Class;
      
      private var var_1182:WindowInner;
      
      private var var_1181:name_1134;
      
      private var var_1187:name_1134;
      
      private var var_1184:name_1134;
      
      private var var_1191:name_1889;
      
      private var var_1186:name_1134;
      
      private var var_1190:name_634;
      
      private var var_1189:name_1134;
      
      private var var_1223:name_1921;
      
      private var var_1228:name_1921;
      
      private var var_1229:name_1921;
      
      private var var_1227:name_1921;
      
      private var description:name_1923;
      
      private var var_1330:WindowInner;
      
      private var list:ClanMembersList;
      
      private var var_1268:uint = 0;
      
      private var var_262:int = 0;
      
      private var clanData:name_861;
      
      private var method_1570:name_1890;
      
      public function ForeignClanWindow(param1:name_861)
      {
         this.const_1531 = name_2056;
         this.var_1188 = new this.const_1531();
         this.var_1234 = name_2060;
         this.var_1231 = name_2059;
         this.var_1233 = name_2057;
         this.var_1232 = name_2058;
         this.var_1181 = new name_1134();
         this.var_1187 = new name_1134();
         this.var_1184 = new name_1134();
         this.var_1189 = new name_1134();
         this.method_1570 = new name_1890();
         super();
         this.clanData = param1;
         this.method_1611(param1);
         this.method_1609(param1);
         this.method_1608(param1);
         this.method_1613(param1);
      }
      
      private function method_1611(param1:name_861) : void
      {
         this.var_1182 = new WindowInner(900 - 2 * 11,231,name_1891.name_1428);
         this.var_1182.name_1895 = true;
         addChild(this.var_1182);
         this.var_1181.bold = true;
         this.var_1181.size = 16;
         this.var_1181.text = param1.name;
         this.var_1191 = new name_1889("RTanks",false);
         this.var_1190 = new name_634(this.name_1893(param1.flagId));
         this.var_1187.text = "[" + param1.tag + "]";
         this.var_1189.text = localeService.getText(name_390.const_940) + " " + name_2002.name_2009(new Date(param1.createTime));
         this.var_1186 = new name_1134();
         this.var_1186.text = localeService.getText(name_390.const_987);
         this.var_1184.text = localeService.getText(name_390.const_1142);
         this.var_1187.color = name_1139.name_1894;
         this.method_1606(param1);
         this.var_1182.addChild(this.var_1188);
         this.var_1182.addChild(this.var_1181);
         this.var_1182.addChild(this.var_1190);
         this.var_1182.addChild(this.var_1186);
         this.var_1182.addChild(this.var_1191);
         this.var_1182.addChild(this.var_1184);
         this.var_1182.addChild(this.var_1187);
         this.var_1182.addChild(this.var_1189);
         this.var_1182.addChild(this.method_1570);
         this.var_1182.x = 11;
         this.var_1182.y = 11;
         this.var_1188.x = 11;
         this.var_1188.y = 11;
         this.var_1181.mouseEnabled = false;
         this.var_1181.color = 16777215;
         this.var_1181.x = this.var_1188.x + this.var_1188.width + 11;
         this.var_1181.y = 11;
         this.var_1190.x = this.var_1181.x + this.var_1181.width + 5;
         this.var_1190.y = this.var_1181.y + 2;
         this.var_1186.x = this.var_1181.x;
         this.var_1186.y = this.var_1181.y + this.var_1181.height;
         this.var_1191.mouseEnabled = false;
         this.var_1191.x = this.var_1186.x + this.var_1186.width;
         this.var_1191.y = this.var_1186.y;
         this.var_1189.mouseEnabled = false;
         this.var_1189.x = this.var_1186.x;
         this.var_1189.y = this.var_1186.y + this.var_1186.height + 5;
         this.var_1184.x = this.var_1189.x;
         this.var_1184.y = this.var_1189.y + this.var_1189.height + 5;
         this.var_1187.mouseEnabled = false;
         this.var_1187.x = this.var_1184.x + this.var_1184.width;
         this.var_1187.y = this.var_1184.y;
         this.method_1570.width = 160;
         this.method_1570.x = this.var_1182.width - this.method_1570.width - 11;
         this.method_1570.y = 11;
      }
      
      private function method_1606(param1:name_861) : void
      {
         var _loc2_:int = int(clanUserInfoService.restrictionTime);
         if(param1.memberClan)
         {
            this.method_1570.visible = false;
            return;
         }
         if(param1.blocked)
         {
            this.method_1570.visible = false;
            return;
         }
         if(param1.minRankForAddClan > userPropertyService.rank)
         {
            this.method_1570.visible = false;
         }
         if(!param1.incomingRequestEnabled)
         {
            this.method_1570.enabled = false;
            this.method_1570.label = localeService.getText(name_390.const_1202);
            return;
         }
         if(_loc2_ > 0)
         {
            this.method_1570.enabled = false;
            this.method_1507();
            return;
         }
         this.method_1570.enabled = true;
         if(param1.requestInIncoming)
         {
            this.method_1570.label = localeService.getText(name_390.const_808);
            this.method_1570.addEventListener(MouseEvent.CLICK,this.method_1439);
            return;
         }
         if(param1.requestInOutgoing)
         {
            this.method_1570.label = localeService.getText(name_390.const_1236);
            this.method_1570.addEventListener(MouseEvent.CLICK,this.method_1440);
            return;
         }
         this.method_1570.label = localeService.getText(name_390.const_632);
         this.method_1570.addEventListener(MouseEvent.CLICK,this.method_1441);
      }
      
      public function method_1507() : void
      {
         this.var_262 = clanUserInfoService.restrictionTime;
         if(this.var_262 > 0 && this.var_1268 == 0)
         {
            this.method_1504();
            this.var_1268 = setInterval(this.method_1504,1000);
         }
      }
      
      private function method_1504() : void
      {
         --this.var_262;
         if(this.var_262 <= 0)
         {
            clearInterval(this.var_1268);
            this.var_1268 = 0;
            this.var_262 = 0;
            this.method_1606(this.clanData);
         }
         else if(this.clanData.incomingRequestEnabled)
         {
            this.method_1570.label = name_1952.format(this.var_262);
         }
      }
      
      private function method_1441(param1:MouseEvent) : void
      {
         foreignClanService.method_347();
         this.method_1570.removeEventListener(MouseEvent.CLICK,this.method_1441);
         this.method_1570.label = localeService.getText(name_390.const_1236);
         this.method_1570.addEventListener(MouseEvent.CLICK,this.method_1440);
      }
      
      private function method_1439(param1:MouseEvent) : void
      {
         foreignClanService.method_346();
         this.method_1570.enabled = false;
      }
      
      private function method_1440(param1:MouseEvent) : void
      {
         foreignClanService.method_340();
         this.method_1570.removeEventListener(MouseEvent.CLICK,this.method_1440);
         this.method_1570.label = localeService.getText(name_390.const_632);
         this.method_1570.addEventListener(MouseEvent.CLICK,this.method_1441);
      }
      
      private function method_1609(param1:name_861) : void
      {
         var _loc2_:name_351 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         for each(_loc2_ in param1.users)
         {
            _loc3_ += _loc2_.kills;
            _loc4_ += _loc2_.deaths;
         }
         this.var_1223 = new name_1921(new this.var_1232() as Bitmap,localeService.getText(name_390.const_1195),param1.users.length.toString());
         this.var_1228 = new name_1921(new this.var_1231() as Bitmap,localeService.getText(name_390.const_1125),_loc3_.toString());
         this.var_1229 = new name_1921(new this.var_1234() as Bitmap,localeService.getText(name_390.const_835),_loc4_.toString());
         this.var_1227 = new name_1921(new this.var_1233() as Bitmap,localeService.getText(name_390.const_600),"");
         if(_loc4_ == 0)
         {
            this.var_1227.setValue("0.00");
         }
         else
         {
            this.var_1227.setValue((Number(_loc3_) / _loc4_).toFixed(2));
         }
         this.var_1182.addChild(this.var_1223);
         this.var_1182.addChild(this.var_1228);
         this.var_1182.addChild(this.var_1229);
         this.var_1182.addChild(this.var_1227);
         this.var_1223.x = 11 - 1;
         this.var_1228.x = this.var_1223.x + this.var_1223.width + 11;
         this.var_1229.x = this.var_1228.x + this.var_1228.width + 11;
         this.var_1227.x = this.var_1229.x + this.var_1229.width + 11;
         this.var_1223.y = this.var_1188.y + this.var_1188.height + 11;
         this.var_1228.y = this.var_1223.y;
         this.var_1229.y = this.var_1223.y;
         this.var_1227.y = this.var_1223.y;
      }
      
      public function method_1608(param1:name_861) : void
      {
         var _loc2_:String = param1.description;
         if(param1.blocked)
         {
            _loc2_ = param1.reasonForBlocking;
         }
         this.description = new name_1923(_loc2_);
         addChild(this.description);
         this.description.x = 11;
         this.description.y = this.var_1182.y + this.var_1182.height + 7;
         this.description.width = this.width - 2 * 11;
         this.description.height = 80;
      }
      
      private function method_1613(param1:name_861) : void
      {
         var _loc2_:name_351 = null;
         var _loc3_:Object = null;
         this.var_1330 = new WindowInner(0,0,WindowInner.name_1428);
         this.var_1330.name_1895 = true;
         this.var_1330.x = 11;
         this.var_1330.y = this.description.y + this.description.height + 7;
         this.var_1330.width = this.width - 2 * 11;
         this.var_1330.height = this.height - this.var_1182.height - this.description.height - name_983.height - 3 * 11 - 2 * 7;
         addChild(this.var_1330);
         this.list = new ClanMembersList();
         var _loc4_:Vector.<Object> = new Vector.<Object>();
         for each(_loc2_ in param1.users)
         {
            _loc3_ = {};
            _loc3_.score = _loc2_.score.toString();
            _loc3_.permission = _loc2_.permission;
            _loc3_.kills = _loc2_.kills.toString();
            _loc3_.deaths = _loc2_.deaths.toString();
            _loc3_.kd = this.method_1610(_loc2_).toFixed(2).toString();
            _loc3_.date = _loc2_.dateInClanInSec;
            _loc3_.lastOnlineDate = _loc2_.lastVisitTime;
            _loc3_.id = _loc2_.userId;
            _loc3_.currentUserId = userPropertyService.userId;
            _loc3_.currentUserPermission = ClanPermission.NOVICE;
            _loc3_.isNew = false;
            _loc4_.push(_loc3_);
         }
         this.list.method_1479(_loc4_);
         this.list.x = 3;
         this.list.y = 3;
         this.list.width = this.var_1330.width - 6;
         this.list.height = this.var_1330.height - 4;
         this.var_1330.addChild(this.list);
      }
      
      public function method_1610(param1:name_351) : Number
      {
         var _loc2_:Number = param1.deaths;
         var _loc3_:Number = Number(param1.kills);
         if(_loc2_ == 0)
         {
            return _loc3_;
         }
         return _loc3_ / _loc2_;
      }
      
      public function name_1893(param1:Long) : name_865
      {
         var _loc2_:name_865 = null;
         var _loc3_:int = 0;
         while(_loc3_ < createClanService.flags.length)
         {
            _loc2_ = createClanService.flags[_loc3_];
            if(param1 == _loc2_.id)
            {
               return _loc2_;
            }
            _loc3_++;
         }
         return createClanService.defaultFlag;
      }
      
      override public function get height() : Number
      {
         return 500;
      }
      
      override public function get width() : Number
      {
         return 900;
      }
      
      override protected function method_1476() : void
      {
         this.method_1570.removeEventListener(MouseEvent.CLICK,this.method_1441);
         this.method_1570.removeEventListener(MouseEvent.CLICK,this.method_1439);
         this.method_1570.removeEventListener(MouseEvent.CLICK,this.method_1440);
         super.method_1476();
      }
      
      override public function destroy() : void
      {
         if(this.var_1268 > 0)
         {
            clearInterval(this.var_1268);
         }
         foreignClanService.method_344();
         super.destroy();
      }
      
      public function name_864() : void
      {
         alertService.method_1143(localeService.getText(name_390.const_1273));
         this.method_1570.visible = false;
      }
      
      public function name_863(param1:String) : void
      {
         alertService.method_1143(localeService.getText(name_390.const_697));
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.method_345);
      }
      
      private function method_345(param1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.method_345);
         foreignClanService.method_348();
      }
      
      public function method_350() : void
      {
         alertService.method_1143(localeService.getText(name_390.const_836));
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.method_1612);
      }
      
      private function method_1612(param1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.method_345);
         this.destroy();
      }
      
      public function method_342() : void
      {
         alertService.method_1143(localeService.getText(name_390.const_1033));
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.method_1607);
      }
      
      private function method_1607(param1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.method_345);
         this.destroy();
      }
      
      public function method_349(param1:String) : void
      {
         alertService.method_1143(param1);
         this.method_1570.visible = false;
      }
      
      override protected function method_1477() : String
      {
         return name_390.const_1169;
      }
   }
}
