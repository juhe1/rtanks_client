package forms.battlelist
{
   import assets.icons.name_2925;
   import assets.icons.name_2926;
   import assets.scroller.color.ScrollThumbSkinBlue;
   import assets.scroller.color.ScrollThumbSkinRed;
   import assets.scroller.color.ScrollTrackBlue;
   import assets.scroller.color.ScrollTrackRed;
   import controls.base.name_1134;
   import controls.name_1891;
   import controls.rangicons.name_2924;
   import fl.controls.List;
   import fl.data.DataProvider;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.filters.GlowFilter;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   import forms.name_1838;
   import package_1.Main;
   import package_280.name_2263;
   import package_412.name_2264;
   import package_413.name_2265;
   import package_413.name_2283;
   import package_454.BattleInfoBaseParams;
   import package_54.name_102;
   import package_60.TextConst;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class ViewTDM extends Sprite
   {
      
      public static const name_2279:Boolean = true;
      
      public static const name_2280:Boolean = false;
       
      
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
      
      private var var_2925:Boolean;
      
      private var var_2931:Boolean;
      
      private var _available:Boolean;
      
      private var var_2904:Boolean;
      
      private var var_2197:name_1838;
      
      private var var_2911:name_1891;
      
      private var var_2912:name_1891;
      
      private var format:TextFormat;
      
      private var var_2916:name_2923;
      
      private var var_2913:name_2923;
      
      private var var_2927:name_2925;
      
      private var var_2928:name_2926;
      
      private var var_2917:int = 0;
      
      private var var_2918:int = 0;
      
      public var info:name_2927;
      
      public var var_2909:List;
      
      public var var_2910:List;
      
      private var var_2914:DataProvider;
      
      private var var_2915:DataProvider;
      
      private var redScore:name_1134;
      
      private var blueScore:name_1134;
      
      private var score:MovieClip;
      
      private var var_2938:Boolean = true;
      
      private var var_2202:Timer;
      
      private var var_2939:String;
      
      private var var_2936:int;
      
      private var var_2933:int;
      
      private var var_2919:Boolean;
      
      private var var_2920:NoSubScribeAlert;
      
      private var var_2921:Boolean = false;
      
      private var var_2924:Boolean = false;
      
      private var var_2923:Boolean = false;
      
      public function ViewTDM(param1:Boolean)
      {
         this.var_2197 = new name_1838((Main.osgi.name_6(name_102) as name_102).getText(name_390.const_848));
         this.var_2911 = new name_1891(100,100,name_1891.RED);
         this.var_2912 = new name_1891(100,100,name_1891.BLUE);
         this.format = new TextFormat("MyriadPro",13);
         this.var_2916 = new name_2923();
         this.var_2913 = new name_2923();
         this.var_2927 = new name_2925(0,0);
         this.var_2928 = new name_2926(0,0);
         this.info = new name_2927();
         this.var_2909 = new List();
         this.var_2910 = new List();
         this.var_2914 = new DataProvider();
         this.var_2915 = new DataProvider();
         this.redScore = new name_1134();
         this.blueScore = new name_1134();
         this.score = new MovieClip();
         this.var_2920 = new NoSubScribeAlert();
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.method_2068);
         addEventListener(Event.ADDED_TO_STAGE,this.method_1436);
         addEventListener(Event.REMOVED_FROM_STAGE,this.method_2069);
         this.var_2919 = param1;
         var _loc2_:name_1134 = new name_1134();
         this.redScore.size = 22;
         this.redScore.color = name_1891.RED;
         this.redScore.x = -6;
         this.redScore.autoSize = TextFieldAutoSize.RIGHT;
         this.blueScore.size = 22;
         this.blueScore.color = name_1891.BLUE;
         this.blueScore.x = 5;
         _loc2_.size = 22;
         _loc2_.text = ":";
         _loc2_.x = -3;
         _loc2_.y = -2;
         this.score.addChild(this.redScore);
         this.score.addChild(this.blueScore);
         this.score.addChild(_loc2_);
         this.score.filters = [new GlowFilter(13434828,0.5)];
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
      
      private function method_2068(param1:Event) : void
      {
         var _loc2_:name_102 = Main.osgi.name_6(name_102) as name_102;
         removeEventListener(Event.ADDED_TO_STAGE,this.method_2068);
         this.method_2266();
         addChild(this.var_2197);
         addChild(this.var_2911);
         addChild(this.var_2912);
         addChild(this.var_2913);
         addChild(this.var_2916);
         addChild(this.var_2920);
         this.var_2912.name_1895 = this.var_2911.name_1895 = true;
         this.var_2913.x = 322;
         this.var_2916.x = 25;
         addChild(this.info);
         addChild(this.var_2909);
         addChild(this.var_2910);
         this.var_2909.rowHeight = 20;
         this.var_2909.setStyle("cellRenderer",TeamListRenderer);
         this.var_2909.dataProvider = this.var_2914;
         this.var_2910.rowHeight = 20;
         this.var_2910.setStyle("cellRenderer",TeamListRenderer);
         this.var_2910.dataProvider = this.var_2915;
         this.var_2913.label = _loc2_.getText(TextConst.BATTLEINFO_PANEL_BUTTON_PLAY);
         this.var_2913.icon = this.var_2928;
         this.var_2916.label = _loc2_.getText(TextConst.BATTLEINFO_PANEL_BUTTON_PLAY);
         this.var_2916.icon = this.var_2927;
         this.var_2913.width = this.var_2916.width = 130;
         this.var_2913.addEventListener(MouseEvent.CLICK,this.method_2731);
         this.var_2916.addEventListener(MouseEvent.CLICK,this.method_2731);
         this.var_2920.visible = false;
         addChild(this.score);
         this.method_2732();
      }
      
      public function name_2274(param1:String, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int, param8:BitmapData = null, param9:Number = 0, param10:int = 0, param11:int = 0, param12:Boolean = false, param13:Boolean = false, param14:Boolean = false, param15:String = "", param16:Boolean = true, param17:Boolean = false, param18:Boolean = false, param19:Boolean = false, param20:Boolean = false, param21:Boolean = false, param22:Boolean = false, param23:Boolean = false, param24:Boolean = false, param25:Boolean = false) : void
      {
         this.var_2914 = new DataProvider();
         this.var_2915 = new DataProvider();
         this.var_2921 = param19;
         this.var_2924 = param25;
         this.var_2923 = param24;
         this.var_2909.dataProvider = this.var_2914;
         this.var_2910.dataProvider = this.var_2915;
         this.var_2903 = param1;
         this.var_915 = param2;
         this.var_2922 = param3;
         this.var_2930 = param4;
         this.var_2935 = param5;
         this.var_2926 = param8;
         this.var_2904 = param17;
         this.var_2929 = param9;
         this.var_2937 = param10;
         this.var_2932 = param11;
         this.var_2934 = param12;
         this.var_2925 = param13;
         this.var_2931 = param14;
         this.var_2917 = this.var_2918 = 0;
         var _loc26_:BattleInfoBaseParams = new BattleInfoBaseParams();
         _loc26_.mapName = param1;
         _loc26_.name_2929 = param15;
         var _loc27_:name_2283 = new name_2283();
         _loc27_.battleMode = param17 ? BattleMode.CTF : (param18 ? BattleMode.CP : BattleMode.TDM);
         _loc27_.autoBalance = param13;
         _loc27_.clanBattle = false;
         _loc27_.reArmorEnabled = param23;
         _loc27_.friendlyFire = param14;
         _loc27_.goldBoxesEnabled = param22;
         _loc27_.withoutBonuses = param20;
         _loc27_.withoutSupplies = param21;
         _loc26_.var_211 = param10;
         var _loc28_:name_2264 = new name_2264(param11,param9);
         _loc27_.limits = _loc28_;
         _loc27_.parkourMode = false;
         _loc27_.privateBattle = false;
         _loc27_.proBattle = true;
         _loc27_.rankRange = new name_2265(param5,param4);
         _loc26_.name_2930 = _loc27_;
         this.info.update(_loc26_);
         this.info.name_1550(this.var_2926);
         this._available = param16;
         this.var_2913.enable = this.var_2916.enable = param16 && (this.var_2924 || !this.var_2921 || this.var_2923 || this.var_2919);
         this.updateScore(true,param6);
         this.updateScore(false,param7);
         this.var_2913.name_2928 = this.var_2919 || !param19 || this.var_2923 ? 0 : 5;
         this.var_2916.name_2928 = this.var_2919 || !param19 || this.var_2923 ? 0 : 5;
         this.var_2920.visible = !this.var_2919 && param19;
         this.method_2732();
         this.onResize(null);
      }
      
      public function updateScore(param1:Boolean, param2:int) : void
      {
         if(param1 && this.redScore != null && this.blueScore != null)
         {
            this.redScore.text = String(param2);
            this.var_2936 = param2;
         }
         else
         {
            this.blueScore.text = String(param2);
            this.var_2933 = param2;
         }
      }
      
      public function name_2278() : void
      {
         var _loc1_:Object = null;
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this.var_2914.length)
         {
            _loc1_ = this.var_2914.getItemAt(_loc2_);
            _loc1_.kills = 0;
            this.var_2914.replaceItemAt(_loc1_,_loc2_);
            _loc1_ = this.var_2915.getItemAt(_loc2_);
            _loc1_.kills = 0;
            this.var_2915.replaceItemAt(_loc1_,_loc2_);
            _loc2_++;
         }
         this.var_2914.sortOn(["kills","rang"],[Array.DESCENDING | Array.NUMERIC,Array.DESCENDING | Array.NUMERIC]);
         this.var_2914.invalidate();
         this.var_2915.sortOn(["kills","rang"],[Array.DESCENDING | Array.NUMERIC,Array.DESCENDING | Array.NUMERIC]);
         this.var_2915.invalidate();
         this.updateScore(true,0);
         this.updateScore(false,0);
      }
      
      public function name_1101(param1:Boolean = true, param2:Object = null, param3:String = "", param4:int = 0, param5:int = 0, param6:Boolean = false) : void
      {
         var _loc9_:int = 0;
         var _loc11_:int = 0;
         var _loc7_:Object = new Object();
         var _loc8_:Object = new Object();
         var _loc10_:DataProvider = param1 == true ? this.var_2914 : this.var_2915;
         _loc7_.playerName = param3;
         _loc7_.style = param1 == true ? "red" : "blue";
         _loc8_.rang = param4;
         _loc7_.kills = param5;
         _loc7_.suspicious = param6;
         _loc7_.id = param2;
         _loc7_.rang = param4;
         _loc9_ = param2 == null ? -1 : this.method_2313(param1,param2);
         if(_loc9_ < 0)
         {
            _loc10_.addItem(_loc7_);
         }
         else
         {
            _loc10_.replaceItemAt(_loc7_,_loc9_);
         }
         this.var_2917 = 0;
         this.var_2918 = 0;
         _loc11_ = 0;
         while(_loc11_ < this.var_2914.length)
         {
            this.var_2917 += this.var_2914.getItemAt(_loc11_).id != null ? 1 : 0;
            _loc11_++;
         }
         _loc11_ = 0;
         while(_loc11_ < this.var_2915.length)
         {
            this.var_2918 += this.var_2915.getItemAt(_loc11_).id != null ? 1 : 0;
            _loc11_++;
         }
         this.var_2914.sortOn(["kills","rang"],[Array.DESCENDING | Array.NUMERIC,Array.DESCENDING | Array.NUMERIC]);
         this.var_2915.sortOn(["kills","rang"],[Array.DESCENDING | Array.NUMERIC,Array.DESCENDING | Array.NUMERIC]);
         if(_loc10_.length > this.var_2922 && _loc10_.getItemAt(_loc10_.length - 1).id == null)
         {
            _loc10_.removeItemAt(_loc10_.length - 1);
         }
         this.var_2916.enable = this._available ? this.var_2917 <= this.var_2918 || !this.var_2925 : false;
         this.var_2913.enable = this._available ? this.var_2918 <= this.var_2917 || !this.var_2925 : false;
         if(this.var_2202 == null)
         {
            this.var_2202 = new Timer(500,1);
            this.var_2202.addEventListener(TimerEvent.TIMER,this.method_2730);
         }
         this.var_2202.stop();
         this.var_2202.start();
      }
      
      public function name_1108(param1:Object) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc2_ = this.method_2313(true,param1);
         if(_loc2_ >= 0)
         {
            this.var_2914.removeItemAt(_loc2_);
            this.name_1101(true);
         }
         _loc2_ = this.method_2313(false,param1);
         if(_loc2_ >= 0)
         {
            this.var_2915.removeItemAt(_loc2_);
            this.name_1101(false);
         }
         this.var_2917 = 0;
         this.var_2918 = 0;
         _loc3_ = 0;
         while(_loc3_ < this.var_2914.length)
         {
            this.var_2917 += this.var_2914.getItemAt(_loc3_).id != null ? 1 : 0;
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < this.var_2915.length)
         {
            this.var_2918 += this.var_2915.getItemAt(_loc3_).id != null ? 1 : 0;
            _loc3_++;
         }
         this.var_2916.enable = this._available ? this.var_2917 - this.var_2918 < 2 : false;
         this.var_2913.enable = this._available ? this.var_2918 - this.var_2917 < 2 : false;
         if(this.var_2202 == null)
         {
            this.var_2202 = new Timer(500,1);
            this.var_2202.addEventListener(TimerEvent.TIMER,this.method_2730);
         }
         this.var_2202.stop();
         this.var_2202.start();
      }
      
      private function method_2313(param1:Boolean, param2:Object) : int
      {
         var _loc3_:Object = null;
         var _loc4_:DataProvider = param1 == true ? this.var_2914 : this.var_2915;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc3_ = _loc4_.getItemAt(_loc5_);
            if(_loc3_.id == param2)
            {
               return _loc5_;
            }
            _loc5_++;
         }
         return -1;
      }
      
      private function method_2731(param1:MouseEvent) : void
      {
         var _loc2_:name_2923 = param1.currentTarget as name_2923;
         if(_loc2_ == this.var_2913)
         {
            dispatchEvent(new name_2263(name_2263.name_2267));
         }
         else
         {
            dispatchEvent(new name_2263(name_2263.name_2268));
         }
      }
      
      private function onResize(param1:Event) : void
      {
         var _loc2_:int = int(Math.max(1000,stage.stageWidth));
         this.var_2197.width = _loc2_ / 3;
         this.var_2197.height = Math.max(stage.stageHeight - 60,530);
         this.x = this.var_2197.width * 2;
         this.y = 60;
         this.info.x = this.info.y = 11;
         this.info.width = this.var_2197.width - 22;
         this.info.height = int(this.var_2197.height * 0.4);
         this.var_2911.x = 11;
         this.var_2911.y = this.info.height + 14;
         this.var_2911.width = int(this.var_2197.width - 25) / 2;
         this.var_2911.height = this.var_2197.height - this.info.height - (this.var_2919 || !this.var_2921 ? 80 : 164);
         this.var_2912.x = 14 + this.var_2911.width;
         this.var_2912.y = this.info.height + 14;
         this.var_2912.width = this.var_2197.width - this.var_2911.width - 22;
         this.var_2912.height = this.var_2197.height - this.info.height - (this.var_2919 || !this.var_2921 ? 80 : 164);
         this.var_2909.x = this.var_2911.x + 4;
         this.var_2909.y = this.var_2911.y + 4;
         this.var_2909.setSize(this.var_2911.width - (this.var_2909.maxVerticalScrollPosition > 0 ? 1 : 4),this.var_2911.height - 8);
         this.var_2910.x = this.var_2912.x + 4;
         this.var_2910.y = this.var_2912.y + 4;
         this.var_2910.setSize(this.var_2912.width - (this.var_2910.maxVerticalScrollPosition > 0 ? 1 : 4),this.var_2912.height - 8);
         this.var_2913.width = this.var_2916.width = Math.min(130,int((this.var_2197.width - 110) / 2));
         this.var_2916.x = 11;
         this.var_2916.y = this.var_2197.height - 61;
         this.var_2913.x = this.var_2197.width - this.var_2913.width - 11;
         this.var_2913.y = this.var_2197.height - 61;
         this.score.x = this.var_2912.x - 3;
         this.score.y = this.var_2197.height - 51;
         this.var_2920.x = 15;
         this.var_2920.y = this.var_2197.height - 85 - 55;
         this.var_2920.width = this.var_2197.width - 30;
         if(this.var_2202 == null)
         {
            this.var_2202 = new Timer(200,1);
            this.var_2202.addEventListener(TimerEvent.TIMER,this.method_2730);
         }
         this.var_2202.reset();
         this.var_2202.start();
      }
      
      private function method_2730(param1:TimerEvent) : void
      {
         this.info.width = this.var_2197.width - 22;
         this.info.height = int(this.var_2197.height * 0.4);
         this.var_2911.y = this.info.height + 14;
         this.var_2911.width = int(this.var_2197.width - 25) / 2;
         this.var_2911.height = this.var_2197.height - this.info.height - (this.var_2919 || !this.var_2921 ? 80 : 164);
         this.var_2912.x = 14 + this.var_2911.width;
         this.var_2912.y = this.info.height + 14;
         this.var_2912.width = this.var_2197.width - this.var_2911.width - 22;
         this.var_2912.height = this.var_2197.height - this.info.height - (this.var_2919 || !this.var_2921 ? 80 : 164);
         this.var_2909.x = this.var_2911.x + 4;
         this.var_2909.y = this.var_2911.y + 4;
         this.var_2909.setSize(this.var_2911.width - (this.var_2909.maxVerticalScrollPosition > 0 ? 1 : 4),this.var_2911.height - 8);
         this.var_2914.invalidate();
         this.var_2910.x = this.var_2912.x + 4;
         this.var_2910.y = this.var_2912.y + 4;
         this.var_2910.setSize(this.var_2912.width - (this.var_2910.maxVerticalScrollPosition > 0 ? 1 : 4),this.var_2912.height - 8);
         this.var_2915.invalidate();
         this.var_2913.width = this.var_2916.width = Math.min(130,int((this.var_2197.width - 110) / 2));
         this.var_2916.y = this.var_2197.height - 61;
         this.var_2913.x = this.var_2197.width - this.var_2913.width - 11;
         this.var_2913.y = this.var_2197.height - 61;
         this.score.x = this.var_2912.x - 3;
         this.score.y = this.var_2197.height - 51;
         this.var_2920.x = 15;
         this.var_2920.y = this.var_2197.height - 85 - 55;
         this.var_2920.width = this.var_2197.width - 30;
         this.var_2202.removeEventListener(TimerEvent.TIMER,this.method_2730);
         this.var_2202 = null;
      }
      
      public function method_2732() : void
      {
         var _loc1_:int = 0;
         this.var_2914.removeAll();
         this.var_2915.removeAll();
         _loc1_ = 0;
         while(_loc1_ < this.var_2922)
         {
            this.name_1101(true);
            this.name_1101(false);
            _loc1_++;
         }
         this.var_2918 = 0;
         this.var_2917 = 0;
      }
      
      public function hide() : void
      {
         stage.removeEventListener(Event.RESIZE,this.onResize);
         this.var_2913.removeEventListener(MouseEvent.CLICK,this.method_2731);
         this.var_2916.removeEventListener(MouseEvent.CLICK,this.method_2731);
      }
      
      private function method_2586(param1:Object) : Bitmap
      {
         var _loc2_:Bitmap = null;
         var _loc5_:TextField = null;
         var _loc6_:TextField = null;
         var _loc7_:name_2924 = null;
         var _loc3_:BitmapData = new BitmapData(360,20,true,0);
         var _loc4_:Sprite = new Sprite();
         this.format.color = 16777215;
         _loc5_ = new TextField();
         _loc5_.embedFonts = true;
         _loc5_.antiAliasType = AntiAliasType.ADVANCED;
         _loc5_.sharpness = -200;
         _loc5_.defaultTextFormat = this.format;
         _loc5_.text = param1.playerName == "" ? "none" : String(param1.playerName);
         _loc5_.autoSize = TextFieldAutoSize.LEFT;
         _loc5_.height = 20;
         _loc5_.x = 26;
         _loc5_.y = 0;
         _loc6_ = new TextField();
         _loc6_.embedFonts = true;
         _loc6_.antiAliasType = AntiAliasType.ADVANCED;
         _loc6_.sharpness = -200;
         _loc6_.defaultTextFormat = this.format;
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
            _loc7_.y = 4;
            _loc4_.addChild(_loc7_);
         }
         _loc4_.addChild(_loc5_);
         _loc4_.addChild(_loc6_);
         _loc3_.draw(_loc4_,null,null,null,null,true);
         return new Bitmap(_loc3_);
      }
      
      private function method_2266() : void
      {
         this.var_2909.setStyle("downArrowUpSkin",name_2568);
         this.var_2909.setStyle("downArrowDownSkin",name_2568);
         this.var_2909.setStyle("downArrowOverSkin",name_2568);
         this.var_2909.setStyle("downArrowDisabledSkin",name_2568);
         this.var_2909.setStyle("upArrowUpSkin",name_2565);
         this.var_2909.setStyle("upArrowDownSkin",name_2565);
         this.var_2909.setStyle("upArrowOverSkin",name_2565);
         this.var_2909.setStyle("upArrowDisabledSkin",name_2565);
         this.var_2909.setStyle("trackUpSkin",ScrollTrackRed);
         this.var_2909.setStyle("trackDownSkin",ScrollTrackRed);
         this.var_2909.setStyle("trackOverSkin",ScrollTrackRed);
         this.var_2909.setStyle("trackDisabledSkin",ScrollTrackRed);
         this.var_2909.setStyle("thumbUpSkin",ScrollThumbSkinRed);
         this.var_2909.setStyle("thumbDownSkin",ScrollThumbSkinRed);
         this.var_2909.setStyle("thumbOverSkin",ScrollThumbSkinRed);
         this.var_2909.setStyle("thumbDisabledSkin",ScrollThumbSkinRed);
         this.var_2910.setStyle("downArrowUpSkin",name_2566);
         this.var_2910.setStyle("downArrowDownSkin",name_2566);
         this.var_2910.setStyle("downArrowOverSkin",name_2566);
         this.var_2910.setStyle("downArrowDisabledSkin",name_2566);
         this.var_2910.setStyle("upArrowUpSkin",name_2567);
         this.var_2910.setStyle("upArrowDownSkin",name_2567);
         this.var_2910.setStyle("upArrowOverSkin",name_2567);
         this.var_2910.setStyle("upArrowDisabledSkin",name_2567);
         this.var_2910.setStyle("trackUpSkin",ScrollTrackBlue);
         this.var_2910.setStyle("trackDownSkin",ScrollTrackBlue);
         this.var_2910.setStyle("trackOverSkin",ScrollTrackBlue);
         this.var_2910.setStyle("trackDisabledSkin",ScrollTrackBlue);
         this.var_2910.setStyle("thumbUpSkin",ScrollThumbSkinBlue);
         this.var_2910.setStyle("thumbDownSkin",ScrollThumbSkinBlue);
         this.var_2910.setStyle("thumbOverSkin",ScrollThumbSkinBlue);
         this.var_2910.setStyle("thumbDisabledSkin",ScrollThumbSkinBlue);
      }
   }
}
