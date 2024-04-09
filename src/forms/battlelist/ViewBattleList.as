package forms.battlelist
{
   import alternativa.osgi.OSGi;
   import assets.cellrenderer.battlelist.name_2933;
   import assets.scroller.color.ScrollThumbSkinGreen;
   import assets.scroller.color.ScrollTrackGreen;
   import controls.DefaultButton;
   import controls.base.LabelBase;
   import controls.buttons.BigButton;
   import controls.buttons.skin.name_2937;
   import controls.TankWindowInner;
   import fl.controls.List;
   import fl.controls.ScrollBar;
   import fl.data.DataProvider;
   import fl.events.ListEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   import forms.name_1139;
   import forms.TankWindowWithHeader;
   import package_1.Main;
   import package_280.name_2263;
   import package_455.name_2931;
   import package_456.name_2932;
   import package_457.GreenTimeLeftIndicator;
   import package_457.GreyTimeLeftIndicator;
   import package_457.name_2935;
   import package_54.name_102;
   import package_60.TextConst;
   import package_95.IStorageService;
   import projects.tanks.clients.fp10.libraries.name_390;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class ViewBattleList extends Sprite
   {
      
      public static var storageService:IStorageService = OSGi.getInstance().getService(IStorageService) as IStorageService;
      
      private static const const_2262:String = "BATTLE_LIST_MODE_FILTER";
      
      private static const const_2261:BattleMode = BattleMode.TDM;
       
      
      private var var_2197:TankWindowWithHeader;
      
      private var var_1182:TankWindowInner;
      
      private var var_2941:BigButton;
      
      private var var_1794:List;
      
      private var var_1347:DataProvider;
      
      private var var_2942:DataProvider;
      
      private var var_2943:Object;
      
      private var var_2202:Timer;
      
      private var var_2944:int = 100;
      
      private var var_2945:Boolean = false;
      
      private var var_2940:Vector.<name_2931>;
      
      private var var_2947:BattleMode;
      
      public var createButton:DefaultButton;
      
      private var var_2946:int = 0;
      
      public function ViewBattleList()
      {
         this.var_1182 = new TankWindowInner(100,100,TankWindowInner.GREEN);
         this.var_1794 = new List();
         this.var_1347 = new DataProvider();
         this.var_2942 = new DataProvider();
         this.createButton = new DefaultButton();
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.method_2068);
         addEventListener(Event.ADDED_TO_STAGE,this.method_1436);
         addEventListener(Event.REMOVED_FROM_STAGE,this.method_2069);
      }
      
      public function get name_2266() : Object
      {
         return this.var_2943;
      }
      
      private function method_1436(param1:Event) : void
      {
         stage.addEventListener(Event.RESIZE,this.onResize);
         this.var_2945 = true;
         this.onResize(null);
      }
      
      private function method_2069(param1:Event) : void
      {
         stage.removeEventListener(Event.RESIZE,this.onResize);
         this.var_2945 = false;
         var _loc2_:int = int(this.var_2940.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_2940[_loc3_].removeEventListener(Event.CHANGE,this.method_2735);
            _loc3_++;
         }
         this.var_2941.removeEventListener(MouseEvent.CLICK,this.method_2737);
      }
      
      private function method_2737(param1:MouseEvent) : void
      {
         this.var_2941.enabled = false;
         Network(OSGi.getInstance().getService(name_2)).send("lobby;start_matchmaking");
      }
      
      private function method_2068(param1:Event) : void
      {
         var _loc2_:name_102 = Main.osgi.getService(name_102) as name_102;
         removeEventListener(Event.ADDED_TO_STAGE,this.method_2068);
         this.var_2197 = new TankWindowWithHeader(_loc2_.getText(name_390.const_1103));
         addChild(this.var_2197);
         addChild(this.var_1182);
         this.var_1182.showBlink = true;
         this.var_2941 = new BigButton();
         this.var_1794.rowHeight = 20;
         this.var_1794.setStyle("cellRenderer",BattleListRenderer);
         this.var_1794.dataProvider = this.var_1347;
         this.var_1794.addEventListener(ListEvent.ITEM_CLICK,this.method_2744);
         this.var_1794.addEventListener(KeyboardEvent.KEY_UP,this.method_2742);
         this.var_1794.focusEnabled = true;
         this.method_2266();
         addChild(this.var_1794);
         this.var_1794.move(15,70);
         this.var_1794.verticalLineScrollSize = 12;
         this.var_2941.method_2297();
         this.var_2941.width = 200;
         this.var_2941.label = _loc2_.getText(name_390.const_549);
         this.var_2941.y = 12;
         this.var_2941.name_1146(name_2937.name_2940);
         this.var_2941.enabled = true;
         addChild(this.var_2941);
         this.method_2740();
         addChild(this.createButton);
         this.createButton.addEventListener(MouseEvent.CLICK,this.method_2743);
         this.var_2941.addEventListener(MouseEvent.CLICK,this.method_2737);
         this.createButton.label = _loc2_.getText(TextConst.BATTLELIST_PANEL_BUTTON_CREATE);
         var _loc3_:int = int(this.var_2940.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_2940[_loc4_].addEventListener(Event.CHANGE,this.method_2735);
            _loc4_++;
         }
      }
      
      private function method_2740() : void
      {
         this.var_2940 = new Vector.<name_2931>();
         this.method_2734(BattleMode.DM);
         this.method_2734(BattleMode.TDM);
         this.method_2734(BattleMode.CTF);
         this.method_2734(BattleMode.CP);
      }
      
      private function method_2734(param1:BattleMode) : void
      {
         var _loc2_:name_2931 = new name_2931(param1);
         _loc2_.isPressed = true;
         addChild(_loc2_);
         this.var_2940.push(_loc2_);
      }
      
      private function method_2266() : void
      {
         var _loc1_:ScrollBar = this.var_1794.verticalScrollBar;
         this.var_1794.setStyle("downArrowUpSkin",ScrollArrowDownGreen);
         this.var_1794.setStyle("downArrowDownSkin",ScrollArrowDownGreen);
         this.var_1794.setStyle("downArrowOverSkin",ScrollArrowDownGreen);
         this.var_1794.setStyle("downArrowDisabledSkin",ScrollArrowDownGreen);
         this.var_1794.setStyle("upArrowUpSkin",ScrollArrowUpGreen);
         this.var_1794.setStyle("upArrowDownSkin",ScrollArrowUpGreen);
         this.var_1794.setStyle("upArrowOverSkin",ScrollArrowUpGreen);
         this.var_1794.setStyle("upArrowDisabledSkin",ScrollArrowUpGreen);
         this.var_1794.setStyle("trackUpSkin",ScrollTrackGreen);
         this.var_1794.setStyle("trackDownSkin",ScrollTrackGreen);
         this.var_1794.setStyle("trackOverSkin",ScrollTrackGreen);
         this.var_1794.setStyle("trackDisabledSkin",ScrollTrackGreen);
         this.var_1794.setStyle("thumbUpSkin",ScrollThumbSkinGreen);
         this.var_1794.setStyle("thumbDownSkin",ScrollThumbSkinGreen);
         this.var_1794.setStyle("thumbOverSkin",ScrollThumbSkinGreen);
         this.var_1794.setStyle("thumbDisabledSkin",ScrollThumbSkinGreen);
      }
      
      private function method_2743(param1:MouseEvent) : void
      {
         this.var_1794.selectedItem = null;
         dispatchEvent(new name_2263(name_2263.name_2281));
      }
      
      private function method_2744(param1:ListEvent) : void
      {
         this.var_2943 = param1.item.id;
         dispatchEvent(new name_2263(name_2263.name_2275));
      }
      
      private function method_2742(param1:KeyboardEvent) : void
      {
         if(!this.var_1794.selectedItem || param1.keyCode != Keyboard.UP && param1.keyCode != Keyboard.DOWN)
         {
            return;
         }
         this.var_2943 = this.var_1794.selectedItem.id;
         dispatchEvent(new name_2263(name_2263.name_2275));
      }
      
      private function name_1439(param1:Object, param2:String, param3:Boolean = true, param4:int = 0, param5:int = 0, param6:int = 0, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = true, param11:Boolean = false, param12:int = 0, param13:Number = 0, param14:int = 0, param15:String = "", param16:Boolean = false, param17:Boolean = false, param18:Boolean = false, param19:int = 0, param20:int = 0, param21:int = 0) : Object
      {
         var _loc22_:Object = new Object();
         var _loc23_:Object = new Object();
         _loc22_.gamename = param2;
         _loc22_.id = param1;
         _loc22_.type = param15;
         _loc22_.dmatch = param3;
         _loc22_.reds = param4;
         _loc22_.blues = param5;
         _loc22_.all = param6;
         _loc22_.allfull = param7;
         _loc22_.redfull = param8;
         _loc22_.bluefull = param9;
         _loc22_.accessible = param10;
         _loc22_.suspicious = param11;
         _loc23_.isFull = this.method_2738(_loc22_);
         _loc22_.friendsDm = param19;
         _loc22_.friendsRed = param20;
         _loc22_.friendsBlue = param21;
         _loc22_.privateBattle = param16;
         _loc22_.formatBattle = param18;
         _loc22_.proBattle = param17;
         _loc22_.timeLimit = param12;
         _loc22_.scoreLimit = param14;
         _loc22_.percentLeft = param13;
         _loc23_.id = param1;
         _loc23_.accessible = param10;
         _loc23_.suspicious = param11;
         _loc23_.iconNormal = this.method_2586(false,_loc22_);
         _loc23_.iconSelected = this.method_2586(true,_loc22_);
         _loc23_.dat = _loc22_;
         return _loc23_;
      }
      
      public function addItem(param1:Object, param2:String, param3:Boolean = true, param4:int = 0, param5:int = 0, param6:int = 0, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = true, param11:Boolean = false, param12:int = 0, param13:Number = 0, param14:int = 0, param15:String = "", param16:Boolean = false, param17:Boolean = false, param18:Boolean = false, param19:int = 0, param20:int = 0, param21:int = 0) : void
      {
         var _loc22_:Object = new Object();
         var _loc23_:Object = new Object();
         var _loc24_:int = this.method_2313(param1);
         _loc22_.gamename = param2;
         _loc22_.id = param1;
         _loc22_.type = param15;
         _loc22_.dmatch = param3;
         _loc22_.reds = param4;
         _loc22_.blues = param5;
         _loc22_.all = param6;
         _loc22_.allfull = param7;
         _loc22_.redfull = param8;
         _loc22_.bluefull = param9;
         _loc22_.accessible = param10;
         _loc22_.suspicious = param11;
         _loc22_.friendsDm = param19;
         _loc22_.friendsRed = param20;
         _loc22_.friendsBlue = param21;
         _loc22_.privateBattle = param16;
         _loc22_.formatBattle = param18;
         _loc22_.proBattle = param17;
         _loc22_.timeLimit = param12;
         _loc22_.percentLeft = param13;
         _loc22_.scoreLimit = param14;
         _loc23_.id = param1;
         _loc23_.accessible = param10;
         _loc23_.suspicious = param11;
         _loc23_.iconNormal = this.method_2586(false,_loc22_);
         _loc23_.iconSelected = this.method_2586(true,_loc22_);
         _loc23_.isFull = this.method_2738(_loc22_);
         _loc23_.dat = _loc22_;
         if(_loc24_ < 0)
         {
            this.var_1347.addItem(_loc23_);
            this.var_1347.sortOn(["suspicious","accessible","id"],[Array.DESCENDING,Array.DESCENDING,Array.DESCENDING]);
         }
         if(this.var_2945)
         {
            this.onResize();
         }
      }
      
      private function method_2738(param1:Object) : Boolean
      {
         if(Boolean(param1.dmatch))
         {
            return param1.allfull;
         }
         return Boolean(param1.redfull) && Boolean(param1.bluefull);
      }
      
      public function name_2290(param1:Object, param2:Boolean) : void
      {
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc3_:Object = new Object();
         var _loc6_:int = this.method_2313(param1);
         if(_loc6_ >= 0)
         {
            _loc3_ = this.var_1347.getItemAt(_loc6_);
            _loc4_ = _loc3_.dat;
            _loc5_ = this.name_1439(_loc3_.id,_loc4_.gamename,_loc4_.dmatch,_loc4_.reds,_loc4_.blues,_loc4_.all,_loc4_.allfull,_loc4_.redfull,_loc4_.bluefull,_loc4_.accessible,param2,_loc4_.timeLimit,_loc4_.percentLeft,_loc4_.scoreLimit,_loc4_.type,_loc4_.privateBattle,_loc4_.proBattle,_loc4_.formatBattle,_loc4_.friendsDm,_loc4_.friendsRed,_loc4_.friendsBlue);
            this.var_1347.replaceItemAt(_loc5_,_loc6_);
            this.var_1347.invalidateItemAt(_loc6_);
         }
      }
      
      public function method_2747(param1:Object, param2:Boolean) : void
      {
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc3_:Object = new Object();
         var _loc6_:int = this.method_2313(param1);
         if(_loc6_ >= 0)
         {
            _loc3_ = this.var_1347.getItemAt(_loc6_);
            _loc4_ = _loc3_.dat;
            _loc5_ = this.name_1439(_loc3_.id,_loc4_.gamename,_loc4_.dmatch,_loc4_.reds,_loc4_.blues,_loc4_.all,_loc4_.allfull,_loc4_.redfull,_loc4_.bluefull,param2,_loc4_.suspicious,_loc4_.timeLimit,_loc4_.percentLeft,_loc4_.scoreLimit,_loc4_.type,_loc4_.privateBattle,_loc4_.proBattle,_loc4_.formatBattle,_loc4_.friendsDm,_loc4_.friendsRed,_loc4_.friendsBlue);
            this.var_1347.replaceItemAt(_loc5_,_loc6_);
            this.var_1347.invalidateItemAt(_loc6_);
         }
      }
      
      public function name_2289(param1:Object, param2:int, param3:Boolean, param4:int) : void
      {
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         var _loc5_:Object = new Object();
         var _loc8_:int = this.method_2313(param1);
         if(_loc8_ >= 0)
         {
            _loc5_ = this.var_1347.getItemAt(_loc8_);
            _loc6_ = _loc5_.dat;
            _loc7_ = this.name_1439(_loc5_.id,_loc6_.gamename,_loc6_.dmatch,_loc6_.reds,_loc6_.blues,param2,param3,_loc6_.redfull,_loc6_.bluefull,_loc6_.accessible,_loc6_.suspicious,_loc6_.timeLimit,_loc6_.percentLeft,_loc6_.scoreLimit,_loc6_.type,_loc6_.privateBattle,_loc6_.proBattle,_loc6_.formatBattle,param4,_loc6_.friendsRed,_loc6_.friendsBlue);
            this.var_1347.replaceItemAt(_loc7_,_loc8_);
            this.var_1347.invalidateItemAt(_loc8_);
         }
      }
      
      public function name_2288(param1:Object, param2:int, param3:int, param4:Boolean) : void
      {
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         var _loc5_:Object = new Object();
         var _loc8_:int = this.method_2313(param1);
         if(_loc8_ >= 0)
         {
            _loc5_ = this.var_1347.getItemAt(_loc8_);
            _loc6_ = _loc5_.dat;
            _loc7_ = this.name_1439(_loc5_.id,_loc6_.gamename,_loc6_.dmatch,param2,_loc6_.blues,_loc6_.all,_loc6_.allfull,param4,_loc6_.bluefull,_loc6_.accessible,_loc6_.suspicious,_loc6_.timeLimit,_loc6_.percentLeft,_loc6_.scoreLimit,_loc6_.type,_loc6_.privateBattle,_loc6_.proBattle,_loc6_.formatBattle,_loc6_.friendsDm,param3,_loc6_.friendsBlue);
            this.var_1347.replaceItemAt(_loc7_,_loc8_);
            this.var_1347.invalidateItemAt(_loc8_);
         }
      }
      
      public function name_2287(param1:Object, param2:int, param3:int, param4:Boolean) : void
      {
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         var _loc5_:Object = new Object();
         var _loc8_:int = this.method_2313(param1);
         if(_loc8_ >= 0)
         {
            _loc5_ = this.var_1347.getItemAt(_loc8_);
            _loc6_ = _loc5_.dat;
            _loc7_ = this.name_1439(_loc5_.id,_loc6_.gamename,_loc6_.dmatch,_loc6_.reds,param2,_loc6_.all,_loc6_.allfull,_loc6_.redfull,param4,_loc6_.accessible,_loc6_.suspicious,_loc6_.timeLimit,_loc6_.percentLeft,_loc6_.scoreLimit,_loc6_.type,_loc6_.privateBattle,_loc6_.proBattle,_loc6_.formatBattle,_loc6_.friendsDm,_loc6_.friendsRed,param3);
            this.var_1347.replaceItemAt(_loc7_,_loc8_);
            this.var_1347.invalidateItemAt(_loc8_);
         }
      }
      
      public function method_1981(param1:Object, param2:Number) : void
      {
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc3_:Object = new Object();
         var _loc6_:int = this.method_2313(param1);
         if(_loc6_ >= 0)
         {
            _loc3_ = this.var_1347.getItemAt(_loc6_);
            _loc4_ = _loc3_.dat;
            _loc5_ = this.name_1439(_loc3_.id,_loc4_.gamename,_loc4_.dmatch,_loc4_.reds,_loc4_.blues,_loc4_.all,_loc4_.allfull,_loc4_.redfull,_loc4_.bluefull,_loc4_.accessible,_loc4_.suspicious,_loc4_.timeLimit,param2,_loc4_.scoreLimit,_loc4_.type,_loc4_.privateBattle,_loc4_.proBattle,_loc4_.formatBattle,_loc4_.friendsDm,_loc4_.friendsRed,_loc4_.friendsBlue);
            _loc5_.percentLeft = param2;
            this.var_1347.replaceItemAt(_loc5_,_loc6_);
            this.var_1347.invalidateItemAt(_loc6_);
         }
      }
      
      public function name_1879(param1:Object) : void
      {
         var _loc2_:int = this.method_2313(param1);
         if(_loc2_ > -1)
         {
            this.var_1794.selectedIndex = _loc2_;
            this.var_1794.scrollToSelected();
            this.var_2943 = param1;
         }
      }
      
      public function removeItem(param1:Object) : void
      {
         var _loc2_:int = this.method_2313(param1);
         if(_loc2_ >= 0)
         {
            this.var_1347.removeItemAt(_loc2_);
         }
      }
      
      private function method_2313(param1:Object) : int
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.var_1347.length)
         {
            _loc2_ = this.var_1347.getItemAt(_loc3_);
            if(_loc2_.id == param1)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      private function method_2586(param1:Boolean, param2:Object) : Sprite
      {
         var _loc3_:Bitmap = null;
         var _loc5_:LabelBase = null;
         var _loc7_:name_2933 = null;
         var _loc12_:name_2935 = null;
         var _loc13_:LabelBase = null;
         var _loc14_:Bitmap = null;
         var _loc15_:LabelBase = null;
         var _loc16_:name_2932 = null;
         var _loc17_:name_2932 = null;
         var _loc18_:name_2932 = null;
         var _loc4_:Sprite = new Sprite();
         var _loc6_:Shape = new Shape();
         var _loc8_:Boolean = Boolean(param2.accessible);
         var _loc9_:int = this.var_2944;
         var _loc10_:BitmapData = new BitmapData(_loc9_,20,true,0);
         var _loc11_:int = int(_loc9_ * 0.55);
         var _loc19_:Bitmap = new Bitmap();
         var _loc20_:Bitmap = new Bitmap();
         var _loc21_:Bitmap = new Bitmap();
         if(Boolean(param2.privateBattle))
         {
            _loc20_.bitmapData = name_2934.name_2943(param2.accessible);
            _loc20_.y = 5;
            _loc20_.x = 0;
            _loc4_.addChild(_loc20_);
         }
         else if(Boolean(param2.formatBattle))
         {
            _loc21_.bitmapData = name_2934.name_2941(param2.accessible);
            _loc21_.y = 5;
            _loc21_.x = 0;
            _loc4_.addChild(_loc21_);
         }
         else if(Boolean(param2.proBattle))
         {
            _loc19_.bitmapData = name_2934.name_2939(param2.accessible);
            _loc19_.y = 5;
            _loc19_.x = 0;
            _loc4_.addChild(_loc19_);
         }
         _loc5_ = new LabelBase();
         _loc5_.size = 12;
         _loc5_.color = Boolean(param2.suspicious) ? name_1139.const_1758 : (!!param2.accessible ? uint(name_1139.name_1894) : uint(name_1139.name_2149));
         _loc5_.text = param2.gamename;
         _loc5_.autoSize = TextFieldAutoSize.NONE;
         _loc5_.width = _loc9_ / 2;
         _loc5_.height = 18;
         _loc5_.x = 12;
         _loc5_.y = 1;
         _loc4_.addChild(_loc5_);
         if(Boolean(param2.dmatch))
         {
            _loc7_ = new name_2933();
            _loc7_.gotoAndStop(!param2.allfull ? 2 : 1);
            _loc7_.x = _loc11_;
            _loc7_.y = 3;
            _loc4_.addChild(_loc7_);
            _loc5_ = new LabelBase();
            _loc5_.autoSize = TextFieldAutoSize.NONE;
            _loc5_.size = 12;
            _loc5_.color = !param2.allfull ? uint(16777215) : uint(8816262);
            _loc5_.align = TextFormatAlign.CENTER;
            _loc5_.text = String(param2.all);
            _loc5_.x = _loc11_ - 0.5;
            _loc5_.y = 1;
            _loc5_.width = 52;
            _loc5_.height = 16;
            _loc4_.addChild(_loc5_);
            if(param2.friendsDm > 0)
            {
               _loc16_ = new name_2932(_loc8_,param1,param2.friendsDm,param1 ? (_loc8_ ? TankWindowInner.GREEN : uint(5789784)) : (_loc8_ ? uint(5898034) : uint(11645361)));
               _loc16_.x = _loc11_ + _loc7_.width + 10;
               _loc16_.y = 2;
               _loc4_.addChild(_loc16_);
            }
         }
         else
         {
            _loc7_ = new name_2933();
            _loc7_.gotoAndStop(!param2.redfull ? 5 : 3);
            _loc7_.x = _loc11_;
            _loc7_.y = 3;
            _loc4_.addChild(_loc7_);
            _loc7_ = new name_2933();
            _loc7_.gotoAndStop(!param2.bluefull ? 6 : 4);
            _loc7_.x = _loc11_ + 27;
            _loc7_.y = 3;
            _loc4_.addChild(_loc7_);
            _loc5_ = new LabelBase();
            _loc5_.autoSize = TextFieldAutoSize.NONE;
            _loc5_.size = 12;
            _loc5_.align = TextFormatAlign.CENTER;
            _loc5_.color = !param2.redfull ? uint(16777215) : uint(8816262);
            _loc5_.text = String(param2.reds);
            _loc5_.x = _loc11_ - 0.5;
            _loc5_.y = 1;
            _loc5_.width = 27;
            _loc5_.height = 16;
            _loc4_.addChild(_loc5_);
            _loc5_ = new LabelBase();
            _loc5_.autoSize = TextFieldAutoSize.NONE;
            _loc5_.align = TextFormatAlign.CENTER;
            _loc5_.color = !param2.bluefull ? uint(16777215) : uint(8816262);
            _loc5_.text = String(param2.blues);
            _loc5_.x = _loc11_ + 26.5;
            _loc5_.y = 1;
            _loc5_.width = 27;
            _loc5_.height = 16;
            _loc4_.addChild(_loc5_);
            if(Boolean(param2.friendsRed))
            {
               _loc17_ = new name_2932(_loc8_,param1,param2.friendsRed,param1 ? (_loc8_ ? TankWindowInner.GREEN : uint(5789784)) : (_loc8_ ? uint(5898034) : uint(11645361)));
               _loc17_.x = _loc11_ - _loc17_.width - 9;
               _loc17_.y = 2;
               _loc4_.addChild(_loc17_);
            }
            if(Boolean(param2.friendsBlue))
            {
               _loc18_ = new name_2932(_loc8_,param1,param2.friendsBlue,param1 ? (_loc8_ ? TankWindowInner.GREEN : uint(5789784)) : (_loc8_ ? uint(5898034) : uint(11645361)));
               _loc18_.x = _loc11_ + 27 + _loc7_.width + 10;
               _loc18_.y = 2;
               _loc4_.addChild(_loc18_);
            }
         }
         if(this.method_2741(param2))
         {
            _loc12_ = !!param2.accessible ? new GreenTimeLeftIndicator() : new GreyTimeLeftIndicator();
            _loc12_.x = _loc9_ - 6;
            _loc12_.y = 4;
            _loc4_.addChild(_loc12_);
            _loc12_.method_1981(param2.percentLeft);
            _loc13_ = new LabelBase();
            _loc13_.size = 12;
            _loc13_.color = !!param2.accessible ? uint(name_1139.name_1894) : uint(name_1139.name_2149);
            _loc13_.autoSize = TextFieldAutoSize.RIGHT;
            _loc13_.align = TextFormatAlign.RIGHT;
            _loc13_.text = String(param2.timeLimit);
            _loc13_.x = _loc12_.x - _loc13_.textWidth - 4;
            _loc13_.y = 1;
            _loc4_.addChild(_loc13_);
         }
         else if(param2.type != null && param2.accessible != null)
         {
            _loc14_ = !!param2.accessible ? name_2936.name_2938(BattleMode.method_2227(param2.type)) : name_2936.name_2942(BattleMode.method_2227(param2.type));
            _loc14_.x = _loc9_ - 6;
            _loc14_.y = 4;
            _loc4_.addChild(_loc14_);
            _loc15_ = new LabelBase();
            _loc15_.size = 12;
            _loc15_.color = !!param2.accessible ? uint(name_1139.name_1894) : uint(name_1139.name_2149);
            _loc15_.autoSize = TextFieldAutoSize.RIGHT;
            _loc15_.align = TextFormatAlign.RIGHT;
            _loc15_.text = String(param2.scoreLimit);
            _loc15_.y = 1;
            _loc15_.x = _loc14_.x - _loc15_.textWidth - 4;
            _loc4_.addChild(_loc15_);
         }
         _loc10_.draw(_loc4_,null,null,null,null,true);
         _loc3_ = new Bitmap(_loc10_);
         return _loc4_;
      }
      
      private function method_2741(param1:Object) : Boolean
      {
         return int(param1.timeLimit) > 0;
      }
      
      private function method_2736(param1:int) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Object = null;
         this.var_2944 = param1 - (this.var_1794.maxVerticalScrollPosition > 0 ? 32 : 20);
         if(this.var_2944 == this.var_2946)
         {
            return;
         }
         this.var_2946 = this.var_2944;
         var _loc4_:int = 0;
         while(_loc4_ < this.var_1347.length)
         {
            _loc2_ = this.var_1347.getItemAt(_loc4_);
            _loc3_ = _loc2_.dat;
            _loc2_.iconNormal = this.method_2586(false,_loc3_);
            _loc2_.iconSelected = this.method_2586(true,_loc3_);
            this.var_1347.replaceItemAt(_loc2_,_loc4_);
            this.var_1347.invalidateItemAt(_loc4_);
            _loc4_++;
         }
      }
      
      private function onResize(param1:Event = null) : void
      {
         var _loc4_:int = 0;
         var _loc2_:int = int(Math.max(1000,stage.stageWidth));
         var _loc3_:int = this.var_1794.selectedIndex;
         if(this.var_2202 == null)
         {
            this.var_2202 = new Timer(400,1);
            this.var_2202.addEventListener(TimerEvent.TIMER,this.method_2730);
         }
         this.var_2197.width = _loc2_ / 3;
         this.var_2197.height = Math.max(stage.stageHeight - 60,530);
         this.x = this.var_2197.width;
         this.y = 60;
         this.var_1182.width = this.var_2197.width - 22;
         this.var_1182.height = this.var_2197.height - 115;
         this.var_1182.x = 11;
         this.var_1182.y = 67;
         this.var_2941.x = (this.var_2197.width - this.var_2941.width) / 2;
         var _loc5_:int = int(this.var_2940.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            if(_loc6_ == 0)
            {
               this.var_2940[_loc6_].x = 11;
            }
            else
            {
               this.var_2940[_loc6_].x = this.var_2940[_loc6_ - 1].x + this.var_2940[_loc6_ - 1].width + 5;
            }
            this.var_2940[_loc6_].y = this.var_2197.height - 42;
            _loc6_++;
         }
         this.createButton.x = this.var_2197.width - this.createButton.width - 11;
         this.createButton.y = this.var_2197.height - 42;
         _loc4_ = this.var_1182.width - (this.var_1794.maxVerticalScrollPosition > 0 ? 0 : 4);
         this.var_1794.setSize(_loc4_,this.var_1182.height - 8);
         this.method_2736(_loc4_);
         this.var_2202.stop();
         this.var_2202.start();
      }
      
      private function method_2730(param1:TimerEvent) : void
      {
         var _loc2_:int = this.var_1794.selectedIndex;
         var _loc3_:int = this.var_1182.width - (this.var_1794.maxVerticalScrollPosition > 0 ? 0 : 4);
         this.var_1794.setSize(_loc3_,this.var_1182.height - 8);
         this.method_2736(_loc3_);
         this.var_1794.selectedIndex = _loc2_;
         this.var_1794.scrollToSelected();
         this.var_2202.removeEventListener(TimerEvent.TIMER,this.method_2730);
         this.var_2202 = null;
      }
      
      public function destroy() : *
      {
         this.var_2197 = null;
         var _loc1_:int = int(this.var_2940.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this.var_2940[_loc2_].destroy();
            _loc2_++;
         }
         this.var_2940 = null;
      }
      
      private function method_2739(param1:BattleMode) : void
      {
         var _loc3_:int = 0;
         var _loc2_:name_2931 = this.method_2733(param1);
         if(_loc2_ != null)
         {
            this.var_1794.selectedItem = null;
            this.var_2942.removeAll();
            _loc3_ = 0;
            while(_loc3_ < this.var_1347.length)
            {
               if(this.method_2733(BattleMode.DM).isPressed && this.var_1347.getItemAt(_loc3_).dat.type == "DM")
               {
                  this.var_2942.addItem(this.var_1347.getItemAt(_loc3_));
               }
               if(this.method_2733(BattleMode.TDM).isPressed && this.var_1347.getItemAt(_loc3_).dat.type == "TDM")
               {
                  this.var_2942.addItem(this.var_1347.getItemAt(_loc3_));
               }
               if(this.method_2733(BattleMode.CTF).isPressed && this.var_1347.getItemAt(_loc3_).dat.type == "CTF")
               {
                  this.var_2942.addItem(this.var_1347.getItemAt(_loc3_));
               }
               if(this.method_2733(BattleMode.CP).isPressed && this.var_1347.getItemAt(_loc3_).dat.type == "CP")
               {
                  this.var_2942.addItem(this.var_1347.getItemAt(_loc3_));
               }
               _loc3_++;
            }
            this.var_2942.sortOn(["accessible","id"],[Array.DESCENDING,Array.DESCENDING]);
            if(this.var_2942.length > 0 && (this.method_2733(BattleMode.DM).isPressed || this.method_2733(BattleMode.TDM).isPressed || this.method_2733(BattleMode.CTF).isPressed || this.method_2733(BattleMode.CP).isPressed))
            {
               this.var_1794.dataProvider = this.var_2942;
            }
            else
            {
               this.var_1794.dataProvider = this.var_1347;
            }
         }
      }
      
      private function method_2735(param1:Event) : void
      {
         var _loc2_:name_2931 = name_2931(param1.currentTarget);
         this.method_2739(_loc2_.battleMode);
      }
      
      public function method_2745(param1:BattleMode) : void
      {
         this.method_2733(param1).isPressed = false;
      }
      
      public function method_2748(param1:BattleMode) : void
      {
         this.method_2733(param1).lock = true;
      }
      
      public function method_2746(param1:BattleMode) : void
      {
         this.method_2733(param1).lock = false;
      }
      
      private function method_2733(param1:BattleMode) : name_2931
      {
         var _loc2_:name_2931 = null;
         for each(_loc2_ in this.var_2940)
         {
            if(_loc2_.battleMode == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
