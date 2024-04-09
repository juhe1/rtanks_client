package package_31
{
   import alternativa.model.class_11;
   import alternativa.model.IModel;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.config.TanksMap;
   import alternativa.tanks.gui.NewReferalWindow;
   import alternativa.tanks.gui.name_991;
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.gui.settings.name_997;
   import alternativa.tanks.loader.name_13;
   import alternativa.tanks.model.BattleSelectModel;
   import alternativa.tanks.model.GarageModel;
   import alternativa.tanks.model.friends.invite.BattleInviteModel;
   import alternativa.tanks.model.friends.invite.name_1027;
   import alternativa.tanks.model.name_381;
   import alternativa.tanks.model.shop.ShopModel;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.StatisticsModel;
   import alternativa.tanks.models.battlefield.gui.chat.ChatModel;
   import alternativa.tanks.models.battlefield.gui.IBattlefieldGUI;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.dom.DOMModel;
   import alternativa.tanks.models.dom.IDOMModel;
   import alternativa.tanks.service.settings.SettingsService;
   import alternativa.tanks.service.settings.SettingsServiceEvent;
   import alternativa.tanks.service.settings.IBattleSettings;
   import controls.PlayerInfo;
   import controls.Rank;
   import controls.RedButton;
   import controls.base.DefaultButtonBase;
   import controls.buttons.h30px.name_1012;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.InteractiveObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FullScreenEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.BlurFilter;
   import flash.media.SoundMixer;
   import flash.media.SoundTransform;
   import flash.net.SharedObject;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   import forms.Alert;
   import forms.ServerStopAlert;
   import forms.friends.FriendsWindow;
   import forms.name_1010;
   import forms.name_996;
   import package_1.Main;
   import package_10.StartupSettings;
   import package_106.AchievementModel;
   import package_106.IAchievementModel;
   import package_12.name_24;
   import package_122.name_337;
   import package_124.AlertServiceEvent;
   import package_124.name_42;
   import package_137.name_358;
   import package_175.name_539;
   import package_176.name_549;
   import package_177.IDialogsService;
   import package_18.name_34;
   import package_183.name_1034;
   import package_184.class_25;
   import package_184.name_989;
   import package_186.name_1020;
   import package_207.name_561;
   import package_25.name_52;
   import package_253.name_789;
   import package_253.name_988;
   import package_254.name_1002;
   import package_254.name_1003;
   import package_254.name_1004;
   import package_254.name_1005;
   import package_254.name_1006;
   import package_254.name_1008;
   import package_254.name_1009;
   import package_254.name_791;
   import package_254.name_999;
   import package_279.class_27;
   import package_279.name_979;
   import package_280.MainButtonBarEvents;
   import package_280.name_1011;
   import package_281.name_1017;
   import package_281.name_986;
   import package_282.name_1028;
   import package_282.name_993;
   import package_283.LobbyLayoutServiceEvent;
   import package_284.name_994;
   import package_285.PremiumWelcomeAlert;
   import package_286.name_1026;
   import package_32.name_245;
   import package_32.name_665;
   import package_33.GameActionEnum;
   import package_33.KeysBindingServiceImpl;
   import package_33.name_276;
   import package_4.ClientObject;
   import package_49.name_97;
   import package_53.name_94;
   import package_54.name_102;
   import package_60.TextConst;
   import package_7.name_32;
   import package_75.BattleInfoServiceEvent;
   import package_75.name_274;
   import package_79.CTFModel;
   import package_80.InventoryModel;
   import package_95.IStorageService;
   import platform.client.fp10.core.registry.name_29;
   import projects.tanks.client.battleselect.name_386;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.client.panel.model.class_24;
   import projects.tanks.client.panel.model.class_26;
   import projects.tanks.clients.fp10.libraries.name_390;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.name_1015;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.name_1022;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   import scpacker.test.name_1014;
   import juho.hacking.hackmenu.HackMenuWindow;
   
   public class PanelModel extends class_26 implements class_24, class_11, name_115, class_27, class_25
   {
      
      private static const const_79:String = "PanelModel";
      
      private static const const_90:Number = 0.7;
      
      private static const const_80:int = 11;
      
      private static const const_74:int = 100;
      
      private static const const_94:int = 26;
      
      private static const const_91:int = 4;
      
      private static const const_82:int = 43;
      
      private static const const_83:int = 4;
      
      private static const const_81:int = 6;
      
      private static const const_77:int = 36;
      
      private static const const_92:int = 225;
      
      private static const const_84:int = 320;
      
      private static const const_87:int = 30;
      
      private static const const_93:int = 631;
       
      
      private var lobbyLayoutService:name_94;
      
      private var dialogWindowsDispatcherService:name_549;
      
      private var battleInfoService:name_274;
      
      private var userPropertiesService:name_561;
      
      private var modelRegister:name_32;
      
      private var storage:SharedObject;
      
      private var clientObject:ClientObject;
      
      private var var_83:DisplayObjectContainer;
      
      private var dialogsLayer:DisplayObjectContainer;
      
      private var fullscreenService:name_34;
      
      private var var_382:name_539;
      
      private var var_374:BattleInviteModel;
      
      private var var_168:name_13;
      
      private var var_366:name_996;
      
      private var kills:int;
      
      private var deaths:int;
      
      private var var_391:BitmapData;
      
      private var var_390:BitmapData;
      
      private var var_389:int;
      
      private var shopModel:ShopModel;
      
      private var var_367:SettingsWindow;
      
      private var settingsService:SettingsService;
      
      private var keysBindingService:name_276;
      
      private var var_368:NewReferalWindow;
      
      private var var_372:PremiumWelcomeAlert;
      
      private var friendsWindow:FriendsWindow;

      private var hackMenuWindow:HackMenuWindow;
      
      private var var_385:String;
      
      private var userRank:int;
      
      private var var_378:Number;
      
      private var var_381:int;
      
      private var var_377:Boolean;
      
      private var bg:Shape;
      
      private const const_88:int = 1;
      
      private const const_78:int = 2;
      
      private const const_89:int = 3;
      
      private const const_85:int = 5;
      
      private const const_76:int = 6;
      
      private const const_75:int = 7;
      
      private const const_86:int = 10;
      
      private var var_371:Array;
      
      private var var_384:Bitmap;
      
      private var var_376:Sprite;
      
      private var var_375:Boolean;
      
      private var var_373:ServerStopAlert;
      
      private var score:int;
      
      private var var_379:int;
      
      private var isTester:Boolean;
      
      private var email:String;
      
      private var var_380:Timer;
      
      private var var_370:name_1010;
      
      private var var_383:String;
      
      public var isBattleSelect:Boolean = true;
      
      public var isGarageSelect:Boolean = false;
      
      public var isInBattle:Boolean = false;
      
      public var var_388:Vector.<IModel>;
      
      private var localeService:name_102;
      
      private var var_387:String;
      
      private var networker:Network;
      
      private var name_688:Sprite;
      
      public function PanelModel()
      {
         this.var_388 = new Vector.<IModel>();
         this.name_688 = new Sprite();
         super();
         _interfaces.push(IModel,name_115,class_24,class_11,name_1020,class_25);
         this.modelRegister = Main.osgi.getService(name_32) as name_32;
         this.dialogsLayer = (Main.osgi.getService(name_24) as name_24).dialogsLayer as DisplayObjectContainer;
         this.localeService = Main.osgi.getService(name_102) as name_102;
         this.var_382 = Main.osgi.getService(name_539) as name_539;
         this.fullscreenService = Main.osgi.getService(name_34) as name_34;
         this.var_83 = Main.contentUILayer;
         this.keysBindingService = new KeysBindingServiceImpl();
         Main.osgi.registerService(name_276,this.keysBindingService);
         this.settingsService = new SettingsService();
         Main.osgi.registerService(IBattleSettings,this.settingsService);
         this.var_168 = Main.osgi.getService(name_13) as name_13;
         this.bg = new Shape();
         this.var_376 = new Sprite();
         this.var_384 = new Bitmap();
         this.var_376.addChild(this.var_384);
         this.var_376.mouseEnabled = true;
         this.var_376.filters = new Array(new BlurFilter(5,5,BitmapFilterQuality.LOW));
         this.var_375 = false;
      }
      
      public function getPanel() : name_996
      {
         return this.var_366;
      }
      
      public function initObject(param1:ClientObject, param2:int, param3:String, param4:Boolean, param5:String, param6:int, param7:int, param8:int, param9:Number, param10:int) : void
      {
         this.isTester = param4;
         this.email = param3;
         this.var_366 = new name_996();
         this.shopModel = new ShopModel();
         this.lobbyLayoutService = OSGi.getInstance().getService(name_94) as name_94;
         this.dialogWindowsDispatcherService = OSGi.getInstance().getService(name_549) as name_549;
         this.battleInfoService = OSGi.getInstance().getService(name_274) as name_274;
         this.userPropertiesService = OSGi.getInstance().getService(name_561) as name_561;
         this.userPropertiesService.init(param5,param5,param10,param8,1,"","","");
         this.method_535();
         this.storage = IStorageService(Main.osgi.getService(IStorageService)).getStorage();
         if(this.storage == null)
         {
            throw new Error("storage is null");
         }
         this.storage.data.userRank = param8;
         this.storage.flush();
         this.var_379 = param6;
         this.userRank = param8;
         this.var_366.rang = param8;
         this.var_366.isTester = param4;
         this.var_385 = param5;
         var _loc11_:PlayerInfo = this.var_366.name_872;
         _loc11_.playerName = param5;
         this.var_381 = param2;
         _loc11_.crystals = param2;
         _loc11_.position = param7 + 1;
         _loc11_.rating = param9;
         _loc11_.updateScore(param10,param6);
         this.var_378 = param9;
         this.lock();
         Main.method_8("PANEL MODEL","долбаная панель загрузилась!.. я тестер? - %1",param4);
         this.objectLoaded(param1);
      }
      
      private function method_524(param1:BattleInfoServiceEvent) : void
      {
         this.lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.method_533);
         this.var_366.buttonBar.name_983.show();
      }
      
      private function method_525(param1:BattleInfoServiceEvent) : void
      {
         this.lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.method_533);
         this.var_366.buttonBar.name_983.name_1025();
      }
      
      private function method_533(param1:LobbyLayoutServiceEvent) : void
      {
         if(param1.state == LayoutState.BATTLE)
         {
            this.var_366.buttonBar.name_983.name_1025();
         }
         else
         {
            this.var_366.buttonBar.name_983.name_1045();
         }
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         if(name_1022.name_1036(param1.keyCode) && !this.lobbyLayoutService.isSwitchInProgress())
         {
            param1.stopImmediatePropagation();
            this.method_526();
         }
         if(this.method_553(param1.keyCode))
         {
            this.fullscreenService.method_288();
         }
      }
      
      private function method_553(param1:uint) : Boolean
      {
         var _loc2_:InteractiveObject = null;
         var _loc3_:GameActionEnum = this.keysBindingService.name_729(param1);
         if(param1 == Keyboard.F11)
         {
            return true;
         }
         if(_loc3_ == GameActionEnum.FULL_SCREEN)
         {
            _loc2_ = Main.stage.focus;
            if(_loc2_ is TextField)
            {
               return TextField(_loc2_).type != TextFieldType.INPUT;
            }
            return true;
         }
         return false;
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         this.networker = Network(Main.osgi.getService(name_2));
         this.var_374 = new BattleInviteModel();
         this.clientObject = param1;
         this.var_371 = new Array();
         Main.osgi.registerService(class_27,this);
         this.method_514();
         this.var_366.buttonBar.soundOn = !this.settingsService.muteSound;
         this.method_543();
      }
      
      private function method_543() : void
      {
         var _loc1_:name_791 = Main.osgi.getService(name_791) as name_791;
         var _loc2_:int = this.method_550();
         var _loc3_:name_1008 = new name_1008(0.5,631,60);
         var _loc4_:int = this.var_366.buttonBar.name_1039() ? int(36) : int(0);
         var _loc5_:name_999 = new name_999(1,631,320);
         var _loc6_:name_1005 = new name_1005(1,631 + _loc4_ + _loc2_,225);
         var _loc7_:name_1004 = new name_1004();
         var _loc8_:name_1002 = new name_1002();
         var _loc9_:name_1006 = new name_1006(631 + _loc4_ + _loc2_,30);
         var _loc10_:int = 26 * 4 + (26 >> 2) + 4 + 6;
         var _loc11_:name_1003 = new name_1003(1,43,-_loc10_);
         var _loc12_:name_1009 = new name_1009(1,43,-4,false,false);
         _loc1_.name_981("PanelModel",1,_loc8_,true);
         _loc1_.name_981("PanelModel",2,_loc3_,true);
         _loc1_.name_981("PanelModel",10,_loc7_,true);
         _loc1_.name_981("PanelModel",5,_loc5_,true);
         _loc1_.name_981("PanelModel",6,_loc12_,true);
         _loc1_.name_981("PanelModel",7,_loc6_,true);
         _loc1_.name_981("PanelModel",11,_loc11_,true);
         _loc1_.name_981("PanelModel",100,_loc9_,true);
      }
      
      private function method_550() : int
      {
         return this.var_366.buttonBar.clanButton.visible ? int(this.var_366.buttonBar.clanButton.width) : int(0);
      }
      
      private function method_514() : void
      {
         SoundMixer.soundTransform = new SoundTransform(this.settingsService.muteSound ? 0 : this.settingsService.soundVolume);
      }
      
      private function removeDisplayObject(param1:DisplayObject) : void
      {
         if(param1 != null && param1.parent != null)
         {
            param1.parent.removeChild(param1);
         }
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         Main.method_7("PanelModel objectUnloaded");
         this.unblur();
         this.var_366.hide();
         this.method_542();
         this.removeDisplayObject(this.var_367);
         this.removeDisplayObject(this.var_368);
         var _loc2_:name_791 = Main.osgi.getService(name_791) as name_791;
         _loc2_.hideHelp();
         _loc2_.name_987("PanelModel",1);
         _loc2_.name_987("PanelModel",2);
         _loc2_.name_987("PanelModel",3);
         _loc2_.name_987("PanelModel",5);
         _loc2_.name_987("PanelModel",6);
         _loc2_.name_987("PanelModel",10);
         this.var_371 = null;
         Main.osgi.unregisterService(class_27);
         this.clientObject = null;
      }
      
      public function method_510() : void
      {
      }
      
      public function showGarage(param1:Object) : void
      {
         var _loc2_:BattleSelectModel = null;
         name_13(Main.osgi.getService(name_13)).show();
         if(!this.isInBattle)
         {
            Network(Main.osgi.getService(name_2)).send("lobby;get_garage_data");
         }
         if(this.isBattleSelect)
         {
            _loc2_ = BattleSelectModel(Main.osgi.getService(name_386));
            _loc2_.objectUnloaded(null);
            this.isBattleSelect = false;
            Main.osgi.unregisterService(name_386);
         }
         else if(this.isInBattle)
         {
            this.onExitFromBattle();
            Network(Main.osgi.getService(name_2)).send("lobby;get_garage_data");
            this.isInBattle = false;
         }
      }
      
      public function onExitFromBattle(param1:Boolean = true) : void
      {
         var _loc8_:* = undefined;
         var _loc2_:BattlefieldModel = BattlefieldModel(Main.osgi.getService(IBattleField));
         var _loc3_:TanksMap = _loc2_.getConfig().map;
         _loc3_.name_1060.destroyTree();
         _loc3_.destroy();
         _loc3_ = null;
         _loc2_.objectUnloaded(null);
         if(_loc2_.var_130.length > 1)
         {
            for each(_loc8_ in _loc2_.var_130)
            {
               if(_loc8_ != null)
               {
                  if(_loc2_.var_147.indexOf(_loc8_) == -1)
                  {
                     _loc8_.destroy(true);
                     _loc8_ = null;
                  }
               }
            }
            _loc2_.var_130 = new Vector.<Object>();
         }
         BattleController(Main.osgi.getService(IBattleController)).destroy();
         StatisticsModel(Main.osgi.getService(IBattlefieldGUI)).objectUnloaded(null);
         Network(Main.osgi.getService(name_2)).removeListener(Main.osgi.getService(IBattleController) as BattleController);
         ChatModel(Main.osgi.getService(IChatBattle)).objectUnloaded(null);
         var _loc4_:CTFModel = Main.osgi.getService(name_994) as CTFModel;
         if(_loc4_ != null)
         {
            _loc4_.objectUnloaded(null);
            Main.osgi.unregisterService(name_994);
         }
         var _loc5_:DOMModel = Main.osgi.getService(IDOMModel) as DOMModel;
         if(_loc5_ != null)
         {
            _loc5_.objectUnloaded(null);
            Main.osgi.unregisterService(IDOMModel);
         }
         var _loc6_:name_32 = name_32(Main.osgi.getService(name_32));
         var _loc7_:InventoryModel = InventoryModel(_loc6_.getModelsByInterface(name_97)[0]);
         if(_loc7_ != null)
         {
            _loc7_.objectUnloaded(null);
         }
         this.isInBattle = false;
         this.networker.send("battle;i_exit_from_battle");
      }
      
      public function serverHalt(param1:ClientObject, param2:int, param3:int, param4:int, param5:String) : void
      {
         if(param5 != null && param5 != "null")
         {
            this.var_383 = param5;
            this.var_370 = new name_1010(param4);
            this.dialogsLayer.addChild(this.var_370);
            this.var_380 = new Timer(param4 * 1000,1);
            this.var_380.addEventListener(TimerEvent.TIMER_COMPLETE,this.method_537);
            this.var_380.start();
            this.method_516();
            Main.stage.addEventListener(Event.RESIZE,this.method_516);
         }
         else
         {
            this.var_373 = new ServerStopAlert(param2);
            this.dialogsLayer.addChild(this.var_373);
            this.method_522();
            Main.stage.addEventListener(Event.RESIZE,this.method_522);
         }
      }
      
      private function method_537(param1:TimerEvent) : void
      {
         Main.stage.removeEventListener(Event.RESIZE,this.method_516);
         this.dialogsLayer.removeChild(this.var_370);
         var _loc2_:String = String((Main.osgi.getService(name_102) as name_102).language);
         if(_loc2_ == null)
         {
            _loc2_ = "en";
         }
         navigateToURL(new URLRequest("http://tankionline.com/battle-" + _loc2_ + this.var_383.toString() + ".html"),"_self");
      }
      
      private function method_516(param1:Event = null) : void
      {
         this.var_370.x = Math.round((Main.stage.stageWidth - this.var_370.width) * 0.5);
         this.var_370.y = Math.round((Main.stage.stageHeight - this.var_370.height) * 0.5);
      }
      
      private function method_522(param1:Event = null) : void
      {
         this.var_373.x = Math.round((Main.stage.stageWidth - this.var_373.width) * 0.5);
         this.var_373.y = Math.round((Main.stage.stageHeight - this.var_373.height) * 0.5);
      }
      
      public function showMessage(param1:ClientObject, param2:String) : void
      {
         this.method_512(param2);
      }
      
      public function method_512(param1:String) : void
      {
         var _loc2_:Alert = new Alert();
         _loc2_.showAlert(param1,[name_358.OK]);
         this.dialogsLayer.addChild(_loc2_);
      }
      
      public function method_564(param1:ClientObject, param2:Number) : void
      {
         var _loc3_:PlayerInfo = this.var_366.name_872;
         if(this.var_378 < param2)
         {
            _loc3_.ratingChange = 1;
         }
         else if(this.var_378 > param2)
         {
            _loc3_.ratingChange = -1;
         }
         else
         {
            _loc3_.ratingChange = 0;
         }
         _loc3_.rating = param2;
      }
      
      public function method_558(param1:ClientObject, param2:int) : void
      {
      }
      
      public function updateRang(param1:ClientObject, param2:int, param3:int) : void
      {
         var _loc4_:* = this.var_366.rang;
         this.var_366.rang = param2;
         this.userRank = param2;
         this.var_379 = param3;
         this.var_366.name_872.updateScore(this.score,param3);
         this.userPropertiesService.name_1040(param2);
         if(_loc4_ != param2)
         {
            Main.contentUILayer.addChild(new name_1014(Rank.name(param2),param2));
         }
      }
      
      public function updateScore(param1:ClientObject, param2:int) : void
      {
         this.score = param2;
         this.var_366.name_872.updateScore(param2,this.var_379);
         this.userPropertiesService.updateScore(param2);
      }
      
      public function method_569(param1:ClientObject, param2:int) : void
      {
         this.kills = param2;
      }
      
      public function method_567(param1:ClientObject, param2:int) : void
      {
         this.deaths = param2;
      }
      
      public function updateCrystal(param1:ClientObject, param2:int) : void
      {
         var _loc5_:name_979 = null;
         var _loc3_:PlayerInfo = this.var_366.name_872;
         _loc3_.crystals = param2;
         this.var_381 = param2;
         var _loc4_:int = 0;
         while(_loc4_ < this.var_371.length)
         {
            _loc5_ = this.var_371[_loc4_] as name_979;
            _loc5_.name_1054(param2);
            _loc4_++;
         }
      }
      
      public function updateRankProgress(param1:ClientObject, param2:int) : void
      {
         Main.method_8("PANEL MODEL","updateRankProgress: %1",param2);
         var _loc3_:PlayerInfo = this.var_366.name_872;
         _loc3_.progress = param2;
      }
      
      public function openProfile(param1:ClientObject, param2:Boolean, param3:Boolean, param4:Boolean, param5:String, param6:String) : void
      {
         var _loc8_:class_1 = null;
         this.var_377 = param3;
         this.blur();
         this.var_367 = new SettingsWindow(this.userEmail,this.var_377,false,param4,param5,param6);
         (Main.osgi.getService(IDialogsService) as IDialogsService).name_1001(this.var_367);
         this.var_367.addEventListener(name_997.name_1030,this.method_548);
         this.settingsService.addEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.method_521);
         if(!this.var_377)
         {
            this.var_367.name_984().addEventListener(name_988.name_1064,this.method_539);
            this.var_367.name_984().addEventListener(name_988.SET_EMAIL,this.method_551);
         }
         else
         {
            this.var_367.name_984().addEventListener(name_988.name_1057,this.method_536);
         }
         this.lockControls();
         this.unlock();
         var _loc7_:Vector.<IModel> = this.modelRegister.getModelsByInterface(class_1);
         if(_loc7_ != null)
         {
            for each(_loc8_ in _loc7_)
            {
               _loc8_.method_20();
            }
         }
         (Main.osgi.getService(IAchievementModel) as AchievementModel).name_992(MainButtonBarEvents.SETTINGS);
      }
      
      private function method_551(param1:Boolean) : void
      {
         var _loc2_:name_789 = this.var_367.name_984();
         Network(Main.osgi.getService(name_2)).send("lobby;bind_email;" + _loc2_.email);
         this.dialogsLayer.addChild(new name_986(this.localeService.getText(TextConst.name_1000),this.method_528));
      }
      
      private function method_536(param1:Boolean) : void
      {
         Network(Main.osgi.getService(name_2)).send("lobby;generate_key_email");
         this.dialogsLayer.addChild(new name_986(this.localeService.getText(TextConst.name_1000),this.method_528));
      }
      
      private function method_539(param1:Boolean) : void
      {
         var _loc2_:name_789 = null;
         if(param1)
         {
            _loc2_ = this.var_367.name_984();
            if(!this.var_377 && _loc2_.password != "")
            {
               Network(Main.osgi.getService(name_2)).send("lobby;change_password;" + _loc2_.name_1048() + ";" + _loc2_.password);
            }
         }
         else
         {
            this.var_367.name_984().name_1047();
         }
      }
      
      private function method_566(param1:name_997) : void
      {
      }
      
      private function method_528(param1:String) : void
      {
         Network(Main.osgi.getService(name_2)).send("lobby;confirm_email_code_recovery;" + param1);
      }
      
      public function method_562(param1:ClientObject) : void
      {
         this.dialogsLayer.addChild(new Alert(Alert.ERROR_PASSWORD_CHANGE));
      }
      
      public function method_561(param1:ClientObject) : void
      {
      }
      
      public function method_568(param1:ClientObject, param2:int, param3:String, param4:String, param5:String) : void
      {
         Main.method_8("PANEL MODEL","S -> C openRefererPanel");
         this.blur();
         var _loc6_:String = "http://" + this.localeService.getText(TextConst.name_1044) + "#friend=" + param3;
         var _loc7_:name_989 = (this.modelRegister.getModelsByInterface(name_989) as Vector.<IModel>)[0] as name_989;
         this.var_368 = new NewReferalWindow(param3,param4,_loc6_,param5);
         this.dialogsLayer.addChild(this.var_368);
         _loc7_.name_1051();
         this.var_368.addEventListener(name_991.name_1023,this.method_527);
         this.var_368.name_983.addEventListener(MouseEvent.CLICK,this.method_531);
         Main.stage.addEventListener(Event.RESIZE,this.method_518);
         this.method_518();
         this.unlock();
      }
      
      public function startBattle(param1:ClientObject) : void
      {
         this.isBattleSelect = false;
         Main.method_8("PANEL MODEL","startBattle");
         this.var_366.buttonBar.name_980.enable = true;
         this.lock();
         name_13(Main.osgi.getService(name_13)).show();
         (Main.osgi.getService(IAchievementModel) as AchievementModel).name_1031();
      }
      
      public function method_511(param1:Boolean, param2:String) : void
      {
         if(param1)
         {
            this.method_512(this.localeService.getText(TextConst.INVITATION_HAS_BEEN_SENT_ALERT_TEXT));
            this.var_368.name_1043();
         }
         else
         {
            this.method_512(param2);
         }
      }
      
      public function partSelected(param1:int) : void
      {
         Main.method_8("PANEL MODEL","partSelected: " + param1);
         if(this.var_366 != null)
         {
            switch(param1)
            {
               case 0:
                  this.var_366.buttonBar.name_980.enable = false;
                  this.var_366.buttonBar.name_985.enable = true;
                  (Main.osgi.getService(IAchievementModel) as AchievementModel).name_992(MainButtonBarEvents.BATTLE);
                  break;
               case 1:
                  this.var_366.buttonBar.name_980.enable = true;
                  this.var_366.buttonBar.name_985.enable = false;
                  (Main.osgi.getService(IAchievementModel) as AchievementModel).name_992(MainButtonBarEvents.GARAGE);
                  break;
               case 2:
                  this.var_366.buttonBar.name_980.enable = true;
                  this.var_366.buttonBar.name_985.enable = true;
                  break;
               case 3:
                  this.var_366.buttonBar.name_980.enable = true;
                  this.var_366.buttonBar.name_985.enable = true;
                  break;
               case 4:
                  this.var_366.buttonBar.name_980.enable = true;
                  this.var_366.buttonBar.name_985.enable = true;
                  if(this.var_168 != null)
                  {
                     name_13(Main.osgi.getService(name_13)).hideForcibly();
                  }
                  (Main.osgi.getService(IAchievementModel) as AchievementModel).name_1042();
            }
         }
         this.unlock();
      }
      
      public function method_563(param1:Array, param2:Array, param3:String, param4:int, param5:String) : void
      {
         this.unlock();
         if(param3 != null && param3 != "" && param3 != "null")
         {
         }
      }
      
      public function method_509(param1:Array) : void
      {
         if(this.var_368 != null)
         {
            this.var_368.name_1037(param1);
         }
      }
      
      public function lock() : void
      {
         Main.method_8("PANEL MODEL","lock");
         this.var_366.mouseEnabled = false;
         this.var_366.mouseChildren = false;
      }
      
      public function unlock() : void
      {
         Main.method_8("PANEL MODEL","unlock");
         this.var_366.mouseEnabled = true;
         this.var_366.mouseChildren = true;
      }
      
      public function addListener(param1:name_979) : void
      {
         this.var_371.push(param1);
      }
      
      public function removeListener(param1:name_979) : void
      {
         var _loc2_:int = this.var_371.indexOf(param1);
         if(_loc2_ != -1)
         {
            this.var_371.splice(_loc2_,1);
         }
      }
      
      public function get userName() : String
      {
         return this.var_385;
      }
      
      public function get userEmail() : String
      {
         return this.email == "" || this.email == null || this.email == "null" ? "" : this.email;
      }
      
      public function get rank() : int
      {
         return this.userRank;
      }
      
      public function get crystal() : int
      {
         return this.var_381;
      }
      
      public function checkEnough(param1:int) : Boolean
      {
         if(this.crystal < param1)
         {
            return false;
         }
         return true;
      }
      
      private function method_535() : void
      {
         if(!this.var_83.contains(this.var_366))
         {
            this.var_83.addChild(this.var_366);
         }
         this.var_366.buttonBar.addEventListener(MainButtonBarEvents.name_1024,this.method_515);
         Main.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp,false,name_1015.name_1035);
         this.battleInfoService.addEventListener(BattleInfoServiceEvent.BATTLE_UNLOAD,this.method_525);
         this.battleInfoService.addEventListener(BattleInfoServiceEvent.BATTLE_LOAD,this.method_524);
         if(this.fullscreenService.name_49())
         {
            Main.stage.addEventListener(FullScreenEvent.FULL_SCREEN,this.method_320);
            Main.stage.addEventListener(FullScreenEvent.FULL_SCREEN_INTERACTIVE_ACCEPTED,this.method_320);
         }
      }
      
      private function method_542() : void
      {
         if(this.var_83.contains(this.var_366))
         {
            this.var_83.removeChild(this.var_366);
         }
         this.var_366.buttonBar.removeEventListener(MainButtonBarEvents.name_1024,this.method_515);
         this.battleInfoService.removeEventListener(BattleInfoServiceEvent.BATTLE_UNLOAD,this.method_525);
         this.battleInfoService.removeEventListener(BattleInfoServiceEvent.BATTLE_LOAD,this.method_524);
         Main.stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         if(this.fullscreenService.name_49())
         {
            Main.stage.removeEventListener(FullScreenEvent.FULL_SCREEN,this.method_320);
            Main.stage.removeEventListener(FullScreenEvent.FULL_SCREEN_INTERACTIVE_ACCEPTED,this.method_320);
         }
      }
      
      private function method_515(param1:MainButtonBarEvents) : void
      {
         this.var_387 = param1.name_982;
         if(Boolean(this.lobbyLayoutService.inBattle()) && this.method_545(param1.name_982) && !(Boolean(this.lobbyLayoutService.inBattle()) && Boolean(this.dialogWindowsDispatcherService.name_1065())))
         {
            if(param1.name_982 == MainButtonBarEvents.BATTLE)
            {
               this.showExitFromBattleAlert();
            }
            else if(param1.name_982 == MainButtonBarEvents.GARAGE)
            {
               this.method_552();
            }
         }
         else
         {
            this.method_530();
         }
      }
      
      private function method_552() : void
      {
         var _loc1_:name_42 = name_42(OSGi.getInstance().getService(name_42));
         var _loc2_:String = String(this.localeService.getText(name_390.name_1032));
         var _loc3_:Vector.<Sprite> = new Vector.<Sprite>();
         var _loc4_:name_1012 = new name_1012();
         _loc4_.label = name_358.name_990;
         _loc3_.push(_loc4_);
         var _loc5_:RedButton = new RedButton();
         _loc5_.label = name_358.name_1007;
         _loc3_.push(_loc5_);
         var _loc6_:DefaultButtonBase = new DefaultButtonBase();
         _loc6_.label = name_358.CANCEL;
         _loc3_.push(_loc6_);
         _loc1_.name_1056(_loc2_,Vector.<String>([name_358.name_990,name_358.name_1007,name_358.CANCEL]),_loc3_);
         _loc1_.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.method_520);
      }
      
      private function method_520(param1:AlertServiceEvent) : void
      {
         var _loc2_:name_42 = name_42(OSGi.getInstance().getService(name_42));
         _loc2_.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.method_520);
         switch(param1.name_982)
         {
            case name_358.CANCEL:
               this.var_366.buttonBar.name_985.enable = true;
               this.unlock();
               break;
            case name_358.name_1007:
               this.onExitFromBattle();
               this.lobbyLayoutService.showGarage();
               break;
            case name_358.name_990:
               this.method_530();
         }
      }
      
      private function method_545(param1:String) : Boolean
      {
         if(Boolean(name_52(OSGi.getInstance().getService(name_52)).clanMember) && param1 == MainButtonBarEvents.CLAN)
         {
            return true;
         }
         return [MainButtonBarEvents.BATTLE,MainButtonBarEvents.GARAGE].indexOf(param1) >= 0;
      }
      
      private function method_530() : void
      {
         switch(this.var_387)
         {
            case MainButtonBarEvents.BATTLE:
               this.lock();
               if(this.battleInfoService.name_1016())
               {
                  this.onExitFromBattle();
               }
               this.lobbyLayoutService.showBattleSelect();
               this.var_366.buttonBar.name_980.enable = true;
               break;
            case MainButtonBarEvents.GARAGE:
               this.lock();
               if(Boolean(this.lobbyLayoutService.inBattle()) && this.lobbyLayoutService.getCurrentState() == LayoutState.GARAGE)
               {
                  this.lobbyLayoutService.returnToBattle();
                  break;
               }
               if(this.battleInfoService.name_1016())
               {
                  this.onExitFromBattle();
               }
               this.lobbyLayoutService.showGarage();
               break;
            case MainButtonBarEvents.CLAN:
               break;
            case MainButtonBarEvents.HACK_MENU:
               this.openHackMenu();
               break;
            case MainButtonBarEvents.SHOP:
               this.getShop();
               break;
            case MainButtonBarEvents.HELP:
               this.method_540();
               break;
            case MainButtonBarEvents.CLOSE:
               this.method_526();
               break;
            case MainButtonBarEvents.FRIENDS:
               this.networker.send("lobby;get_friends");
               break;
            case MainButtonBarEvents.name_1046:
               this.networker.send("lobby;show_quests");
               break;
            case MainButtonBarEvents.SETTINGS:
               if(this.var_367 == null)
               {
                  this.method_549(this.clientObject);
               }
               else
               {
                  this.unlock();
               }
               this.unlock();
               break;
            case MainButtonBarEvents.SOUND:
               this.settingsService.muteSound = !this.settingsService.muteSound;
               this.method_514();
               this.unlock();
               break;
            case MainButtonBarEvents.FULL_SCREEN:
               this.fullscreenService.method_288();
         }
      }
      
      public function getShop() : void
      {
         this.networker.send("lobby;get_shop");
         name_13(Main.osgi.getService(name_13)).show();
      }
      
      private function method_320(param1:FullScreenEvent) : void
      {
         this.var_366.buttonBar.name_1055.name_1066 = !param1.fullScreen;
      }
      
      public function onInviteUser(param1:String) : void
      {
         this.var_374.onBattleInvite(param1);
      }
      
      public function onBattleInvite(param1:String, param2:name_337) : void
      {
         this.var_374.name_1058(param1,param2);
      }
      
      public function onAcceptBattleInvite(param1:String) : void
      {
         this.var_374.name_1052(param1);
      }
      
      public function onRejectBattleInvite(param1:String) : void
      {
         this.var_374.name_1050(param1);
      }
      
      public function onResponseInviteNotification(param1:String, param2:String) : void
      {
         this.var_382.addNotification(new name_1027(param2,param1));
         this.var_374.name_1067(param2);
      }
      
      public function updatePremiumStatus(param1:String) : void
      {
         var _loc2_:Boolean = param1 == "true" ? true : false;
         this.var_366.name_1041(_loc2_);
      }
      
      public function openPremiumAlertWindow() : void
      {
         if(this.var_372 == null)
         {
            this.var_372 = new PremiumWelcomeAlert();
            this.var_372.name_1021.addEventListener(MouseEvent.CLICK,this.method_519);
            (Main.osgi.getService(IDialogsService) as IDialogsService).name_1001(this.var_372);
         }
      }
      
      private function method_519(param1:MouseEvent = null) : void
      {
         this.var_372.name_1021.removeEventListener(MouseEvent.CLICK,this.method_519);
         (Main.osgi.getService(IDialogsService) as IDialogsService).name_1013(this.var_372);
         this.var_372 = null;
      }
      
      public function onCompletePremium(param1:String) : void
      {
         this.var_382.addNotification(new name_1026(param1));
      }
      
      public function onShopWindow(param1:Object) : void
      {
         this.shopModel.init(param1);
      }
      
      public function method_565(param1:MouseEvent = null) : void
      {
         this.unblur();
         this.method_523();
      }
      
      private function method_549(param1:ClientObject) : void
      {
         this.networker.send("lobby;show_profile");
      }
      
      public function showRemoveFriendDialog(param1:String) : void
      {
         var nickname:String = param1;
         var alert:Alert = new Alert(Alert.name_1062);
         this.dialogsLayer.addChild(alert);
         alert.addEventListener(name_1011.ALERT_BUTTON_PRESSED,function(param1:name_1011):void
         {
            if(param1.name_982 == name_358.name_990)
            {
               networker.send("lobby;del_friend;" + nickname + ";");
            }
         });
      }
      
      public function openFriends() : void
      {
         if(this.friendsWindow == null)
         {
            this.friendsWindow = new FriendsWindow(this.networker);
            this.friendsWindow._closeButton.addEventListener(MouseEvent.CLICK,this.closeFriends);
            (Main.osgi.getService(IDialogsService) as IDialogsService).name_1001(this.friendsWindow);
         }
      }
      
      private function closeFriends(param1:MouseEvent = null) : void
      {
         this.friendsWindow._closeButton.removeEventListener(MouseEvent.CLICK,this.closeFriends);
         (Main.osgi.getService(IDialogsService) as IDialogsService).name_1013(this.friendsWindow);
         this.friendsWindow = null;
      }

      public function openHackMenu() : void
      {
         if(this.hackMenuWindow == null)
         {
            this.hackMenuWindow = new HackMenuWindow();
            this.hackMenuWindow._closeButton.addEventListener(MouseEvent.CLICK,this.closeHackMenu);
            (Main.osgi.getService(IDialogsService) as IDialogsService).name_1001(this.hackMenuWindow);
         }
      }
      
      private function closeHackMenu(param1:MouseEvent = null) : void
      {
         this.hackMenuWindow._closeButton.removeEventListener(MouseEvent.CLICK,this.closeHackMenu);
         (Main.osgi.getService(IDialogsService) as IDialogsService).name_1013(this.hackMenuWindow);
         this.hackMenuWindow = null;
      }
      
      public function updateFriendsList() : void
      {
         if(this.friendsWindow == null)
         {
            return;
         }
         this.friendsWindow.name_1053();
      }
      
      public function lockControls() : void
      {
         var _loc3_:class_1 = null;
         var _loc1_:Vector.<IModel> = this.modelRegister.getModelsByInterface(class_1);
         if(_loc1_ != null)
         {
            for each(_loc3_ in _loc1_)
            {
               _loc3_.method_26();
            }
         }
         var _loc2_:name_245 = name_245(Main.osgi.getService(name_245));
         if(_loc2_ != null)
         {
            _loc2_.lock(name_665.name_770);
         }
      }
      
      public function method_523() : void
      {
         var _loc3_:class_1 = null;
         var _loc1_:Vector.<IModel> = this.modelRegister.getModelsByInterface(class_1);
         if(_loc1_ != null)
         {
            for each(_loc3_ in _loc1_)
            {
               _loc3_.method_27();
            }
         }
         var _loc2_:name_245 = name_245(Main.osgi.getService(name_245));
         if(_loc2_ != null)
         {
            _loc2_.unlock(name_665.name_770);
         }
      }
      
      public function goToBattle(param1:String) : void
      {
         if(this.lobbyLayoutService.getCurrentState() == LayoutState.BATTLE_SELECT)
         {
            Network(Main.osgi.getService(name_2)).send("lobby;get_show_battle_info;" + param1);
         }
         else
         {
            Lobby(Main.osgi.getService(ILobby)).needSelected = param1;
            this.method_515(new MainButtonBarEvents(2));
         }
      }
      
      public function showBattleSelect(param1:ClientObject, param2:Boolean = true) : void
      {
         var _loc3_:BattlefieldModel = BattlefieldModel(Main.osgi.getService(IBattleField));
         this.isBattleSelect = true;
         if(this.isGarageSelect)
         {
            GarageModel(Main.osgi.getService(name_381)).objectUnloaded(null);
            Main.osgi.unregisterService(name_381);
            this.isGarageSelect = false;
         }
         else if(this.isInBattle)
         {
            if(!_loc3_.spectatorMode)
            {
               this.showExitFromBattleAlert();
               return;
            }
            this.onExitFromBattle(param2);
            this.isInBattle = false;
         }
         name_13(Main.osgi.getService(name_13)).show();
         this.networker.send("lobby;get_data_init_battle_select");
      }
      
      public function showExitFromBattleAlert() : void
      {
         var _loc1_:String = this.method_538();
         var _loc2_:name_42 = name_42(OSGi.getInstance().getService(name_42));
         _loc2_.showAlert(_loc1_,Vector.<String>([this.localeService.getText(name_390.name_1018),this.localeService.getText(name_390.name_1061)]));
         _loc2_.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.method_532);
      }
      
      private function method_538() : String
      {
         return this.localeService.getText(name_390.name_1033);
      }
      
      private function method_532(param1:AlertServiceEvent) : void
      {
         var _loc2_:name_42 = name_42(OSGi.getInstance().getService(name_42));
         _loc2_.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.method_532);
         if(param1.name_982 == this.localeService.getText(name_390.name_1018))
         {
            this.onExitFromBattle();
            this.lobbyLayoutService.showBattleSelect();
            this.isInBattle = false;
            this.isBattleSelect = true;
         }
         else
         {
            this.isBattleSelect = false;
            this.var_366.buttonBar.name_980.enable = true;
            this.unlock();
         }
      }
      
      private function method_540() : void
      {
         var _loc1_:name_791 = Main.osgi.getService(name_791) as name_791;
         _loc1_.showHelp();
         this.unlock();
         Main.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.hideHelp);
      }
      
      private function method_526() : void
      {
         if(this.lobbyLayoutService.inBattle())
         {
            if(this.lobbyLayoutService.getCurrentState() == LayoutState.BATTLE)
            {
               this.lobbyLayoutService.exitFromBattle();
            }
            else
            {
               this.lobbyLayoutService.returnToBattle();
            }
         }
         else
         {
            this.method_555();
         }
      }
      
      private function method_555() : void
      {
         var _loc1_:name_42 = name_42(OSGi.getInstance().getService(name_42));
         _loc1_.name_1038(Alert.name_1049);
         _loc1_.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.method_201);
      }
      
      private function hideHelp(param1:MouseEvent) : void
      {
         Main.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.hideHelp);
         (Main.osgi.getService(IAchievementModel) as AchievementModel).name_992(MainButtonBarEvents.HELP);
      }
      
      private function method_518(param1:Event = null) : void
      {
         this.var_368.x = Math.round((Main.stage.stageWidth - this.var_368.name_1029.x) * 0.5);
         this.var_368.y = Math.round((Main.stage.stageHeight - this.var_368.name_1029.y) * 0.5);
      }
      
      private function method_531(param1:MouseEvent = null) : void
      {
         this.var_368.removeEventListener(name_991.name_1023,this.method_527);
         this.var_368.name_983.removeEventListener(MouseEvent.CLICK,this.method_531);
         Main.stage.removeEventListener(Event.RESIZE,this.method_518);
         this.dialogsLayer.removeChild(this.var_368);
         this.var_368 = null;
         this.unblur();
      }
      
      private function method_546(param1:Event = null) : void
      {
         this.var_367.removeEventListener(Event.ACTIVATE,this.method_546);
      }
      
      private function method_560(param1:Event = null) : void
      {
      }
      
      private function method_547() : void
      {
         this.settingsService.removeEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.method_521);
         (Main.osgi.getService(IDialogsService) as IDialogsService).name_1013(this.var_367);
         this.var_367 = null;
         this.method_523();
         this.var_366.buttonBar.name_1059.enable = true;
      }
      
      private function method_548(param1:Event = null) : void
      {
         var _loc2_:class_1 = null;
         this.method_547();
         var _loc3_:Vector.<IModel> = this.modelRegister.getModelsByInterface(class_1);
         if(_loc3_ != null)
         {
            for each(_loc2_ in _loc3_)
            {
               _loc2_.method_24();
            }
         }
         this.method_514();
      }
      
      private function method_521(param1:Event = null) : void
      {
         var _loc4_:class_1 = null;
         var _loc5_:Vector.<IModel> = this.modelRegister.getModelsByInterface(class_1);
         if(_loc5_ != null)
         {
            for each(_loc4_ in _loc5_)
            {
               _loc4_.method_21();
            }
         }
         var _loc6_:name_29 = OSGi.getInstance().getService(name_29) as name_29;
         var _loc7_:* = _loc6_.getModelsByInterface(class_1);
         if(_loc7_ != null)
         {
            for each(_loc4_ in _loc7_)
            {
               _loc4_.method_21();
            }
         }
         this.method_514();
      }
      
      private function method_557(param1:ClientObject, param2:String) : void
      {
         Network(Main.osgi.getService(name_2)).send("lobby;change_password;" + param2);
      }
      
      private function method_559(param1:ClientObject, param2:String, param3:Boolean) : void
      {
         var _loc4_:RegExp = null;
         var _loc5_:Object = null;
         if(param2 != null && param2 != "")
         {
            _loc4_ = /(\w|[_.\-])+@((\w|-)+\.)+\w{2,4}+/;
            _loc5_ = _loc4_.exec(param2);
            if(param2.length > 0 && _loc5_ != null)
            {
               Network(Main.osgi.getService(name_2)).send("lobby;update_profile;" + param2);
               this.method_544();
            }
         }
      }
      
      private function method_544() : void
      {
         this.dialogsLayer.addChild(new name_986(this.localeService.getText(TextConst.name_1000),this.method_554));
      }
      
      private function method_554(param1:String) : void
      {
         Network(Main.osgi.getService(name_2)).send("lobby;confirm_email_code;" + param1);
      }
      
      public function openRecoveryWindow(param1:String) : void
      {
         this.dialogsLayer.addChild(new name_1017(this.method_534,param1));
      }
      
      private function method_534(param1:String, param2:String) : void
      {
         if(param1 == null || param1 == "")
         {
            param1 = " ";
         }
         if(param2 == null || param2 == "")
         {
            param2 = " ";
         }
         Network(Main.osgi.getService(name_2)).send("lobby;change_pass_email;" + param1 + ";" + param2);
      }
      
      private function method_556(param1:Event = null) : void
      {
         this.var_367.x = Math.round((Main.stage.stageWidth - this.var_367.width) * 0.5);
         this.var_367.y = Math.round((Main.stage.stageHeight - this.var_367.height) * 0.5);
      }
      
      private function method_527(param1:name_991) : void
      {
         var _loc6_:Object = null;
         var _loc7_:name_993 = null;
         var _loc2_:Array = param1.name_1063.split(",");
         var _loc3_:RegExp = /(\w|[_.\-])+@((\w|-)+\.)+\w{2,4}+/;
         var _loc4_:Array = new Array();
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_.length)
         {
            _loc6_ = _loc3_.exec(_loc2_[_loc5_]);
            if(_loc6_ == null)
            {
               _loc4_.push(_loc2_[_loc5_]);
            }
            _loc5_++;
         }
         if(_loc4_.length > 0)
         {
            if(_loc4_.length == 1)
            {
               this.method_512(this.localeService.getText(TextConst.REFERAL_WINDOW_ADDRESS_NOT_VALID_ALERT_TEXT,_loc4_[0]));
            }
            else
            {
               this.method_512(this.localeService.getText(TextConst.REFERAL_WINDOW_ADDRESSES_NOT_VALID_ALERT_TEXT,_loc4_.join(", ")));
            }
         }
         else
         {
            this.modelRegister = Main.osgi.getService(name_32) as name_32;
            _loc7_ = (this.modelRegister.getModelsByInterface(name_1028) as Vector.<IModel>)[0] as name_993;
         }
      }
      
      private function method_201(param1:AlertServiceEvent) : void
      {
         this.unlock();
         if(param1.name_982 == name_358.name_990)
         {
            this.storage.data.userHash = null;
            this.storage.data.up = null;
            this.storage.flush();
            if(StartupSettings.method_129)
            {
               StartupSettings.method_130();
            }
         }
      }
      
      public function blur() : void
      {
         if(!this.var_375)
         {
            Main.stage.addEventListener(Event.RESIZE,this.method_517);
            this.method_541();
            this.dialogsLayer.addChildAt(this.name_688,0);
            this.method_517(null);
            this.var_375 = true;
         }
      }
      
      private function method_541() : void
      {
         var _loc1_:int = Main.stage.stageWidth;
         var _loc2_:int = Main.stage.stageHeight;
         this.name_688.graphics.clear();
         this.name_688.graphics.beginFill(0,0.5);
         this.name_688.graphics.drawRect(0,0,_loc1_,_loc2_);
      }
      
      private function method_517(param1:Event = null) : void
      {
         var _loc2_:int = Main.stage.stageWidth;
         var _loc3_:int = Main.stage.stageHeight;
         this.name_688.width = _loc2_;
         this.name_688.height = _loc3_;
      }
      
      public function unblur() : void
      {
         if(this.var_375)
         {
            this.dialogsLayer.removeChild(this.name_688);
            Main.stage.removeEventListener(Event.RESIZE,this.method_517);
            this.var_375 = false;
         }
      }
      
      public function method_570(param1:ClientObject, param2:String) : void
      {
         var _loc3_:Alert = new Alert();
         _loc3_.showAlert(param2,[]);
         this.dialogsLayer.addChild(_loc3_);
      }
      
      public function method_513(param1:Boolean) : void
      {
         if(!param1)
         {
            this.method_512("该身份证错误,请重新输入");
         }
         else
         {
            this.method_512("您的身份证信息已通过验证");
         }
      }
   }
}
