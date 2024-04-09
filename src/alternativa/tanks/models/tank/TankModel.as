package alternativa.tanks.models.tank
{
   import alternativa.model.class_11;
   import alternativa.osgi.OSGi;
   import alternativa.physics.collision.name_166;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.StatisticsModel;
   import alternativa.tanks.models.battlefield.class_4;
   import alternativa.tanks.models.battlefield.class_9;
   import alternativa.tanks.models.battlefield.effects.levelup.LevelUpEffect;
   import alternativa.tanks.models.battlefield.gui.IBattlefieldGUI;
   import alternativa.tanks.models.battlefield.logic.name_130;
   import alternativa.tanks.models.battlefield.name_128;
   import alternativa.tanks.models.battlefield.name_193;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.tank.spawn.name_136;
   import alternativa.tanks.models.tank.turret.name_111;
   import alternativa.tanks.models.weapon.name_213;
   import alternativa.tanks.service.settings.IBattleSettings;
   import alternativa.tanks.services.materialregistry.IMaterialRegistry;
   import alternativa.tanks.services.objectpool.IObjectPoolService;
   import alternativa.tanks.sfx.Sound3D;
   import alternativa.tanks.sfx.Sound3DEffect;
   import alternativa.tanks.sfx.name_127;
   import alternativa.tanks.sfx.name_132;
   import alternativa.tanks.sfx.name_89;
   import alternativa.tanks.utils.MathUtils;
   import alternativa.tanks.vehicles.tanks.Tank;
   import alternativa.tanks.vehicles.tanks.TankSkin;
   import flash.events.Event;
   import flash.geom.Vector3D;
   import flash.media.Sound;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import forms.name_82;
   import juho.hacking.event.HackEventDispatcher;
   import juho.hacking.event.LocalTankInitedEvent;
   import juho.hacking.event.TankSpecificationsChangedEvent;
   import package_1.Main;
   import package_13.Long;
   import package_24.LogLevel;
   import package_31.PanelModel;
   import package_31.class_1;
   import package_31.name_115;
   import package_32.class_2;
   import package_32.name_245;
   import package_33.GameActionEnum;
   import package_34.class_3;
   import package_35.class_5;
   import package_35.name_98;
   import package_36.class_6;
   import package_36.name_105;
   import package_37.Vector3;
   import package_37.name_86;
   import package_39.Model;
   import package_4.ClientObject;
   import package_40.class_10;
   import package_40.class_8;
   import package_40.TankSoundResources;
   import package_40.ClientTank;
   import package_40.name_131;
   import package_40.TankSpawnState;
   import package_41.TankSpecification;
   import package_41.TankState;
   import package_41.Vector3dData;
   import package_41.name_81;
   import package_41.TankParts;
   import package_42.TanksCollisionDetector;
   import package_42.name_73;
   import package_43.TankExplosionModel;
   import package_43.name_107;
   import package_43.name_93;
   import package_44.DefaultUserTitlesRender;
   import package_44.name_117;
   import package_44.name_99;
   import package_45.TankCriticalHitModel;
   import package_45.name_172;
   import package_45.name_91;
   import package_46.name_138;
   import package_46.name_140;
   import package_46.name_153;
   import package_46.name_158;
   import package_46.name_96;
   import package_47.BattleTeamType;
   import package_48.UserTitle;
   import package_48.name_92;
   import package_49.name_146;
   import package_49.name_163;
   import package_49.name_97;
   import package_50.name_104;
   import package_50.name_110;
   import package_51.name_152;
   import package_51.name_90;
   import package_52.WeaponsManager;
   import package_53.name_94;
   import package_54.name_102;
   import package_55.name_101;
   import package_56.name_95;
   import package_57.name_167;
   import package_57.name_174;
   import package_58.name_112;
   import package_59.name_114;
   import package_6.ClientClass;
   import package_6.ObjectRegister;
   import package_60.TextConst;
   import package_61.RayHit;
   import package_62.name_137;
   import package_63.name_162;
   import package_64.name_154;
   import package_65.name_160;
   import package_66.name_168;
   import package_67.DamageType;
   import package_68.name_175;
   import package_69.name_211;
   import package_7.name_11;
   import package_7.name_32;
   import platform.client.fp10.core.model.name_141;
   import platform.client.fp10.core.model.name_170;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.registry.name_29;
   import platform.client.fp10.core.registry.name_33;
   import platform.client.fp10.core.registry.name_45;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.types.SoundResource;
   import platform.client.fp10.core.type.name_178;
   import platform.client.fp10.core.type.name_202;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class TankModel extends class_8 implements class_12, class_2, class_10, class_11, class_6, class_5, class_1, ITank, class_4, class_3, class_9
   {
      
      public static var battleInputService:name_245;
      
      public static var battleReadinessService:name_211;
      
      public static var var_35:name_95 = OSGi.getInstance().getService(name_95) as name_95;
      
      public static var battleEventDispatcher:name_96 = OSGi.getInstance().getService(name_96) as name_96;
      
      public static var lobbyLayoutService:name_94 = OSGi.getInstance().getService(name_94) as name_94;
      
      private static const const_13:int = 5;
      
      private static const const_9:Number = 1250;
      
      private static const const_17:Number = 80000;
      
      private static const const_16:int = 4000;
      
      private static const SEND_RATE:int = 500;
      
      private static const const_7:Number = -10000;
      
      private static const const_8:int = 2500;
      
      private static const const_12:int = 5000;
      
      private static const const_10:int = 18;
      
      private static const PAUSE_KEY_CODE_1:int = 80;
      
      private static const PAUSE_KEY_CODE_2:int = 19;
      
      private static const const_11:int = 220;
      
      public static const const_14:int = 1;
      
      public static const BACK:int = 2;
      
      public static const LEFT:int = 4;
      
      public static const RIGHT:int = 8;
      
      public static const const_6:int = 16;
      
      public static const const_5:int = 32;
      
      public static const CENTER_TURRET:int = 64;
      
      public static const const_15:int = 128;
      
      private static var var_58:IMaterialRegistry = IMaterialRegistry(Main.osgi.getService(IMaterialRegistry));
       
      
      private var var_61:Number = 7000;
      
      private var var_59:Number = 7050;
      
      private var var_37:Boolean;
      
      private var var_46:int;
      
      private var var_53:int;
      
      private var var_33:Boolean;
      
      private var var_52:Boolean;
      
      public var var_26:int;
      
      private var modelService:name_32;
      
      private var battlefield:BattlefieldModel;
      
      private var gui:IBattlefieldGUI;
      
      private var var_57:name_104;
      
      private var var_56:name_97;
      
      private var var_40:ITankEventDispatcher;
      
      private var var_63:name_193;
      
      public var localUserData:TankData;
      
      public var var_36:Dictionary;
      
      private var var_45:int;
      
      private var var_48:Boolean;
      
      private var var_28:int;
      
      private var var_42:Boolean;
      
      private var var_39:Boolean;
      
      private var var_49:int;
      
      private var var_43:Boolean;
      
      private var var_38:int;
      
      private var var_44:int;
      
      private var var_34:Vector3dData;
      
      private var var_32:Vector3dData;
      
      private var var_31:Vector3dData;
      
      private var var_30:Vector3dData;
      
      private const const_4:name_86 = new name_86();
      
      private const _orientation2:name_86 = new name_86();
      
      private const const_3:Vector3 = new Vector3();
      
      private var var_51:Vector3;
      
      private var var_50:String;
      
      private var var_62:String;
      
      private var paused:Boolean;
      
      private var controlsLocked:Boolean;
      
      private var point:Vector3;
      
      private var var_47:Vector3;
      
      private var var_54:Vector3;
      
      private var var_55:RayHit;
      
      private var var_27:name_99;
      
      private var var_41:Dictionary;
      
      private var var_29:Dictionary;
      
      public var var_65:TankParts;
      
      private var panelModel:PanelModel;
      
      private var space:name_202;
      
      private var gameClass:name_178;
      
      public var var_60:Boolean = false;
      
      public var var_64:Boolean = false;
      
      public function TankModel()
      {
         this.var_36 = new Dictionary();
         this.var_34 = new Vector3dData(0,0,0);
         this.var_32 = new Vector3dData(0,0,0);
         this.var_31 = new Vector3dData(0,0,0);
         this.var_30 = new Vector3dData(0,0,0);
         this.var_51 = new Vector3(0,0,0);
         this.point = new Vector3();
         this.var_47 = new Vector3();
         this.var_54 = new Vector3();
         this.var_55 = new RayHit();
         this.var_27 = new DefaultUserTitlesRender();
         this.var_41 = new Dictionary();
         this.var_29 = new Dictionary();
         super();
         OSGi.getInstance().registerService(class_12,this);
         Main.osgi.registerService(ITank,this);
         this.panelModel = PanelModel(Main.osgi.getService(name_115));
         this.space = name_33(OSGi.getInstance().getService(name_33)).getSpace(Long.getLong(419472,230884));
         var _loc1_:Vector.<Long> = new Vector.<Long>();
         _loc1_.push(Long.getLong(1691794381,-1794202080));
         _loc1_.push(Long.getLong(500772743,-1275562344));
         _loc1_.push(Long.getLong(1519945329,-715940911));
         _loc1_.push(Long.getLong(179431987,214974876));
         _loc1_.push(Long.getLong(486222912,-663069007));
         _loc1_.push(Long.getLong(1366230363,-857495328));
         _loc1_.push(Long.getLong(1659531301,-819911951));
         _loc1_.push(Long.getLong(490108405,-1605879749));
         this.gameClass = name_45(OSGi.getInstance().getService(name_45)).createClass(Long.getLong(-763511,91532),_loc1_);
      }
      
      public static function method_86(param1:Vector3dData) : Boolean
      {
         return param1 != null && isFinite(param1.x) && isFinite(param1.y) && isFinite(param1.z);
      }
      
      public function lockControls(param1:Boolean) : void
      {
         this.controlsLocked = param1;
      }
      
      public function method_22() : void
      {
         this.method_44(1);
      }
      
      public function method_25() : void
      {
         this.method_44(-1);
      }
      
      public function method_26() : void
      {
         this.method_44(1);
      }
      
      public function method_27() : void
      {
         this.method_44(-1);
      }
      
      public function method_20() : void
      {
         this.method_44(1);
      }
      
      public function method_24() : void
      {
         this.method_44(-1);
         if(this.localUserData != null)
         {
            this.method_53();
         }
      }
      
      public function method_21() : void
      {
      }
      
      public function connect() : void
      {
      }
      
      public function disconnect() : void
      {
         if(this.localUserData != null)
         {
            this.var_33 = false;
            this.var_37 = false;
            this.localUserData.weapon.name_126(this.localUserData.user);
         }
      }
      
      public function activate() : void
      {
         var _loc1_:name_128 = null;
         if(this.battlefield != null)
         {
            _loc1_ = this.battlefield.getBattlefieldData();
            if(_loc1_ != null)
            {
               Main.stage.focus = _loc1_.viewport;
            }
         }
      }
      
      public function deactivate() : void
      {
         if(this.localUserData != null && this.localUserData.tank != null)
         {
            this.localUserData.weapon.stop();
            this.var_26 = 0;
            this.method_47(this.localUserData,0);
         }
      }
      
      public function method_29(param1:Object) : void
      {
      }
      
      public function method_30(param1:Object) : void
      {
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:TankData = this.getTankData(param1);
         if(_loc2_ == null)
         {
            return;
         }
         this.battlefield.name_147(_loc2_);
         this.method_70(_loc2_);
         if(_loc2_.tank != null)
         {
            if(_loc2_.weapon != null)
            {
               _loc2_.weapon.name_161(param1);
            }
         }
         var _loc3_:Tank = _loc2_.tank;
         _loc3_.destroy();
         _loc3_ = null;
         if(_loc2_ == this.localUserData)
         {
            TankData.localTankData = null;
            if(this.localUserData.tank != null)
            {
               this.localUserData.tank.destroy();
               this.localUserData.tank = null;
            }
            this.localUserData = null;
            this.var_27.name_116(null);
            this.battlefield.name_125(null);
            battleInputService.name_150(this);
            this.resume();
         }
         var_35.removeUser(_loc2_.object);
         this.space.name_188(_loc2_.object.id);
         this.var_40.dispatchEvent(name_77.UNLOADED,_loc2_);
         delete this.var_36[param1.id];
         TankExplosionModel(Main.osgi.getService(name_93)).objectUnloaded(_loc2_.hull);
         TankCriticalHitModel(Main.osgi.getService(name_91)).objectUnloaded(_loc2_.hull);
         _loc2_ = null;
      }
      
      private function method_70(param1:TankData) : void
      {
         var tankData:TankData = param1;
         try
         {
            battleEventDispatcher.dispatchEvent(new name_140(tankData.tank,tankData.local));
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      public function objectUnloadedFully(param1:ClientObject, param2:Boolean = false) : void
      {
         var _loc3_:TankData = this.getTankData(param1);
         if(_loc3_ == null)
         {
            return;
         }
         this.battlefield.name_147(_loc3_);
         if(_loc3_.tank != null)
         {
            if(_loc3_.weapon != null)
            {
               _loc3_.weapon.name_161(param1);
            }
         }
         var _loc4_:Tank = _loc3_.tank;
         if(_loc4_ != null)
         {
            _loc4_.destroy(param2);
         }
         _loc4_ = null;
         if(_loc3_ == this.localUserData)
         {
            TankData.localTankData = null;
            if(this.localUserData.tank != null)
            {
               this.localUserData.tank.destroy(param2);
               this.localUserData.tank = null;
            }
            this.var_27.name_116(null);
            this.battlefield.name_125(null);
            battleInputService.name_150(this);
            this.resume();
            this.localUserData = null;
         }
         WeaponsManager.objectUnloaded(_loc3_.turret);
         var_35.removeUser(_loc3_.object);
         this.var_40.dispatchEvent(name_77.UNLOADED,_loc3_);
         delete this.var_36[param1.id];
         TankExplosionModel(Main.osgi.getService(name_93)).objectUnloaded(_loc3_.hull);
         TankCriticalHitModel(Main.osgi.getService(name_91)).objectUnloaded(_loc3_.hull);
         StatisticsModel(Main.osgi.getService(IBattlefieldGUI)).userDisconnect(null,_loc3_.userName);
         _loc3_ = null;
      }
      
      public function initClientObject(param1:String, param2:String) : ClientObject
      {
         var _loc3_:ClientClass = new ClientClass(param1,null,param2);
         return new ClientObject(param1,_loc3_,param2,null);
      }
      
      public function initObject(param1:ClientObject, param2:String, param3:Number, param4:Number, param5:TankSoundResources, param6:TankParts, param7:name_131, param8:Number, param9:Number, param10:Number, param11:Number, param12:String = null, param13:int = 0, param14:String = null) : void
      {
         var _loc15_:String = null;
         if(this.modelService == null)
         {
            this.method_76();
         }
         if(Game.getInstance.var_6 == null)
         {
            _loc15_ = "TankModel::initObject() battle object not found";
            name_11.log(LogLevel.name_79,_loc15_);
            throw new Error(_loc15_);
         }
         this.method_74(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14);
      }
      
      private function method_74(param1:ClientObject, param2:String, param3:Number, param4:Number, param5:TankSoundResources, param6:TankParts, param7:name_131, param8:Number, param9:Number, param10:Number, param11:Number, param12:String = null, param13:int = 0, param14:String = null) : void
      {
         var _loc15_:ObjectRegister = param1.register;
         var _loc16_:ClientObject = Game.getInstance.var_6;
         var _loc17_:TankData = new TankData();
         _loc17_.name_84("Loaded");
         _loc17_.battlefield = _loc16_;
         _loc17_.object = this.space.name_15(Long.getLong(0,Math.random() * (param6.colorMapResourceId.low + param6.hullResourceId.low + param6.turretResourceId.low)),this.gameClass,param12);
         _loc17_.user = param1;
         _loc17_.userName = param12 == null ? PanelModel(Main.osgi.getService(name_115)).userName : param12;
         _loc17_.userRank = param13;
         _loc17_.mass = param3 <= 0 ? 1250 : param3;
         _loc17_.power = param4 <= 0 ? 80000 : param4;
         _loc17_.hull = this.initClientObject(param12 + "_hull",param12 + "_hull");
         _loc17_.turret = WeaponsManager.name_185(param14);
         _loc17_.turret.method_12(TankParts,param6);
         _loc17_.weapon = WeaponsManager.name_231(param1,_loc17_.turret,param8,param9,param10,param11);
         _loc17_.sounds = this.method_58(param5);
         param1.method_12(TankModel,_loc17_);
         this.var_36[param1.id] = _loc17_;
         this.battlefield = Main.osgi.getService(IBattleField) as BattlefieldModel;
         this.var_27 = (Main.osgi.getService(IBattleField) as BattlefieldModel).spectatorMode ? new name_117() : new DefaultUserTitlesRender();
         this.var_27.name_134(this.battlefield);
         TankExplosionModel(Main.osgi.getService(name_93)).initObject(_loc17_.hull);
         TankCriticalHitModel(Main.osgi.getService(name_91)).initObject(_loc17_.hull);
      }
      
      public function initTank(param1:ClientObject, param2:ClientTank, param3:TankParts, param4:Object, param5:Boolean = true) : void
      {
         var _loc9_:Vector.<Object> = null;
         var _loc6_:TankData = this.getTankData(param1);
         if(_loc6_ == null)
         {
            return;
         }
         _loc6_.local = param2.self;
         var _loc7_:Tank = this.method_59(_loc6_,param3,param2);
         if(_loc7_ == null || _loc6_ == null)
         {
            return;
         }
         _loc6_.tank = _loc7_;
         _loc6_.sounds.tank = _loc7_;
         _loc6_.teamType = param2.teamType;
         _loc6_.name_149 = param2.incarnationId;
         _loc6_.user = param1;
         this.method_54(_loc6_);
         this.method_50(_loc6_,param2.tankSpecification,true);
         var _loc8_:name_213 = _loc6_.weapon;
         _loc8_.name_190(param1);
         if(param2.self)
         {
            this.localUserData = _loc6_;
            this.var_27.name_116(this.localUserData);
            this.initLocalTank(_loc6_);
            this.var_28 = int.MAX_VALUE;
         }
         this.method_68(_loc6_,param4);
         _loc6_.name_84("Initialized");
         if(param2.tankState != null)
         {
            this.method_62(_loc6_,param2);
         }
         this.var_40.dispatchEvent(name_77.LOADED,_loc6_);
         battleEventDispatcher.dispatchEvent(new name_158(_loc7_,_loc6_.local));
         this.battlefield.name_237(_loc6_);
         if(param5)
         {
            StatisticsModel(Main.osgi.getService(IBattlefieldGUI)).userConnect(param1,_loc6_.userName,_loc6_.teamType,_loc6_.userName,_loc6_.userRank);
         }
         if(!_loc6_.local)
         {
            this.method_45(_loc6_);
         }
         if(_loc6_.local)
         {
            _loc6_.tank.name_135(new name_167(_loc6_.tank));
            name_112(_loc6_.object.name_176(name_112)).updateOthersResistances();
         }
         else
         {
            _loc6_.tank.name_135(new name_174(_loc6_.tank));
            if(this.var_41[param1.id] != null)
            {
               switch(this.var_41[param1.id])
               {
                  case "activate":
                     this.activateTank(param1);
                     break;
                  case "spawn":
                     _loc9_ = this.var_29[param1.id];
                     this.spawn(param1,TankSpecification(_loc9_[0]),BattleTeamType(_loc9_[1]),Vector3dData(_loc9_[2]),Vector3dData(_loc9_[3]),int(_loc9_[4]),int(_loc9_[5]));
                     this.var_29[param1.id] = null;
               }
               this.var_41[param1.id] = null;
            }
         }
         
         if (param2.self) {
            HackEventDispatcher.singleton.dispatchEvent(new LocalTankInitedEvent(_loc7_));
         }
      }
      
      private function method_68(param1:TankData, param2:Object) : void
      {
         var _loc4_:Object = null;
         var _loc5_:Long = null;
         var _loc6_:Vector.<name_90> = null;
         var _loc7_:Object = null;
         var _loc3_:name_66 = null;
         for each(_loc4_ in param2)
         {
            _loc5_ = Long.getLong(_loc4_.high,_loc4_.low);
            _loc3_ = name_29(OSGi.getInstance().getService(name_29)).getModel(_loc5_);
            if(_loc3_ != null)
            {
               Model.object = param1.object;
               if(_loc4_.name == "laser")
               {
                  _loc3_.method_18(new name_137(500,"30719","16711684",false));
               }
               else if(_loc4_.name == "shotgunAiming")
               {
                  _loc3_.method_18(param1.turret.method_16(name_162));
               }
               else if(_loc4_.name == "resistances")
               {
                  _loc6_ = new Vector.<name_90>();
                  for each(_loc7_ in _loc4_.resistances)
                  {
                     _loc6_.push(new name_90(_loc7_.percent,Lobby.getItemProperty(_loc7_.property)));
                  }
                  _loc3_.method_18(new name_152(_loc6_));
                  name_141(_loc3_).objectLoadedPost();
               }
               Model.method_38();
            }
         }
      }
      
      public function activateTank(param1:ClientObject) : void
      {
         var _loc2_:TankData = this.getTankData(param1);
         if(_loc2_ == null || _loc2_.tank == null || _loc2_.tank.skin == null || _loc2_.tank.skin.name_123 == null || _loc2_.tank.skin.name_200 == null)
         {
            name_11.log(LogLevel.name_79,"TankModel: Incorrect call of activateTank() clientObject=" + param1 + ", tankData=" + _loc2_);
            this.var_41[param1.id] = "activate";
            return;
         }
         _loc2_.name_84("Activated");
         this.method_55(_loc2_);
         if(_loc2_.local)
         {
            this.method_44(0);
         }
         this.var_40.dispatchEvent(name_77.name_253,_loc2_);
      }
      
      public function setTemperature(param1:ClientObject, param2:Number) : void
      {
         var _loc3_:TankData = this.getTankData(param1);
         if(_loc3_ == null || _loc3_.tank == null)
         {
            name_11.log(LogLevel.name_79,"TankModel: Incorrect call of setTemperature() clientObject=" + param1 + ", tankData=" + _loc3_);
            return;
         }
         this.method_80(_loc3_.tank,param2);
      }
      
      public function getTankData(param1:ClientObject) : TankData
      {
         if(param1 == null)
         {
            return null;
         }
         return TankData(param1.method_16(TankModel));
      }
      
      public function move(param1:ClientObject, param2:Vector3dData, param3:Vector3dData, param4:Vector3dData, param5:Vector3dData, param6:Number, param7:int, param8:Boolean) : void
      {
         var _loc9_:TankData = this.getTankData(param1);
         if(_loc9_ == null || _loc9_.tank == null || _loc9_ == this.localUserData)
         {
            return;
         }
         var _loc10_:Tank = _loc9_.tank;
         this.method_48(0.5,_loc10_.state.position,param2,param2);
         this.method_48(0.5,_loc10_.state.name_187,param4,param4);
         this.method_48(0.5,_loc10_.state.name_181,param5,param5);
         this.method_72(0.5,_loc10_.state.orientation,param3,param3);
         this.method_49(_loc9_,param2,param3,param4,param5,param6,param7,param8);
      }
      
      private function method_48(param1:Number, param2:Vector3, param3:Vector3dData, param4:Vector3dData) : void
      {
         param4.x = param2.x + (param3.x - param2.x) * param1;
         param4.y = param2.y + (param3.y - param2.y) * param1;
         param4.z = param2.z + (param3.z - param2.z) * param1;
      }
      
      private function method_72(param1:Number, param2:name_86, param3:Vector3dData, param4:Vector3dData) : void
      {
         this.const_4.name_222(param3.x,param3.y,param3.z);
         this._orientation2.name_205(param2,this.const_4,param1);
         this._orientation2.name_182(this.const_3);
         param4.x = this.const_3.x;
         param4.y = this.const_3.y;
         param4.z = this.const_3.z;
      }
      
      public function resetFirstSpawn() : void
      {
         this.var_39 = false;
      }
      
      public function prepareToSpawn(param1:ClientObject, param2:Vector3dData, param3:Vector3dData) : void
      {
         var _loc5_:Vector3 = null;
         var _loc6_:Vector3 = null;
         var _loc4_:TankData = this.getTankData(param1);
         if(_loc4_ == null || _loc4_.tank == null)
         {
            name_11.log(LogLevel.name_79,"TankModel: Incorrect call of prepareToSpawn() clientObject=" + param1 + ", tankData=" + _loc4_);
            return;
         }
         _loc4_.name_84("Prepare to spawn");
         _loc4_.name_78 = 0;
         this.battlefield.name_129(_loc4_);
         _loc4_.tank.name_206();
         if(this.localUserData != null && param1 == this.localUserData.user)
         {
            Model.object = this.localUserData.object;
            _loc5_ = new Vector3(param2.x,param2.y,param2.z + 200);
            _loc6_ = new Vector3(-Math.sin(param3.z),Math.cos(param3.z),0);
            if(this.var_39)
            {
               this.battlefield.name_236(_loc5_,_loc6_);
               battleReadinessService.name_228();
            }
            else
            {
               this.battlefield.name_198(_loc5_,_loc6_);
            }
            this.var_37 = false;
            name_136(name_29(OSGi.getInstance().getService(name_29)).getModel(Long.getLong(490108405,-1605879749))).prepareToSpawn(this.var_39 ? 2500 : 4500);
            Model.method_38();
         }
      }
      
      public function spawn(param1:ClientObject, param2:TankSpecification, param3:BattleTeamType, param4:Vector3dData, param5:Vector3dData, param6:int, param7:int) : void
      {
         var _loc11_:name_82 = null;
         var _loc8_:TankData = this.getTankData(param1);
         if(_loc8_ == null || _loc8_.tank == null || _loc8_.tank.skin == null)
         {
            name_11.log(LogLevel.name_79,"TankModel: Incorrect call of spawn() clientObject=" + param1 + ", tankData=" + _loc8_);
            if(param1 == null || param1.id == null)
            {
               return;
            }
            this.var_41[param1.id] = "spawn";
            this.var_29[param1.id] = new Vector.<Object>();
            this.var_29[param1.id].push(param2);
            this.var_29[param1.id].push(param3);
            this.var_29[param1.id].push(param4);
            this.var_29[param1.id].push(param5);
            this.var_29[param1.id].push(param6);
            this.var_29[param1.id].push(param7);
            return;
         }
         _loc8_.name_84("Spawn begin");
         var _loc9_:Tank = _loc8_.tank;
         if(_loc8_.local && param3 != BattleTeamType.NONE && param3 != _loc8_.teamType || _loc8_.local && this.var_39 && param3 != BattleTeamType.NONE)
         {
            _loc11_ = new name_82(5,param3 == BattleTeamType.RED ? name_82.RED : name_82.BLUE);
            _loc11_.x = Main.stage.stageWidth - _loc11_.width >> 1;
            _loc11_.y = Main.stage.stageHeight - _loc11_.height >> 1;
            Main.stage.addChild(_loc11_);
         }
         _loc8_.name_78 = 0;
         _loc8_.enabled = true;
         _loc8_.name_149 = param7;
         this.method_51(_loc8_,param6);
         _loc8_.teamType = param3;
         _loc8_.tank.title.name_227(param3);
         _loc8_.tank.title.name_239();
         this.method_50(_loc8_,param2,true);
         _loc9_.setTemperature(0);
         _loc9_.skin.name_261();
         param4.z += 200;
         _loc8_.tank.name_233();
         var _loc10_:Vector3dData = new Vector3dData(0,0,0);
         this.method_49(_loc8_,param4,param5,_loc10_,_loc10_,0,0,true);
         this.method_54(_loc8_);
         _loc8_.sounds.name_145();
         this.method_52(_loc8_);
         if(_loc8_.local)
         {
            _loc8_ = this.localUserData;
            this.var_43 = true;
            this.var_49 = getTimer() + this.battlefield.name_232();
            this.var_28 = int.MAX_VALUE;
            this.var_42 = false;
            _loc8_.tank.title.show();
            _loc8_.weapon.reset();
            this.method_44(0);
            this.method_77();
            this.var_39 = false;
            this.controlsLocked = false;
            this.battlefield.name_165().name_194(_loc9_);
         }
         else
         {
            this.method_45(_loc8_);
         }
         _loc8_.name_84("Spawned");
         _loc8_.tank.name_240();
         this.var_40.dispatchEvent(name_77.name_184,_loc8_);
      }
      
      public function kill(param1:ClientObject, param2:name_81, param3:String, param4:DamageType) : void
      {
         var _loc5_:TankData = this.getTankData(param1);
         if(_loc5_ == null || _loc5_.tank == null)
         {
            return;
         }
         this.setControlState(_loc5_,0,true);
         _loc5_.name_84("Killed");
         _loc5_.enabled = false;
         _loc5_.health = 0;
         _loc5_.name_78 = 2500;
         _loc5_.sounds.enabled = false;
         _loc5_.weapon.name_126(param1);
         _loc5_.tank.title.name_256();
         _loc5_.name_87 = TankSpawnState.SUICIDE;
         if(_loc5_.local)
         {
            this.var_33 = false;
            this.var_42 = false;
            this.var_48 = false;
            this.battlefield.name_209();
            this.var_28 = int.MAX_VALUE;
            _loc5_.tank.collisionGroup &= ~name_73.name_148;
         }
         this.method_61(_loc5_);
         this.method_63(param1,param2,param3,param4);
         this.var_40.dispatchEvent(name_77.name_192,_loc5_);
         this.stop(_loc5_);
         battleEventDispatcher.dispatchEvent(new name_154(_loc5_.object));
         this.battlefield.name_165().name_212(new name_130(getTimer() + 2500,_loc5_.tank));
      }
      
      public function changeHealth(param1:ClientObject, param2:int) : void
      {
         var _loc3_:TankData = this.getTankData(param1);
         if(_loc3_ == null || _loc3_.tank == null)
         {
            name_11.log(LogLevel.name_79,"TankModel: Incorrect call of changeHealth() clientObject=" + param1 + ", tankData=" + _loc3_);
            return;
         }
         this.method_51(_loc3_,param2);
      }
      
      public function changeSpecification(param1:ClientObject, param2:TankSpecification, param3:Boolean) : void
      {
         var _loc4_:TankData = this.getTankData(param1);
         if(_loc4_ == null || _loc4_.tank == null)
         {
            name_11.log(LogLevel.name_79,"TankModel: Incorrect call of changeSpecification() clientObject=" + param1 + ", tankData=" + _loc4_);
            return;
         }
         this.method_50(_loc4_,param2,param3);
      }
      
      public function update(param1:TankData, param2:int, param3:int, param4:Number, param5:Number, param6:Vector3) : void
      {
         var _loc7_:Tank = param1.tank;
         this.method_60(param1,param4);
         this.var_27.method_84(param1,param6);
         _loc7_.name_210(param5);
         _loc7_.name_234(param3);
         if(param1.name_78 > 0)
         {
            param1.name_78 -= param3;
            if(param1.name_78 <= 0)
            {
               param1.name_78 = 0;
               this.battlefield.name_129(param1);
            }
         }
         if(param1.local)
         {
            this.method_66(param2,param3);
         }
      }
      
      public function method_33(param1:Boolean) : void
      {
         if(this.localUserData == null)
         {
            return;
         }
         this.var_33 = false;
         this.var_26 = 0;
         this.method_47(this.localUserData,0);
         this.localUserData.weapon.disable();
         if(param1)
         {
            this.var_37 = false;
         }
      }
      
      public function method_35() : void
      {
         if(this.localUserData == null || !this.localUserData.enabled)
         {
            return;
         }
         this.var_33 = true;
         this.var_37 = true;
         this.method_47(this.localUserData,this.var_26);
         if(this.localUserData.name_87 == TankSpawnState.ACTIVE)
         {
            this.localUserData.weapon.enable();
         }
      }
      
      public function stop(param1:TankData) : void
      {
         this.setControlState(param1,0);
         param1.weapon.name_126(param1.user);
      }
      
      public function method_31(param1:Boolean) : void
      {
         if(param1)
         {
            this.var_43 = false;
         }
         this.var_38 = 0;
      }
      
      public function get userControlsEnabled() : Boolean
      {
         return this.var_33;
      }
      
      public function userStatChanged(param1:String, param2:String, param3:int) : void
      {
         var _loc5_:UserTitle = null;
         var _loc4_:TankData = this.var_36[param1];
         if(_loc4_ != null)
         {
            _loc4_.userName = param2;
            _loc4_.userRank = param3;
            if(_loc4_.tank != null)
            {
               _loc5_ = _loc4_.tank.title;
               _loc5_.name_156(param2);
               _loc5_.name_122(param3);
            }
         }
      }
      
      public function createLevelUpEffect(param1:String, param2:int) : void
      {
         var _loc4_:LevelUpEffect = null;
         var _loc5_:Sound = null;
         var _loc3_:TankData = this.var_36[param1];
         if(_loc3_ != null)
         {
            _loc4_ = new LevelUpEffect();
            _loc4_.name_220(_loc3_.tank,param2);
            _loc3_.tank.title.name_122(param2);
            _loc5_ = SoundResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,88303))).sound;
            this.method_56(_loc5_,_loc3_.tank.state.position);
         }
      }
      
      public function setUserSuspiciousness(param1:String, param2:Boolean) : void
      {
         var _loc3_:TankData = this.var_36[param1];
         if(_loc3_ != null)
         {
            _loc3_.tank.title.name_249(param2);
         }
      }
      
      private function method_56(param1:Sound, param2:Vector3) : void
      {
         var _loc3_:name_132 = this.method_79(param1,param2);
         if(_loc3_ != null)
         {
            this.battlefield.name_195(_loc3_);
         }
      }
      
      private function method_79(param1:Sound, param2:Vector3) : name_132
      {
         var _loc3_:Sound3D = Sound3D.create(param1,name_89.name_191,name_89.name_229,name_89.name_250,1.5);
         return Sound3DEffect.create(this.battlefield.getObjectPool(),null,param2,_loc3_);
      }
      
      public function createCriticalHitEffect(param1:String) : void
      {
         var _loc2_:TankData = this.var_36[param1];
         if(_loc2_ != null)
         {
            this.battlefield.name_217(new name_172(_loc2_));
         }
      }
      
      public function method_32(param1:Vector3D) : void
      {
         if(this.localUserData == null)
         {
            return;
         }
         var _loc2_:Vector3 = this.localUserData.tank.state.position;
         param1.x = _loc2_.x;
         param1.y = _loc2_.y;
         param1.z = _loc2_.z;
      }
      
      public function method_34(param1:ClientObject, param2:int, param3:int) : void
      {
         var _loc4_:TankData = this.getTankData(param1);
         if(_loc4_ == null || _loc4_.tank == null)
         {
            name_11.log(LogLevel.name_79,"TankModel::effectStarted(): Incorrect call clientObject=" + param1 + ", tankData=" + _loc4_ + ", effectId=" + param2);
            return;
         }
         _loc4_.tank.title.name_157(param2,param3);
      }
      
      public function method_36(param1:ClientObject, param2:int) : void
      {
         var _loc3_:TankData = this.getTankData(param1);
         if(_loc3_ == null || _loc3_.tank == null)
         {
            name_11.log(LogLevel.name_79,"TankModel::effectStopped(): Incorrect call clientObject=" + param1 + ", tankData=" + _loc3_ + ", effectId=" + param2);
            return;
         }
         _loc3_.tank.title.name_254(param2);
      }
      
      public function get dumperName() : String
      {
         return "tank";
      }
      
      public function dump(param1:Vector.<String>) : String
      {
         return "=== TankModel dump ===\n" + "userControlsEnabled=" + this.var_33 + "\n" + "correctionEnabled=" + this.var_37 + "\n" + "nextCorrectionTime=" + this.var_46 + "\n" + "reverseBackTurn=" + this.var_52 + "\n" + "ctrlBits=" + this.var_26 + "\n" + "uiControlLockCount=" + this.var_45 + "\n" + "suicideTime=" + this.var_28 + "\n" + "awaitingKillCommand=" + this.var_42 + "\n" + "firstSpawn=" + this.var_39 + "\n" + "activationTime=" + this.var_49 + "\n" + "idleTime=" + this.var_38 + "\n" + "idleKickPeriod=" + this.var_44 + "\n" + "=== Eend of TankModel dump ===";
      }
      
      public function chatOpened() : void
      {
         this.method_44(1);
      }
      
      public function chatClosed() : void
      {
         this.method_44(-1);
      }
      
      public function method_23(param1:Boolean) : void
      {
      }
      
      private function method_63(param1:ClientObject, param2:name_81, param3:String, param4:DamageType) : void
      {
         var _loc5_:StatisticsModel = null;
         switch(param2)
         {
            case name_81.SUICIDE:
               this.gui.logUserAction(param1.id,this.var_50);
               break;
            case name_81.name_224:
               if(param3 == param1.id)
               {
                  this.gui.logUserAction(param1.id,this.var_50);
                  break;
               }
               _loc5_ = this.gui as StatisticsModel;
               _loc5_.name_223(param3,param4,param1.id);
               break;
         }
      }
      
      private function method_76() : void
      {
         this.modelService = name_32(Main.osgi.getService(name_32));
         this.var_40 = ITankEventDispatcher(Main.osgi.getService(ITankEventDispatcher));
         this.battlefield = Main.osgi.getService(IBattleField) as BattlefieldModel;
         this.var_27 = (Main.osgi.getService(IBattleField) as BattlefieldModel).spectatorMode ? new name_117() : new DefaultUserTitlesRender();
         this.var_27.name_134(this.battlefield);
         this.gui = Main.osgi.getService(IBattlefieldGUI) as IBattlefieldGUI;
         this.var_57 = name_104(this.modelService.getModelsByInterface(name_104)[0]);
         this.var_56 = name_97(this.modelService.getModelsByInterface(name_97)[0]);
         var _loc1_:name_102 = name_102(Main.osgi.getService(name_102));
         this.var_50 = _loc1_.getText(TextConst.BATTLE_PLAYER_SUICIDED);
         this.var_62 = _loc1_.getText(TextConst.BATTLE_PLAYER_KILLED);
         var _loc2_:name_105 = name_105(Main.osgi.getService(name_105));
         if(_loc2_ != null)
         {
            _loc2_.addEventListener(this);
         }
         var _loc3_:name_98 = name_98(Main.osgi.getService(name_98));
         if(_loc3_ != null)
         {
            _loc3_.name_177(this);
         }
      }
      
      private function method_62(param1:TankData, param2:ClientTank) : void
      {
         var _loc3_:TankState = param2.tankState;
         param1.enabled = true;
         this.method_51(param1,param2.health);
         if(param2.health <= 0)
         {
            this.method_75(param1);
            param1.tank.title.hide();
         }
         else if(TankData.localTankData != null && !param2.self)
         {
            this.method_45(param1);
         }
         var _loc4_:Vector3dData = new Vector3dData(0,0,0);
         this.method_49(param1,_loc3_.position,_loc3_.orientation,_loc4_,_loc4_,_loc3_.turretAngle,_loc3_.controlBit,true);
         switch(param2.tankSpawnState)
         {
            case TankSpawnState.NEWCOME:
               this.method_52(param1);
               break;
            case TankSpawnState.ACTIVE:
               this.method_55(param1);
         }
      }
      
      private function initLocalTank(param1:TankData) : void
      {
         TankData.localTankData = param1;
         this.var_38 = 0;
         this.paused = false;
         Main.stage.focus = null;
         this.localUserData = param1;
         this.var_27.name_116(this.localUserData);
         this.battlefield.name_125(param1.user);
         this.var_39 = true;
         this.var_37 = false;
         this.var_33 = false;
         this.var_43 = false;
         this.var_44 = this.battlefield.getBattlefieldData().var_44;
         battleInputService.name_219(this);
         this.method_53();
         this.var_48 = true;
         this.battlefield.name_186(param1.tank);
         var _loc2_:UserTitle = this.localUserData.tank.title;
         _loc2_.name_122(param1.userRank);
         _loc2_.name_156(param1.userName);
         param1.health = 10000;
         _loc2_.name_133(param1.health);
         _loc2_.name_207(name_92.name_262 | name_92.WEAPON | name_92.EFFECTS);
         _loc2_.name_159(100);
         _loc2_.show();
      }
      
      private function method_64(param1:BattleTeamType, param2:BattleTeamType) : Boolean
      {
         return param1 != BattleTeamType.NONE && param1 == param2;
      }
      
      private function method_61(param1:TankData) : void
      {
         var _loc2_:name_107 = name_107(IObjectPoolService(OSGi.getInstance().getService(IObjectPoolService)).objectPool.getObject(name_107));
         _loc2_.name_248(param1);
      }
      
      private function method_60(param1:TankData, param2:Number) : void
      {
         var _loc3_:Tank = param1.tank;
         _loc3_.name_121().method_60(param2);
      }
      
      private function method_84(param1:TankData, param2:Vector3D) : void
      {
         var _loc4_:Vector3 = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc3_:Tank = param1.tank;
         if(param1.health <= 0)
         {
            param1.tank.title.hide();
         }
         else if(!param1.local && this.localUserData != null)
         {
            if(!this.method_64(this.localUserData.teamType,param1.teamType))
            {
               _loc4_ = _loc3_.state.position;
               _loc5_ = _loc4_.x - param2.x;
               _loc6_ = _loc4_.y - param2.y;
               _loc7_ = _loc4_.z - param2.z;
               _loc8_ = Math.sqrt(_loc5_ * _loc5_ + _loc6_ * _loc6_ + _loc7_ * _loc7_);
               if(_loc8_ >= this.var_59 || this.method_67(param1,param2))
               {
                  _loc3_.title.hide();
               }
               else if(_loc8_ < this.var_61)
               {
                  _loc3_.title.show();
               }
            }
            else
            {
               _loc3_.title.show();
            }
         }
      }
      
      private function method_67(param1:TankData, param2:Vector3D) : Boolean
      {
         var _loc3_:TanksCollisionDetector = this.battlefield.getBattlefieldData().name_247;
         var _loc4_:Vector.<Vector3> = param1.tank.name_264;
         var _loc5_:int = int(_loc4_.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            this.point.vCopy(_loc4_[_loc6_]);
            if(this.method_81(this.point,param1,param2,_loc3_))
            {
               return false;
            }
            _loc6_++;
         }
         return true;
      }
      
      private function method_81(param1:Vector3, param2:TankData, param3:Vector3D, param4:TanksCollisionDetector) : Boolean
      {
         param1.vTransformBy3(param2.tank.name_225);
         param1.vAdd(param2.tank.state.position);
         this.var_47.copyFromVector3D(param3);
         this.var_54.diff(param1,this.var_47);
         return !param4.name_251(this.var_47,this.var_54,name_73.name_252,1,null,this.var_55);
      }
      
      public function method_82() : void
      {
         this.var_60 = true;
      }
      
      public function method_73(param1:ClientObject) : void
      {
         Network(Main.osgi.getService(name_2)).send("battle;activate_tank");
      }
      
      private function method_66(param1:int, param2:int) : void
      {
         var _loc3_:Vector3 = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(this.localUserData.enabled)
         {
            _loc3_ = this.localUserData.tank.state.position;
            if(param1 >= this.var_28 || _loc3_.z < -10000)
            {
               this.method_57(_loc3_);
            }
            _loc4_ = Number(this.localUserData.weapon.update(param1,param2));
            this.localUserData.tank.title.name_159(100 * _loc4_);
            if(this.localUserData.name_87 != TankSpawnState.ACTIVE && param1 >= this.var_49 && this.localUserData.name_197 == 0)
            {
               this.var_49 = int.MAX_VALUE;
               this.method_73(this.localUserData.user);
            }
         }
         if(this.localUserData.name_78 == 0 && !this.paused && !this.var_48)
         {
            this.var_48 = true;
         }
         if(this.localUserData.tank.name_180().name_199() > 0)
         {
            if(this.var_37 && param1 >= this.var_46)
            {
               this.localUserData.tank.name_113(this.var_34,this.var_32,this.var_31,this.var_30);
               this.method_46(this.localUserData.user,param1,this.var_34,this.var_32,this.var_31,this.var_30,this.localUserData.tank.turretDir,this.localUserData.ctrlBits);
               this.var_46 += SEND_RATE;
            }
            if(this.var_37 && param1 >= this.var_53)
            {
               if(int((this.localUserData.ctrlBits & 4) != 0) - int((this.localUserData.ctrlBits & 8) != 0) != 0)
               {
                  this.localUserData.tank.name_113(this.var_34,this.var_32,this.var_31,this.var_30);
                  this.method_46(this.localUserData.user,param1,this.var_34,this.var_32,this.var_31,this.var_30,this.localUserData.tank.turretDir,this.localUserData.ctrlBits);
                  this.var_53 += 750;
               }
            }
         }
         else
         {
            _loc5_ = Math.abs(Vector3.distanceBetween(this.localUserData.tank.state.position,this.var_51));
            if(_loc5_ > 500)
            {
               this.localUserData.tank.name_113(this.var_34,this.var_32,this.var_31,this.var_30);
               this.method_46(this.localUserData.user,param1,this.var_34,this.var_32,this.var_31,this.var_30,this.localUserData.tank.turretDir,this.localUserData.ctrlBits);
               this.var_51.vCopy(this.localUserData.tank.state.position);
            }
         }
         if(this.paused || this.var_43)
         {
            this.method_65(param2);
         }
         if(this.paused)
         {
            this.gui.name_244((this.var_44 - this.var_38) / 1000);
         }
      }
      
      private function method_46(param1:ClientObject, param2:int, param3:Vector3dData, param4:Vector3dData, param5:Vector3dData, param6:Vector3dData, param7:Number, param8:int) : void
      {
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         if(this.controlsLocked)
         {
            param8 = 0;
            _loc9_ = ((this.localUserData.ctrlBits & TankModel.const_6 || this.localUserData.ctrlBits & TankModel.LEFT) >> 4) - ((this.localUserData.ctrlBits & TankModel.const_5 || this.localUserData.ctrlBits & TankModel.RIGHT) >> 5);
            _loc10_ = ((this.localUserData.ctrlBits & TankModel.LEFT) >> 2) - ((this.localUserData.ctrlBits & TankModel.RIGHT) >> 3);
            if(_loc9_ == 0)
            {
               _loc9_ = _loc10_;
            }
            if(_loc9_ == 1)
            {
               param8 = TankModel.const_6;
            }
            else if(_loc9_ == -1)
            {
               param8 = TankModel.const_5;
            }
            else if(_loc9_ == 0 && (this.localUserData.ctrlBits & TankModel.CENTER_TURRET) != 0)
            {
               param8 = TankModel.CENTER_TURRET;
            }
         }
         Network(Main.osgi.getService(name_2)).send("battle;move;" + (param3.x + "@" + param3.y + "@" + param3.z) + "@" + (param4.x + "@" + param4.y + "@" + param4.z) + "@" + (param5.x + "@" + param5.y + "@" + param5.z) + "@" + (param6.x - 10000000000000000000 + "@" + param6.y + "@" + param6.z) + ";" + param7 + ";" + param8 + ";" + 1);
      }
      
      private function method_57(param1:Vector3) : void
      {
         if(!this.var_42)
         {
            this.var_28 = int.MAX_VALUE;
            this.var_42 = true;
            this.method_71(this.localUserData.user,name_81.SUICIDE,new Vector3dData(param1.x,param1.y,param1.z));
         }
      }
      
      private function method_71(param1:ClientObject, param2:name_81, param3:Vector3dData) : void
      {
         Network(Main.osgi.getService(name_2)).send("battle;suicide");
      }
      
      private function method_65(param1:int) : void
      {
         if(this.var_38 >= this.var_44 && this.var_43)
         {
            Network(Main.osgi.getService(name_2)).send("battle;idle_kick");
            this.var_43 = false;
         }
         else
         {
            this.var_38 += param1;
         }
      }
      
      private function method_52(param1:TankData) : void
      {
         param1.name_87 = TankSpawnState.NEWCOME;
         param1.tank.collisionGroup = name_73.name_171;
         param1.tank.name_142 = name_73.name_183;
         param1.tank.skin.name_123.alpha = 0.5;
         param1.tank.skin.name_144().alpha = 0.5;
         param1.tank.name_169 = name_166(this.battlefield);
      }
      
      private function method_55(param1:TankData) : void
      {
         param1.name_87 = TankSpawnState.ACTIVE;
         param1.tank.collisionGroup = name_73.name_171 | name_73.name_151 | name_73.WEAPON;
         if(param1 == TankData.localTankData)
         {
            param1.tank.collisionGroup |= name_73.name_148;
         }
         param1.tank.name_142 = name_73.name_151;
         param1.tank.skin.name_123.alpha = 1;
         param1.tank.skin.name_144().alpha = 1;
         param1.tank.name_169 = null;
      }
      
      public function method_28(param1:GameActionEnum, param2:Boolean) : void
      {
         this.var_38 = 0;
         if(param2)
         {
            if(this.paused)
            {
               this.resume();
            }
            else if(param1 == GameActionEnum.BATTLE_PAUSE && this.var_45 == 0)
            {
               this.pause();
            }
         }
         switch(param1)
         {
            case GameActionEnum.CHASSIS_FORWARD_MOVEMENT:
               this.var_26 = MathUtils.name_85(this.var_26,1,param2);
               break;
            case GameActionEnum.CHASSIS_BACKWARD_MOVEMENT:
               this.var_26 = MathUtils.name_85(this.var_26,2,param2);
               break;
            case GameActionEnum.CHASSIS_LEFT_MOVEMENT:
               this.var_26 = MathUtils.name_85(this.var_26,4,param2);
               break;
            case GameActionEnum.CHASSIS_RIGHT_MOVEMENT:
               this.var_26 = MathUtils.name_85(this.var_26,8,param2);
               break;
            case GameActionEnum.ROTATE_TURRET_LEFT:
               this.var_26 = MathUtils.name_85(this.var_26,16,param2);
               break;
            case GameActionEnum.ROTATE_TURRET_RIGHT:
               this.var_26 = MathUtils.name_85(this.var_26,32,param2);
               break;
            case GameActionEnum.CENTER_TURRET:
               this.var_26 = MathUtils.name_85(this.var_26,64,true);
         }
         if(this.var_33)
         {
            if(this.var_52)
            {
               this.var_26 |= 128;
            }
            else
            {
               this.var_26 &= ~128;
            }
            this.method_47(this.localUserData,this.var_26,!this.controlsLocked);
         }
         if(param1 == GameActionEnum.SUICIDE)
         {
            this.method_78();
         }
      }
      
      private function method_78() : void
      {
         if(this.localUserData.name_87 == TankSpawnState.ACTIVE && this.var_33 && !this.var_42 && this.var_28 == int.MAX_VALUE)
         {
            this.var_28 = getTimer() + 5000;
            this.battlefield.name_221(5000);
         }
      }
      
      private function method_51(param1:TankData, param2:int) : void
      {
         param1.health = param2;
         param1.tank.title.name_133(param2);
         if(param1.local)
         {
            this.var_56.name_179(name_163.name_196,name_146.name_203,param2 >= 10000);
         }
      }
      
      private function method_50(param1:TankData, param2:TankSpecification, param3:Boolean) : void
      {
         param1.tank.setMaxSpeed(param2.speed * 100,param3);
         param1.tank.setMaxTurnSpeed(param2.turnSpeed,param3);
         param1.tank.setMaxTurretTurnSpeed(param2.turretRotationSpeed,param3);
         param1.tank.setTurretTurnAcceleration(param2.turretRotationSpeed);
         
         HackEventDispatcher.singleton.dispatchEvent(new TankSpecificationsChangedEvent(param1.tank));
      }
      
      private function method_49(param1:TankData, param2:Vector3dData, param3:Vector3dData, param4:Vector3dData, param5:Vector3dData, param6:Number, param7:int, param8:Boolean) : void
      {
         if(param2 != null && param3 != null && param4 != null && param5 != null)
         {
            param1.tank.name_243(param2,param3,param4,param5);
            this.setControlState(param1,param7,param8);
            param1.tank.turretDir = param6;
         }
      }
      
      private function method_59(param1:TankData, param2:TankParts, param3:ClientTank) : Tank
      {
         var _loc4_:Tanks3DSResource = Tanks3DSResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(param2.hullResourceId));
         var _loc5_:Tanks3DSResource = Tanks3DSResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(param2.turretResourceId));
         var _loc6_:Resource = ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(param2.colorMapResourceId);
         var _loc7_:Resource = ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,926352));
         if(_loc6_ == null)
         {
            return null;
         }
         var _loc8_:TankSkin = new TankSkin(_loc4_,_loc5_,_loc6_,_loc7_);
         if(param1 == null || this.battlefield == null || this.battlefield.getBattlefieldData() == null || this.battlefield.getBattlefieldData().viewport == null)
         {
            _loc8_.destroy();
            _loc8_ = null;
            return null;
         }
         var _loc9_:name_101 = new name_101(param1);
         var _loc10_:Tank = new Tank(_loc8_,param1,param1.mass,param3.speedCharacteristics,param1.local,param1.local ? this.battlefield.getBattlefieldData().viewport.name_230() : this.battlefield.getBattlefieldData().viewport.name_257());
         _loc10_.name_238(_loc9_);
         Model.object = param1.object;
         putData(Tank,_loc10_);
         putData(UserTitle,_loc10_.title);
         putData(name_101,_loc9_);
         if(param1.local)
         {
            putData(name_111,new name_111(param1));
            putData(name_114,new name_114(param1.object));
         }
         name_170(name_29(OSGi.getInstance().getService(name_29)).getModel(Long.getLong(490108405,-1605879749))).objectLoaded();
         Model.method_38();
         var_35.addUser(param1.object);
         return _loc10_;
      }
      
      public function onRearmorScheduled(param1:int) : void
      {
         if(this.var_28 == int.MAX_VALUE)
         {
            battleEventDispatcher.dispatchEvent(new name_168(param1));
            this.var_28 = getTimer() + param1;
         }
      }
      
      private function method_87(param1:Vector3D) : Vector3
      {
         return new Vector3(param1.x,param1.y,param1.z);
      }
      
      private function method_54(param1:TankData) : void
      {
         param1.tank.skin.method_55();
      }
      
      private function method_75(param1:TankData) : void
      {
         param1.tank.skin.name_242();
      }
      
      public function method_85(param1:TankData, param2:Number) : void
      {
         Network(Main.osgi.getService(name_2)).send("battle;rotate_turret;" + param2);
      }
      
      public function rotateTurretTo(param1:ClientObject, param2:Number) : void
      {
         var _loc3_:TankData = this.getTankData(param1);
         if(_loc3_ == null || _loc3_.tank == null || _loc3_ == this.localUserData)
         {
            return;
         }
         var _loc4_:Tank = _loc3_.tank;
         _loc4_.name_121().name_226(param2);
      }
      
      public function method_47(param1:TankData, param2:int, param3:Boolean = true) : void
      {
         var _loc4_:int = 0;
         if(param1.enabled && param1.ctrlBits != param2)
         {
            this.setControlState(param1,param2);
            param1.tank.name_113(this.var_34,this.var_32,this.var_31,this.var_30);
            _loc4_ = getTimer();
            if(param3 || param1.tank.name_121() is name_160)
            {
               this.method_46(this.localUserData.user,_loc4_,this.var_34,this.var_32,this.var_31,this.var_30,param1.tank.turretDir,param2);
               this.var_46 = _loc4_ + 4000;
            }
         }
      }
      
      public function setControlState(param1:TankData, param2:int, param3:Boolean = false) : void
      {
         var _loc4_:Number = NaN;
         if(!param1 || !param1.enabled)
         {
            return;
         }
         param1.ctrlBits = param2;
         if(this.controlsLocked && !param3)
         {
            return;
         }
         var _loc5_:int = int((param2 & 1) != 0) - int((param2 & 2) != 0);
         var _loc6_:Number = int((param2 & 4) != 0) - int((param2 & 8) != 0);
         var _loc7_:Tank = param1.tank;
         param1.tank.name_260(_loc5_,_loc6_,(param2 & 128) != 0);
         if(_loc5_ != 0)
         {
            param1.sounds.name_189();
         }
         else if(_loc6_ != 0)
         {
            param1.sounds.name_241();
         }
         else
         {
            param1.sounds.name_145();
         }
      }
      
      private function method_44(param1:int) : void
      {
         this.var_45 += param1;
         if(this.var_45 <= 0)
         {
            this.method_35();
         }
         else
         {
            this.method_33(false);
         }
      }
      
      private function method_53() : void
      {
         var _loc1_:IBattleSettings = IBattleSettings(Main.osgi.getService(IBattleSettings));
         this.var_52 = _loc1_.inverseBackDriving;
      }
      
      private function method_58(param1:TankSoundResources) : name_127
      {
         var _loc2_:Sound = SoundResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(param1.engineIdleSoundId)).sound;
         var _loc3_:Sound = SoundResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(param1.engineStartMovingSoundId)).sound;
         var _loc4_:Sound = SoundResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(param1.engineMovingSoundId)).sound;
         var _loc5_:Sound = SoundResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(param1.turretRotationSoundId)).sound;
         return new name_127(null,null,_loc2_,_loc3_,_loc4_,_loc5_);
      }
      
      public function pause() : void
      {
         this.paused = true;
         this.gui.name_173(true);
         battleEventDispatcher.dispatchEvent(new name_138(this.var_44));
      }
      
      public function resume() : void
      {
         this.paused = false;
         this.gui.name_173(false);
         if(!lobbyLayoutService.name_215())
         {
            battleEventDispatcher.dispatchEvent(new name_153());
         }
      }
      
      private function method_77() : void
      {
         var _loc2_:TankData = null;
         var _loc3_:* = undefined;
         var _loc4_:Vector.<name_110> = null;
         var _loc5_:int = 0;
         var _loc6_:name_110 = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc1_:name_128 = this.battlefield.getBattlefieldData();
         for(_loc3_ in _loc1_.name_263)
         {
            _loc2_ = _loc3_;
            if(_loc2_ != this.localUserData || !_loc2_.local)
            {
               this.method_45(_loc2_);
               _loc4_ = this.var_57.name_259(_loc2_.user.id);
               if(_loc4_ != null)
               {
                  _loc5_ = getTimer();
                  for each(_loc6_ in _loc4_)
                  {
                     _loc7_ = _loc5_ - _loc6_.name_218;
                     _loc8_ = _loc6_.duration - _loc7_;
                     if(_loc8_ > 0)
                     {
                        _loc2_.tank.title.name_157(_loc6_.effectId,_loc8_);
                     }
                  }
               }
            }
         }
      }
      
      private function method_45(param1:TankData) : void
      {
         this.var_27.name_255(param1);
      }
      
      private function method_80(param1:Tank, param2:Number) : void
      {
         if(param1 == null || param1.skin == null)
         {
            return;
         }
         param1.setTemperature(param2);
      }
      
      public function getTank() : Tank
      {
         return Tank(getData(Tank));
      }
      
      public function method_41() : Boolean
      {
         return this.localUserData != null && this.localUserData.object != null;
      }
      
      public function method_43() : name_70
      {
         if(!this.method_41())
         {
            throw new Error("Incorrect call method \'getLocalTank\' because local tank was not loaded");
         }
         return this.localUserData.object;
      }
      
      public function method_40() : name_70
      {
         return this.localUserData.object;
      }
      
      public function method_42() : Tank
      {
         return ITank(this.method_43().name_176(ITank)).getTank();
      }
      
      public function isLocal() : Boolean
      {
         return this.getTank() == null ? false : this.getTank().tankData.local;
      }
   }
}
