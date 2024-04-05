package package_87
{
   import assets.scroller.color.ScrollThumbSkinBlue;
   import assets.scroller.color.ScrollThumbSkinGreen;
   import assets.scroller.color.ScrollThumbSkinRed;
   import assets.scroller.color.ScrollTrackBlue;
   import assets.scroller.color.ScrollTrackGreen;
   import assets.scroller.color.ScrollTrackRed;
   import controls.Label;
   import controls.resultassets.class_149;
   import controls.resultassets.name_2572;
   import controls.resultassets.name_2573;
   import controls.resultassets.name_2575;
   import controls.resultassets.name_2576;
   import controls.resultassets.name_2581;
   import controls.resultassets.name_2584;
   import fl.controls.List;
   import fl.data.DataProvider;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import flash.utils.Dictionary;
   import package_1.Main;
   import package_54.name_102;
   import package_60.TextConst;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class ViewStatistics extends Sprite
   {
      
      public static const BLUE:int = 0;
      
      public static const RED:int = 1;
      
      public static const name_1428:int = 2;
      
      private static const const_1891:int = 52;
      
      private static const const_1890:int = 7;
      
      private static const const_1893:int = 12;
      
      private static const const_1892:int = 20;
      
      private static var var_2274:Object;
       
      
      private var list:List;
      
      private var var_1347:DataProvider;
      
      private var var_1182:class_149;
      
      private var type:int;
      
      private var var_429:String;
      
      private var finish:Boolean;
      
      private var var_2275:Boolean;
      
      private var header:Sprite;
      
      private var var_2278:String;
      
      private var var_2281:String;
      
      private var var_2277:String;
      
      private var var_2279:String;
      
      private var var_2280:String;
      
      private var var_2283:String;
      
      private var var_2282:String;
      
      private var var_2276:String;
      
      public function ViewStatistics(param1:int, param2:String, param3:Boolean)
      {
         this.var_1347 = new DataProvider();
         super();
         if(var_2274 == null)
         {
            this.method_2314();
         }
         this.type = param1;
         this.var_429 = param2;
         this.finish = param3;
         this.var_2275 = true;
         this.tabEnabled = false;
         this.tabChildren = false;
         var _loc4_:name_102 = name_102(Main.osgi.name_6(name_102));
         this.var_2278 = _loc4_.getText(TextConst.BATTLE_STAT_CALLSIGN);
         this.var_2281 = _loc4_.getText(TextConst.BATTLE_STAT_SCORE);
         this.var_2277 = _loc4_.getText(TextConst.BATTLE_STAT_KILLS);
         this.var_2279 = _loc4_.getText(TextConst.BATTLE_STAT_DEATHS);
         this.var_2280 = _loc4_.getText(TextConst.BATTLE_STAT_KDRATIO);
         this.var_2283 = _loc4_.getText(TextConst.BATTLE_STAT_REWARD);
         this.var_2282 = _loc4_.getText(name_390.const_583);
         this.var_2276 = _loc4_.getText(name_390.const_658);
         this.init();
      }
      
      private function method_2314() : void
      {
         var_2274 = {};
         this.method_2311("downArrowUpSkin",ScrollArrowDownGreen,name_2568,name_2566);
         this.method_2311("downArrowDownSkin",ScrollArrowDownGreen,name_2568,name_2566);
         this.method_2311("downArrowOverSkin",ScrollArrowDownGreen,name_2568,name_2566);
         this.method_2311("downArrowDisabledSkin",ScrollArrowDownGreen,name_2568,name_2566);
         this.method_2311("upArrowUpSkin",ScrollArrowUpGreen,name_2565,name_2567);
         this.method_2311("upArrowDownSkin",ScrollArrowUpGreen,name_2565,name_2567);
         this.method_2311("upArrowOverSkin",ScrollArrowUpGreen,name_2565,name_2567);
         this.method_2311("upArrowDisabledSkin",ScrollArrowUpGreen,name_2565,name_2567);
         this.method_2311("trackUpSkin",ScrollTrackGreen,ScrollTrackRed,ScrollTrackBlue);
         this.method_2311("trackDownSkin",ScrollTrackGreen,ScrollTrackRed,ScrollTrackBlue);
         this.method_2311("trackOverSkin",ScrollTrackGreen,ScrollTrackRed,ScrollTrackBlue);
         this.method_2311("trackDisabledSkin",ScrollTrackGreen,ScrollTrackRed,ScrollTrackBlue);
         this.method_2311("thumbUpSkin",ScrollThumbSkinGreen,ScrollThumbSkinRed,ScrollThumbSkinBlue);
         this.method_2311("thumbDownSkin",ScrollThumbSkinGreen,ScrollThumbSkinRed,ScrollThumbSkinBlue);
         this.method_2311("thumbOverSkin",ScrollThumbSkinGreen,ScrollThumbSkinRed,ScrollThumbSkinBlue);
         this.method_2311("thumbDisabledSkin",ScrollThumbSkinGreen,ScrollThumbSkinRed,ScrollThumbSkinBlue);
      }
      
      private function method_2311(param1:String, param2:Class, param3:Class, param4:Class) : void
      {
         var _loc5_:Dictionary = new Dictionary();
         _loc5_[ViewStatistics.name_1428] = param2;
         _loc5_[ViewStatistics.RED] = param3;
         _loc5_[ViewStatistics.BLUE] = param4;
         var_2274[param1] = _loc5_;
      }
      
      public function name_1101(param1:Object, param2:String, param3:int, param4:int, param5:int, param6:int, param7:Boolean, param8:int, param9:int, param10:int, param11:int) : void
      {
         var _loc12_:name_2569 = new name_2569();
         _loc12_.id = param1;
         _loc12_.name_2586 = param3;
         _loc12_.playerName = param2;
         _loc12_.kills = param4;
         _loc12_.deaths = param5;
         _loc12_.score = param6;
         _loc12_.reward = param8;
         _loc12_.premiumBonusReward = param9;
         _loc12_.newbiesAbonementBonusReward = param10;
         _loc12_.stars = param11;
         _loc12_.type = this.type;
         _loc12_.self = param1 == this.var_429;
         _loc12_.suspicious = param7;
         var _loc13_:int = param1 == null ? -1 : this.method_2313(param1);
         if(_loc13_ < 0)
         {
            this.var_1347.addItem(_loc12_);
         }
         else
         {
            this.var_1347.replaceItemAt(_loc12_,_loc13_);
         }
         if(this.type == 2)
         {
            this.var_1347.sortOn(["kills","deaths"],[Array.DESCENDING | Array.NUMERIC,Array.NUMERIC]);
         }
         else
         {
            this.var_1347.sortOn(["score","kills","deaths"],[Array.DESCENDING | Array.NUMERIC,Array.DESCENDING | Array.NUMERIC,Array.NUMERIC]);
         }
      }
      
      public function name_1108(param1:Object) : void
      {
         var _loc2_:int = this.method_2313(param1);
         this.var_1347.removeItemAt(_loc2_);
      }
      
      public function removeAll() : void
      {
         this.var_1347.removeAll();
      }
      
      public function resize(param1:Number) : void
      {
         var _loc2_:Number = (this.var_1347.length + 1) * name_2564.name_2570 + 12;
         if(_loc2_ > param1)
         {
            _loc2_ = int(param1 / this.header.height) * this.header.height + 12;
         }
         this.var_1182.height = _loc2_ < 52 ? 52 : _loc2_;
         this.list.setSize(this.var_1182.width - 2 * name_2564.const_1890,this.var_1182.height - this.header.y - this.header.height - 5);
      }
      
      override public function get height() : Number
      {
         return this.var_1182.height;
      }
      
      public function get rowCount() : int
      {
         return this.var_1347.length;
      }
      
      private function method_2313(param1:Object) : int
      {
         var _loc2_:name_2569 = null;
         var _loc3_:int = int(this.var_1347.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.var_1347.getItemAt(_loc4_) as name_2569;
            if(_loc2_ != null && _loc2_.id == param1)
            {
               return _loc4_;
            }
            _loc4_++;
         }
         return -1;
      }
      
      private function method_2315() : void
      {
         this.method_2310("downArrowUpSkin");
         this.method_2310("downArrowDownSkin");
         this.method_2310("downArrowOverSkin");
         this.method_2310("downArrowDisabledSkin");
         this.method_2310("upArrowUpSkin");
         this.method_2310("upArrowDownSkin");
         this.method_2310("upArrowOverSkin");
         this.method_2310("upArrowDisabledSkin");
         this.method_2310("trackUpSkin");
         this.method_2310("trackDownSkin");
         this.method_2310("trackOverSkin");
         this.method_2310("trackDisabledSkin");
         this.method_2310("thumbUpSkin");
         this.method_2310("thumbDownSkin");
         this.method_2310("thumbOverSkin");
         this.method_2310("thumbDisabledSkin");
      }
      
      private function method_2310(param1:String) : void
      {
         this.list.setStyle(param1,var_2274[param1][this.type]);
      }
      
      private function init() : void
      {
         switch(this.type)
         {
            case 1:
               this.var_1182 = new name_2573();
               break;
            case 2:
               this.var_1182 = new name_2572();
               break;
            case 0:
               this.var_1182 = new name_2581();
         }
         this.var_1182.width = name_2564.name_2585 + 2 * name_2564.const_1890 + name_2564.name_2578 + name_2564.name_2577 + name_2564.name_2583 + name_2564.name_2574 + name_2564.name_2580 + (this.type != 2 ? name_2564.name_2582 : 0) + (this.finish ? name_2564.name_2579 + name_2564.name_2571 + name_2564.name_2571 : 0) + 20;
         this.var_1182.height = 52;
         addChild(this.var_1182);
         this.header = this.method_2316();
         this.var_1182.addChild(this.header);
         this.header.x = 7;
         this.header.y = 7;
         this.var_1347 = new DataProvider();
         this.list = new List();
         this.method_2315();
         this.var_1182.addChild(this.list);
         this.list.rowHeight = name_2564.name_2570;
         this.list.x = 7;
         StatisticsListRenderer.var_2275 = this.var_2275;
         this.list.setStyle("cellRenderer",StatisticsListRenderer);
         this.list.y = this.header.y + this.header.height;
         this.list.focusEnabled = false;
         this.list.dataProvider = this.var_1347;
      }
      
      private function method_2316() : Sprite
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:uint = 0;
         var _loc5_:Label = null;
         switch(this.type)
         {
            case 0:
               _loc1_ = new name_2576();
               _loc2_ = 11590;
               break;
            case 2:
               _loc1_ = new name_2575();
               _loc2_ = 83457;
               break;
            case 1:
               _loc1_ = new name_2584();
               _loc2_ = 4655104;
         }
         var _loc3_:Sprite = new Sprite();
         _loc3_.addChild(_loc1_);
         var _loc4_:int = name_2564.name_2578;
         _loc5_ = this.method_2312(_loc3_,this.var_2278,_loc2_,TextFormatAlign.LEFT,name_2564.name_2577,_loc4_);
         _loc4_ += _loc5_.width;
         if(this.type != 2)
         {
            _loc5_ = this.method_2312(_loc3_,this.var_2281,_loc2_,TextFormatAlign.RIGHT,name_2564.name_2582,_loc4_);
            _loc4_ += _loc5_.width;
         }
         _loc5_ = this.method_2312(_loc3_,this.var_2277,_loc2_,TextFormatAlign.RIGHT,name_2564.name_2583,_loc4_);
         _loc4_ += _loc5_.width;
         _loc5_ = this.method_2312(_loc3_,this.var_2279,_loc2_,TextFormatAlign.RIGHT,name_2564.name_2574,_loc4_);
         _loc4_ += _loc5_.width;
         _loc5_ = this.method_2312(_loc3_,this.var_2280,_loc2_,TextFormatAlign.RIGHT,name_2564.name_2580,_loc4_);
         _loc4_ += _loc5_.width;
         if(this.finish)
         {
            _loc5_ = this.method_2312(_loc3_,this.var_2283,_loc2_,TextFormatAlign.RIGHT,name_2564.name_2579,_loc4_);
            _loc4_ += _loc5_.width;
            if(this.var_2275)
            {
               _loc5_ = this.method_2312(_loc3_,this.var_2282,_loc2_,TextFormatAlign.RIGHT,name_2564.name_2571,_loc4_);
               _loc4_ += _loc5_.width;
               _loc5_ = this.method_2312(_loc3_,this.var_2276,_loc2_,TextFormatAlign.RIGHT,name_2564.name_2571,_loc4_);
            }
         }
         _loc1_.width = width - 2 * 7;
         _loc1_.height = name_2564.name_2570 - 2;
         return _loc3_;
      }
      
      private function method_2312(param1:Sprite, param2:String, param3:uint, param4:String, param5:int, param6:int) : Label
      {
         var _loc7_:Label = new Label();
         _loc7_.autoSize = TextFieldAutoSize.NONE;
         _loc7_.text = param2;
         _loc7_.color = param3;
         _loc7_.align = param4;
         _loc7_.x = param6;
         _loc7_.width = param5;
         _loc7_.height = name_2564.name_2570;
         param1.addChild(_loc7_);
         return _loc7_;
      }
   }
}
