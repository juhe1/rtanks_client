package alternativa.tanks.models.battlefield
{
   import alternativa.engine3d.containers.KDContainer;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Light3D;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.RayIntersectionData;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Decal;
   import alternativa.engine3d.objects.SkyBox;
   import alternativa.model.class_11;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.dump.name_524;
   import alternativa.physics.collision.name_166;
   import alternativa.physics.collision.CollisionPrimitive;
   import alternativa.physics.Body;
   import alternativa.proplib.PropLibRegistry;
   import alternativa.tanks.battle.BattleRunner;
   import alternativa.tanks.battle.name_712;
   import alternativa.tanks.config.name_669;
   import alternativa.tanks.models.battlefield.gui.IBattlefieldGUI;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.class_15;
   import alternativa.tanks.models.tank.ITank;
   import alternativa.tanks.models.tank.ITankEventDispatcher;
   import alternativa.tanks.models.tank.name_77;
   import alternativa.tanks.models.weapon.shared.name_651;
   import alternativa.tanks.models.weapon.shared.name_653;
   import alternativa.tanks.service.settings.IBattleSettings;
   import alternativa.tanks.services.materialregistry.IMaterialRegistry;
   import alternativa.tanks.services.objectpool.IObjectPoolService;
   import alternativa.tanks.sfx.Sound3D;
   import alternativa.tanks.sfx.Sound3DEffect;
   import alternativa.tanks.sfx.name_132;
   import alternativa.tanks.sfx.name_657;
   import alternativa.tanks.sfx.name_691;
   import alternativa.tanks.sfx.name_89;
   import alternativa.tanks.vehicles.tanks.Tank;
   import alternativa.tanks.vehicles.tanks.TankSkin;
   import alternativa.utils.DebugPanel;
   import com.alternativaplatform.projects.tanks.client.models.battlefield.class_13;
   import com.alternativaplatform.projects.tanks.client.models.battlefield.name_306;
   import com.alternativaplatform.projects.tanks.client.models.battlefield.name_676;
   import com.alternativaplatform.projects.tanks.client.models.battlefield.name_716;
   import controls.SuicideIndicator;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.geom.Rectangle;
   import flash.geom.Vector3D;
   import flash.media.SoundTransform;
   import flash.net.SharedObject;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import package_1.Main;
   import package_12.name_24;
   import package_13.Long;
   import package_172.name_531;
   import package_175.name_539;
   import package_188.name_560;
   import package_20.GameClass;
   import package_20.GameObject;
   import package_238.ObjectPool;
   import package_239.SoundManager;
   import package_239.name_655;
   import package_24.LogLevel;
   import package_240.DecalFactory;
   import package_240.FadingDecalsRenderer;
   import package_240.name_656;
   import package_240.name_682;
   import package_241.class_14;
   import package_241.name_659;
   import package_242.name_662;
   import package_242.name_679;
   import package_243.name_673;
   import package_244.Dust;
   import package_245.name_683;
   import package_246.BattlefieldMessages;
   import package_247.name_684;
   import package_248.name_677;
   import package_249.HidableGraphicObjects;
   import package_250.name_698;
   import package_251.name_690;
   import package_31.class_1;
   import package_31.name_115;
   import package_32.class_2;
   import package_32.name_245;
   import package_32.name_665;
   import package_33.GameActionEnum;
   import package_33.name_276;
   import package_34.class_3;
   import package_36.class_6;
   import package_36.name_105;
   import package_37.Vector3;
   import package_39.Model;
   import package_4.ClientObject;
   import package_41.Vector3dData;
   import package_42.TankBodyIdProvider;
   import package_42.TanksCollisionDetector;
   import package_46.name_689;
   import package_46.name_697;
   import package_46.name_704;
   import package_46.name_715;
   import package_46.name_96;
   import package_53.name_94;
   import package_59.ControlsMiniHelpSupport;
   import package_59.name_671;
   import package_6.ObjectRegister;
   import package_61.name_767;
   import package_69.name_211;
   import package_7.name_11;
   import package_7.name_28;
   import package_7.name_32;
   import package_75.name_274;
   import package_76.FollowCameraController;
   import package_76.name_654;
   import package_76.name_658;
   import package_76.name_681;
   import package_76.name_709;
   import package_76.name_733;
   import package_76.name_735;
   import package_77.SpectatorCameraController;
   import package_88.BonusRegionService;
   import package_88.name_695;
   import package_95.IStorageService;
   import package_97.BonusCommonModel;
   import package_99.BattleMinesModel;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.registry.name_29;
   import platform.client.fp10.core.registry.name_33;
   import platform.client.fp10.core.type.name_202;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.clients.flash.resources.resource.MapResource;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class BattlefieldModel extends class_13 implements name_306, IBattleField, class_11, class_14, class_6, class_1, name_166, class_3, class_15, class_2
   {
      
      public static var battleInputService:name_245;
      
      public static var keysBindingService:name_276;
      
      public static var battleReadinessService:name_211;
      
      public static var modelRegistry:name_29;
      
      public static var battleInfoService:name_274;
      
      public static var battleEventDispatcher:name_96;
      
      public static var lobbyLayoutService:name_94;
      
      private static const const_41:Number = 5.8;
      
      private static const const_38:String = "battle";
      
      private static const const_36:int = 33;
      
      private static const const_37:int = 200;
      
      private static const const_40:int = 3500;
      
      private static const const_39:int = 10;
      
      private static const const_35:int = 20000;
      
      private static const const_28:Vector3D = new Vector3D();
      
      private static const const_29:Vector3D = new Vector3D();
      
      private static const const_31:Class = name_710;
      
      private static const const_32:Class = name_713;
       
      
      private var var_138:IObjectPoolService;
      
      private var var_58:IMaterialRegistry;
      
      private var var_150:name_32;
      
      private const const_30:name_668 = new name_668();
      
      private var var_133:DebugPanel;
      
      private var var_123:TankModel;
      
      private var var_149:name_653;
      
      private var var_145:name_651;
      
      private var var_120:name_655;
      
      public var var_117:name_128;
      
      private var var_132:SuicideIndicator;
      
      private var var_127:int = 10;
      
      public var screenSize:int;
      
      private var var_119:Vector.<name_652>;
      
      private var var_124:int;
      
      private var border:name_675;
      
      private var var_139:Number = 0;
      
      private var var_144:Boolean;
      
      private var var_141:Boolean;
      
      private var var_167:Error;
      
      private var var_136:int;
      
      private var var_137:int;
      
      private var var_122:name_654;
      
      private var var_118:name_733;
      
      private var var_134:name_681;
      
      private var var_125:SpectatorCameraController;
      
      private var var_142:Vector3;
      
      private var var_143:Vector3;
      
      private var startTime:int;
      
      private var var_155:int;
      
      public var var_164:int;
      
      private var var_157:int;
      
      private var gui:IBattlefieldGUI;
      
      private var var_161:Boolean;
      
      private var var_129:int;
      
      private var var_148:name_679;
      
      private var var_151:name_662;
      
      private var muteSound:Boolean;
      
      private var var_121:BattleRunner;
      
      private var var_131:BonusRegionService;
      
      private var var_163:name_677;
      
      private var var_128:name_284;
      
      public var spectatorMode:Boolean;
      
      private var shadows:name_684;
      
      private var var_126:Dust;
      
      private var var_162:DecalFactory;
      
      private const const_33:name_682 = new name_682();
      
      private const const_34:Dictionary = new Dictionary();
      
      public var var_160:FadingDecalsRenderer;
      
      public var var_156:name_662;
      
      public var var_153:name_662;
      
      public var var_158:name_662;
      
      public var var_140:Dictionary;
      
      public var hidableObjects:HidableGraphicObjects;
      
      private var var_146:name_683;
      
      public var var_166:Boolean;
      
      private var var_165:Boolean = true;
      
      private var var_154:Boolean;
      
      private var var_135:name_669;
      
      private var name_247:TanksCollisionDetector;
      
      public var var_130:Vector.<Object>;
      
      public var var_147:Vector.<Object>;
      
      public var messages:BattlefieldMessages;
      
      public var var_159:PropLibRegistry;
      
      public var mapResourceId:String;
      
      public var var_152:Long;
      
      public function BattlefieldModel()
      {
         this.screenSize = this.var_127;
         this.border = new name_675();
         this.var_142 = new Vector3();
         this.var_143 = new Vector3();
         this.var_148 = new name_679("tankexpl_soffset",0,0,1000);
         this.var_151 = new name_662("tankexpl_svolume",0.4,0,1);
         this.hidableObjects = new HidableGraphicObjects();
         this.var_159 = new PropLibRegistry();
         super();
         this.var_156 = new name_662("shf",0.05,-100,100);
         this.var_153 = new name_662("shv",0.05,-100,100);
         this.var_158 = new name_662("shav",0.2,-100,100);
         this.var_130 = new Vector.<Object>();
         this.var_147 = new Vector.<Object>();
         this.var_138 = IObjectPoolService(Main.osgi.getService(IObjectPoolService));
         this.var_58 = IMaterialRegistry(Main.osgi.getService(IMaterialRegistry));
         this.var_150 = name_32(Main.osgi.getService(name_32));
         this.var_131 = new BonusRegionService(this);
         name_709.name_725();
         this.var_140 = new Dictionary();
      }
      
      public static function copyToVector3D(param1:Vector3, param2:Vector3D) : void
      {
         param2.x = param1.x;
         param2.y = param1.y;
         param2.z = param1.z;
      }
      
      public function method_22() : void
      {
         this.method_158(1);
      }
      
      public function method_25() : void
      {
         this.method_158(-1);
      }
      
      public function method_26() : void
      {
         this.method_158(1);
      }
      
      public function method_27() : void
      {
         this.method_158(-1);
      }
      
      public function method_20() : void
      {
         this.method_158(1);
      }
      
      public function method_24() : void
      {
         this.method_158(-1);
      }
      
      public function method_21() : void
      {
         this.method_158(-1);
         if(this.var_117 == null)
         {
            return;
         }
         var _loc1_:IBattleSettings = this.method_159();
         if(_loc1_ != null)
         {
            this.var_117.skybox.visible = _loc1_.showSkyBox;
            this.var_128.name_674(_loc1_.adaptiveFPS);
            if(this.var_117.name_664 == null && Boolean(_loc1_.bgSound) || this.var_117.name_664 != null && !_loc1_.bgSound)
            {
               this.method_172();
            }
            this.var_117.viewport.name_719(_loc1_.graphicsAutoQuality,this.mapResourceId);
            if(!_loc1_.graphicsAutoQuality)
            {
               this.var_117.viewport.name_711(_loc1_.fog);
               this.var_117.viewport.name_706(_loc1_.softParticles);
               this.var_117.viewport.name_705(_loc1_.antialiasing);
               this.var_126.enabled = _loc1_.dust;
               this.var_117.viewport.name_687(_loc1_.dynamicShadows);
               this.var_117.viewport.name_692(_loc1_.dynamicLighting);
               this.var_117.viewport.name_721(_loc1_.shadows);
               this.var_117.viewport.name_722(_loc1_.ssao);
            }
            this.var_117.viewport.name_702(true);
            this.var_58.useMipMapping = _loc1_.mipMapping;
         }
      }
      
      public function connect() : void
      {
      }
      
      public function disconnect() : void
      {
         this.method_162();
         this.method_170();
         this.var_120.name_686();
      }
      
      public function getBattlefieldData() : name_128
      {
         return this.var_117;
      }
      
      public function initObject(param1:ClientObject, param2:name_716, param3:name_676, param4:int, param5:String, param6:Long, param7:int, param8:Number, param9:name_673, param10:Boolean, param11:Boolean) : void
      {
         var networkService:name_105 = null;
         var modelService:name_32 = null;
         var dumpService:name_524 = null;
         var clientObject:ClientObject = param1;
         var battlefieldResources:name_716 = param2;
         var battlefieldSoundScheme:name_676 = param3;
         var idleKickPeriodMsec:int = param4;
         var mapDescriptorResourceId:String = param5;
         var mapResourceId:Long = param6;
         var respawnInvulnerabilityPeriodMsec:int = param7;
         var gravity:Number = param8;
         var skybox:name_673 = param9;
         var spectator:Boolean = param10;
         var reArmorEnabled:Boolean = param11;
         try
         {
            this.var_144 = Main.osgi.getService(name_531) != null;
            this.spectatorMode = spectator;
            battleInfoService.spectatorMode = spectator;
            battleInfoService.currentBattleId = Long.getLong(0,0);
            battleInfoService.name_720(true);
            battleInfoService.reArmorEnabled = reArmorEnabled;
            this.var_129 = 2;
            this.var_161 = false;
            this.var_123 = Main.osgi.getService(ITank) as TankModel;
            networkService = Main.osgi.getService(name_105) as name_105;
            if(networkService != null)
            {
               networkService.addEventListener(this);
            }
            modelService = name_32(Main.osgi.getService(name_32));
            this.gui = Main.osgi.getService(IBattlefieldGUI) as IBattlefieldGUI;
            this.var_117 = new name_128();
            this.var_117.bfObject = clientObject;
            this.var_117.name_685 = new GameObject(Long.getLong(-2281337,1337228),new GameClass(Long.getLong(726910,-261930),Vector.<Long>([])),"BattleObject",null);
            this.var_117.name_661 = (Main.osgi.getService(name_24) as name_24).contentLayer;
            this.var_117.name_661.visible = false;
            this.var_117.name_707 = respawnInvulnerabilityPeriodMsec;
            this.var_117.var_44 = idleKickPeriodMsec;
            this.method_181(battlefieldSoundScheme);
            this.mapResourceId = mapDescriptorResourceId;
            this.var_152 = mapResourceId;
            this.method_185(gravity);
            this.method_175(mapDescriptorResourceId,skybox);
            this.var_163 = new name_677(this);
            this.var_131.prepare();
            dumpService = name_524(Main.osgi.getService(name_524));
            if(dumpService != null)
            {
               dumpService.registerDumper(this);
            }
            this.startTime = getTimer();
            this.var_155 = 0;
            this.var_164 = 0;
            this.var_157 = 0;
         }
         catch(e:Error)
         {
            OSGi.clientLog.log("BattlefieldModel",e.getStackTrace());
         }
      }
      
      public function method_202(param1:name_695) : *
      {
         this.var_131.name_785(param1);
      }
      
      public function method_203(param1:name_695) : *
      {
         this.var_131.name_728(param1);
      }
      
      public function addBonus(param1:ClientObject, param2:String, param3:Long, param4:Long, param5:Long, param6:Long, param7:Vector3dData, param8:Boolean, param9:int = 21) : void
      {
         this.method_184(param1.register,param2,param3,param4,param5,param6,param7,0,true,param1,param9,param8);
      }
      
      public function removeBonus(param1:ClientObject, param2:String) : void
      {
         if(this.var_117 == null)
         {
            return;
         }
         var _loc3_:name_659 = this.var_117.name_663[param2];
         if(_loc3_ != null)
         {
            _loc3_.name_748();
         }
      }
      
      public function bonusTaken(param1:ClientObject, param2:String) : void
      {
         var _loc4_:Sound3D = null;
         var _loc5_:Vector3 = null;
         if(this.var_117 == null)
         {
            return;
         }
         var _loc3_:name_659 = this.var_117.name_663[param2];
         if(_loc3_ == null)
         {
            name_11.log(LogLevel.name_79,"BattlefieldModel::bonusTaken(): bonus not found. Bonus id=" + param2);
         }
         else
         {
            _loc3_.name_741();
            if(this.var_117.bonusTakenSound != null)
            {
               _loc4_ = Sound3D.create(this.var_117.bonusTakenSound,name_89.name_191,name_89.name_229,name_89.name_250,0.5);
               _loc5_ = new Vector3();
               _loc3_.name_703(_loc5_);
               this.name_195(Sound3DEffect.create(this.var_138.objectPool,null,_loc5_,_loc4_));
            }
         }
      }
      
      public function method_156(param1:name_659) : void
      {
         var _loc2_:Vector3 = new Vector3();
         param1.name_703(_loc2_);
      }
      
      public function method_155(param1:name_659) : void
      {
         if(param1.name_740())
         {
            this.method_156(param1);
         }
         this.method_192(this.var_117.bfObject,param1.name_693);
      }
      
      private function method_192(param1:ClientObject, param2:String) : void
      {
         var _loc3_:TankData = this.var_123.getTankData(this.var_117.name_700);
         var _loc4_:Object = new Object();
         _loc4_.bonus_id = param2;
         _loc4_.real_tank_position = new Vector3dData(_loc3_.tank.state.position.x,_loc3_.tank.state.position.y,_loc3_.tank.state.position.z);
         Network(Main.osgi.getService(name_2)).send("battle;attempt_to_take_bonus;" + JSON.stringify(_loc4_));
      }
      
      public function method_195(param1:ClientObject) : void
      {
         var _loc2_:int = 0;
         if(this.var_119 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < this.var_124)
            {
               name_652(this.var_119[_loc2_]).startBattle();
               _loc2_++;
            }
         }
         battleInfoService.method_195();
      }
      
      public function battleFinish(param1:ClientObject) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:TankData = null;
         var _loc4_:name_659 = null;
         var _loc5_:int = 0;
         this.var_123.method_33(true);
         for(_loc2_ in this.var_117.name_263)
         {
            _loc3_ = _loc2_;
            _loc3_.tank.title.name_256();
            this.var_123.stop(_loc3_);
            _loc3_.enabled = false;
         }
         this.var_132.hide();
         this.var_123.method_31(true);
         for(_loc2_ in this.var_117.name_663)
         {
            _loc4_ = this.var_117.name_663[_loc2_];
            _loc4_.destroy();
            delete this.var_117.name_663[_loc2_];
         }
         battleEventDispatcher.dispatchEvent(new name_704());
         if(this.var_119 != null)
         {
            _loc5_ = 0;
            while(_loc5_ < this.var_124)
            {
               name_652(this.var_119[_loc5_]).finishBattle();
               _loc5_++;
            }
         }
      }
      
      public function battleRestart(param1:ClientObject) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:int = 0;
         this.const_30.reset();
         for(_loc2_ in this.var_117.name_263)
         {
            this.name_129(_loc2_ as TankData);
         }
         if(this.var_119 != null)
         {
            _loc3_ = 0;
            while(_loc3_ < this.var_124)
            {
               name_652(this.var_119[_loc3_]).restartBattle();
               _loc3_++;
            }
         }
         battleInfoService.battleRestart();
         battleEventDispatcher.dispatchEvent(new name_715());
      }
      
      private function method_161(param1:Event) : void
      {
         if(this.messages != null)
         {
            this.messages.x = 0.5 * Main.stage.stageWidth;
            this.messages.y = 40;
         }
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         this.method_177(param1);
         this.const_30.reset();
      }
      
      private function method_177(param1:ClientObject) : void
      {
         Model.object = this.var_117.name_685;
         var _loc2_:String = Game.local ? "" : "resources/";
         this.var_120 = SoundManager.name_736(this.var_117.ambientSound);
         var _loc3_:IBattleSettings = this.method_159();
         this.muteSound = _loc3_.muteSound;
         if(!this.muteSound && Boolean(_loc3_.bgSound))
         {
            this.var_117.name_664 = this.var_120.playSound(this.var_117.ambientSound,0,1000000,new SoundTransform(0.5));
         }
         battleInputService.unlock(name_665.name_708);
         this.method_186();
         this.method_179();
         this.var_117.time = getTimer();
         var _loc4_:ITankEventDispatcher = ITankEventDispatcher(Main.osgi.getService(ITankEventDispatcher));
         if(_loc4_ != null)
         {
            _loc4_.name_718(name_77.name_192,this);
            _loc4_.name_718(name_77.name_184,this);
         }
         if(!this.spectatorMode)
         {
            Network(Main.osgi.getService(name_2)).send("battle;get_init_data_local_tank");
            battleInputService.name_743();
            battleInfoService.spectatorMode = false;
            putData(ControlsMiniHelpSupport,new ControlsMiniHelpSupport());
         }
         else
         {
            BattleController.name_771 = true;
            Network(Main.osgi.getService(name_2)).send("battle;spectator_user_init");
            battleInputService.name_768();
            battleInfoService.spectatorMode = true;
            this.method_189();
            this.method_174();
         }
         battleInfoService.name_752();
         battleEventDispatcher.dispatchEvent(new name_689());
         (this.var_118 as FollowCameraController).name_764(this.var_117.viewport._mapContainer);
         this.messages = new BattlefieldMessages();
         Main.contentUILayer.addChild(this.messages);
         Main.stage.addEventListener(Event.RESIZE,this.method_161);
         this.method_161(null);
         putData(AdditionUserTitleSwitcher,new AdditionUserTitleSwitcher());
         putData(name_671,new name_671());
         Model.method_38();
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc4_:* = undefined;
         var _loc5_:name_202 = null;
         var _loc6_:Vector.<name_70> = null;
         var _loc7_:name_70 = null;
         var _loc8_:name_659 = null;
         var _loc9_:name_560 = null;
         var _loc12_:* = undefined;
         if(this.var_117 == null)
         {
            name_11.log(LogLevel.name_79,"BattlefieldModel::objectUnloaded Called more than once");
            return;
         }
         var _loc2_:name_105 = name_105(Main.osgi.getService(name_105));
         if(_loc2_ != null)
         {
            _loc2_.removeEventListener(this);
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.var_130.length)
         {
            _loc12_ = this.var_130[_loc3_];
            if(_loc12_ != null)
            {
               if(this.var_147.indexOf(_loc12_) == -1)
               {
                  _loc12_.destroy(true);
                  _loc12_ = null;
                  _loc3_++;
               }
               else
               {
                  this.var_130.removeAt(_loc3_);
               }
            }
            if(_loc3_ >= 200)
            {
               break;
            }
            _loc3_++;
         }
         if(_loc3_ < 200)
         {
            this.var_130 = new Vector.<Object>();
         }
         BattleMinesModel(this.var_150.getModelsByInterface(name_690)[0]).objectUnloaded(param1);
         this.var_128.name_766();
         this.var_128 = null;
         battleInputService.lock(name_665.name_708);
         this.method_162();
         this.method_170();
         for each(_loc4_ in BattleController.tankClientObjectByTankId)
         {
            TankModel(Main.osgi.getService(ITank)).objectUnloadedFully(_loc4_ as ClientObject,true);
         }
         _loc5_ = name_33(OSGi.getInstance().getService(name_33)).getSpace(Long.getLong(419472,230884));
         _loc6_ = new Vector.<name_70>();
         for each(object in _loc5_.objects)
         {
            _loc6_.push(object);
         }
         _loc6_.reverse();
         for each(_loc7_ in _loc6_)
         {
            _loc5_.name_188(_loc7_.id);
         }
         GameObject(this.var_117.name_685).clear();
         battleEventDispatcher.dispatchEvent(new name_697());
         this.var_58.clear();
         this.var_131.destroy();
         this.method_147(null);
         this.method_149(null);
         this.var_120.name_686();
         this.var_120.name_701();
         this.var_117.viewport.name_776();
         this.var_117.viewport.camera.view.clear();
         this.var_117.viewport.camera.view = null;
         this.var_117.viewport.name_757();
         this.var_117.name_661.removeChild(this.var_117.viewport);
         battleReadinessService.reset();
         battleInfoService.name_720(false);
         battleInfoService.name_732();
         if(this.var_125 != null)
         {
            this.var_125.deactivate();
         }
         Main.contentUILayer.visible = true;
         this.name_186(null);
         this.var_133 = null;
         for each(_loc8_ in this.var_117.name_663)
         {
            _loc8_.destroy();
            _loc8_ = null;
         }
         this.var_121.name_781();
         this.var_121 = null;
         this.getObjectPool().clear();
         this.var_117 = null;
         this.var_132 = null;
         this.var_135 = null;
         _loc9_ = name_560(Main.osgi.getService(name_560));
         if(_loc9_ != null)
         {
            _loc9_.drawBg();
         }
         var _loc10_:name_524 = name_524(Main.osgi.getService(name_524));
         if(_loc10_ != null)
         {
            _loc10_.unregisterDumper(this.dumperName);
         }
         this.var_118.deactivate();
         var _loc11_:ITankEventDispatcher = ITankEventDispatcher(Main.osgi.getService(ITankEventDispatcher));
         _loc11_.name_717(name_77.name_192,this);
         _loc11_.name_717(name_77.name_184,this);
         Main.contentUILayer.removeChild(this.messages);
         Main.stage.removeEventListener(Event.RESIZE,this.method_161);
         this.messages = null;
      }
      
      public function name_217(param1:name_657) : void
      {
         if(param1 == null || this.var_117 == null)
         {
            return;
         }
         this.var_117.name_694[param1] = true;
         param1.name_742(this.var_117.viewport.name_257());
      }
      
      public function name_195(param1:name_132) : void
      {
         if(param1 != null && !this.muteSound)
         {
            this.var_120.name_672(param1);
         }
      }
      
      public function name_125(param1:ClientObject) : void
      {
         if(this.var_117 == null)
         {
            return;
         }
         this.var_117.name_700 = param1;
      }
      
      public function name_237(param1:TankData) : void
      {
         var _loc2_:int = 0;
         this.var_117.tanks[param1.tank] = param1;
         if(param1.enabled)
         {
            this.method_164(param1);
         }
         if(this.var_119 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < this.var_124)
            {
               name_652(this.var_119[_loc2_]).addUser(param1.user);
               _loc2_++;
            }
         }
         if(param1.local)
         {
            this.method_163();
         }
      }
      
      public function name_147(param1:TankData) : void
      {
         var _loc2_:int = 0;
         if(this.var_117 == null)
         {
            return;
         }
         if(this.var_117.name_263[param1] != null)
         {
            this.name_129(param1);
            delete this.var_117.tanks[param1.tank];
         }
         if(this.var_118.name_670() == param1.tank)
         {
            this.var_118.deactivate();
            if(this.spectatorMode)
            {
               this.var_125.name_782.name_745();
            }
         }
         if(this.var_119 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < this.var_124)
            {
               name_652(this.var_119[_loc2_]).removeUser(param1.user);
               _loc2_++;
            }
         }
      }
      
      public function onResize(param1:Event) : void
      {
         if(this.var_117 == null)
         {
            return;
         }
         var _loc2_:Number = this.screenSize / this.var_127;
         var _loc3_:Stage = this.var_117.name_661.stage;
         var _loc4_:Number = _loc3_.stageWidth;
         var _loc5_:Number = _loc3_.stageHeight;
         var _loc6_:int = _loc4_ * _loc2_;
         var _loc7_:int = _loc5_ * _loc2_;
         this.var_117.viewport.resize(_loc6_,_loc7_);
         this.var_117.viewport.x = 0.5 * (_loc4_ - _loc6_);
         this.var_117.viewport.y = 0.5 * (_loc5_ - _loc7_);
         var _loc8_:name_560 = Main.osgi.getService(name_560) as name_560;
         if(_loc8_ != null)
         {
            _loc8_.drawBg(new Rectangle(0.5 * (_loc4_ - _loc6_),0.5 * (_loc5_ - _loc7_),_loc6_,_loc7_));
         }
         this.var_117.viewport.name_688.graphics.clear();
         if(this.screenSize < this.var_127)
         {
            this.border.draw(this.var_117.viewport.name_688.graphics,_loc6_,_loc7_);
         }
      }
      
      public function method_168() : int
      {
         if(this.var_117.viewport.stage == null)
         {
            return 1;
         }
         return this.var_117.viewport.stage.stageWidth * this.screenSize / this.var_127;
      }
      
      public function method_165() : int
      {
         if(this.var_117.viewport.stage == null)
         {
            return 1;
         }
         return this.var_117.viewport.stage.stageHeight * this.screenSize / this.var_127;
      }
      
      public function method_204() : Number
      {
         return this.method_165() * this.method_165() + this.method_168() * this.method_168();
      }
      
      public function getObjectPool() : ObjectPool
      {
         return this.var_138.objectPool;
      }
      
      public function name_165() : BattleRunner
      {
         return this.var_121;
      }
      
      public function method_143() : name_654
      {
         return this.var_122;
      }
      
      public function method_154() : name_653
      {
         return this.var_149;
      }
      
      public function method_147(param1:name_653) : void
      {
         this.var_149 = param1;
      }
      
      public function method_151() : name_651
      {
         return this.var_145;
      }
      
      public function method_149(param1:name_651) : void
      {
         this.var_145 = param1;
      }
      
      public function name_198(param1:Vector3, param2:Vector3) : void
      {
         if(this.var_122 == this.var_125)
         {
            return;
         }
         this.var_118.deactivate();
         this.var_118.name_730(param1,param2,this.var_142,this.var_143);
         this.var_134.init(this.var_142,this.var_143);
         this.var_134.activate(this.var_117.viewport.camera);
         this.var_122 = this.var_134;
      }
      
      public function name_236(param1:Vector3, param2:Vector3) : void
      {
         this.var_118.activate(this.var_117.viewport.camera);
         this.var_118.name_666(true);
         this.var_118.name_749(param1,param2);
         this.var_122 = this.var_118;
         this.method_169();
      }
      
      public function method_146(param1:name_654) : void
      {
         this.var_118.deactivate();
         this.var_122 = param1;
         TankModel(this.var_123).lockControls(true);
      }
      
      public function method_198() : void
      {
         if(this.var_117 != null && this.var_117.viewport != null)
         {
            this.var_117.viewport.camera.rotationY = 0;
         }
      }
      
      public function method_200() : void
      {
         if(this.var_117 == null)
         {
            return;
         }
         this.var_118.activate(this.var_117.viewport.camera);
         this.var_118.name_666(false);
         this.var_122 = this.var_118;
         TankModel(this.var_123).lockControls(false);
      }
      
      public function method_174() : void
      {
         if(this.var_122 == this.var_118)
         {
            this.var_118.deactivate();
         }
         this.var_122 = this.var_125;
         this.var_125.activate(this.var_117.viewport.camera);
         TankModel(this.var_123).lockControls(true);
      }
      
      private function method_194() : void
      {
         if(this.var_122 != this.var_125)
         {
            if(this.var_122 == this.var_118)
            {
               this.var_118.deactivate();
            }
            this.var_122 = this.var_125;
            this.var_125.activate(this.var_117.viewport.camera);
            TankModel(this.var_123).lockControls(true);
         }
         else
         {
            this.var_125.deactivate();
            this.var_118.activate(this.var_117.viewport.camera);
            this.var_118.name_666(false);
            this.var_122 = this.var_118;
            TankModel(this.var_123).lockControls(false);
         }
      }
      
      public function name_186(param1:Tank) : void
      {
         this.var_118.name_758(param1);
      }
      
      public function name_221(param1:int) : void
      {
         this.var_132.show(param1);
      }
      
      public function name_209() : void
      {
         this.var_132.hide();
      }
      
      public function name_232() : int
      {
         return this.getBattlefieldData().name_707;
      }
      
      public function name_129(param1:TankData) : void
      {
         var _loc2_:int = 0;
         if(this.var_117.name_263[param1] == null)
         {
            return;
         }
         delete this.var_117.name_263[param1];
         param1.name_84("Removed from field");
         param1.tank.name_775();
         this.var_121.name_765(param1.tank.name_667());
         this.var_121.name_772(param1.tank);
         this.var_121.name_724(param1.tank);
         this.var_121.name_753(param1.tank);
         TankBodyIdProvider.name_756(param1.tank.name_667().id);
         param1.tank.name_667().name_787.name_233();
         this.var_123.stop(param1);
         this.var_120.name_696(param1.sounds);
         if(this.var_119 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < this.var_124)
            {
               name_652(this.var_119[_loc2_]).removeUserFromField(param1.user);
               _loc2_++;
            }
         }
         if(this.var_118.name_670() == param1.tank)
         {
            this.var_118.deactivate();
         }
      }
      
      public function method_157(param1:Body, param2:Body) : Boolean
      {
         var _loc3_:TankData = null;
         if(param1.name_169 != null && param2.name_169 == null)
         {
            _loc3_ = this.var_117.tanks[param1];
            ++_loc3_.name_197;
         }
         else if(param1.name_169 == null && param2.name_169 != null)
         {
            _loc3_ = this.var_117.tanks[param2];
            ++_loc3_.name_197;
         }
         return false;
      }
      
      public function method_148(param1:String, param2:String) : void
      {
         this.var_133.name_773(param1,param2);
      }
      
      public function method_152(param1:name_652) : void
      {
         if(this.var_119 == null)
         {
            this.var_119 = new Vector.<name_652>();
         }
         if(this.var_119.indexOf(param1) < 0)
         {
            var _loc2_:* = this.var_124++;
            this.var_119[_loc2_] = param1;
         }
      }
      
      public function method_150(param1:name_652) : void
      {
         var _loc2_:int = 0;
         if(this.var_119 != null)
         {
            _loc2_ = this.var_119.indexOf(param1);
            if(_loc2_ > -1)
            {
               this.var_119.splice(_loc2_,1);
               --this.var_124;
            }
         }
      }
      
      public function get soundManager() : name_655
      {
         return this.var_120;
      }
      
      public function method_144(param1:TankData, param2:Vector3, param3:Number) : void
      {
      }
      
      public function get dumperName() : String
      {
         return "currbattle";
      }
      
      public function dump(param1:Vector.<String>) : String
      {
         var _loc4_:TankData = null;
         var _loc5_:name_652 = null;
         var _loc6_:Boolean = false;
         if(this.var_117 == null)
         {
            return "";
         }
         var _loc2_:String = "=== BattlefieldModel dump ===\n";
         if(this.var_119 != null && this.var_124 > 0)
         {
            _loc2_ += "Plugins list:\n";
            for each(_loc5_ in this.var_119)
            {
               _loc2_ += " " + _loc5_.name_750 + "\n";
            }
            _loc2_ += "End of plugins list\n";
         }
         _loc2_ += "Tanks list:\n";
         var _loc3_:int = 0;
         for each(_loc4_ in this.var_117.tanks)
         {
            _loc6_ = this.var_117.name_263[_loc4_] != null;
            _loc2_ += "--- Tank " + _loc3_++ + " ---\n" + "active=" + _loc6_ + "\n" + _loc4_.toString() + "\n";
         }
         _loc2_ += "End of tanks list\n";
         return _loc2_ + "=== End BattlefieldModel dump ===\n";
      }
      
      public function handleTankEvent(param1:int, param2:TankData) : void
      {
         switch(param1)
         {
            case name_77.name_184:
               this.method_188(param2);
               break;
            case name_77.name_192:
               this.method_171(param2);
         }
      }
      
      public function method_145(param1:name_658) : void
      {
      }
      
      public function method_23(param1:Boolean) : void
      {
         var _loc2_:IBattleSettings = null;
         var _loc3_:* = undefined;
         if(this.var_117 == null)
         {
            return;
         }
         this.muteSound = param1;
         if(param1)
         {
            this.var_120.name_686();
            this.var_120.name_701();
            this.var_117.name_664 = null;
         }
         else
         {
            _loc2_ = this.method_159();
            if(_loc2_.bgSound)
            {
               this.var_117.name_664 = this.var_120.playSound(this.var_117.ambientSound,0,1000000,new SoundTransform(0.5));
            }
            for(_loc3_ in this.var_117.name_263)
            {
               this.var_120.name_672(TankData(_loc3_).sounds);
            }
         }
      }
      
      private function method_188(param1:TankData) : void
      {
         if(this.var_117.name_263[param1] != null)
         {
            return;
         }
         this.method_164(param1);
         this.var_120.name_672(param1.sounds);
      }
      
      private function method_171(param1:TankData) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:name_691 = null;
         var _loc4_:Sound3D = null;
         var _loc5_:Object3D = null;
         this.var_120.name_696(param1.sounds);
         this.var_120.name_783(param1.user);
         for(_loc2_ in this.var_117.name_694)
         {
            _loc3_ = _loc2_;
            if(_loc3_.owner == param1.user)
            {
               _loc3_.kill();
            }
         }
         if(this.var_117.killSound != null)
         {
            _loc4_ = Sound3D.create(this.var_117.killSound,name_89.name_191,name_89.name_229,name_89.name_250,this.var_151.value);
            _loc5_ = param1.tank.skin.name_144();
            this.name_195(Sound3DEffect.create(this.var_138.objectPool,null,new Vector3(_loc5_.x,_loc5_.y,_loc5_.z),_loc4_,0,this.var_148.value));
         }
         if(this.var_118.name_670() == param1.tank)
         {
            this.var_118.name_666(true);
         }
      }
      
      private function method_181(param1:name_676) : void
      {
         this.var_117.ambientSound = param1.ambientSound;
         this.var_117.bonusTakenSound = param1.name_761;
         this.var_117.battleFinishSound = param1.battleFinishSound;
         this.var_117.killSound = param1.killSound;
      }
      
      public function method_153() : void
      {
         var _loc1_:IBattleSettings = this.method_159();
         this.var_117.name_661.visible = true;
         this.var_117.name_661.addChild(this.var_117.viewport);
         this.var_128.name_674(_loc1_.adaptiveFPS);
         this.var_117.viewport.name_719(_loc1_.graphicsAutoQuality,this.mapResourceId);
         if(!_loc1_.graphicsAutoQuality)
         {
            this.var_117.viewport.name_711(_loc1_.fog);
            this.var_117.viewport.name_706(_loc1_.softParticles);
            this.var_117.viewport.name_705(_loc1_.antialiasing);
            this.var_126.enabled = _loc1_.dust;
            this.var_117.viewport.name_687(_loc1_.dynamicShadows);
            this.var_117.viewport.name_692(_loc1_.dynamicLighting);
            this.var_117.viewport.name_721(_loc1_.shadows);
            this.var_117.viewport.name_722(_loc1_.ssao);
         }
         this.var_117.viewport.name_702(true);
         this.var_58.useMipMapping = _loc1_.mipMapping;
         this.var_117.viewport.visible = true;
         this.onResize(null);
         this.var_117.viewport.name_726();
      }
      
      private function method_185(param1:Number) : void
      {
         this.var_121 = new BattleRunner(-param1,this.var_117.ambientSound,battleEventDispatcher);
         this.var_117.name_678 = this.var_121.name_678;
         this.var_117.name_247 = this.var_121.name_778();
         this.var_160 = new FadingDecalsRenderer(20000,this);
         this.var_117.viewport = new BattleView3D(this.var_144,this.var_117.name_247,this);
         this.shadows = new name_684(this.var_117.viewport);
         this.shadows.on();
         this.var_117.viewport.visible = false;
         this.var_126 = new Dust(this);
         if(this.mapResourceId.indexOf("_winter") != -1)
         {
            this.var_126.init(new const_31().bitmapData,7000,5000,180,0.75,0.15);
         }
         else
         {
            this.var_126.init(new const_32().bitmapData,7000,5000,180,0.75,0.15);
         }
         this.var_117.viewport.name_751(this.var_126);
         this.var_128 = new name_284(name_24(OSGi.getInstance().getService(name_24)).stage,this.const_30);
         this.var_128.name_674(this.method_159().adaptiveFPS);
         this.var_132 = new SuicideIndicator(this);
         Main.stage.focus = this.var_117.viewport;
         this.var_137 = 0;
         this.var_141 = false;
         this.var_133 = new DebugPanel();
         this.var_133.visible = false;
         this.var_118 = new FollowCameraController();
         this.var_134 = new name_681(3500);
         this.var_125 = new SpectatorCameraController();
         var _loc2_:IStorageService = Main.osgi.getService(IStorageService) as IStorageService;
         this.screenSize = _loc2_.getStorage().data.screenSize;
         if(this.screenSize == 0)
         {
            this.screenSize = this.var_127;
         }
         this.var_162 = new DecalFactory(this.var_117.name_247);
      }
      
      public function method_180(param1:name_712) : void
      {
         this.var_121.method_180(param1);
      }
      
      public function method_173(param1:name_712) : void
      {
         this.var_121.method_173(param1);
      }
      
      private function method_175(param1:String, param2:name_673) : void
      {
         this.var_117.skybox = this.method_183(param2);
         this.var_117.viewport.name_759(this.var_117.skybox);
         this.var_135 = new name_669();
         this.var_135.load(MapResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(this.var_152)));
      }
      
      public function getConfig() : name_669
      {
         return this.var_135;
      }
      
      public function method_187(param1:Decal) : void
      {
         this.var_117.viewport.method_187(param1);
      }
      
      public function addDecal(param1:Vector3, param2:Vector3, param3:Number, param4:TextureMaterial, param5:name_656 = null) : void
      {
         this.var_117.viewport.addDecal(param1,param2,param3,param4,param5);
      }
      
      public function build(param1:KDContainer, param2:Vector.<CollisionPrimitive>, param3:Vector.<Light3D>) : void
      {
         this.var_117.viewport._mapContainer = param1;
         this.var_117.viewport.name_786(param3);
         this.name_247 = TanksCollisionDetector(this.var_117.name_678.name_247);
         this.name_247.name_754(param2);
         this.onMapBuildingComplete(null);
         OSGi.clientLog.log("BattlefieldModel","onMapBuildingComplete");
      }
      
      private function method_183(param1:name_673) : SkyBox
      {
         var _loc2_:name_680 = new name_680(param1);
         this.var_146 = new name_683(_loc2_,new Vector3(10,3,0),0);
         this.var_117.viewport.name_755(this.var_146,0);
         return _loc2_;
      }
      
      public function raycast(param1:Vector3, param2:Vector3, param3:Dictionary, param4:Camera3D = null) : RayIntersectionData
      {
         var _loc5_:Object3D = null;
         copyToVector3D(param1,const_28);
         copyToVector3D(param2,const_29);
         var _loc6_:RayIntersectionData = this.var_117.viewport._mapContainer.intersectRay(const_28,const_29,param3,param4);
         if(Boolean(_loc6_))
         {
            _loc5_ = _loc6_.object;
            while(_loc5_ != null && !_loc5_.mouseEnabled)
            {
               _loc5_ = _loc5_.parent;
            }
            _loc6_.object = _loc5_;
         }
         return _loc6_;
      }
      
      private function onMapBuildingComplete(param1:Event) : void
      {
         this.gui = Main.osgi.getService(IBattlefieldGUI) as IBattlefieldGUI;
         this.var_141 = true;
         this.method_169();
         this.method_163();
         battleReadinessService.name_780();
         this.objectLoaded(null);
      }
      
      private function method_189() : void
      {
         var _loc1_:Vector3 = new Vector3();
         var _loc2_:Vector3 = new Vector3();
         this.method_182(_loc1_,_loc2_,this.getConfig().map.name_737());
         this.var_117.viewport.camera.name_731(_loc1_);
         this.var_117.viewport.camera.lookAt(_loc2_.x,_loc2_.y,_loc2_.z);
         battleReadinessService.name_228();
         if(!lobbyLayoutService.isSwitchInProgress())
         {
            battleInputService.unlock(name_665.name_770);
         }
      }
      
      public function method_182(param1:Vector3, param2:Vector3, param3:name_767) : void
      {
         param1.x = param3.name_714;
         param1.y = param3.name_699;
         param1.z = param3.name_760 + 5000;
         param2.x = (param3.name_714 + param3.name_738) / 2;
         param2.y = (param3.name_699 + param3.name_739) / 2;
         param2.z = param3.minZ;
      }
      
      private function method_186() : void
      {
         if(this.var_117 == null)
         {
            return;
         }
         this.var_117.name_661.addEventListener(Event.ENTER_FRAME,this.method_166);
         this.var_117.name_661.stage.addEventListener(Event.RESIZE,this.onResize);
      }
      
      private function method_162() : void
      {
         if(this.var_117 == null)
         {
            return;
         }
         this.var_117.name_661.removeEventListener(Event.ENTER_FRAME,this.method_166);
         this.var_117.name_661.stage.removeEventListener(Event.RESIZE,this.onResize);
      }
      
      private function method_179() : void
      {
         if(this.var_117 == null)
         {
            return;
         }
         this.var_117.name_661.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.method_160);
         this.var_117.name_661.stage.addEventListener(KeyboardEvent.KEY_UP,this.method_160);
         battleInputService.name_219(this);
      }
      
      private function method_170() : void
      {
         if(this.var_117 == null)
         {
            return;
         }
         this.var_117.name_661.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.method_160);
         this.var_117.name_661.stage.removeEventListener(KeyboardEvent.KEY_UP,this.method_160);
         battleInputService.name_150(this);
      }
      
      private function method_196(param1:int, param2:name_668, param3:String, param4:String) : void
      {
      }
      
      private function method_166(param1:Event) : void
      {
         var t1:int = 0;
         var deltaMsec:int = 0;
         var t:Number = NaN;
         var i:int = 0;
         var e:Event = param1;
         try
         {
            this.const_30.update();
            this.var_121.tick();
            t1 = getTimer();
            deltaMsec = t1 - this.var_117.time;
            this.var_117.time = t1;
            if(deltaMsec <= 0)
            {
               return;
            }
            this.var_139 = 0.001 * deltaMsec;
            t = this.var_121.name_744();
            this.method_178(this.var_117.time,deltaMsec,this.var_139,t);
            if(this.var_119 != null)
            {
               i = 0;
               while(i < this.var_124)
               {
                  name_652(this.var_119[i]).tick(this.var_117.time,deltaMsec,this.var_139,t);
                  i++;
               }
            }
            this.method_191(deltaMsec);
            this.method_176(this.var_117.time,deltaMsec,t);
            return;
         }
         catch(e:Error)
         {
            if(!this.var_154)
            {
               this.var_154 = true;
               name_539(OSGi.getInstance().getService(name_539)).addNotification(new name_698());
               OSGi.clientLog.log("battleError",e.getStackTrace());
            }
            return;
         }
      }
      
      private function method_201(param1:Event) : void
      {
         var _loc2_:name_28 = name_28(Main.osgi.getService(name_28));
         if(_loc2_ != null)
         {
            _loc2_.reload();
         }
      }
      
      private function method_178(param1:int, param2:int, param3:Number, param4:Number) : void
      {
         var _loc6_:* = undefined;
         var _loc5_:Vector3 = this.var_117.viewport.camera.pos;
         for(_loc6_ in this.var_117.name_263)
         {
            this.var_123.update(_loc6_ as TankData,param1,param2,param3,param4,_loc5_);
         }
      }
      
      private function method_191(param1:int) : void
      {
         var _loc2_:name_735 = this.var_117.viewport.camera;
         if(!this.muteSound)
         {
            this.soundManager.name_723(param1,_loc2_);
         }
      }
      
      private function method_176(param1:int, param2:int, param3:Number) : void
      {
         var _loc4_:* = undefined;
         var _loc5_:name_659 = null;
         for(_loc4_ in this.var_117.name_663)
         {
            _loc5_ = this.var_117.name_663[_loc4_];
            if(!_loc5_.update(param1,param2,param3))
            {
               _loc5_.destroy();
               delete this.var_117.name_663[_loc4_];
            }
         }
      }
      
      private function method_164(param1:TankData) : void
      {
         var skin:TankSkin = null;
         var i:int = 0;
         var tankData:TankData = param1;
         try
         {
            if(this.var_117.name_263[tankData] != null)
            {
               return;
            }
            this.var_117.name_263[tankData] = true;
            tankData.tank.name_777();
            tankData.tank.name_742(this.var_117.viewport.name_257());
            tankData.tank.name_210(1);
            tankData.name_84("Added to field");
            tankData.tank.name_667().id = TankBodyIdProvider.name_779();
            this.var_121.name_762(tankData.tank.name_667());
            this.var_121.name_746(tankData.tank);
            this.var_121.name_747(tankData.tank);
            this.var_121.name_784(tankData.tank);
            this.var_120.name_672(tankData.sounds);
            if(this.var_119 != null)
            {
               i = 0;
               while(i < this.var_124)
               {
                  name_652(this.var_119[i]).addUserToField(tankData.user);
                  i++;
               }
            }
            if(tankData.tank == this.var_118.name_670() && this.var_122 != this.var_125)
            {
               this.var_118.activate(this.var_117.viewport.camera);
               this.var_118.name_666(false);
               this.var_122 = this.var_118;
            }
            this.var_126.name_237(tankData);
            skin = tankData.tank.skin;
            this.var_140[skin.name_144()] = tankData.tank;
            this.var_140[skin.name_123] = tankData.tank;
         }
         catch(e:Error)
         {
            OSGi.clientLog.log("BattlefieldModel",e.getStackTrace());
         }
      }
      
      public function method_199() : Dust
      {
         return this.var_126;
      }
      
      private function method_160(param1:KeyboardEvent) : void
      {
         this.var_123.method_31(false);
         if(!battleInputService.name_727())
         {
            if(param1.type == KeyboardEvent.KEY_DOWN)
            {
               this.method_190(param1);
            }
         }
      }
      
      public function method_197() : void
      {
         Network(Main.osgi.getService(name_2)).send("battle;speedhack_detected");
      }
      
      public function method_28(param1:GameActionEnum, param2:Boolean) : void
      {
         if(param1 == GameActionEnum.OPEN_GARAGE && param2)
         {
            if(Boolean(lobbyLayoutService.inBattle()) && lobbyLayoutService.getCurrentState() == LayoutState.GARAGE)
            {
               lobbyLayoutService.returnToBattle();
            }
            else
            {
               lobbyLayoutService.showGarage();
            }
         }
      }
      
      private function method_190(param1:KeyboardEvent) : void
      {
         var _loc2_:GameActionEnum = keysBindingService.name_729(param1.keyCode);
         if(_loc2_ == GameActionEnum.BATTLE_VIEW_INCREASE)
         {
            this.method_167(this.screenSize + 1);
         }
         if(_loc2_ == GameActionEnum.BATTLE_VIEW_DECREASE)
         {
            this.method_167(this.screenSize - 1);
         }
         var _loc3_:* = param1.keyCode;
         switch(0)
         {
         }
      }
      
      public function isEnableDamageUpEffect() : Boolean
      {
         return this.method_159().showDamage;
      }
      
      private function method_193() : Boolean
      {
         var _loc1_:SharedObject = IStorageService(Main.osgi.getService(IStorageService)).getStorage();
         var _loc2_:Boolean = Boolean(_loc1_.data.textureDebug1);
         _loc1_.data.textureDebug1 = !_loc2_;
         _loc1_.flush();
         return !_loc2_;
      }
      
      private function method_172() : void
      {
         if(this.var_117.name_664 != null)
         {
            this.var_120.name_763(this.var_117.name_664);
            this.var_117.name_664 = null;
         }
         else
         {
            this.var_117.name_664 = this.var_120.playSound(this.var_117.ambientSound,0,100000,new SoundTransform(0.5));
         }
      }
      
      private function method_167(param1:int) : void
      {
         this.screenSize = param1 > this.var_127 ? this.var_127 : (param1 < 1 ? 1 : param1);
         var _loc2_:IStorageService = Main.osgi.getService(IStorageService) as IStorageService;
         _loc2_.getStorage().data.screenSize = this.screenSize;
         this.onResize(null);
      }
      
      private function method_184(param1:ObjectRegister, param2:String, param3:Long, param4:Long, param5:Long, param6:Long, param7:Vector3dData, param8:int, param9:Boolean, param10:ClientObject, param11:int = 21, param12:Boolean = false) : name_659
      {
         var _loc13_:ClientObject = param10;
         if(_loc13_ == null)
         {
            return null;
         }
         var _loc14_:BonusCommonModel = new BonusCommonModel();
         _loc14_.initObject(param10,param2,param3,param4,param11,param6,param5);
         var _loc15_:name_659 = _loc14_.name_734(_loc13_,param2,param8,param9);
         if(this.var_117 == null || this.var_117.name_663 == null)
         {
            _loc15_.destroy();
            return null;
         }
         this.var_117.name_663[_loc15_.name_693] = _loc15_;
         _loc15_.name_769(new Vector3(param7.x,param7.y,param7.z),this.var_117.viewport.name_257(),this,param12);
         return _loc15_;
      }
      
      private function method_159() : IBattleSettings
      {
         return IBattleSettings(Main.osgi.getService(IBattleSettings));
      }
      
      private function method_158(param1:int) : void
      {
         this.var_136 += param1;
         if(this.var_136 < 0)
         {
            this.var_136 = 0;
         }
      }
      
      private function method_169() : void
      {
         this.var_137 += 1;
         if(this.var_137 == 2)
         {
            this.var_141 = true;
         }
      }
      
      private function method_163() : void
      {
         var _loc1_:name_32 = null;
         var _loc2_:name_115 = null;
         if(this.var_129 == 0)
         {
            return;
         }
         --this.var_129;
         if(this.var_129 == 0 || this.spectatorMode)
         {
            _loc1_ = name_32(Main.osgi.getService(name_32));
            _loc2_ = name_115(_loc1_.getModelsByInterface(name_115)[0]);
            _loc2_.partSelected(4);
         }
      }
   }
}
