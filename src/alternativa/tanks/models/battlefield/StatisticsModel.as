package alternativa.tanks.models.battlefield
{
   import alternativa.model.class_11;
   import alternativa.model.IModel;
   import alternativa.tanks.loader.name_13;
   import alternativa.tanks.models.battlefield.gui.chat.BattleChat;
   import alternativa.tanks.models.battlefield.gui.chat.ChatModel;
   import alternativa.tanks.models.battlefield.gui.name_1102;
   import alternativa.tanks.models.battlefield.gui.IBattlefieldGUI;
   import alternativa.tanks.models.battlefield.logic.class_23;
   import alternativa.tanks.models.dom.DOMModel;
   import alternativa.tanks.models.dom.IDOMModel;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.ITank;
   import alternativa.tanks.service.settings.IBattleSettings;
   import controls.lifeindicator.name_1121;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import package_1.Main;
   import package_254.name_791;
   import package_284.name_994;
   import package_291.class_33;
   import package_291.class_34;
   import package_291.name_1099;
   import package_291.name_1124;
   import package_292.KeyPointsHUDPanel;
   import package_293.WinkManager;
   import package_293.name_1105;
   import package_294.name_1100;
   import package_295.name_1104;
   import package_296.name_1103;
   import package_31.PanelModel;
   import package_31.class_1;
   import package_31.name_115;
   import package_35.class_5;
   import package_35.name_98;
   import package_4.ClientObject;
   import package_47.BattleTeamType;
   import package_54.name_102;
   import package_60.TextConst;
   import package_67.DamageType;
   import package_7.name_32;
   import package_79.CTFModel;
   import package_85.ControlsHelper;
   import package_87.TableStatistics;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class StatisticsModel extends class_34 implements class_33, class_11, class_5, IBattlefieldGUI, name_193, class_9, class_1, class_23
   {
      
      public static const const_125:String = "STAT";
      
      public static const const_124:String = "[StatisticsModel]";
       
      
      private var var_425:ClientObject;
      
      private var contentLayer:DisplayObjectContainer;
      
      private var modelService:name_32;
      
      private var var_431:Boolean;
      
      private var var_415:TableStatistics;
      
      private var var_416:name_1105;
      
      private var var_424:KeyPointsHUDPanel;
      
      private var var_419:name_1103;
      
      private var var_417:Vector.<name_1099>;
      
      private var var_420:Boolean = false;
      
      private var var_168:name_13;
      
      private var var_426:name_1104;
      
      private var controlsHelper:ControlsHelper;
      
      private var var_429:String;
      
      private var var_423:Vector.<class_4>;
      
      private var var_428:SpectatorScreenLayouts;
      
      private var var_427:Boolean = false;
      
      private var battleName:String;
      
      private var var_432:String;
      
      private var var_433:String;
      
      private var var_422:name_1121;
      
      private var var_418:name_1102;
      
      private var paused:Boolean;
      
      private var var_421:BattlefieldModel;
      
      private var var_430:String;
      
      private var var_435:String;
      
      private var var_434:String;
      
      public function StatisticsModel()
      {
         this.var_423 = new Vector.<class_4>();
         super();
         _interfaces.push(IModel,class_33,class_11,class_5,IBattlefieldGUI,name_193,class_9,class_1);
         this.contentLayer = Main.contentUILayer;
         this.var_426 = new name_1104();
         WinkManager.init(500);
         Main.osgi.registerService(IBattlefieldGUI,this);
         this.var_429 = PanelModel(Main.osgi.getService(name_115)).userName;
      }
      
      public function method_504(param1:int, param2:int) : void
      {
         if(this.var_421 != null)
         {
            this.var_421.messages.update(param2);
         }
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         this.paused = false;
         this.var_168 = Main.osgi.getService(name_13) as name_13;
         this.var_168.hide();
         Main.stage.addEventListener(Event.RESIZE,this.onResize);
         var _loc2_:name_98 = name_98(Main.osgi.getService(name_98));
         _loc2_.name_177(this);
         var _loc3_:name_102 = name_102(Main.osgi.getService(name_102));
         this.var_418 = new name_1102(_loc3_.getText(TextConst.name_1123),_loc3_.getText(TextConst.name_1112),_loc3_.getText(TextConst.name_1111));
         this.var_421 = BattlefieldModel(Main.osgi.getService(IBattleField));
         this.var_430 = _loc3_.getText(TextConst.name_1126);
         this.var_435 = _loc3_.getText(TextConst.name_1116);
         this.var_434 = _loc3_.getText(TextConst.name_1117);
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         this.name_173(false);
         this.var_418 = null;
         if(this.var_428 != null)
         {
            this.var_428.close();
            this.var_428 = null;
         }
         var _loc2_:name_98 = name_98(Main.osgi.getService(name_98));
         _loc2_.name_1119(this);
         Main.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         Main.stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         Main.stage.removeEventListener(Event.RESIZE,this.onResize);
         this.var_415.removeEventListener(name_1100.name_1109,this.method_643);
         if(this.contentLayer.contains(this.var_415))
         {
            this.var_415.hide();
            this.contentLayer.removeChild(this.var_415);
         }
         this.removeDisplayObject(this.contentLayer,this.var_416);
         this.removeDisplayObject(this.contentLayer,this.var_424);
         this.removeDisplayObject(this.contentLayer,this.var_419);
         this.removeDisplayObject(this.contentLayer,this.var_426);
         this.removeDisplayObject(this.contentLayer,this.var_422);
         this.var_422 = null;
         this.method_644();
         this.var_425 = null;
         this.var_417 = null;
         this.var_419 = null;
      }
      
      public function deactivate() : void
      {
         if(this.var_425 == null)
         {
            return;
         }
         if(!this.var_420)
         {
            this.var_415.hide();
         }
         if(!this.var_421.spectatorMode)
         {
            TankModel(Main.osgi.getService(ITank)).pause();
         }
      }
      
      public function activate() : void
      {
         if(this.var_425 == null)
         {
            return;
         }
         if(!this.var_421.spectatorMode)
         {
            TankModel(Main.osgi.getService(ITank)).resume();
         }
      }
      
      public function method_30(param1:Object) : void
      {
      }
      
      public function method_29(param1:Object) : void
      {
      }
      
      public function initObject(param1:ClientObject, param2:String) : void
      {
         this.battleName = param2;
         var _loc3_:name_102 = name_102(Main.osgi.getService(name_102));
         this.var_432 = _loc3_.getText(TextConst.BATTLE_PLAYER_JOINED);
         this.var_433 = _loc3_.getText(TextConst.BATTLE_PLAYER_LEFT);
         this.var_423.push(TankModel(Main.osgi.getService(ITank)));
      }
      
      public function init(param1:ClientObject, param2:name_1124, param3:Array) : void
      {
         var _loc4_:name_370 = null;
         var _loc6_:name_1099 = null;
         var _loc7_:CTFModel = null;
         var _loc8_:DOMModel = null;
         this.var_425 = param1;
         this.var_431 = param2.var_431;
         this.var_417 = Vector.<name_1099>(param3);
         this.var_420 = false;
         this.var_415 = new TableStatistics(this.battleName,this.var_431);
         this.contentLayer.addChild(this.var_415);
         if(this.var_431)
         {
            _loc7_ = CTFModel(Main.osgi.getService(name_994));
            _loc8_ = DOMModel(Main.osgi.getService(IDOMModel));
            _loc4_ = _loc7_ != null ? name_370.CTF : (_loc8_ != null ? name_370.DOM : name_370.TDM);
         }
         else
         {
            _loc4_ = name_370.DM;
         }
         this.var_416 = new name_1105(this.var_429,param2,this.var_417,_loc4_);
         this.contentLayer.addChild(this.var_416);
         this.var_416.name_1125();
         this.var_419 = new name_1103();
         this.contentLayer.addChild(this.var_419);
         this.method_647();
         var _loc5_:IBattleSettings = IBattleSettings(Main.osgi.getService(IBattleSettings));
         if(_loc5_.showFPS)
         {
            this.contentLayer.addChild(this.var_426);
         }
         Main.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         Main.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         this.var_415.addEventListener(name_1100.name_1109,this.method_643);
         for each(_loc6_ in this.var_417)
         {
            this.method_641(_loc6_);
            TankModel(Main.osgi.getService(ITank)).setUserSuspiciousness(_loc6_.userId,_loc6_.suspicious);
         }
         this.objectLoaded(param1);
         if(this.var_421.spectatorMode)
         {
            this.method_649();
         }
         this.var_421.name_165().name_212(this);
      }
      
      private function method_649() : void
      {
         var _loc1_:BattleChat = ChatModel(Main.osgi.getService(IChatBattle)).getChat();
         this.var_428 = new SpectatorScreenLayouts(_loc1_,this.var_419,this.var_421.messages,this.var_416,this.var_426);
      }
      
      public function method_630(param1:KeyPointsHUDPanel) : void
      {
         this.var_424 = param1;
         this.contentLayer.addChild(this.var_424);
      }
      
      public function method_629() : void
      {
         this.var_424.x = this.var_416.name_1127() - this.var_424.width - 10;
         this.var_424.y = this.var_416.name_1113();
         this.var_424.update();
      }
      
      public function method_650(param1:ClientObject) : void
      {
      }
      
      public function changeUserTeam(param1:ClientObject, param2:String, param3:BattleTeamType) : void
      {
         var _loc4_:name_1099 = this.method_640(param2);
         if(_loc4_ != null)
         {
            this.var_415.name_1108(param2,_loc4_.teamType);
            _loc4_.teamType = param3;
            this.var_415.name_1101(_loc4_);
         }
      }
      
      public function userConnect(param1:ClientObject, param2:String, param3:BattleTeamType, param4:String, param5:int) : void
      {
         var _loc6_:name_1099 = new name_1099(0,0,param4,param5,0,0,param3,param4,false,0,0,0);
         this.var_417.push(_loc6_);
         this.var_419.addMessage(_loc6_,this.var_432);
         this.var_415.name_1101(_loc6_);
         this.method_641(_loc6_);
      }
      
      public function userDisconnect(param1:ClientObject, param2:String) : void
      {
         var _loc3_:int = this.method_648(param2);
         if(_loc3_ < 0)
         {
            return;
         }
         var _loc4_:name_1099 = this.var_417[_loc3_];
         if(!this.var_420)
         {
            this.var_415.name_1108(param2,_loc4_.teamType);
         }
         this.var_419.addMessage(_loc4_,this.var_433);
         this.var_417.splice(_loc3_,1);
      }
      
      public function fundChange(param1:ClientObject, param2:int) : void
      {
         if(this.var_416 == null)
         {
            return;
         }
         this.var_416.name_1122(param2);
      }
      
      public function finish(param1:ClientObject, param2:Array, param3:int) : void
      {
         if(this.var_415 != null)
         {
            this.var_415.hide();
            this.var_415.show(this.var_429,Vector.<name_1099>(param2),true,param3);
         }
         this.var_420 = true;
         if(this.var_416 != null)
         {
            this.var_416.finish();
         }
      }
      
      public function restart(param1:ClientObject, param2:int) : void
      {
         var _loc5_:name_1099 = null;
         this.var_415.hide();
         this.var_416.timeLimit = param2;
         this.var_416.name_1118();
         this.var_420 = false;
         var _loc3_:int = int(this.var_417.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = this.var_417[_loc4_];
            _loc5_.deaths = 0;
            _loc5_.kills = 0;
            _loc5_.score = 0;
            _loc4_++;
         }
      }
      
      public function changeTeamScore(param1:ClientObject, param2:BattleTeamType, param3:int) : void
      {
         if(this.var_425 == null)
         {
            return;
         }
         this.var_416.name_1120(param2,param3);
      }
      
      public function changeUsersStat(param1:ClientObject, param2:Array) : void
      {
         var _loc5_:name_1099 = null;
         var _loc6_:name_1099 = null;
         if(param2 == null)
         {
            return;
         }
         var _loc3_:int = int(param2.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param2[_loc4_];
            _loc6_ = this.method_640(_loc5_.userId);
            if(_loc6_ != null)
            {
               _loc6_.score = _loc5_.score;
               _loc6_.kills = _loc5_.kills;
               _loc6_.deaths = _loc5_.deaths;
               _loc6_.rank = _loc5_.rank;
               _loc6_.suspicious = _loc5_.suspicious;
               if(!this.var_420)
               {
                  this.var_415.name_1101(_loc6_);
               }
               this.var_416.name_1110(_loc5_);
               this.method_641(_loc5_);
            }
            _loc4_++;
         }
      }
      
      public function logUserAction(param1:String, param2:String, param3:String = null) : void
      {
         var _loc6_:uint = 0;
         var _loc4_:name_1099 = this.method_640(param1);
         var _loc5_:name_1099 = param3 == null ? null : this.method_640(param3);
         if(param2.indexOf("золотой ящик") != -1 || param2.indexOf("gold box") != -1)
         {
            _loc6_ = 16753920;
            this.var_421.messages.addMessage(_loc6_,param1 + " " + this.var_430);
            this.var_419.addMessage(_loc4_,this.var_430);
         }
         else
         {
            this.var_419.addMessage(_loc4_,param2,_loc5_);
         }
      }
      
      public function name_223(param1:String, param2:DamageType, param3:String = null) : void
      {
         var _loc4_:name_1099 = this.method_640(param1);
         var _loc5_:name_1099 = param3 == null ? null : this.method_640(param3);
         this.var_419.name_1115(_loc4_,param2,_loc5_);
      }
      
      public function method_634(param1:String, param2:String = null) : void
      {
         var _loc3_:name_1099 = param2 == null ? null : this.method_640(param2);
         this.var_419.addMessage(null,param1,_loc3_);
      }
      
      public function method_633(param1:BattleTeamType) : void
      {
         if(this.var_416 != null)
         {
            this.var_416.method_633(param1);
         }
      }
      
      public function method_628(param1:BattleTeamType) : void
      {
         if(this.var_416 != null)
         {
            this.var_416.method_628(param1);
         }
      }
      
      public function method_635(param1:BattleTeamType) : void
      {
         if(this.var_416 != null)
         {
            this.var_416.method_635(param1);
         }
      }
      
      public function method_632(param1:Number) : void
      {
         if(this.var_422 != null)
         {
            this.var_422.name_1114 = param1;
         }
      }
      
      public function method_631(param1:Number) : void
      {
         if(this.var_422 != null)
         {
            this.var_422.charge = param1;
         }
      }
      
      public function name_173(param1:Boolean) : void
      {
         if(this.paused == param1)
         {
            return;
         }
         this.paused = param1;
         this.method_646(param1);
      }
      
      public function name_244(param1:int) : void
      {
         if(this.var_418 != null)
         {
            this.var_418.name_978 = param1;
         }
      }
      
      public function method_637(param1:String) : String
      {
         var _loc2_:name_1099 = this.method_640(param1);
         return _loc2_ == null ? "Unknown " + param1.toString() : _loc2_.name;
      }
      
      public function method_638(param1:String) : int
      {
         var _loc2_:name_1099 = this.method_640(param1);
         return _loc2_ == null ? -1 : _loc2_.rank;
      }
      
      public function method_636(param1:class_4) : void
      {
         var _loc2_:int = this.var_423.indexOf(param1);
         if(_loc2_ > -1)
         {
            return;
         }
         this.var_423.push(param1);
      }
      
      public function method_639(param1:class_4) : void
      {
         var _loc2_:int = this.var_423.indexOf(param1);
         if(_loc2_ < 0)
         {
            return;
         }
         this.var_423.splice(_loc2_,1);
      }
      
      public function chatOpened() : void
      {
         this.method_642();
         this.var_427 = true;
      }
      
      public function chatClosed() : void
      {
         this.var_427 = false;
      }
      
      public function method_22() : void
      {
      }
      
      public function method_25() : void
      {
      }
      
      public function method_26() : void
      {
      }
      
      public function method_27() : void
      {
      }
      
      public function method_21() : void
      {
         if(this.var_425 == null)
         {
            return;
         }
         var _loc1_:IBattleSettings = IBattleSettings(Main.osgi.getService(IBattleSettings));
         if(_loc1_.showFPS)
         {
            this.contentLayer.addChild(this.var_426);
         }
         else
         {
            this.removeDisplayObject(this.contentLayer,this.var_426);
         }
      }
      
      public function method_24() : void
      {
      }
      
      public function method_20() : void
      {
      }
      
      public function method_23(param1:Boolean) : void
      {
      }
      
      private function method_643(param1:name_1100) : void
      {
         var _loc2_:PanelModel = Main.osgi.getService(name_115) as PanelModel;
         _loc2_.showExitFromBattleAlert();
      }
      
      private function exit(param1:ClientObject) : void
      {
         Network(Main.osgi.getService(name_2)).send("battle;exit_from_statistic");
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.TAB && !this.var_420 && !this.var_427)
         {
            this.method_645();
         }
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.TAB && !this.var_420 && !this.var_427)
         {
            this.method_642();
         }
      }
      
      private function method_645() : void
      {
         if(this.var_420)
         {
            return;
         }
         this.var_415.show(this.var_429,this.var_417,false,0);
      }
      
      private function method_642() : void
      {
         if(this.var_420 && this.var_415 == null)
         {
            return;
         }
         if(this.var_420)
         {
            return;
         }
         if(this.var_415 != null)
         {
            this.var_415.hide();
         }
      }
      
      private function method_648(param1:String) : int
      {
         var _loc2_:int = 0;
         if(this.var_417 != null)
         {
            _loc2_ = this.var_417.length - 1;
            while(_loc2_ >= 0)
            {
               if(name_1099(this.var_417[_loc2_]).userId == param1)
               {
                  return _loc2_;
               }
               _loc2_--;
            }
         }
         return -1;
      }
      
      private function method_640(param1:String) : name_1099
      {
         var _loc2_:int = 0;
         var _loc3_:name_1099 = null;
         if(this.var_417 != null)
         {
            _loc2_ = this.var_417.length - 1;
            while(_loc2_ >= 0)
            {
               _loc3_ = this.var_417[_loc2_];
               if(_loc3_.userId == param1)
               {
                  return _loc3_;
               }
               _loc2_--;
            }
         }
         return null;
      }
      
      private function method_647() : void
      {
         if(this.controlsHelper == null)
         {
            this.controlsHelper = new ControlsHelper();
         }
         var _loc1_:name_791 = Main.osgi.getService(name_791) as name_791;
         _loc1_.name_981(ControlsHelper.name_1106,ControlsHelper.name_1107,this.controlsHelper,true);
      }
      
      private function method_644() : void
      {
         var _loc1_:name_791 = Main.osgi.getService(name_791) as name_791;
         _loc1_.name_987(ControlsHelper.name_1106,ControlsHelper.name_1107);
      }
      
      private function method_641(param1:name_1099) : void
      {
         var _loc2_:int = this.var_423.length - 1;
         while(_loc2_ >= 0)
         {
            class_4(this.var_423[_loc2_]).userStatChanged(param1.userId,param1.name,param1.rank);
            _loc2_--;
         }
      }
      
      private function removeDisplayObject(param1:DisplayObjectContainer, param2:DisplayObject) : void
      {
         if(param2 != null && param1.contains(param2))
         {
            param1.removeChild(param2);
         }
      }
      
      private function onResize(param1:Event) : void
      {
         var _loc2_:int = Main.stage.stageWidth;
         var _loc3_:int = Main.stage.stageHeight;
         if(this.var_422 != null)
         {
            this.var_422.x = 260;
            this.var_422.y = Main.stage.stageHeight - 50;
         }
         if(this.var_418 != null && this.var_418.parent != null)
         {
            this.var_418.x = _loc2_ - this.var_418.width >> 1;
            this.var_418.y = _loc3_ - this.var_418.height >> 1;
         }
      }
      
      private function method_646(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.var_418 != null)
            {
               Main.stage.addChild(this.var_418);
               this.onResize(null);
            }
         }
         else if(this.var_418 != null && this.var_418.parent != null)
         {
            this.var_418.parent.removeChild(this.var_418);
         }
      }
   }
}
