package forms.battlelist
{
   import assets.icons.name_2999;
   import assets.scroller.color.ScrollThumbSkinGreen;
   import assets.scroller.color.ScrollTrackGreen;
   import controls.base.LabelBase;
   import controls.TankWindowInner;
   import controls.rangicons.name_2924;
   import fl.controls.List;
   import fl.data.DataProvider;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   import forms.TankWindowWithHeader;
   import package_1.Main;
   import package_280.name_2263;
   import package_412.name_2264;
   import package_413.name_2265;
   import package_413.name_2283;
   import package_454.BattleInfoBaseParams;
   import package_54.name_102;
   import package_60.TextConst;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class ViewDM extends Sprite
   {
       
      
      private var var_2903:String;
      
      private var var_915:String;
      
      private var var_2922:int;
      
      private var var_2930:int;
      
      private var var_2935:int;
      
      private var var_2926:BitmapData;
      
      private var var_2934:Boolean;
      
      private var var_2929:Number;
      
      private var var_2937:Number;
      
      private var var_2932:int;
      
      private var _available:Boolean;
      
      private var var_2197:TankWindowWithHeader;
      
      private var var_2975:TankWindowInner;
      
      private var format:TextFormat;
      
      private var var_2976:name_2923;
      
      private var var_2977:BitmapData;
      
      public var info:name_2927;
      
      private var list:List;
      
      private var var_1347:DataProvider;
      
      private var var_2938:Boolean = true;
      
      private var var_2202:Timer;
      
      private var var_2939:String;
      
      private var var_2919:Boolean;
      
      private var var_2920:NoSubScribeAlert;
      
      private var var_2921:Boolean = false;
      
      private var var_2924:Boolean = false;
      
      private var var_2923:Boolean = false;
      
      public function ViewDM(param1:Boolean)
      {
         this.var_2197 = new TankWindowWithHeader((Main.osgi.getService(name_102) as name_102).getText(name_390.const_848));
         this.var_2975 = new TankWindowInner(100,100,TankWindowInner.GREEN);
         this.format = new TextFormat("MyriadPro",13);
         this.var_2976 = new name_2923();
         this.var_2977 = new name_2999(0,0);
         this.info = new name_2927();
         this.var_1347 = new DataProvider();
         this.var_2920 = new NoSubScribeAlert();
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.method_2068);
         addEventListener(Event.ADDED_TO_STAGE,this.method_1436);
         addEventListener(Event.REMOVED_FROM_STAGE,this.method_2069);
         this.var_2919 = param1;
      }
      
      public function get haveSubscribe() : Boolean
      {
         return this.var_2919;
      }
      
      public function set haveSubscribe(param1:Boolean) : void
      {
         this.var_2919 = param1;
      }
      
      private function method_1436(param1:Event) : void
      {
         stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize(null);
      }
      
      private function method_2069(param1:Event) : void
      {
         stage.removeEventListener(Event.RESIZE,this.onResize);
      }
      
      public function name_2274(param1:String, param2:String, param3:int, param4:int, param5:int, param6:BitmapData = null, param7:Number = 0, param8:int = 0, param9:int = 0, param10:Boolean = false, param11:String = "", param12:Boolean = true, param13:Boolean = false, param14:Boolean = false, param15:Boolean = false, param16:Boolean = false, param17:Boolean = false, param18:Boolean = false, param19:Boolean = false) : void
      {
         this.var_1347 = new DataProvider();
         this.var_2921 = param13;
         this.var_2924 = param19;
         this.list.dataProvider = this.var_1347;
         this.var_2903 = param1;
         this.var_915 = param2;
         this.var_2922 = param3;
         this.var_2930 = param4;
         this.var_2935 = param5;
         this.var_2926 = param6;
         this.var_2934 = param10;
         this.var_2929 = param7;
         this.var_2937 = param8;
         this.var_2923 = param18;
         this.var_2932 = param9;
         var _loc20_:BattleInfoBaseParams = new BattleInfoBaseParams();
         _loc20_.mapName = param1;
         _loc20_.name_2929 = param11;
         var _loc21_:name_2283 = new name_2283();
         _loc21_.battleMode = BattleMode.DM;
         _loc21_.autoBalance = false;
         _loc21_.clanBattle = false;
         _loc21_.reArmorEnabled = param17;
         _loc21_.friendlyFire = false;
         _loc21_.goldBoxesEnabled = param16;
         _loc21_.withoutBonuses = param14;
         _loc21_.withoutSupplies = param15;
         _loc20_.var_211 = param8;
         var _loc22_:name_2264 = new name_2264(param9,param7);
         _loc21_.limits = _loc22_;
         _loc21_.parkourMode = false;
         _loc21_.privateBattle = false;
         _loc21_.proBattle = true;
         _loc21_.rankRange = new name_2265(param5,param4);
         _loc20_.name_2930 = _loc21_;
         this.info.update(_loc20_);
         this.info.name_1550(this.var_2926);
         this._available = param12;
         this.var_2976.width = 130;
         Main.method_8("BATTLE SELECT","  _payBattle: %1 _userAlreadyPaid: %2 _haveSubscribe: %3",this.var_2921,this.var_2923,this.var_2919);
         this.var_2976.enable = param12 && (this.var_2924 || !this.var_2921 || this.var_2923 || this.var_2919);
         this.var_2976.icon = this.var_2977;
         this.var_2920.visible = !this.var_2919 && param13;
         this.var_2976.name_2928 = this.var_2919 || !param13 || this.var_2923 ? 0 : 5;
         this.method_2732();
         this.onResize(null);
      }
      
      private function method_2068(param1:Event) : void
      {
         var _loc2_:name_102 = Main.osgi.getService(name_102) as name_102;
         removeEventListener(Event.ADDED_TO_STAGE,this.method_2068);
         this.list = new List();
         this.method_2266();
         this.var_2976.x = 320;
         addChild(this.var_2197);
         addChild(this.var_2975);
         addChild(this.list);
         addChild(this.var_2976);
         addChild(this.var_2920);
         this.var_2975.showBlink = true;
         addChild(this.info);
         this.list.rowHeight = 20;
         this.list.setStyle("cellRenderer",TeamListRenderer);
         this.var_2976.label = _loc2_.getText(TextConst.BATTLEINFO_PANEL_BUTTON_PLAY);
         this.var_2976.addEventListener(MouseEvent.CLICK,this.method_2731);
         this.var_2920.visible = false;
      }
      
      private function method_2731(param1:MouseEvent) : void
      {
         dispatchEvent(new name_2263(name_2263.name_2269));
      }
      
      public function name_2278() : void
      {
         var _loc1_:Object = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_1347.length)
         {
            _loc1_ = this.var_1347.getItemAt(_loc2_);
            _loc1_.kills = 0;
            this.var_1347.replaceItemAt(_loc1_,_loc2_);
            _loc2_++;
         }
         this.var_1347.sortOn(["kills","rang"],[Array.DESCENDING | Array.NUMERIC,Array.DESCENDING | Array.NUMERIC]);
         this.var_1347.invalidate();
      }
      
      public function name_1101(param1:Object = null, param2:String = "", param3:int = 0, param4:int = 0, param5:Boolean = false) : void
      {
         var _loc8_:int = 0;
         var _loc6_:Object = new Object();
         var _loc7_:Object = new Object();
         _loc6_.id = param1;
         _loc6_.rang = param3;
         _loc6_.suspicious = param5;
         _loc6_.playerName = param2;
         _loc6_.style = "green";
         _loc7_.rang = param3;
         _loc6_.kills = param4;
         _loc8_ = param1 == null ? -1 : this.method_2313(param1);
         if(_loc8_ < 0)
         {
            this.var_1347.addItem(_loc6_);
         }
         else
         {
            this.var_1347.replaceItemAt(_loc6_,_loc8_);
         }
         this.var_1347.sortOn(["kills","rang"],[Array.DESCENDING | Array.NUMERIC,Array.DESCENDING | Array.NUMERIC]);
         if(this.var_1347.length > this.var_2922)
         {
            this.var_1347.removeItemAt(this.var_1347.length - 1);
         }
         if(this.var_1347.length > 1)
         {
            _loc6_ = this.var_1347.getItemAt(this.var_1347.length - 1);
         }
         this.var_2976.enable = this._available && (this.var_2924 || !this.var_2921 || this.var_2923 || this.var_2919);
         if(_loc6_.id != null)
         {
            this.var_2976.enable = false;
         }
         if(this.var_2202 == null)
         {
            this.var_2202 = new Timer(500,1);
            this.var_2202.addEventListener(TimerEvent.TIMER,this.method_2730);
         }
         this.var_2202.reset();
      }
      
      public function name_1108(param1:Object) : void
      {
         var _loc2_:int = this.method_2313(param1);
         if(_loc2_ >= 0)
         {
            this.var_1347.removeItemAt(_loc2_);
            this.name_1101();
         }
         if(this.var_2202 == null)
         {
            this.var_2202 = new Timer(500,1);
            this.var_2202.addEventListener(TimerEvent.TIMER,this.method_2730);
         }
         this.var_2202.stop();
         this.var_2202.start();
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
      
      private function onResize(param1:Event) : void
      {
         var _loc2_:int = int(Math.max(1000,stage.stageWidth));
         this.var_2197.width = _loc2_ / 3;
         this.var_2197.height = Math.max(stage.stageHeight - 60,530);
         this.x = this.var_2197.width * 2;
         this.y = 60;
         this.info.y = 11;
         this.info.x = 11;
         this.info.width = this.var_2197.width - 22;
         this.info.height = int(this.var_2197.height * 0.4);
         this.var_2975.x = 11;
         this.var_2975.y = this.info.height + 14;
         this.var_2975.width = this.var_2197.width - 22;
         this.var_2975.height = this.var_2197.height - this.info.height - (this.var_2919 || !this.var_2921 ? 80 : 164);
         this.list.x = this.var_2975.x + 4;
         this.list.y = this.var_2975.y + 4;
         this.list.setSize(this.var_2975.width - (this.list.maxVerticalScrollPosition > 0 ? 1 : 4),this.var_2975.height - 8);
         this.var_2976.x = this.var_2197.width - this.var_2976.width - 11;
         this.var_2976.y = this.var_2197.height - 61;
         this.var_2920.x = 15;
         this.var_2920.y = this.var_2197.height - 85 - 55;
         this.var_2920.width = this.var_2197.width - 30;
         if(this.var_2202 == null)
         {
            this.var_2202 = new Timer(200,1);
            this.var_2202.addEventListener(TimerEvent.TIMER,this.method_2730);
         }
         this.var_2202.stop();
         this.var_2202.start();
      }
      
      private function method_2730(param1:TimerEvent) : void
      {
         this.info.width = this.var_2197.width - 22;
         this.info.height = int(this.var_2197.height * 0.4);
         this.var_2975.x = 11;
         this.var_2975.y = this.info.height + 14;
         this.var_2975.width = this.var_2197.width - 22;
         this.var_2975.height = this.var_2197.height - this.info.height - (this.var_2919 || !this.var_2921 ? 80 : 164);
         this.list.x = this.var_2975.x + 4;
         this.list.y = this.var_2975.y + 4;
         this.list.setSize(this.var_2975.width - (this.list.maxVerticalScrollPosition > 0 ? 1 : 4),this.var_2975.height - 8);
         this.var_1347.invalidate();
         this.var_2976.x = this.var_2197.width - this.var_2976.width - 11;
         this.var_2976.y = this.var_2197.height - 61;
         this.var_2920.x = 15;
         this.var_2920.y = this.var_2197.height - 85 - 55;
         this.var_2920.width = this.var_2197.width - 30;
         this.var_2202.removeEventListener(TimerEvent.TIMER,this.method_2730);
         this.var_2202 = null;
      }
      
      public function method_2732() : void
      {
         this.var_1347.removeAll();
         var _loc1_:int = 0;
         while(_loc1_ < this.var_2922)
         {
            this.name_1101();
            _loc1_++;
         }
      }
      
      public function hide() : void
      {
         stage.removeEventListener(Event.RESIZE,this.onResize);
         this.var_2976.removeEventListener(MouseEvent.CLICK,this.method_2731);
      }
      
      private function method_2586(param1:Object) : Bitmap
      {
         var _loc2_:Bitmap = null;
         var _loc5_:LabelBase = null;
         var _loc6_:LabelBase = null;
         var _loc7_:name_2924 = null;
         var _loc3_:BitmapData = new BitmapData(360,20,true,0);
         var _loc4_:Sprite = new Sprite();
         this.format.color = 16777215;
         _loc5_ = new LabelBase();
         _loc5_.text = param1.playerName == "" ? "none" : String(param1.playerName);
         _loc5_.height = 20;
         _loc5_.x = 26;
         _loc5_.y = 0;
         _loc6_ = new LabelBase();
         _loc6_.text = param1.kills == 0 ? "-" : String(param1.kills);
         _loc6_.autoSize = TextFieldAutoSize.CENTER;
         _loc6_.height = 20;
         _loc6_.width = 20;
         _loc6_.x = 160;
         _loc6_.y = 0;
         if(param1.rang > 0)
         {
            _loc7_ = new name_2924(param1.rang);
            _loc7_.x = 13;
            _loc7_.y = 5;
            _loc4_.addChild(_loc7_);
         }
         _loc4_.addChild(_loc5_);
         _loc4_.addChild(_loc6_);
         _loc3_.draw(_loc4_,null,null,null,null,true);
         return new Bitmap(_loc3_);
      }
      
      private function method_2266() : void
      {
         this.list.setStyle("downArrowUpSkin",ScrollArrowDownGreen);
         this.list.setStyle("downArrowDownSkin",ScrollArrowDownGreen);
         this.list.setStyle("downArrowOverSkin",ScrollArrowDownGreen);
         this.list.setStyle("downArrowDisabledSkin",ScrollArrowDownGreen);
         this.list.setStyle("upArrowUpSkin",ScrollArrowUpGreen);
         this.list.setStyle("upArrowDownSkin",ScrollArrowUpGreen);
         this.list.setStyle("upArrowOverSkin",ScrollArrowUpGreen);
         this.list.setStyle("upArrowDisabledSkin",ScrollArrowUpGreen);
         this.list.setStyle("trackUpSkin",ScrollTrackGreen);
         this.list.setStyle("trackDownSkin",ScrollTrackGreen);
         this.list.setStyle("trackOverSkin",ScrollTrackGreen);
         this.list.setStyle("trackDisabledSkin",ScrollTrackGreen);
         this.list.setStyle("thumbUpSkin",ScrollThumbSkinGreen);
         this.list.setStyle("thumbDownSkin",ScrollThumbSkinGreen);
         this.list.setStyle("thumbOverSkin",ScrollThumbSkinGreen);
         this.list.setStyle("thumbDisabledSkin",ScrollThumbSkinGreen);
      }
   }
}
