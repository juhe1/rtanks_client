package package_253
{
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.gui.settings.tabs.SettingsTabView;
   import assets.icons.InputCheckIcon;
   import controls.base.TankInput;
   import controls.base.LabelBase;
   import controls.base.DefaultButtonBase;
   import controls.containers.HorizontalStackPanel;
   import controls.containers.VerticalStackPanel;
   import controls.TankWindowInner;
   import controls.name_2118;
   import controls.name_2122;
   import controls.name_2123;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.system.Capabilities;
   import flash.text.AntiAliasType;
   import forms.registration.name_2111;
   import package_12.name_24;
   import package_179.name_541;
   import package_180.SocialNetworkServiceEvent;
   import package_180.name_544;
   import package_254.name_791;
   import package_280.name_2014;
   import package_394.SocialNetworkIcon;
   import package_399.name_2116;
   import package_399.name_2117;
   import package_399.name_2119;
   import platform.clients.fp10.libraries.alternativapartners.service.name_493;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_789 extends SettingsTabView
   {
      
      private static const const_79:String = "ChangeHelpers";
      
      private static const const_1588:int = 3;
      
      private static const const_1589:int = 4;
      
      private static const ERROR_EMAIL_INVALID:int = 5;
      
      private static const const_1590:int = 15;
      
      private static const const_47:int = 30;
      
      private static const const_1587:Array = ["1234567890","123456789","12345678","1234567","123456","12345","1234","0123","01234","012345","0123456","01234567","012345678","0123456789","9876","98765","987654","9876543","98765432","987654321","9876543210","8765","87654","876543","8765432","87654321","876543210","7654","76543","765432","7654321","76543210","6543","65432","654321","6543210","5432","54321","543210","4321","43210","3210","1111","2222","3333","4444","5555","6666","7777","8888","9999","0000","11111","22222","33333","44444","55555","66666","77777","88888","99999","00000","111111","222222","333333","444444","555555","666666","777777","888888","999999","000000","1111111","2222222","3333333","4444444","5555555","6666666","7777777","8888888","9999999","0000000","11111111","22222222","33333333","44444444","55555555","66666666","77777777","88888888","99999999","00000000","111111111","222222222","333333333","444444444","555555555","666666666","777777777","888888888","999999999","000000000","abcd","Jack","1234","snoopy","suzy","spike","1012","1234","pepper ","shelby","12345 ","54321 ","pass ","wolf","john","qqqq","aaaa","ZZZz","asdf","zxcv","asdf","zxcv","asdfgh","zxcvbn","1111","!!!!","4321","$#@!","1234","!@#$","12345","!@#$%","123456","!@#$%^","abcd","ABCD","qwerty1","QWERTY!","1q2w3e4r","1q2w3e","q1w2e3","q1w2e3r4","qweasd","QWEASD","asdzxc","ASDZXC","qweqwe","QWEQWE","asdasd","ASDASD","zxczxc","qwaszx","elite","ELITE","1qwerty","!QWERTY","black","blue","green","grey","yellow","orange","brown","support","Support","Topgun","topgun","help","Lame","hack","hunter","ranger","lamer","Lamer","hacker","Hacker","hack","summer","spring","autumn","winter","sunday","monday","tuesday","wednesda","thursday","friday","saturday","january","february","march","april","june","july","august","september","october","november","december","cool","lucky","korn ","fuck","Honda","mustang","pentium","mouse","stan","soccer","password","diablo","zoom","joker","nofear","unix","home","apache","holly","q3rulez","pass123","magnum","mother","father","lisa","janet","helen","chocolate","Matrix","Gold","dollar","pussy","eminem","personal","zippo","jennifer","pepsi","clock","time","good","super","friend","angel","qwer","qwert","qwerty","homer","angle","johan","love","test","1q2w3e4r5t6y","31337","loll","gggg"];
      
      private static const const_1584:String = "vkontakte";
      
      private static const const_1582:String = "discord";
      
      public static var display:name_24;
      
      public static var partnersService:name_493;
      
      public static var socialNetworkService:name_544;
      
      public static var validateService:name_541;
      
      public static var helperService:name_791;
       
      
      private var pass1:TankInput;
      
      private var pass2:TankInput;
      
      private var var_1500:TankInput;
      
      private var name_1855:TankInput;
      
      private var var_1501:TankInput;
      
      private var var_1511:DefaultButtonBase;
      
      private var pass1CheckIcon:InputCheckIcon;
      
      private var pass2CheckIcon:InputCheckIcon;
      
      private var var_1503:InputCheckIcon;
      
      private var var_1513:name_2117;
      
      private var var_1515:name_2119;
      
      private var var_1514:name_2116;
      
      private var var_1506:DefaultButtonBase;
      
      private var var_1512:Boolean;
      
      private var var_1509:name_2118;
      
      private var var_1502:LabelBase;
      
      private var var_1507:DefaultButtonBase;
      
      private var var_1510:DefaultButtonBase;
      
      public var var_377:Boolean = false;
      
      public var var_1517:String;
      
      public var var_1518:String;
      
      private var var_1504:DefaultButtonBase;
      
      private var var_1516:String;
      
      private var var_1499:TankInput;
      
      private var var_1508:InputCheckIcon;
      
      private var var_1505:DefaultButtonBase;
      
      public function name_789(param1:String, param2:Boolean, param3:Boolean, param4:String, param5:String)
      {
         super();
         this.var_1517 = param4;
         this.var_1518 = param5;
         this.var_377 = param2;
         var _loc6_:VerticalStackPanel = new VerticalStackPanel();
         _loc6_.name_2121(8);
         _loc6_.y = 3 * 8 + 30;
         if(!partnersService.method_1187())
         {
            if(param2)
            {
               _loc6_.addItem(this.method_1709());
            }
            else
            {
               _loc6_.addItem(this.method_1724(param1));
               this.method_1718();
               this.method_1714();
            }
         }
         if(Boolean(socialNetworkService.method_1316("discord")) || Boolean(socialNetworkService.method_1316("vkontakte")))
         {
            _loc6_.addItem(this.method_1708());
         }
         if(param3)
         {
            _loc6_.addItem(this.method_1711(param1,param5,param4));
         }
         addChildAt(_loc6_,0);
      }
      
      private static function method_1694(param1:Event) : void
      {
         var _loc2_:TankInput = param1.currentTarget as TankInput;
         _loc2_.validValue = true;
      }
      
      private static function method_1704(param1:String) : Boolean
      {
         return param1 == "" || param1.length >= 4 && const_1587.indexOf(param1.toLowerCase()) == -1;
      }
      
      private static function method_1696(param1:String) : String
      {
         if(Boolean(param1))
         {
            return param1.replace(/^\s+|\s+$/g,"");
         }
         return param1;
      }
      
      private function method_1711(param1:String, param2:String, param3:String) : DisplayObject
      {
         var _loc5_:TankWindowInner = null;
         var _loc7_:LabelBase = null;
         var _loc4_:VerticalStackPanel = new VerticalStackPanel();
         _loc4_.name_2121(3);
         _loc5_ = new TankWindowInner(SettingsWindow.name_2112,0,TankWindowInner.name_2114);
         var _loc6_:LabelBase = new LabelBase();
         _loc6_.antiAliasType = AntiAliasType.ADVANCED;
         _loc6_.sharpness = -100;
         _loc6_.thickness = 100;
         _loc6_.text = "防沉迷验证登记";
         _loc5_.addChild(_loc6_);
         _loc4_.addItem(_loc6_);
         _loc7_ = new LabelBase();
         _loc5_.addChild(_loc7_);
         _loc7_.text = "您的真实姓名:";
         _loc7_.x = 8;
         this.name_1855 = new TankInput();
         _loc5_.addChild(this.name_1855);
         this.name_1855.width = _loc5_.width - 8 * 3 - _loc7_.textWidth - 4;
         this.name_1855.x = _loc7_.x + _loc7_.width + 8;
         this.name_1855.y = _loc5_.y + 8;
         _loc7_.y = this.name_1855.y + Math.round((this.name_1855.height - _loc7_.textHeight) * 0.5) - 2;
         var _loc8_:LabelBase = new LabelBase();
         _loc5_.addChild(_loc8_);
         _loc8_.text = "身份证号码:";
         _loc8_.x = 8;
         _loc8_.y = this.name_1855.y + this.name_1855.height + 8 + 6;
         this.var_1501 = new TankInput();
         _loc5_.addChild(this.var_1501);
         this.var_1501.textField.text = param1;
         this.var_1501.x = this.name_1855.x;
         this.var_1501.y = this.name_1855.y + this.name_1855.height + 8;
         this.var_1501.width = this.name_1855.width;
         this.var_1501.textField.text = param2 != null && param2 != "null" ? param2 : "";
         this.name_1855.textField.text = param3 != null && param3 != "null" ? param3 : "";
         this.var_1501.addEventListener(name_2014.name_2020,this.method_1710);
         this.name_1855.addEventListener(name_2014.name_2020,this.method_1707);
         this.var_1504 = new DefaultButtonBase();
         this.var_1504.label = localeService.getText(name_390.const_1039);
         this.var_1504.addEventListener(MouseEvent.CLICK,this.method_1703);
         _loc5_.height = 8 * 4 + 2 * this.name_1855.height + this.var_1504.height;
         this.var_1504.x = SettingsWindow.name_2112 - 8 - this.var_1504.width;
         this.var_1504.y = 3 * 8 + 2 * this.name_1855.height;
         _loc5_.addChild(this.var_1504);
         _loc4_.addItem(_loc5_);
         return _loc4_;
      }
      
      private function method_1709() : TankWindowInner
      {
         var _loc1_:TankWindowInner = new TankWindowInner(SettingsWindow.name_2112,2 * 8 + 30,TankWindowInner.name_2114);
         this.var_1506 = new DefaultButtonBase();
         this.var_1506.width = 210;
         this.var_1506.label = localeService.getText(name_390.const_1206);
         this.var_1506.x = (SettingsWindow.name_2112 - this.var_1506.width) / 2;
         this.var_1506.y = 8;
         this.var_1506.addEventListener(MouseEvent.CLICK,this.method_1722);
         _loc1_.addChild(this.var_1506);
         return _loc1_;
      }
      
      private function method_1724(param1:String) : TankWindowInner
      {
         var _loc2_:TankWindowInner = new TankWindowInner(SettingsWindow.name_2112,30 * 3 + 4 * 8,TankWindowInner.name_2114);
         var _loc3_:LabelBase = this.method_582(localeService.getText(name_390.const_773));
         var _loc4_:LabelBase = this.method_582(localeService.getText(name_390.const_625));
         var _loc5_:LabelBase = this.method_582(localeService.getText(name_390.const_1110));
         var _loc6_:int = (SettingsWindow.name_2112 - _loc3_.width - _loc4_.width - _loc5_.width - 7 * 8) / 3 + 1;
         this.var_1499 = new TankInput();
         this.var_1499.hidden = true;
         this.var_1499.width = _loc6_;
         this.var_1499.maxChars = 20;
         this.var_1499.validValue = true;
         this.pass1 = new TankInput();
         this.pass1.hidden = true;
         this.pass1.width = _loc6_;
         this.pass1.maxChars = 20;
         this.pass1.validValue = true;
         this.var_1499.height = this.pass1.height;
         this.pass2 = new TankInput();
         this.pass2.hidden = true;
         this.pass2.width = _loc6_;
         this.pass2.maxChars = 20;
         this.pass2.validValue = true;
         _loc3_.x = 8;
         _loc3_.y = 8 + (30 - _loc3_.height) / 2;
         this.var_1499.x = _loc3_.x + _loc3_.width + 8;
         this.var_1499.y = 8;
         _loc4_.x = this.var_1499.x + this.var_1499.width + 8;
         _loc4_.y = _loc3_.y;
         this.pass1.x = _loc4_.x + _loc4_.width + 8;
         this.pass1.y = 8;
         _loc5_.x = this.pass1.x + this.pass1.width + 8;
         _loc5_.y = _loc3_.y;
         this.pass2.x = _loc5_.x + _loc5_.width + 8;
         this.pass2.y = 8;
         _loc2_.addChild(_loc3_);
         _loc2_.addChild(this.var_1499);
         _loc2_.addChild(_loc4_);
         _loc2_.addChild(this.pass1);
         _loc2_.addChild(_loc5_);
         _loc2_.addChild(this.pass2);
         this.var_1505 = new DefaultButtonBase();
         this.var_1505.label = localeService.getText(name_390.const_586);
         this.var_1505.addEventListener(MouseEvent.CLICK,this.method_1705);
         this.var_1505.x = SettingsWindow.name_2112 - 8 - this.var_1505.width;
         this.var_1505.y = 2 * 8 + 30;
         _loc2_.addChild(this.var_1505);
         this.var_1508 = new InputCheckIcon();
         this.var_1508.x = this.var_1499.x + _loc6_ - this.var_1508.width / 2 - 15;
         this.var_1508.y = this.var_1499.y + 8;
         this.var_1508.visible = false;
         this.var_1508.gotoAndStop(name_2111.name_2115);
         this.pass1CheckIcon = new InputCheckIcon();
         this.pass2CheckIcon = new InputCheckIcon();
         this.pass1CheckIcon.x = this.pass1.x + _loc6_ - this.pass1CheckIcon.width / 2 - 15;
         this.pass1CheckIcon.y = this.pass1.y + 8;
         this.pass1State = name_2111.name_2113;
         this.pass2CheckIcon.x = this.pass2.x + _loc6_ - this.pass2CheckIcon.width / 2 - 15;
         this.pass2CheckIcon.y = this.pass2.y + 8;
         this.pass2State = name_2111.name_2113;
         _loc2_.addChild(this.var_1508);
         _loc2_.addChild(this.pass1CheckIcon);
         _loc2_.addChild(this.pass2CheckIcon);
         var _loc7_:DisplayObject = this.method_1713(param1);
         _loc7_.height = 30;
         _loc7_.x = 8;
         _loc7_.y = 30 + this.var_1505.height + 3 * 8;
         _loc2_.addChild(_loc7_);
         this.var_1503 = new InputCheckIcon();
         this.var_1503.x = this.var_1500.x + this.var_1500.width - this.var_1503.width / 2 - 15;
         this.var_1503.y = _loc7_.y + 6;
         this.method_1701 = name_2111.name_2113;
         _loc2_.addChild(this.var_1503);
         return _loc2_;
      }
      
      private function method_1725() : TankWindowInner
      {
         var _loc1_:TankWindowInner = new TankWindowInner(SettingsWindow.name_2112,30 + 2 * 8,TankWindowInner.name_2114);
         var _loc2_:LabelBase = this.method_582(localeService.getText(name_390.const_778));
         var _loc3_:int = _loc2_.width + 8;
         _loc2_.x = int(SettingsWindow.name_2112 / 2 - _loc3_ / 2);
         _loc2_.y += 8;
         _loc1_.addChild(_loc2_);
         _loc1_.height = 30 + 2 * 8;
         return _loc1_;
      }
      
      private function method_1727() : Boolean
      {
         var _loc1_:String = Capabilities.os;
         return _loc1_.indexOf("Windows") >= 0 || _loc1_.indexOf("Mac") >= 0;
      }
      
      private function method_1713(param1:String) : DisplayObject
      {
         var _loc2_:HorizontalStackPanel = new HorizontalStackPanel();
         _loc2_.name_2121(8);
         var _loc3_:LabelBase = this.method_582(localeService.getText(name_390.const_1339));
         this.var_1511 = new DefaultButtonBase();
         this.var_1511.label = localeService.getText(name_390.const_1333);
         this.var_1511.addEventListener(MouseEvent.CLICK,this.method_1706);
         this.var_1500 = new TankInput();
         this.var_1500.value = param1;
         this.var_1500.validValue = true;
         this.var_1500.width = SettingsWindow.name_2112 - 4 * 8 - _loc3_.width - this.var_1511.width;
         _loc2_.addItem(_loc3_);
         _loc2_.addItem(this.var_1500);
         _loc2_.addItem(this.var_1511);
         return _loc2_;
      }
      
      private function method_582(param1:String) : LabelBase
      {
         var _loc2_:LabelBase = new LabelBase();
         _loc2_.text = param1;
         _loc2_.y = Math.round((30 - _loc2_.textHeight) * 0.5) - 2;
         return _loc2_;
      }
      
      private function method_1703(param1:MouseEvent) : void
      {
         if(this.method_1720 != "" && this.method_1712 != "")
         {
            dispatchEvent(new name_988(name_988.name_2125));
         }
      }
      
      private function method_1706(param1:MouseEvent) : void
      {
         if(!this.var_377 && this.email != null)
         {
            dispatchEvent(new name_988(name_988.SET_EMAIL));
         }
      }
      
      private function method_1705(param1:MouseEvent = null) : void
      {
         dispatchEvent(new name_988(name_988.name_1064));
      }
      
      override public function show() : void
      {
         display.stage.addEventListener(Event.RESIZE,this.method_1699);
         this.method_1699();
         this.method_540();
      }
      
      override public function hide() : void
      {
         this.method_1723();
         display.stage.removeEventListener(Event.RESIZE,this.method_1699);
      }
      
      private function method_1723() : void
      {
         helperService.name_1653("ChangeHelpers",3);
         helperService.name_1653("ChangeHelpers",4);
         helperService.name_1653("ChangeHelpers",5);
      }
      
      private function method_540() : void
      {
         if(this.var_1500 != null)
         {
            this.method_1698();
         }
         if(!this.var_377 && this.pass1 != null)
         {
            this.method_1695();
         }
      }
      
      private function method_1698(param1:Event = null) : void
      {
         if(Boolean(partnersService.method_1187()) || this.var_377)
         {
            return;
         }
         var _loc2_:Boolean = true;
         if(this.var_1500.value.length > 0)
         {
            _loc2_ = Boolean(validateService.method_1341(this.var_1500.value));
         }
         if(!_loc2_)
         {
            helperService.name_1654("ChangeHelpers",5,true);
         }
         else
         {
            helperService.name_1653("ChangeHelpers",5);
         }
         if(_loc2_)
         {
            this.var_1500.validValue = true;
            this.method_1701 = this.var_1500.value == "" ? int(name_2111.name_2113) : int(name_2111.name_2120);
         }
         else
         {
            this.var_1500.validValue = false;
            this.method_1701 = name_2111.name_2115;
         }
         this.var_1511.enable = _loc2_;
      }
      
      private function method_1695(param1:Event = null) : void
      {
         if(Boolean(partnersService.method_1187()) || this.var_377)
         {
            return;
         }
         this.pass1.validValue = method_1704(this.pass1.value);
         this.pass1State = name_2111.name_2115;
         var _loc2_:Boolean = true;
         this.pass2.validValue = this.pass2.value == "" || this.pass1.value == this.pass2.value;
         this.pass2State = name_2111.name_2115;
         if(this.pass1.value == "")
         {
            this.pass1State = name_2111.name_2113;
            _loc2_ = false;
         }
         else if(this.pass1.validValue)
         {
            this.pass1State = name_2111.name_2120;
            _loc2_ = false;
         }
         if(this.pass2.value == "")
         {
            this.pass2State = name_2111.name_2113;
         }
         else if(this.pass2.validValue)
         {
            this.pass2State = name_2111.name_2120;
         }
         var _loc3_:Boolean = !(_loc2_ || this.pass2.validValue);
         if(_loc2_)
         {
            helperService.name_1654("ChangeHelpers",3,true);
         }
         else
         {
            helperService.name_1653("ChangeHelpers",3);
         }
         if(_loc3_)
         {
            helperService.name_1654("ChangeHelpers",4,true);
         }
         else
         {
            helperService.name_1653("ChangeHelpers",4);
         }
         this.var_1505.enable = this.pass1.value == this.pass2.value && this.pass1.validValue && this.pass2.validValue;
      }
      
      private function method_1708() : TankWindowInner
      {
         var _loc1_:LabelBase = null;
         var _loc2_:Bitmap = null;
         var _loc3_:Bitmap = null;
         var _loc4_:Boolean = false;
         var _loc5_:TankWindowInner = new TankWindowInner(SettingsWindow.name_2112,0,TankWindowInner.name_2114);
         this.var_1512 = Boolean(socialNetworkService.method_1316("vkontakte")) && Boolean(socialNetworkService.method_1316("discord"));
         var _loc6_:Sprite = new Sprite();
         if(this.var_1512)
         {
            _loc1_ = new LabelBase();
            _loc1_.text = localeService.getText(name_390.const_672);
            _loc1_.y = 5;
            _loc6_.addChild(_loc1_);
            _loc2_ = SocialNetworkIcon.name_2126();
            _loc3_ = SocialNetworkIcon.name_2124();
            this.var_1507 = new DefaultButtonBase();
            this.var_1510 = new DefaultButtonBase();
            _loc2_.y = _loc1_.y + _loc1_.height + 8;
            _loc6_.addChild(_loc2_);
            this.var_1507.label = !!socialNetworkService.method_1310("vkontakte") ? String(localeService.getText(name_390.const_801)) : String(localeService.getText(name_390.const_1187));
            this.var_1507.y = _loc1_.y + _loc1_.height + 8;
            this.var_1507.x = _loc2_.x + _loc2_.width + 8;
            _loc6_.addChild(this.var_1507);
            _loc3_.x = this.var_1507.x + this.var_1507.width + 5 * 8;
            _loc3_.y = _loc1_.y + _loc1_.height + 8;
            _loc6_.addChild(_loc3_);
            this.var_1510.label = !!socialNetworkService.method_1310("discord") ? String(localeService.getText(name_390.const_801)) : String(localeService.getText(name_390.const_1187));
            this.var_1510.y = _loc1_.y + _loc1_.height + 8;
            this.var_1510.x = _loc3_.x + _loc3_.width + 8;
            _loc6_.addChild(this.var_1510);
            _loc1_.x = (_loc6_.width - _loc1_.width) / 2;
            this.var_1507.addEventListener(MouseEvent.CLICK,this.method_1715);
            this.var_1510.addEventListener(MouseEvent.CLICK,this.method_1721);
         }
         else
         {
            this.var_1516 = !!socialNetworkService.method_1316("vkontakte") ? "vkontakte" : "discord";
            _loc4_ = Boolean(socialNetworkService.method_1310(this.var_1516));
            this.var_1502 = new LabelBase();
            this.var_1502.text = _loc4_ ? String(localeService.getText(name_390.const_1354)) : String(localeService.getText(name_390.const_715));
            _loc6_.addChild(this.var_1502);
            this.var_1509 = this.var_1516 == "vkontakte" ? new name_2122() : new name_2123();
            this.var_1509.width = 102;
            this.var_1509.x = this.var_1502.x + this.var_1502.width + 5;
            this.var_1502.y = this.var_1509.y + 7;
            _loc6_.addChild(this.var_1509);
            _loc6_.y = 8;
            this.var_1509.addEventListener(MouseEvent.CLICK,this.method_1719);
         }
         _loc6_.x = (SettingsWindow.name_2112 - _loc6_.width) / 2;
         _loc5_.height = _loc6_.height + 2 * 8;
         _loc5_.addChild(_loc6_);
         socialNetworkService.addEventListener(SocialNetworkServiceEvent.UNLINK_SUCCESS,this.method_1716);
         socialNetworkService.addEventListener(SocialNetworkServiceEvent.LINK_SUCCESS,this.method_1717);
         return _loc5_;
      }
      
      private function method_1717(param1:SocialNetworkServiceEvent) : void
      {
         if(this.var_1512)
         {
            this.method_1702(param1.name_2104,true);
         }
         else
         {
            this.var_1502.text = localeService.getText(name_390.const_1354);
            this.var_1509.x = this.var_1502.x + this.var_1502.width + 5;
         }
      }
      
      private function method_1716(param1:SocialNetworkServiceEvent) : void
      {
         if(this.var_1512)
         {
            this.method_1702(param1.name_2104,false);
         }
         else
         {
            this.var_1502.text = localeService.getText(name_390.const_715);
            this.var_1509.x = this.var_1502.x + this.var_1502.width + 5;
         }
      }
      
      private function method_1702(param1:String, param2:Boolean) : void
      {
         if(param1 == "vkontakte")
         {
            this.var_1507.label = localeService.getText(param2 ? name_390.const_801 : name_390.const_1187);
         }
         else
         {
            this.var_1510.label = localeService.getText(param2 ? name_390.const_801 : name_390.const_1187);
         }
      }
      
      private function method_1719(param1:MouseEvent) : void
      {
         this.method_1700(this.var_1516);
      }
      
      private function method_1715(param1:MouseEvent) : void
      {
         this.method_1700("vkontakte");
      }
      
      private function method_1721(param1:MouseEvent) : void
      {
         this.method_1700("discord");
      }
      
      private function method_1700(param1:String) : void
      {
         if(socialNetworkService.method_1310(param1))
         {
            socialNetworkService.method_1311(param1);
         }
         else
         {
            socialNetworkService.method_1314(param1);
         }
      }
      
      private function method_1718() : void
      {
         this.pass1.addEventListener(FocusEvent.FOCUS_IN,method_1694);
         this.pass2.addEventListener(FocusEvent.FOCUS_IN,method_1694);
         this.var_1500.addEventListener(FocusEvent.FOCUS_IN,method_1694);
         this.pass1.addEventListener(Event.CHANGE,this.method_1695);
         this.pass1.addEventListener(FocusEvent.FOCUS_IN,this.method_1695);
         this.pass2.addEventListener(Event.CHANGE,this.method_1695);
         this.pass2.addEventListener(FocusEvent.FOCUS_IN,this.method_1695);
         this.var_1500.addEventListener(FocusEvent.FOCUS_IN,this.method_1698);
         this.var_1500.addEventListener(Event.CHANGE,this.method_1698);
         this.var_1499.addEventListener(FocusEvent.FOCUS_IN,this.method_1697);
         this.var_1499.addEventListener(Event.CHANGE,this.method_1697);
      }
      
      private function method_1707(param1:name_2014) : void
      {
         var _loc2_:String = null;
         if(this.name_1855 != null)
         {
            _loc2_ = method_1696(this.name_1855.textField.text);
            this.name_1855.validValue = Boolean(validateService.method_1347(_loc2_)) || _loc2_.length == 0;
         }
      }
      
      private function method_1710(param1:name_2014) : void
      {
         var _loc2_:String = null;
         if(this.var_1501 != null)
         {
            _loc2_ = this.var_1501.textField.text;
            this.var_1501.validValue = Boolean(validateService.method_1340(_loc2_)) || _loc2_.length == 0;
         }
      }
      
      private function method_1722(param1:MouseEvent) : void
      {
         dispatchEvent(new name_988(name_988.name_1057));
      }
      
      public function method_1726() : void
      {
         this.var_1506.enable = false;
      }
      
      private function method_1697(param1:Event) : void
      {
         this.var_1508.visible = false;
         this.var_1499.validValue = true;
      }
      
      public function name_1047() : void
      {
         this.var_1499.validValue = false;
         this.var_1508.visible = true;
      }
      
      public function method_1728() : void
      {
         this.var_1499.visible = false;
      }
      
      public function set pass1State(param1:int) : void
      {
         if(param1 == name_2111.name_2113)
         {
            this.pass1CheckIcon.visible = false;
         }
         else
         {
            this.pass1CheckIcon.visible = true;
            this.pass1CheckIcon.gotoAndStop(param1);
         }
      }
      
      public function set pass2State(param1:int) : void
      {
         if(param1 == name_2111.name_2113)
         {
            this.pass2CheckIcon.visible = false;
         }
         else
         {
            this.pass2CheckIcon.visible = true;
            this.pass2CheckIcon.gotoAndStop(param1);
         }
      }
      
      public function set method_1701(param1:int) : void
      {
         if(param1 == name_2111.name_2113)
         {
            this.var_1503.visible = false;
         }
         else
         {
            this.var_1503.visible = true;
            this.var_1503.gotoAndStop(param1);
         }
      }
      
      private function method_1714() : void
      {
         this.var_1513 = new name_2117();
         this.var_1515 = new name_2119();
         this.var_1514 = new name_2116();
         helperService.name_981("ChangeHelpers",3,this.var_1513,false);
         helperService.name_981("ChangeHelpers",4,this.var_1515,false);
         helperService.name_981("ChangeHelpers",5,this.var_1514,false);
      }
      
      private function method_1699(param1:Event = null) : void
      {
         var _loc2_:int = 0;
         if(parent != null)
         {
            _loc2_ = 30 + 3 * 8;
            if(this.var_1513 != null)
            {
               this.var_1513.targetPoint = new Point(this.pass1CheckIcon.x + this.pass1CheckIcon.width / 2 + this.x + parent.x,_loc2_ + this.pass1CheckIcon.y + this.pass1CheckIcon.height / 2 + this.y + parent.y);
            }
            if(this.var_1515 != null)
            {
               this.var_1515.targetPoint = new Point(this.pass2CheckIcon.x + this.pass2CheckIcon.width / 2 + this.x + parent.x,_loc2_ + this.pass2CheckIcon.y + this.pass2CheckIcon.height / 2 + this.y + parent.y);
            }
            if(this.var_1514 != null)
            {
               this.var_1514.targetPoint = new Point(this.var_1503.x + this.var_1503.width / 2 + this.x + parent.x,_loc2_ + this.var_1503.y + this.var_1503.height / 2 + this.y + parent.y);
            }
         }
      }
      
      public function get password() : String
      {
         var _loc1_:String = "";
         if(!this.var_377)
         {
            if(Boolean(this.pass1.textField.text))
            {
               if(this.pass1.textField.text == this.pass2.textField.text)
               {
                  _loc1_ = this.pass1.textField.text;
               }
            }
         }
         return _loc1_;
      }
      
      public function get email() : String
      {
         if(this.var_377)
         {
            return "";
         }
         if(this.var_1500.textField.text.indexOf("*") != -1)
         {
            return null;
         }
         return this.var_1500.textField.text;
      }
      
      public function get method_1720() : String
      {
         if(this.name_1855 != null && this.name_1855.textField.text != null && method_1696(this.name_1855.textField.text).length > 0)
         {
            return this.name_1855.textField.text;
         }
         return "";
      }
      
      public function get method_1712() : String
      {
         if(this.var_1501 != null && this.var_1501.textField.text != null && method_1696(this.var_1501.textField.text).length > 0)
         {
            return this.var_1501.textField.text;
         }
         return "";
      }
      
      public function name_1048() : String
      {
         return this.var_1499 != null ? this.var_1499.value : "";
      }
      
      override public function destroy() : void
      {
         if(!this.var_377)
         {
            this.var_1505.removeEventListener(MouseEvent.CLICK,this.method_1705);
            this.var_1511.removeEventListener(MouseEvent.CLICK,this.method_1706);
            this.pass1.removeEventListener(FocusEvent.FOCUS_IN,method_1694);
            this.pass2.removeEventListener(FocusEvent.FOCUS_IN,method_1694);
            this.var_1500.removeEventListener(FocusEvent.FOCUS_IN,method_1694);
            this.pass1.removeEventListener(Event.CHANGE,this.method_1695);
            this.pass1.removeEventListener(FocusEvent.FOCUS_IN,this.method_1695);
            this.pass2.removeEventListener(Event.CHANGE,this.method_1695);
            this.pass2.removeEventListener(FocusEvent.FOCUS_IN,this.method_1695);
            this.var_1500.removeEventListener(FocusEvent.FOCUS_IN,this.method_1698);
            this.var_1500.removeEventListener(Event.CHANGE,this.method_1698);
            this.var_1499.removeEventListener(FocusEvent.FOCUS_IN,this.method_1697);
            this.var_1499.removeEventListener(Event.CHANGE,this.method_1697);
         }
         if(Boolean(this.var_1504))
         {
            this.var_1504.removeEventListener(MouseEvent.CLICK,this.method_1703);
         }
         helperService.name_987("ChangeHelpers",3);
         helperService.name_987("ChangeHelpers",4);
         helperService.name_987("ChangeHelpers",5);
         if(!this.var_377)
         {
            this.var_1499.removeEventListener(FocusEvent.FOCUS_IN,this.method_1697);
            this.var_1499.removeEventListener(Event.CHANGE,this.method_1697);
         }
         super.destroy();
      }
   }
}
