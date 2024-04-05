package alternativa.tanks.model
{
   import alternativa.model.class_11;
   import alternativa.model.class_52;
   import alternativa.model.name_66;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.dump.name_524;
   import alternativa.tanks.loader.name_13;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import forms.Alert;
   import forms.battlelist.ViewBattleList;
   import forms.battlelist.ViewDM;
   import forms.battlelist.ViewTDM;
   import forms.battlelist.battlecreate.CreateBattleEvent;
   import forms.battlelist.battlecreate.CreateBattleFormController;
   import forms.battlelist.name_2270;
   import forms.name_358;
   import package_1.BattleSelectModelActivator;
   import package_1.Main;
   import package_108.name_333;
   import package_108.name_336;
   import package_108.name_355;
   import package_12.name_24;
   import package_124.AlertServiceEvent;
   import package_124.name_42;
   import package_13.Long;
   import package_141.name_400;
   import package_144.name_465;
   import package_171.name_528;
   import package_23.SWFAddressEvent;
   import package_24.LogLevel;
   import package_24.name_50;
   import package_254.name_2271;
   import package_254.name_2272;
   import package_254.name_791;
   import package_280.name_1011;
   import package_280.name_2263;
   import package_31.PanelModel;
   import package_31.name_115;
   import package_34.class_3;
   import package_4.ClientObject;
   import package_412.name_2264;
   import package_413.name_2265;
   import package_413.name_2283;
   import package_414.name_2273;
   import package_47.BattleTeamType;
   import package_54.name_102;
   import package_60.TextConst;
   import package_7.name_28;
   import package_7.name_32;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.StubBitmapData;
   import projects.tanks.client.battleselect.class_164;
   import projects.tanks.client.battleselect.name_386;
   import projects.tanks.client.battleservice.model.name_370;
   import projects.tanks.clients.fp10.libraries.name_390;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class BattleSelectModel extends class_164 implements name_386, class_11, IResourceLoadingListener, class_52, class_3
   {
       
      
      private var modelRegister:name_32;
      
      private var panelModel:name_115;
      
      private var var_815:name_791;
      
      private var var_1796:name_28;
      
      private var var_1804:name_528;
      
      private var localeService:name_102;
      
      private var clientObject:ClientObject;
      
      private var var_83:DisplayObjectContainer;
      
      private var dialogsLayer:DisplayObjectContainer;
      
      private var var_1794:ViewBattleList;
      
      private var var_1793:ViewDM;
      
      private var var_1792:ViewTDM;
      
      private var var_1800:CreateBattleFormController;
      
      private var var_1797:Array;
      
      private var var_1803:Array;
      
      private var battles:Dictionary;
      
      private var maps:Dictionary;
      
      private var var_1799:Dictionary;
      
      private const const_1676:int = 2147483647;
      
      private const const_1675:int = 1;
      
      private const const_1674:int = 5;
      
      private var var_1802:name_2271;
      
      private var var_1801:name_2272;
      
      private const const_79:String = "BattleSelectModel";
      
      private var var_1807:uint;
      
      private var var_1809:int = 5000;
      
      private var var_1798:Boolean;
      
      private var recommendedBattle:String;
      
      private var var_1795:Alert;
      
      private var var_1806:Long;
      
      private var var_1805:Long;
      
      public var selectedBattleId:String;
      
      public var battleToSelect:String;
      
      private var translate:Dictionary;
      
      private var locale:String;
      
      private var var_1808:String;
      
      public function BattleSelectModel()
      {
         this.translate = new Dictionary();
         super();
         var_365.push(name_66);
         var_365.push(name_386);
         var_365.push(class_11);
         var_365.push(class_52);
         this.modelRegister = Main.osgi.name_6(name_32) as name_32;
         this.panelModel = Main.osgi.name_6(name_115) as name_115;
         this.var_815 = Main.osgi.name_6(name_791) as name_791;
         this.var_1796 = Main.osgi.name_6(name_28) as name_28;
         this.var_1804 = Main.osgi.name_6(name_528) as name_528;
         this.localeService = name_102(Main.osgi.name_6(name_102));
         this.var_83 = Main.contentUILayer;
         this.dialogsLayer = (Main.osgi.name_6(name_24) as name_24).dialogsLayer as DisplayObjectContainer;
      }
      
      public function initObject(param1:ClientObject, param2:int, param3:Boolean, param4:Array) : void
      {
         var _loc12_:String = null;
         var _loc13_:name_355 = null;
         var _loc14_:ImageResource = null;
         var _loc15_:name_2270 = null;
         Main.method_8("BATTLE SELECT","initObject");
         Main.method_8("BATTLE SELECT","   maps: %1",param4);
         Main.method_8("BATTLE SELECT","   haveSubscribe: %1",param3);
         this.locale = Game.var_1;
         this.clientObject = param1;
         this.battles = new Dictionary();
         this.var_1797 = new Array();
         this.maps = new Dictionary();
         if(ViewBattleList(Main.osgi.name_6(ViewBattleList)) != null)
         {
            ViewBattleList(Main.osgi.name_6(ViewBattleList)).destroy();
            if(this.var_83.contains(ViewBattleList(Main.osgi.name_6(ViewBattleList))))
            {
               this.var_83.removeChild(ViewBattleList(Main.osgi.name_6(ViewBattleList)));
            }
         }
         this.var_1794 = new ViewBattleList();
         Main.osgi.name_1(ViewBattleList,this.var_1794);
         param3 = true;
         if(ViewDM(Main.osgi.name_6(ViewDM)) != null)
         {
            this.var_1793 = ViewDM(Main.osgi.name_6(ViewDM));
            this.var_1793.haveSubscribe = param3;
         }
         else
         {
            this.var_1793 = new ViewDM(param3);
            Main.osgi.name_1(ViewDM,this.var_1793);
         }
         if(ViewTDM(Main.osgi.name_6(ViewTDM)) != null)
         {
            this.var_1792 = ViewTDM(Main.osgi.name_6(ViewTDM));
            this.var_1792.haveSubscribe = param3;
         }
         else
         {
            this.var_1792 = new ViewTDM(param3);
            Main.osgi.name_1(ViewTDM,this.var_1792);
         }
         this.var_1803 = param4;
         var _loc5_:int = 0;
         while(_loc5_ < param4.length)
         {
            _loc12_ = name_355(param4[_loc5_]).id;
            this.maps[_loc12_] = param4[_loc5_];
            _loc5_++;
         }
         var _loc6_:Array = new Array();
         _loc5_ = 0;
         while(_loc5_ < this.var_1803.length)
         {
            _loc13_ = name_355(this.var_1803[_loc5_]);
            _loc14_ = ImageResource(ResourceRegistry(OSGi.getInstance().name_6(ResourceRegistry)).getResource(_loc13_.previewId));
            _loc15_ = new name_2270();
            _loc15_.id = _loc13_.id;
            _loc15_.gameName = _loc13_.name;
            _loc15_.maxPeople = _loc13_.maxPeople;
            _loc15_.maxRank = _loc13_.maxRank;
            _loc15_.minRank = _loc13_.minRank;
            _loc15_.themeName = _loc13_.themeName;
            _loc15_.theme = _loc13_.theme;
            _loc15_.preview = _loc14_;
            _loc15_.ctf = _loc13_.ctf;
            _loc15_.tdm = _loc13_.tdm;
            _loc15_.tdm = _loc13_.tdm;
            _loc15_.dom = _loc13_.dom;
            _loc6_.push(_loc15_);
            _loc5_++;
         }
         var _loc7_:int = int(this.panelModel.rank);
         var _loc8_:name_2273 = new name_2273();
         _loc8_.battleCreationDisabled = false;
         var _loc9_:Vector.<name_2264> = new Vector.<name_2264>();
         _loc9_.push(new name_2264(999,999 * 60));
         _loc9_.push(new name_2264(999,999 * 60));
         _loc9_.push(new name_2264(999,999 * 60));
         _loc9_.push(new name_2264(999,999 * 60));
         _loc8_.battlesLimits = _loc9_;
         _loc8_.defaultRange = new name_2265(_loc7_ + 6,_loc7_ - 6);
         _loc8_.maxRange = new name_2265(_loc7_ + 6,_loc7_ - 6);
         _loc8_.maxRangeLength = 7;
         _loc8_.ultimatesEnabled = false;
         this.var_1800 = new CreateBattleFormController(_loc8_,_loc6_);
         if(this.var_1796 != null)
         {
            this.var_1796.addEventListener(SWFAddressEvent.CHANGE,this.method_3);
         }
         this.var_1798 = true;
         this.var_1801 = new name_2272();
         this.var_1802 = new name_2271();
         this.var_815.name_981("BattleSelectModel",5,this.var_1801,true);
         this.var_815.name_981("BattleSelectModel",1,this.var_1802,false);
         var _loc10_:int = int(Math.max(1000,Main.stage.stageWidth));
         var _loc11_:int = int(Math.max(600,Main.stage.stageHeight));
         this.var_1801.targetPoint = new Point(Math.round(_loc10_ * (2 / 3)) - 47,_loc11_ - 34);
         Main.stage.addEventListener(Event.RESIZE,this.method_1081);
         this.method_1081();
         (BattleSelectModelActivator.osgi.name_6(name_524) as name_524).registerDumper(this);
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         (BattleSelectModelActivator.osgi.name_6(name_524) as name_524).unregisterDumper(this.dumperName);
         if(this.var_1796 != null)
         {
            this.var_1796.removeEventListener(SWFAddressEvent.CHANGE,this.method_3);
            if(this.var_1798)
            {
               this.var_1796.setValue("");
            }
         }
         this.method_1985();
         this.method_1967();
         this.method_1982();
         Main.stage.removeEventListener(Event.RESIZE,this.method_1081);
         this.var_815.name_1653("BattleSelectModel",1);
         this.var_815.name_987("BattleSelectModel",1);
         this.var_815.name_987("BattleSelectModel",5);
         this.var_1802 = null;
         this.var_1801 = null;
         this.var_1794 = null;
         this.var_1793 = null;
         this.var_1792 = null;
         this.var_1800 = null;
         this.var_1797 = null;
         this.var_1803 = null;
         this.battles = null;
         this.maps = null;
         this.var_1799 = null;
         this.var_1795 = null;
         this.clientObject = null;
      }
      
      public function name_16(param1:Object) : void
      {
      }
      
      public function method_1077(param1:Long) : void
      {
      }
      
      public function name_468(param1:ClientObject, param2:Array, param3:String, param4:Boolean) : void
      {
         var _loc5_:int = 0;
         var _loc6_:String = null;
         name_13(Main.osgi.name_6(name_13)).hide();
         this.panelModel.partSelected(0);
         this.method_1984();
         if(param2 != null)
         {
            _loc5_ = 0;
            while(_loc5_ < param2.length)
            {
               this.name_401(param1,name_336(param2[_loc5_]));
               _loc5_++;
            }
            _loc6_ = this.method_1974();
            if(_loc6_ == null || param4)
            {
               this.method_1965(param1,param3);
            }
            else
            {
               this.method_1965(param1,_loc6_);
            }
         }
         if(Lobby.var_77)
         {
            Network(Main.osgi.name_6(name_2)).send("lobby;user_inited");
            Lobby.var_77 = false;
         }
      }
      
      private function method_1991(param1:name_1011) : void
      {
         if(param1.name_982 == name_358.GARAGE)
         {
            this.panelModel.method_510();
         }
      }
      
      public function name_401(param1:ClientObject, param2:name_336) : void
      {
         var _loc3_:name_465 = OSGi.getInstance().name_6(name_465) as name_465;
         this.battles[param2.battleId] = param2;
         this.var_1797.push(param2);
         this.var_1794.addItem(param2.battleId,param2.name,!param2.team,param2.name_384,param2.name_389,param2.countPeople,param2.countPeople >= param2.maxPeople,param2.name_384 >= param2.maxPeople,param2.name_389 >= param2.maxPeople,param2.minRank <= this.panelModel.rank && param2.maxRank >= this.panelModel.rank,param2.suspicious,param2.timeLimit,_loc3_.method_1168(param2.battleId),param2.scoreLimit,param2.type,param2.privateBattle,param2.proBattle,param2.formatBattle,param2.friendsDm,param2.friendsRed,param2.friendsBlue);
         if(this.var_1797.length > 2147483647)
         {
            this.var_1794.createButton.enable = false;
         }
         if(this.battleToSelect != null && this.battleToSelect == param2.name)
         {
            this.method_1965(param1,param2.battleId);
            this.battleToSelect = null;
         }
      }
      
      public function method_1996(param1:String) : String
      {
         return (this.battles[param1] as name_336).name;
      }
      
      public function method_1997(param1:Long) : void
      {
      }
      
      public function name_492(param1:ClientObject, param2:String) : void
      {
         if(this.battles == null)
         {
            return;
         }
         var _loc3_:name_336 = this.battles[param2];
         if(_loc3_ == null)
         {
            return;
         }
         this.var_1797.splice(this.var_1797.indexOf(_loc3_),1);
         this.battles[param2] = null;
         if(this.var_1794.name_2266 == param2)
         {
            this.method_1967();
         }
         this.var_1794.removeItem(param2);
         if(this.var_1797.length <= 2147483647)
         {
            this.var_1794.createButton.enable = true;
         }
      }
      
      public function method_1994(param1:ClientObject, param2:Boolean) : void
      {
         this.var_1793.haveSubscribe = param2;
         this.var_1792.haveSubscribe = param2;
      }
      
      public function showBattleInfo(param1:ClientObject, param2:String, param3:int, param4:name_370, param5:String, param6:Long, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int, param13:int, param14:Boolean, param15:Boolean, param16:Array, param17:Boolean, param18:Boolean, param19:Boolean, param20:Boolean, param21:Boolean, param22:Boolean, param23:Boolean, param24:String, param25:Boolean = false) : void
      {
         var _loc26_:BitmapData = null;
         var _loc28_:String = null;
         var _loc29_:Boolean = false;
         var _loc30_:int = 0;
         var _loc31_:name_333 = null;
         Main.method_8("BATTLE SELECT","showBattleInfo");
         Main.method_8("BATTLE SELECT","   battleId: %1",param5);
         Main.method_8("BATTLE SELECT","this.clientObject = %1",this.clientObject == param1);
         this.var_1799 = new Dictionary(false);
         var _loc27_:ImageResource = ImageResource(ResourceRegistry(OSGi.getInstance().name_6(ResourceRegistry)).getResource(param6));
         if(_loc27_ == null)
         {
            _loc26_ = new StubBitmapData(16777215);
         }
         if(_loc27_ != null && _loc27_.data == null && !_loc27_.isLoaded)
         {
            this.var_1805 = _loc27_.id;
            _loc27_.loadLazyResource(this);
         }
         else if(_loc27_ == null)
         {
            _loc26_ = null;
         }
         else if(Boolean(_loc27_.data))
         {
            _loc26_ = _loc27_.data;
         }
         if(this.var_1794 != null)
         {
            this.var_1794.name_1879(param5);
            _loc28_ = "";
            if(this.var_1796 != null)
            {
               if(this.var_1804.params["partner"] != null && this.var_1796.getValue().indexOf("registered") != -1)
               {
                  this.var_1796.setValue("battle/" + param5.toString() + "/partner=" + this.var_1804.params["partner"]);
               }
               else
               {
                  this.var_1796.setValue("battle/" + param5.toString());
               }
            }
            _loc28_ = "#/battle=" + param5;
            _loc29_ = param4 == name_370.CTF || param4 == name_370.TDM || param4 == name_370.DOM;
            this.method_1978(_loc29_);
            if(_loc29_)
            {
               this.var_1792.name_2274(param2,param24,param3,param7,param8,param12,param13,_loc26_,param9,param10,param11,false,param14,param15,_loc28_,param7 <= this.panelModel.rank && param8 >= this.panelModel.rank,param4 == name_370.CTF,param4 == name_370.DOM,param17,param18,param19,param20,param21,param22,param23);
               _loc30_ = 0;
               while(_loc30_ < param16.length)
               {
                  _loc31_ = param16[_loc30_] as name_333;
                  this.var_1799[_loc31_.id] = _loc31_;
                  this.var_1792.name_1101(_loc31_.type == BattleTeamType.RED ? ViewTDM.name_2279 : ViewTDM.name_2280,_loc31_.id,_loc31_.name,_loc31_.rank,_loc31_.kills,_loc31_.suspicious);
                  _loc30_++;
               }
               if(param17 && !param22)
               {
                  this.var_1792.addEventListener(name_2263.name_2267,this.method_1971);
                  this.var_1792.addEventListener(name_2263.name_2268,this.method_1969);
                  this.var_1792.removeEventListener(name_2263.name_2267,this.method_1975);
                  this.var_1792.removeEventListener(name_2263.name_2268,this.method_1968);
               }
               else
               {
                  this.var_1792.addEventListener(name_2263.name_2267,this.method_1975);
                  this.var_1792.addEventListener(name_2263.name_2268,this.method_1968);
                  this.var_1792.removeEventListener(name_2263.name_2267,this.method_1971);
                  this.var_1792.removeEventListener(name_2263.name_2268,this.method_1969);
               }
               if(param25)
               {
                  this.var_1792.info.name_2277();
               }
            }
            else
            {
               this.var_1793.name_2274(param2,param24,param3,param7,param8,_loc26_,param9,param10,param11,false,_loc28_,param7 <= this.panelModel.rank && param8 >= this.panelModel.rank,param17,param18,param19,param20,param21,param22,param23);
               _loc30_ = 0;
               while(_loc30_ < param16.length)
               {
                  _loc31_ = param16[_loc30_] as name_333;
                  this.var_1799[_loc31_.id] = _loc31_;
                  this.var_1793.name_1101(_loc31_.id,_loc31_.name,_loc31_.rank,_loc31_.kills,_loc31_.suspicious);
                  _loc30_++;
               }
               if(param17 && !param22)
               {
                  this.var_1793.addEventListener(name_2263.name_2269,this.method_1976);
                  this.var_1793.removeEventListener(name_2263.name_2269,this.method_1972);
               }
               else
               {
                  this.var_1793.removeEventListener(name_2263.name_2269,this.method_1976);
                  this.var_1793.addEventListener(name_2263.name_2269,this.method_1972);
               }
               if(param25)
               {
                  this.var_1793.info.name_2277();
               }
            }
         }
      }
      
      public function onResourceLoadingComplete(param1:Resource) : void
      {
         var _loc2_:BitmapData = ImageResource(param1).data;
         if(param1.id == this.var_1805)
         {
            if(this.var_1793 != null && this.var_83.contains(this.var_1793))
            {
               this.var_1793.info.name_1550(_loc2_);
            }
            else if(this.var_1792 != null && this.var_83.contains(this.var_1792))
            {
               this.var_1792.info.name_1550(_loc2_);
            }
            this.var_1805 = null;
         }
         else if(param1.id == this.var_1806)
         {
            this.var_1806 = null;
         }
      }
      
      public function onResourceLoadingError(param1:Resource, param2:String) : void
      {
      }
      
      public function onResourceLoadingFatalError(param1:Resource, param2:String) : void
      {
      }
      
      public function onResourceLoadingStart(param1:Resource) : void
      {
      }
      
      public function name_425(param1:ClientObject, param2:name_333) : void
      {
         if(this.var_1799 == null)
         {
            this.var_1799 = new Dictionary();
         }
         this.var_1799[param2.id] = param2;
         if(this.var_1793 != null && this.var_83.contains(this.var_1793))
         {
            this.var_1793.name_1101(param2.id,param2.name,param2.rank,param2.kills);
         }
         else if(this.var_1792 != null && this.var_83.contains(this.var_1792))
         {
            this.var_1792.name_1101(param2.type == BattleTeamType.RED,param2.id,param2.name,param2.rank,param2.kills);
         }
      }
      
      public function name_415(param1:ClientObject, param2:String) : void
      {
         if(this.var_1793 != null && this.var_83.contains(this.var_1793))
         {
            this.var_1793.name_1108(param2);
         }
         else if(this.var_1792 != null && this.var_83.contains(this.var_1792))
         {
            this.var_1792.name_1108(param2);
         }
      }
      
      public function method_1995(param1:ClientObject, param2:int, param3:int) : void
      {
         if(this.clientObject != null && this.clientObject == param1)
         {
            if(this.var_1792 != null)
            {
               this.var_1792.updateScore(ViewTDM.name_2279,param2);
               this.var_1792.updateScore(ViewTDM.name_2280,param3);
            }
         }
      }
      
      public function method_1981(param1:String, param2:Number) : void
      {
         var _loc3_:name_336 = null;
         if(this.battles != null)
         {
            _loc3_ = this.battles[param1] as name_336;
            if(_loc3_ != null)
            {
               _loc3_.percentLeft = param2;
               if(this.var_1794 != null)
               {
                  this.var_1794.method_1981(param1,param2);
               }
            }
         }
      }
      
      public function name_463(param1:String, param2:Boolean) : void
      {
         var _loc3_:name_336 = null;
         if(this.battles != null)
         {
            _loc3_ = this.battles[param1] as name_336;
            if(_loc3_ != null)
            {
               _loc3_.suspicious = param2;
               if(this.var_1794 != null)
               {
                  this.var_1794.name_2290(param1,param2);
               }
            }
         }
      }
      
      public function name_445(param1:ClientObject, param2:String, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc7_:name_336 = null;
         if(this.battles != null)
         {
            _loc7_ = this.battles[param2] as name_336;
            if(_loc7_ != null)
            {
               _loc7_.name_384 = param3;
               _loc7_.name_389 = param4;
               _loc7_.friendsBlue = param6;
               _loc7_.friendsRed = param5;
               if(this.var_1794 != null)
               {
                  this.var_1794.name_2287(param2,param4,param6,param4 >= _loc7_.maxPeople);
                  this.var_1794.name_2288(param2,param3,param5,param3 >= _loc7_.maxPeople);
               }
            }
         }
      }
      
      public function name_416(param1:ClientObject, param2:String, param3:int, param4:int) : void
      {
         var _loc5_:name_336 = null;
         if(this.battles != null)
         {
            _loc5_ = this.battles[param2] as name_336;
            if(_loc5_ != null)
            {
               _loc5_.countPeople = param3;
               _loc5_.friendsDm = param4;
               if(this.var_1794 != null)
               {
                  this.var_1794.name_2289(param2,param3,param3 >= _loc5_.maxPeople,param4);
               }
            }
         }
      }
      
      public function method_1987(param1:ClientObject) : void
      {
         if(this.clientObject != null && this.clientObject == param1)
         {
            if(this.var_1793 != null && this.var_83.contains(this.var_1793))
            {
               this.var_1793.info.name_2276();
               this.var_1793.name_2278();
            }
            else if(this.var_1792 != null && this.var_83.contains(this.var_1792))
            {
               this.var_1792.info.name_2276();
               this.var_1792.name_2278();
            }
         }
      }
      
      public function method_1989(param1:ClientObject, param2:Long, param3:int) : void
      {
         var _loc4_:name_333 = null;
         var _loc5_:name_50 = null;
         if(this.clientObject != null && this.clientObject == param1)
         {
            _loc4_ = this.var_1799[param2] as name_333;
            if(_loc4_ != null)
            {
               _loc4_.kills = param3;
               if(this.var_1793 != null && this.var_83.contains(this.var_1793))
               {
                  this.var_1793.name_1101(param2,_loc4_.name,_loc4_.rank,param3);
               }
               else if(this.var_1792 != null && this.var_83.contains(this.var_1792))
               {
                  this.var_1792.name_1101(_loc4_.type == BattleTeamType.RED,param2,_loc4_.name,_loc4_.rank,param3);
               }
            }
            else
            {
               _loc5_ = Main.osgi.name_6(name_50) as name_50;
               _loc5_.log(LogLevel.name_79,"[BattleSelectModel]:currentBattleUserKillsUpdate  ERROR: userInfo = null! (userId: " + param2 + ")");
            }
         }
      }
      
      public function method_1990(param1:ClientObject) : void
      {
         if(this.clientObject != null && this.clientObject == param1)
         {
            if(this.var_83.contains(this.var_1793))
            {
               this.var_1793.info.name_2282();
            }
            else if(this.var_83.contains(this.var_1792))
            {
               this.var_1792.info.name_2282();
            }
         }
      }
      
      public function method_1992(param1:ClientObject, param2:Long) : void
      {
         if(this.clientObject != null && this.clientObject == param1)
         {
            this.var_1794.name_1879(param2);
         }
      }
      
      public function method_1993(param1:ClientObject) : void
      {
         var _loc2_:name_42 = Main.osgi.name_6(name_42) as name_42;
         _loc2_.showAlert(name_102(Main.osgi.name_6(name_102)).getText(TextConst.BATTLE_CREATE_PANEL_FLOOD_ALERT_TEXT),Vector.<String>([name_102(Main.osgi.name_6(name_102)).getText(name_390.const_1030)]));
      }
      
      private function method_1974() : String
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         var _loc3_:Array = null;
         if(this.var_1796 != null)
         {
            _loc2_ = String(this.var_1796.getValue());
            if(_loc2_.indexOf("battle/") != -1)
            {
               _loc3_ = _loc2_.split("/");
               if(_loc3_[2] != null)
               {
                  _loc1_ = _loc3_[2] as String;
               }
            }
         }
         return _loc1_;
      }
      
      private function method_3(param1:SWFAddressEvent) : void
      {
         var _loc3_:int = 0;
         var _loc2_:String = this.method_1974();
         if(_loc2_ != null)
         {
            _loc3_ = 0;
            while(_loc3_ < this.var_1797.length)
            {
               if((this.var_1797[_loc3_] as name_336).battleId == _loc2_ && _loc2_ != this.var_1794.name_2266)
               {
                  Main.method_8("BATTLE SELECT","   select: %1",_loc2_);
                  this.var_1794.name_1879(_loc2_);
               }
               _loc3_++;
            }
         }
      }
      
      public function method_1984() : void
      {
         if(!this.var_83.contains(this.var_1794))
         {
            this.var_83.addChild(this.var_1794);
            this.var_1794.addEventListener(name_2263.name_2281,this.method_1973);
            this.var_1794.addEventListener(name_2263.name_2275,this.method_1970);
         }
      }
      
      public function method_1985() : void
      {
         if(this.var_1794 != null)
         {
            if(this.var_83.contains(this.var_1794))
            {
               this.var_83.removeChild(this.var_1794);
               this.var_1794.removeEventListener(name_2263.name_2281,this.method_1973);
               this.var_1794.removeEventListener(name_2263.name_2275,this.method_1970);
            }
         }
      }
      
      private function method_1980() : void
      {
         this.var_1800.addEventListener(CreateBattleEvent.CREATE_BATTLE,this.method_1977);
         this.var_1800.name_2285();
      }
      
      private function method_1982() : void
      {
         this.var_1800.removeEventListener(CreateBattleEvent.CREATE_BATTLE,this.method_1977);
         this.var_1800.name_2286();
      }
      
      private function method_1978(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.var_83.contains(this.var_1793))
            {
               this.var_83.removeChild(this.var_1793);
            }
            if(!this.var_83.contains(this.var_1792))
            {
               this.var_83.addChild(this.var_1792);
            }
         }
         else
         {
            if(this.var_83.contains(this.var_1792))
            {
               this.var_83.removeChild(this.var_1792);
            }
            if(!this.var_83.contains(this.var_1793))
            {
               this.var_83.addChild(this.var_1793);
            }
         }
      }
      
      private function method_1967() : void
      {
         if(this.var_1793 != null)
         {
            if(this.var_83.contains(this.var_1793))
            {
               this.var_83.removeChild(this.var_1793);
            }
         }
         if(this.var_1792 != null)
         {
            if(this.var_83.contains(this.var_1792))
            {
               this.var_83.removeChild(this.var_1792);
            }
         }
      }
      
      private function method_1988(param1:Event) : void
      {
      }
      
      private function method_1973(param1:name_2263) : void
      {
         this.method_1967();
         this.method_1980();
         if(this.var_1797.length > 2147483647)
         {
            this.var_1794.createButton.enable = false;
         }
      }
      
      private function method_1977(param1:CreateBattleEvent) : void
      {
         var _loc2_:name_2283 = param1.name_2284;
         var _loc3_:Object = new Object();
         _loc3_.battleMode = _loc2_.battleMode.name;
         _loc3_.mapId = _loc2_.mapId;
         _loc3_.time = _loc2_.limits.timeLimitInSec;
         _loc3_.scoreLimit = _loc2_.limits.scoreLimit;
         _loc3_.numPlayers = _loc2_.maxPeopleCount;
         _loc3_.minRang = _loc2_.rankRange.min;
         _loc3_.maxRang = _loc2_.rankRange.max;
         _loc3_.proBattle = _loc2_.proBattle;
         _loc3_.privateBattle = _loc2_.privateBattle;
         _loc3_.withoutSupplies = _loc2_.withoutSupplies;
         _loc3_.withoutBonuses = _loc2_.withoutBonuses;
         _loc3_.goldBoxesEnabled = _loc2_.goldBoxesEnabled;
         _loc3_.autoBalance = _loc2_.autoBalance;
         _loc3_.friendlyFire = _loc2_.friendlyFire;
         _loc3_.reArmorEnabled = _loc2_.reArmorEnabled;
         _loc3_.equipmentConstraintsMode = _loc2_.equipmentConstraintsMode;
         _loc3_.parkourMode = _loc2_.parkourMode;
         _loc3_.clanBattle = _loc2_.clanBattle;
         Network(Main.osgi.name_6(name_2)).send("lobby;create_battle;" + JSON.stringify(_loc3_));
      }
      
      private function method_1970(param1:name_2263) : void
      {
         this.method_1965(this.clientObject,this.var_1794.name_2266 as String);
         var _loc2_:name_336 = this.battles[this.var_1794.name_2266 as String] as name_336;
         if(_loc2_.minRank > this.panelModel.rank || _loc2_.maxRank < this.panelModel.rank)
         {
            this.var_1802.targetPoint = new Point(Main.stage.mouseX,Main.stage.mouseY);
         }
      }
      
      private function method_1965(param1:ClientObject, param2:String) : void
      {
         Network(Main.osgi.name_6(name_2)).send("lobby;get_show_battle_info;" + param2);
      }
      
      private function method_1976(param1:name_2263) : void
      {
         var e:name_2263 = param1;
         this.panelModel.blur();
         if(this.panelModel.crystal < 5)
         {
            this.var_1795 = new Alert(-1);
            this.var_1795.showAlert(this.localeService.getText(TextConst.GARAGE_CONFIRM_ALERT_NOT_ENOUGH_CRYSTALS),["OK"]);
            this.dialogsLayer.addChild(this.var_1795);
            this.var_1795.addEventListener(name_1011.ALERT_BUTTON_PRESSED,function(param1:Event):void
            {
               panelModel.unblur();
            });
            return;
         }
         this.var_1795 = new Alert();
         this.var_1795.showAlert(this.localeService.getText(TextConst.const_158),[this.localeService.getText(TextConst.BATTLEINFO_PANEL_PAID_BATTLES_ALERT_ANSWER_ENTER),this.localeService.getText(TextConst.BATTLEINFO_PANEL_PAID_BATTLES_ALERT_ANSWER_DONT_ENTER)]);
         this.dialogsLayer.addChild(this.var_1795);
         this.var_1795.addEventListener(name_1011.ALERT_BUTTON_PRESSED,this.method_1986);
      }
      
      private function method_1969(param1:name_2263) : void
      {
         var e:name_2263 = param1;
         this.panelModel.blur();
         if(this.panelModel.crystal < 5)
         {
            this.var_1795 = new Alert(-1);
            this.var_1795.showAlert(this.localeService.getText(TextConst.GARAGE_CONFIRM_ALERT_NOT_ENOUGH_CRYSTALS),["OK"]);
            this.dialogsLayer.addChild(this.var_1795);
            this.var_1795.addEventListener(name_1011.ALERT_BUTTON_PRESSED,function(param1:Event):void
            {
               panelModel.unblur();
            });
            return;
         }
         this.var_1795 = new Alert();
         this.var_1795.showAlert(this.localeService.getText(TextConst.const_158),[this.localeService.getText(TextConst.BATTLEINFO_PANEL_PAID_BATTLES_ALERT_ANSWER_ENTER),this.localeService.getText(TextConst.BATTLEINFO_PANEL_PAID_BATTLES_ALERT_ANSWER_DONT_ENTER)]);
         this.dialogsLayer.addChild(this.var_1795);
         this.var_1795.addEventListener(name_1011.ALERT_BUTTON_PRESSED,this.method_1983);
      }
      
      private function method_1971(param1:name_2263) : void
      {
         var e:name_2263 = param1;
         this.panelModel.blur();
         if(this.panelModel.crystal < 5)
         {
            this.var_1795 = new Alert(-1);
            this.var_1795.showAlert(this.localeService.getText(TextConst.GARAGE_CONFIRM_ALERT_NOT_ENOUGH_CRYSTALS),["OK"]);
            this.dialogsLayer.addChild(this.var_1795);
            this.var_1795.addEventListener(name_1011.ALERT_BUTTON_PRESSED,function(param1:Event):void
            {
               panelModel.unblur();
            });
            return;
         }
         this.var_1795 = new Alert();
         this.var_1795.showAlert(this.localeService.getText(TextConst.const_158),[this.localeService.getText(TextConst.BATTLEINFO_PANEL_PAID_BATTLES_ALERT_ANSWER_ENTER),this.localeService.getText(TextConst.BATTLEINFO_PANEL_PAID_BATTLES_ALERT_ANSWER_DONT_ENTER)]);
         this.dialogsLayer.addChild(this.var_1795);
         this.var_1795.addEventListener(name_1011.ALERT_BUTTON_PRESSED,this.method_1979);
      }
      
      private function method_1986(param1:name_1011) : void
      {
         this.panelModel.unblur();
         if(param1.name_982 == this.localeService.getText(TextConst.BATTLEINFO_PANEL_PAID_BATTLES_ALERT_ANSWER_ENTER))
         {
            this.var_1798 = false;
            this.method_1964(this.clientObject,false,false);
         }
      }
      
      private function method_1983(param1:name_1011) : void
      {
         this.panelModel.unblur();
         if(param1.name_982 == this.localeService.getText(TextConst.BATTLEINFO_PANEL_PAID_BATTLES_ALERT_ANSWER_ENTER))
         {
            this.var_1798 = false;
            this.method_1964(this.clientObject,true,true);
         }
      }
      
      private function method_1979(param1:name_1011) : void
      {
         this.panelModel.unblur();
         if(param1.name_982 == this.localeService.getText(TextConst.BATTLEINFO_PANEL_PAID_BATTLES_ALERT_ANSWER_ENTER))
         {
            this.var_1798 = false;
            this.method_1964(this.clientObject,true,false);
         }
      }
      
      private function method_1972(param1:name_2263) : void
      {
         this.var_1798 = false;
         this.method_1964(this.clientObject,false,false);
      }
      
      private function method_1964(param1:ClientObject, param2:Boolean, param3:Boolean) : void
      {
         var alertService:name_42 = null;
         var localeService:name_102 = null;
         var cl:ClientObject = param1;
         var team:Boolean = param2;
         var red:Boolean = param3;
         alertService = Main.osgi.name_6(name_42) as name_42;
         localeService = Main.osgi.name_6(name_102) as name_102;
         var b:name_336 = this.battles[this.selectedBattleId] as name_336;
         if(b == null)
         {
            return;
         }
         if(b.formatBattle && (b.name.indexOf("Паркур") > -1 || b.name.indexOf("Parkour") > -1))
         {
            alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,function showParkourAlert(param1:AlertServiceEvent):void
            {
               alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,showParkourAlert);
               if(param1.name_982 == localeService.getText(name_390.const_584))
               {
                  method_1966(team,red);
               }
            });
            alertService.showAlert(localeService.getText(name_390.const_1350),Vector.<String>([localeService.getText(name_390.const_584),localeService.getText(name_390.const_1351)]));
         }
         else
         {
            this.method_1966(team,red);
         }
      }
      
      private function method_1966(param1:Boolean, param2:Boolean) : void
      {
         Network(Main.osgi.name_6(name_2)).send("lobby;" + (!param1 ? "enter_battle;" : "enter_battle_team;") + this.selectedBattleId + ";" + param2);
      }
      
      public function name_489() : void
      {
         var _loc1_:BattleController = null;
         this.objectUnloaded(null);
         PanelModel(Main.osgi.name_6(name_115)).startBattle(null);
         ChatModel(Main.osgi.name_6(name_400)).objectUnloaded(null);
         if(BattleController(Main.osgi.name_6(IBattleController)) == null)
         {
            _loc1_ = new BattleController();
            Main.osgi.name_1(IBattleController,_loc1_);
         }
         Network(Main.osgi.name_6(name_2)).addEventListener(Main.osgi.name_6(IBattleController) as BattleController);
      }
      
      private function method_1968(param1:name_2263) : void
      {
         this.var_1798 = false;
         this.method_1964(this.clientObject,true,true);
      }
      
      private function method_1975(param1:name_2263) : void
      {
         this.var_1798 = false;
         this.method_1964(this.clientObject,true,false);
      }
      
      public function dump(param1:Vector.<String>) : String
      {
         var _loc4_:name_336 = null;
         var _loc2_:String = "\n";
         var _loc3_:int = 0;
         while(_loc3_ < this.var_1797.length)
         {
            _loc4_ = this.var_1797[_loc3_] as name_336;
            _loc2_ += "   battle id: " + _loc4_.battleId + "   battle name: " + _loc4_.name + "   map id: " + _loc4_.mapId + "\n";
            _loc3_++;
         }
         return _loc2_ + "\n";
      }
      
      public function get dumperName() : String
      {
         return "battle";
      }
      
      private function method_1081(param1:Event = null) : void
      {
         var _loc2_:int = int(Math.max(1000,Main.stage.stageWidth));
         var _loc3_:int = int(Math.max(600,Main.stage.stageHeight));
         this.var_1801.targetPoint = new Point(Math.round(_loc2_ * (2 / 3)) - 47,_loc3_ - 34);
      }
      
      public function method_1998(param1:ClientObject) : void
      {
         var _loc2_:Alert = new Alert();
         _loc2_.showAlert(this.localeService.getText(TextConst.SERVER_IS_RESTARTING_CREATE_BATTLE_TEXT),[name_358.OK]);
         this.dialogsLayer.addChild(_loc2_);
      }
      
      public function name_412() : void
      {
         var _loc1_:name_42 = Main.osgi.name_6(name_42) as name_42;
         var _loc2_:name_102 = Main.osgi.name_6(name_102) as name_102;
         _loc1_.showAlert(_loc2_.getText(name_390.const_1309),Vector.<String>([_loc2_.getText(name_390.const_1168)]));
      }
      
      public function method_1999() : void
      {
         var _loc1_:BattleController = null;
         this.objectUnloaded(null);
         PanelModel(Main.osgi.name_6(name_115)).startBattle(null);
         ChatModel(Main.osgi.name_6(name_400)).objectUnloaded(null);
         if(BattleController(Main.osgi.name_6(IBattleController)) == null)
         {
            _loc1_ = new BattleController();
            Main.osgi.name_1(IBattleController,_loc1_);
         }
         Network(Main.osgi.name_6(name_2)).send("lobby;enter_battle_spectator;" + this.selectedBattleId);
         Network(Main.osgi.name_6(name_2)).addEventListener(Main.osgi.name_6(IBattleController) as BattleController);
      }
   }
}
