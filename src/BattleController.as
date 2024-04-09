package
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.model.PingService;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.StatisticsModel;
   import alternativa.tanks.models.battlefield.effects.DamageIndicatorType;
   import alternativa.tanks.models.battlefield.effects.DamageEffect;
   import alternativa.tanks.models.battlefield.gui.chat.ChatModel;
   import alternativa.tanks.models.battlefield.gui.chat.MessageColor;
   import alternativa.tanks.models.battlefield.gui.chat.name_1339;
   import alternativa.tanks.models.battlefield.gui.IBattlefieldGUI;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.dom.DOMModel;
   import alternativa.tanks.models.dom.IDOMModel;
   import alternativa.tanks.models.sfx.LightDataManager;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.ITank;
   import alternativa.tanks.models.weapon.healing.HealingGunModel;
   import alternativa.tanks.models.weapon.machinegun.MachineGunModel;
   import alternativa.tanks.models.weapon.IWeaponController;
   import alternativa.tanks.models.weapon.shaft.ShaftModel;
   import alternativa.tanks.models.weapon.shotgun.ShotgunModel;
   import alternativa.tanks.vehicles.tanks.chassis.SpeedCharacteristics;
   import com.alternativaplatform.projects.tanks.client.models.battlefield.name_676;
   import controls.Label;
   import flash.filters.GlowFilter;
   import flash.utils.Dictionary;
   import forms.Alert;
   import forms.battlelist.BattleMode;
   import package_1.BattlefieldModelActivator;
   import package_1.Main;
   import package_1.BattlefieldSharedActivator;
   import package_1.TanksWarfareActivator;
   import package_1.BattlefieldGUIActivator;
   import package_102.Command;
   import package_102.Type;
   import package_106.AchievementModel;
   import package_106.IAchievementModel;
   import package_13.Long;
   import package_138.ServerBonusModel;
   import package_143.name_396;
   import package_149.FreezeModel;
   import package_151.RicochetModel;
   import package_154.PlasmaModel;
   import package_158.RailgunModel;
   import package_159.BCSHModel;
   import package_159.name_1594;
   import package_159.name_1600;
   import package_161.IWeaponWeakeningModel;
   import package_161.WeaponWeakeningModel;
   import package_163.FlamethrowerModel;
   import package_163.name_1595;
   import package_164.ThunderModel;
   import package_167.name_1454;
   import package_168.SmokyModel;
   import package_188.name_560;
   import package_20.Space;
   import package_243.name_673;
   import package_284.name_1297;
   import package_284.name_1298;
   import package_284.name_994;
   import package_291.name_1099;
   import package_291.name_1124;
   import package_31.PanelModel;
   import package_31.name_115;
   import package_310.name_1285;
   import package_310.name_1596;
   import package_311.name_1307;
   import package_311.name_1312;
   import package_312.name_1311;
   import package_312.name_1607;
   import package_329.ServerInventoryModel;
   import package_329.name_1593;
   import package_330.name_1592;
   import package_331.name_1599;
   import package_332.name_1598;
   import package_333.SnowmanModel;
   import package_334.name_1610;
   import package_335.name_1609;
   import package_336.name_1611;
   import package_337.name_1606;
   import package_338.name_1612;
   import package_37.Vector3;
   import package_39.Model;
   import package_4.ClientObject;
   import package_40.TankSoundResources;
   import package_40.ClientTank;
   import package_40.TankSpawnState;
   import package_41.TankSpecification;
   import package_41.TankState;
   import package_41.Vector3dData;
   import package_41.name_81;
   import package_41.TankParts;
   import package_43.TankExplosionModel;
   import package_43.name_93;
   import package_45.TankCriticalHitModel;
   import package_45.name_91;
   import package_47.BattleTeamType;
   import package_52.WeaponsManager;
   import package_54.name_102;
   import package_6.ClientClass;
   import package_60.TextConst;
   import package_67.DamageType;
   import package_67.Vector3d;
   import package_7.name_32;
   import package_70.name_301;
   import package_71.name_286;
   import package_74.name_272;
   import package_79.CTFModel;
   import package_86.ServerBattleMinesModel;
   import package_88.name_695;
   import package_93.name_1243;
   import package_97.BonusCache;
   import platform.client.fp10.core.model.name_141;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.registry.name_29;
   import platform.client.fp10.core.registry.name_33;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   import platform.client.fp10.core.type.name_202;
   import projects.tanks.client.battlefield.models.battle.battlefield.billboard.name_1409;
   import projects.tanks.client.battlefield.models.battle.cp.name_1597;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import projects.tanks.clients.fp10.libraries.name_390;
   import scpacker.Base;
   import scpacker.networking.Network;
   import scpacker.networking.class_6;
   import scpacker.networking.name_2;
   
   public class BattleController implements class_6
   {
      
      public static var resourceRegistry:ResourceRegistry = OSGi.getInstance().getService(ResourceRegistry) as ResourceRegistry;
      
      public static var modelRegistry:name_29 = OSGi.getInstance().getService(name_29) as name_29;
      
      public static var tankClientObjectByTankId:Dictionary;
      
      public static var name_771:Boolean = false;
      
      public static var client:ClientObject;
      
      private static var var_897:RailgunModel;
      
      private static var var_900:SmokyModel;
      
      private static var var_898:ShotgunModel;
      
      private static var var_901:FlamethrowerModel;
      
      private static var var_893:PlasmaModel;
      
      private static var var_896:HealingGunModel;
      
      private static var var_899:ThunderModel;
      
      private static var var_902:FreezeModel;
      
      private static var var_894:RicochetModel;
      
      private static var shaftModel:ShaftModel;
      
      private static var var_892:SnowmanModel;
      
      private static var var_895:MachineGunModel;
       
      
      private var battle:BattlefieldModelActivator;
      
      private var var_909:package_41.Vector3dData;
      
      private var var_908:ClientTank;
      
      private var var_906:ClientObject;
      
      private var var_903:ServerInventoryModel;
      
      private var var_904:ServerBattleMinesModel;
      
      private var var_74:ServerBonusModel;
      
      private var var_907:name_202;
      
      private var var_905:Label;
      
      public function BattleController()
      {
         this.var_906 = new ClientObject("ctfModel",null,"ctfModelObj",null);
         this.var_903 = new ServerInventoryModel();
         this.var_904 = new ServerBattleMinesModel();
         this.var_74 = new ServerBonusModel();
         super();
         this.var_907 = new Space(Long.getLong(419472,230884),null,null,false);
         name_33(OSGi.getInstance().getService(name_33)).addSpace(this.var_907);
         var _loc1_:BattlefieldGUIActivator = new BattlefieldGUIActivator();
         _loc1_.start(Main.osgi);
         var _loc2_:BattlefieldSharedActivator = new BattlefieldSharedActivator();
         _loc2_.start(Main.osgi);
         var _loc3_:TanksWarfareActivator = new TanksWarfareActivator();
         _loc3_.start(Main.osgi);
         this.battle = new BattlefieldModelActivator();
         this.battle.start(Main.osgi);
         var _loc4_:TanksWarfareActivator = new TanksWarfareActivator();
         _loc4_.start(Main.osgi);
         tankClientObjectByTankId = new Dictionary();
         var _loc5_:TankExplosionModel = new TankExplosionModel();
         Main.osgi.registerService(name_93,_loc5_);
         var _loc6_:TankCriticalHitModel = new TankCriticalHitModel();
         Main.osgi.registerService(name_91,_loc6_);
      }
      
      public static function getWeaponController(param1:ClientObject) : IWeaponController
      {
         var _loc3_:IWeaponController = null;
         var _loc2_:String = String(param1.id.split("_")[0]);
         var _loc4_:* = WeaponsManager.var_497[param1.id];
         switch(_loc2_)
         {
            case "railgun":
               if(var_897 == null)
               {
                  var_897 = new RailgunModel();
               }
               var_897.initObject(param1,1100,0.8);
               var_897.objectLoaded(param1);
               _loc3_ = var_897;
               break;
            case "shotgun":
               if(var_898 == null)
               {
                  var_898 = ShotgunModel(modelRegistry.getModel(Long.getLong(1366230363,-857495328)));
               }
               var_898.initObject(param1,_loc4_.reloadTime,_loc4_.magazineReloadTime,_loc4_.magazineSize,_loc4_.coneHorizontalAngle,_loc4_.coneVerticalAngle,_loc4_.pelletCount);
               var_898.objectLoaded(param1);
               _loc3_ = var_898;
               break;
            case "smoky":
               if(var_900 == null)
               {
                  var_900 = new SmokyModel();
               }
               var_900.objectLoaded(param1);
               _loc3_ = var_900;
               break;
            case "flamethrower":
               if(var_901 == null)
               {
                  var_901 = new FlamethrowerModel();
                  Main.osgi.registerService(name_1595,var_901);
               }
               var_901.initObject(WeaponsManager.name_185(param1.id),_loc4_.cone_angle,_loc4_.cooling_speed,_loc4_.heat_limit,_loc4_.heating_speed,_loc4_.range,_loc4_.target_detection_interval);
               _loc3_ = var_901;
               break;
            case "twins":
               if(var_893 == null)
               {
                  var_893 = new PlasmaModel();
               }
               var_893.initObject(WeaponsManager.name_185(param1.id),_loc4_.shot_radius,_loc4_.shot_range,_loc4_.shot_speed);
               _loc3_ = var_893;
               break;
            case "isida":
               if(var_896 == null)
               {
                  var_896 = new HealingGunModel();
               }
               var_896.initObject(WeaponsManager.name_185(param1.id),_loc4_.capacity,_loc4_.chargeRate,_loc4_.tickPeriod,_loc4_.coneAngle,_loc4_.dischargeDamageRate,_loc4_.dischargeHealingRate,_loc4_.dischargeIdleRate,_loc4_.radius);
               _loc3_ = var_896;
               break;
            case "thunder":
               if(var_899 == null)
               {
                  var_899 = new ThunderModel();
               }
               var_899.initObject(WeaponsManager.name_185(param1.id),_loc4_.impactForce,_loc4_.maxSplashDamageRadius,_loc4_.minSplashDamagePercent,_loc4_.minSplashDamageRadius);
               _loc3_ = var_899;
               break;
            case "frezee":
               if(var_902 == null)
               {
                  var_902 = new FreezeModel();
               }
               var_902.initObject(WeaponsManager.name_185(param1.id),_loc4_.damageAreaConeAngle,_loc4_.damageAreaRange,_loc4_.energyCapacity,_loc4_.energyDischargeSpeed,_loc4_.energyRechargeSpeed,_loc4_.weaponTickMsec);
               _loc3_ = var_902;
               break;
            case "ricochet":
               if(var_894 == null)
               {
                  var_894 = new RicochetModel();
               }
               var_894.initObject(WeaponsManager.name_185(param1.id),_loc4_.energyCapacity,_loc4_.energyPerShot,_loc4_.energyRechargeSpeed,_loc4_.shotDistance,_loc4_.shotRadius,_loc4_.shotSpeed);
               _loc3_ = var_894;
               break;
            case "shaft":
               if(shaftModel == null)
               {
                  shaftModel = new ShaftModel();
               }
               shaftModel.initObject(WeaponsManager.name_185(param1.id),_loc4_.max_energy,_loc4_.charge_rate,_loc4_.discharge_rate,_loc4_.elevation_angle_up,_loc4_.elevation_angle_down,_loc4_.vertical_targeting_speed,_loc4_.horizontal_targeting_speed,_loc4_.inital_fov,_loc4_.minimum_fov,_loc4_.shrubs_hiding_radius_min,_loc4_.shrubs_hiding_radius_max,2);
               _loc3_ = shaftModel;
               break;
            case "snowman":
               if(var_892 == null)
               {
                  var_892 = new SnowmanModel();
               }
               var_892.initObject(WeaponsManager.name_185(param1.id),_loc4_.shot_radius,_loc4_.shot_range,_loc4_.shot_speed);
               _loc3_ = var_892;
               break;
            case "vulcan":
               if(var_895 == null)
               {
                  var_895 = new MachineGunModel();
               }
               var_895.initObject(WeaponsManager.name_185(param1.id),_loc4_.energyCapacity,_loc4_.energyDischargeSpeed,_loc4_.energyRechargeSpeed,_loc4_.weaponTickMsec,_loc4_.damageTickMsec,_loc4_.spinUpTime,_loc4_.spinDownTime,_loc4_.weaponTurnDecelerationCoeff,_loc4_.recoilForce,_loc4_.impactForce);
               var_895.objectLoaded(param1);
               _loc3_ = var_895;
         }
         return _loc3_;
      }
      
      public function onData(param1:Command) : void
      {
         var parser:Object = null;
         var battle:name_1124 = null;
         var users:Array = null;
         var m20:int = 0;
         var obj:Object = null;
         var tempArr:Array = null;
         var pos:package_41.Vector3dData = null;
         var td:TankData = null;
         var target:TankData = null;
         var _loc1:package_67.Vector3d = null;
         var i:int = 0;
         var alertWindow:Alert = null;
         var achievementModel:AchievementModel = null;
         var json:Object = null;
         var lighting:Object = null;
         var ctfCC:name_1285 = null;
         var soundCC:name_1596 = null;
         var redColor:name_1307 = null;
         var blueColor:name_1307 = null;
         var modeLight:name_1312 = null;
         var ctfModel:CTFModel = null;
         var flagsState:name_1297 = null;
         var blueFlag:name_1298 = null;
         var redFlag:name_1298 = null;
         var pointsCC:name_1597 = null;
         var redPointColor:name_1307 = null;
         var bluePointColor:name_1307 = null;
         var neutralPointColor:name_1307 = null;
         var model:DOMModel = null;
         var points:Vector.<name_1592> = null;
         var point:name_1592 = null;
         var userId:Object = null;
         var jsParser:Object = null;
         var items:Array = null;
         var item:Object = null;
         var _item:name_1593 = null;
         var jsArray:Object = null;
         var effects:Array = null;
         var effect:name_1598 = null;
         var data:Command = param1;
         try
         {
            switch(data.type)
            {
               case Type.BATTLE:
                  if(data.name_319[0] == "init_battle_model")
                  {
                     this.method_1115(data.name_319[1]);
                  }
                  else if(data.name_319[0] == "init_gui_model")
                  {
                     parser = JSON.parse(data.name_319[1]);
                     battle = new name_1124();
                     battle.blueScore = parser.score_blue;
                     battle.fund = parser.fund;
                     battle.redScore = parser.score_red;
                     battle.scoreLimit = parser.scoreLimit;
                     battle.var_431 = parser.team;
                     battle.timeLeft = parser.currTime;
                     battle.timeLimit = parser.timeLimit;
                     PanelModel(Main.osgi.getService(name_115)).isInBattle = true;
                     users = new Array();
                     StatisticsModel(Main.osgi.getService(IBattlefieldGUI)).initObject(null,parser.name);
                     m20 = 0;
                     for each(obj in parser.users)
                     {
                        users[i] = new name_1099(0,0,obj.nickname,obj.rank,0,0,BattleTeamType.getType(obj.teamType),obj.nickname,obj.suspicious,0,0,0);
                        i++;
                     }
                     StatisticsModel(Main.osgi.getService(IBattlefieldGUI)).init(new ClientObject("bfObject",null,"bfObject",null),battle,users);
                     ChatModel(Main.osgi.getService(IChatBattle)).objectLoaded(null);
                     this.var_904.init();
                     this.var_903.init();
                  }
                  else if(data.name_319[0] == "init_bonus_regions")
                  {
                     this.method_1141(data.name_319[1]);
                  }
                  else if(data.name_319[0] == "init_delay_mount")
                  {
                     parser = JSON.parse(data.name_319[1]);
                     Model.object = this.battle.var_71.var_117.name_685;
                     modelRegistry.getModel(Long.getLong(1655340370,1523265001)).method_18(new name_1606(parser.delayMountArmorInSec,parser.delayMountResistanceInSec,parser.delayMountWeaponInSec));
                     name_141(modelRegistry.getModel(Long.getLong(1655340370,1523265001))).objectLoadedPost();
                     Model.method_38();
                  }
                  else if(data.name_319[0] == "remove_bonus_regions")
                  {
                     this.method_1140(data.name_319[1]);
                  }
                  else if(data.name_319[0] == "init_tank")
                  {
                     this.initTank(data.name_319[1]);
                  }
                  else if(data.name_319[0] == "pong")
                  {
                     PingService.name_1627();
                  }
                  else if(data.name_319[0] == "create_levelup_effect")
                  {
                     TankModel(Main.osgi.getService(ITank)).createLevelUpEffect(data.name_319[1],data.name_319[2]);
                  }
                  else if(data.name_319[0] == "create_critical_hit_effect")
                  {
                     TankModel(Main.osgi.getService(ITank)).createCriticalHitEffect(data.name_319[1]);
                  }
                  else if(data.name_319[0] == "battle_message")
                  {
                     BattlefieldModel(Main.osgi.getService(IBattleField)).messages.addMessage(16753920,data.name_319[1]);
                  }
                  else if(data.name_319[0] == "gold_spawn")
                  {
                     BattlefieldModel(Main.osgi.getService(IBattleField)).messages.addMessage(16753920,name_102(Main.osgi.getService(name_102)).getText(TextConst.const_296));
                     BattlefieldModel(Main.osgi.getService(IBattleField)).soundManager.playSound(SoundResource(resourceRegistry.getResource(Long.getLong(0,53912))).sound,0,1);
                  }
                  else if(data.name_319[0] == "update_spectator_list")
                  {
                     name_1339.name_1343 = data.name_319[1];
                  }
                  else if(data.name_319[0] == "activate_tank")
                  {
                     if(tankClientObjectByTankId[data.name_319[1]] != null)
                     {
                        TankModel(Main.osgi.getService(ITank)).activateTank(tankClientObjectByTankId[data.name_319[1]]);
                     }
                  }
                  else if(data.name_319[0] == "kill_tank")
                  {
                     if(tankClientObjectByTankId[data.name_319[1]] != null)
                     {
                        TankModel(Main.osgi.getService(ITank)).kill(tankClientObjectByTankId[data.name_319[1]],name_81.method_673(data.name_319[2]),data.name_319[3],this.method_1133(data.name_319[4]));
                     }
                  }
                  else if(data.name_319[0] == "prepare_to_spawn")
                  {
                     if(tankClientObjectByTankId[data.name_319[1]] != null)
                     {
                        tempArr = String(data.name_319[2]).split("@");
                        pos = new package_41.Vector3dData(tempArr[0],tempArr[1],tempArr[2]);
                        TankModel(Main.osgi.getService(ITank)).prepareToSpawn(tankClientObjectByTankId[data.name_319[1]],pos,new package_41.Vector3dData(0,0,tempArr[3]));
                     }
                  }
                  else if(data.name_319[0] == "spawn")
                  {
                     this.method_1124(data.name_319[1]);
                  }
                  else if(data.name_319[0] == "move")
                  {
                     this.method_1138(data.name_319[1]);
                  }
                  else if(data.name_319[0] == "rotate_turret")
                  {
                     if(tankClientObjectByTankId[data.name_319[1]] != null)
                     {
                        TankModel(Main.osgi.getService(ITank)).rotateTurretTo(tankClientObjectByTankId[data.name_319[1]] as ClientObject,data.name_319[2]);
                     }
                  }
                  else if(data.name_319[0] == "chat")
                  {
                     this.method_1128(data.name_319[1]);
                  }
                  else if(data.name_319[0] == "spectator_message")
                  {
                     ChatModel(Main.osgi.getService(IChatBattle)).addSpectatorMessage(data.name_319[1],data.name_319[2] == "true" ? true : false);
                  }
                  else if(data.name_319[0] == "remove_user")
                  {
                     this.removeUser(data.name_319[1]);
                  }
                  else if(data.name_319[0] == "confirm_vote")
                  {
                     BattlefieldModel(Main.osgi.getService(IBattleField)).messages.addMessage(MessageColor.name_1140,name_102(Main.osgi.getService(name_102)).getText(name_390.TEXT_TEAM_KICK_COMPLAINT_SENT));
                  }
                  else if(data.name_319[0] == "change_suspicious")
                  {
                     TankModel(Main.osgi.getService(ITank)).setUserSuspiciousness(data.name_319[1],data.name_319[2]);
                  }
                  else if(data.name_319[0] == "reset_configuration")
                  {
                     this.method_1132(data.name_319[1]);
                  }
                  else if(data.name_319[0] == "start_rearmored")
                  {
                     TankModel(Main.osgi.getService(ITank)).onRearmorScheduled(data.name_319[1]);
                  }
                  else if(data.name_319[0] == "ping")
                  {
                     Network(Main.osgi.getService(name_2)).send("battle;ping");
                  }
                  else if(data.name_319[0] != "tracePing")
                  {
                     if(data.name_319[0] == "tank_smooth")
                     {
                        this.method_1116(data.name_319[1]);
                     }
                     else if(data.name_319[0] == "spawn_bonus")
                     {
                        this.method_1127(data.name_319[1]);
                     }
                     else if(data.name_319[0] == "init_bonuses")
                     {
                        this.method_1136(data.name_319[1]);
                     }
                     else if(data.name_319[0] == "take_bonus_by")
                     {
                        BattlefieldModel(Main.osgi.getService(IBattleField)).bonusTaken(null,data.name_319[1]);
                     }
                     else if(data.name_319[0] == "user_log")
                     {
                        StatisticsModel(Main.osgi.getService(IBattlefieldGUI)).logUserAction(data.name_319[1],data.name_319[2]);
                     }
                     else if(data.name_319[0] == "set_cry")
                     {
                        PanelModel(Main.osgi.getService(name_115)).updateCrystal(null,int(data.name_319[1]));
                     }
                     else if(data.name_319[0] == "remove_bonus")
                     {
                        BattlefieldModel(Main.osgi.getService(IBattleField)).removeBonus(null,data.name_319[1]);
                     }
                     else if(data.name_319[0] == "update_direction")
                     {
                        if(tankClientObjectByTankId[data.name_319[1]] != null)
                        {
                           td = TankModel(Main.osgi.getService(ITank)).getTankData(tankClientObjectByTankId[data.name_319[1]] as ClientObject);
                           if(td != null)
                           {
                              Model.object = td.object;
                              name_286(modelRegistry.getModel(Long.getLong(1691794381,-1794202080))).updateRemoteDirection(data.name_319[2]);
                              Model.method_38();
                           }
                        }
                     }
                     else if(data.name_319[0] == "hide_laser")
                     {
                        if(tankClientObjectByTankId[data.name_319[1]] != null)
                        {
                           td = TankModel(Main.osgi.getService(ITank)).getTankData(tankClientObjectByTankId[data.name_319[1]] as ClientObject);
                           if(td != null)
                           {
                              Model.object = td.object;
                              name_286(modelRegistry.getModel(Long.getLong(1691794381,-1794202080))).hideRemote();
                              Model.method_38();
                           }
                        }
                     }
                     else if(data.name_319[0] == "aim_at_tank")
                     {
                        if(tankClientObjectByTankId[data.name_319[1]] != null && tankClientObjectByTankId[data.name_319[2]] != null)
                        {
                           td = TankModel(Main.osgi.getService(ITank)).getTankData(tankClientObjectByTankId[data.name_319[1]] as ClientObject);
                           target = TankModel(Main.osgi.getService(ITank)).getTankData(tankClientObjectByTankId[data.name_319[2]] as ClientObject);
                           if(td != null && target != null)
                           {
                              parser = JSON.parse(data.name_319[3]);
                              _loc1 = new package_67.Vector3d(parser.x,parser.y,parser.z);
                              Model.object = td.object;
                              name_286(modelRegistry.getModel(Long.getLong(1691794381,-1794202080))).aimRemoteAtTank(target.object,_loc1);
                              Model.method_38();
                           }
                        }
                     }
                     else if(data.name_319[0] == "start_fire")
                     {
                        if(tankClientObjectByTankId[data.name_319[1]] != null)
                        {
                           this.method_1119(tankClientObjectByTankId[data.name_319[1]],data.name_319[1],data.name_319.length > 2 ? String(data.name_319[2]) : "");
                        }
                     }
                     else if(data.name_319[0] == "fire")
                     {
                        if(tankClientObjectByTankId[data.name_319[1]] != null)
                        {
                           this.method_1118(tankClientObjectByTankId[data.name_319[1]],data.name_319[2]);
                        }
                     }
                     else if(data.name_319[0] == "reset_target")
                     {
                        if(tankClientObjectByTankId[data.name_319[1]] != null)
                        {
                           var_896.name_1630(tankClientObjectByTankId[data.name_319[1]]);
                        }
                     }
                     else if(data.name_319[0] == "change_health")
                     {
                        TankModel(Main.osgi.getService(ITank)).changeHealth(tankClientObjectByTankId[data.name_319[1]],data.name_319[2]);
                     }
                     else if(data.name_319[0] == "damage_tank")
                     {
                        this.method_1129(tankClientObjectByTankId[data.name_319[1]],data.name_319[2],data.name_319[3]);
                     }
                     else if(data.name_319[0] == "init_shots_data")
                     {
                        this.method_1122(data.name_319[1]);
                     }
                     else if(data.name_319[0] == "stop_fire")
                     {
                        this.method_1121(tankClientObjectByTankId[data.name_319[1]],data.name_319[1]);
                     }
                     else if(data.name_319[0] == "kick_for_cheats")
                     {
                        Network(Main.osgi.getService(name_2)).destroy();
                        BattlefieldModel(Main.osgi.getService(IBattleField)).getConfig().map.destroy();
                        BattlefieldModel(Main.osgi.getService(IBattleField)).getConfig().map = null;
                        BattlefieldModel(Main.osgi.getService(IBattleField)).objectUnloaded(null);
                        BattleController(Main.osgi.getService(IBattleController)).destroy();
                        StatisticsModel(Main.osgi.getService(IBattlefieldGUI)).objectUnloaded(null);
                        ChatModel(Main.osgi.getService(IChatBattle)).objectUnloaded(null);
                        i = 0;
                        while(i < Main.mainContainer.numChildren)
                        {
                           Main.mainContainer.removeChildAt(1);
                           i++;
                        }
                        name_560(Main.osgi.getService(name_560)).drawBg();
                        name_560(Main.osgi.getService(name_560)).showBg();
                        alertWindow = new Alert(-1,true);
                        alertWindow.name_1626 = "Вы были кикнуты за читы. Пидор. Фу.";
                        Main.systemUILayer.addChild(alertWindow);
                     }
                     else if(data.name_319[0] == "update_player_statistic")
                     {
                        this.method_1123(data.name_319[1]);
                     }
                     else if(data.name_319[0] == "change_fund")
                     {
                        StatisticsModel(Main.osgi.getService(IBattlefieldGUI)).fundChange(null,data.name_319[1]);
                     }
                     else if(data.name_319[0] == "battle_finish")
                     {
                        this.method_1117(data.name_319[1]);
                     }
                     else if(data.name_319[0] == "battle_restart")
                     {
                        StatisticsModel(Main.osgi.getService(IBattlefieldGUI)).restart(null,data.name_319[1]);
                        BattlefieldModel(Main.osgi.getService(IBattleField)).battleRestart(null);
                     }
                     else if(data.name_319[0] == "start_fire_twins")
                     {
                        this.method_1134(tankClientObjectByTankId[data.name_319[1]],data.name_319[2]);
                     }
                     else if(data.name_319[0] == "start_fire_snowman")
                     {
                        this.method_1114(tankClientObjectByTankId[data.name_319[1]],data.name_319[2]);
                     }
                     else if(data.name_319[0] == "show_nube_up_score")
                     {
                        name_396(modelRegistry.getModel(Long.getLong(1118509469,-35521391))).showInfoWindow(604800,100,50);
                     }
                     else if(data.name_319[0] == "show_nube_new_rank")
                     {
                        achievementModel = Main.osgi.getService(IAchievementModel) as AchievementModel;
                        achievementModel.name_477();
                     }
                     else if(data.name_319[0] == "change_spec_tank")
                     {
                        this.method_1125(tankClientObjectByTankId[data.name_319[1]],data.name_319[2]);
                     }
                     else if(data.name_319[0] == "change_temperature_tank")
                     {
                        TankModel(Main.osgi.getService(ITank)).setTemperature(tankClientObjectByTankId[data.name_319[1]],data.name_319[2]);
                     }
                     else if(data.name_319[0] == "fire_ricochet")
                     {
                        this.method_1137(data.name_319[1],data.name_319[2]);
                     }
                     else if(data.name_319[0] == "change_team_scores")
                     {
                        StatisticsModel(Main.osgi.getService(IBattlefieldGUI)).changeTeamScore(null,BattleTeamType.getType(data.name_319[1]),data.name_319[2]);
                     }
                     else if(data.name_319[0] == "init_ctf_model")
                     {
                        json = JSON.parse(data.name_319[1]);
                        lighting = json.lighting;
                        ctfCC = new name_1285();
                        soundCC = new name_1596();
                        soundCC.flagDropSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,json.flagDropSound)));
                        soundCC.flagReturnSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,json.flagReturnSound)));
                        soundCC.flagTakeSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,json.flagTakeSound)));
                        soundCC.winSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,json.winSound)));
                        ctfCC.blueFlagSprite = ImageResource(resourceRegistry.getResource(Long.getLong(0,json.blueFlagSprite)));
                        ctfCC.bluePedestalModel = Tanks3DSResource(resourceRegistry.getResource(Long.getLong(0,json.bluePedestalModel)));
                        ctfCC.redFlagSprite = ImageResource(resourceRegistry.getResource(Long.getLong(0,json.redFlagSprite)));
                        ctfCC.redPedestalModel = Tanks3DSResource(resourceRegistry.getResource(Long.getLong(0,json.redPedestalModel)));
                        ctfCC.sounds = soundCC;
                        Base.object = ctfCC;
                        redColor = new name_1307(lighting.redColor,lighting.redIntensity);
                        blueColor = new name_1307(lighting.blueColor,lighting.blueIntensity);
                        modeLight = new name_1312(redColor,blueColor,null,lighting.attenuationBegin,lighting.attenuationEnd);
                        name_272(OSGi.getInstance().getService(name_272)).setLightForMode(BattleMode.CTF,modeLight);
                        ctfModel = new CTFModel();
                        ctfModel.method_18(ctfCC);
                        ctfModel.initObject(this.var_906,new Vector3(json.posBlueFlag.x,json.posBlueFlag.y,json.posBlueFlag.z),new Vector3(json.posRedFlag.x,json.posRedFlag.y,json.posRedFlag.z));
                        flagsState = new name_1297();
                        blueFlag = new name_1298();
                        blueFlag.name_1300 = new Vector3(json.basePosBlueFlag.x,json.basePosBlueFlag.y,json.basePosBlueFlag.z);
                        blueFlag.name_1289 = new Vector3(json.posBlueFlag.x,json.posBlueFlag.y,json.posBlueFlag.z);
                        blueFlag.name_1292 = json.blueFlagCarrierId;
                        redFlag = new name_1298();
                        redFlag.name_1300 = new Vector3(json.basePosRedFlag.x,json.basePosRedFlag.y,json.basePosRedFlag.z);
                        redFlag.name_1289 = new Vector3(json.posRedFlag.x,json.posRedFlag.y,json.posRedFlag.z);
                        redFlag.name_1292 = json.redFlagCarrierId;
                        flagsState.blueFlag = blueFlag;
                        flagsState.redFlag = redFlag;
                        ctfModel.method_816(this.var_906,flagsState);
                        Main.osgi.registerService(name_994,ctfModel);
                        Base.method_38();
                     }
                     else if(data.name_319[0] == "init_dom_model")
                     {
                        parser = JSON.parse(data.name_319[1]);
                        lighting = parser.lighting;
                        pointsCC = new name_1597();
                        pointsCC.keypointTriggerRadius = 10;
                        pointsCC.minesRestrictionRadius = 5;
                        pointsCC.keypointVisorHeight = 500;
                        pointsCC.resources = new name_1311();
                        pointsCC.resources.bigLetters = ImageResource(resourceRegistry.getResource(Long.getLong(0,parser.bigLetters)));
                        pointsCC.resources.blueCircle = ImageResource(resourceRegistry.getResource(Long.getLong(0,parser.blueCircle)));
                        pointsCC.resources.bluePedestalTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,parser.bluePedestalTexture)));
                        pointsCC.resources.blueRay = ImageResource(resourceRegistry.getResource(Long.getLong(0,parser.blueRay)));
                        pointsCC.resources.blueRayTip = ImageResource(resourceRegistry.getResource(Long.getLong(0,parser.blueRayTip)));
                        pointsCC.resources.neutralCircle = ImageResource(resourceRegistry.getResource(Long.getLong(0,parser.neutralCircle)));
                        pointsCC.resources.neutralPedestalTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,parser.neutralPedestalTexture)));
                        pointsCC.resources.pedestal = Tanks3DSResource(resourceRegistry.getResource(Long.getLong(0,parser.cp_pedestal)));
                        pointsCC.resources.redCircle = ImageResource(resourceRegistry.getResource(Long.getLong(0,parser.redCircle)));
                        pointsCC.resources.redPedestalTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,parser.redPedestalTexture)));
                        pointsCC.resources.redRay = ImageResource(resourceRegistry.getResource(Long.getLong(0,parser.redRay)));
                        pointsCC.resources.redRayTip = ImageResource(resourceRegistry.getResource(Long.getLong(0,parser.redRayTip)));
                        pointsCC.sounds = new name_1607();
                        pointsCC.sounds.pointCaptureStartPositiveSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,parser.startCapturingSound)));
                        pointsCC.sounds.pointCaptureStopPositiveSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,parser.stopCapturingSound)));
                        pointsCC.sounds.pointCapturedPositiveSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,parser.pointCapturedSound)));
                        pointsCC.sounds.pointCapturedNegativeSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,parser.enemyPointCapturedSound)));
                        pointsCC.sounds.pointNeutralizedPositiveSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,parser.enemyLostPointSound)));
                        pointsCC.sounds.pointNeutralizedNegativeSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,parser.lostPointSound)));
                        Base.object = pointsCC;
                        redPointColor = new name_1307(lighting.redPointColor,lighting.redPointIntensity);
                        bluePointColor = new name_1307(lighting.bluePointColor,lighting.bluePointIntensity);
                        neutralPointColor = new name_1307(lighting.neutralPointColor,lighting.neutralPointIntensity);
                        modeLight = new name_1312(redPointColor,bluePointColor,neutralPointColor,lighting.attenuationBegin,lighting.attenuationEnd);
                        name_272(OSGi.getInstance().getService(name_272)).setLightForMode(BattleMode.CP,modeLight);
                        model = new DOMModel();
                        model.method_18(pointsCC);
                        points = new Vector.<name_1592>();
                        for each(obj in parser.points)
                        {
                           point = new name_1592();
                           point.radius = obj.radius;
                           point.id = obj.id;
                           point.pos = new Vector3(obj.x,obj.y,obj.z);
                           point.score = obj.score;
                           point.name_1604 = new Vector.<String>();
                           for each(userId in obj.occupated_users)
                           {
                              point.name_1604.push(userId);
                           }
                           points.push(point);
                        }
                        model.initObject(points);
                        model.objectLoaded(null);
                        Main.osgi.registerService(IDOMModel,model);
                        Base.method_38();
                     }
                     else if(data.name_319[0] == "flagTaken")
                     {
                        CTFModel(Main.osgi.getService(name_994)).flagTaken(null,data.name_319[1],BattleTeamType.getType(data.name_319[2]));
                     }
                     else if(data.name_319[0] == "deliver_flag")
                     {
                        CTFModel(Main.osgi.getService(name_994)).flagDelivered(null,BattleTeamType.getType(data.name_319[1]),data.name_319[2]);
                     }
                     else if(data.name_319[0] == "flag_drop")
                     {
                        json = JSON.parse(data.name_319[1]);
                        CTFModel(Main.osgi.getService(name_994)).dropFlag(null,new package_41.Vector3dData(json.x,json.y,json.z),BattleTeamType.getType(json.flagTeam));
                     }
                     else if(data.name_319[0] == "return_flag")
                     {
                        CTFModel(Main.osgi.getService(name_994)).returnFlagToBase(null,BattleTeamType.getType(data.name_319[1]),data.name_319[2]);
                     }
                     else if(data.name_319[0] != "show_warning_table")
                     {
                        if(data.name_319[0] == "change_user_team")
                        {
                           StatisticsModel(Main.osgi.getService(IBattlefieldGUI)).changeUserTeam(null,data.name_319[1],BattleTeamType.getType(data.name_319[2]));
                        }
                        else if(data.name_319[0] == "init_inventory")
                        {
                           jsParser = JSON.parse(data.name_319[1]);
                           items = new Array();
                           for each(item in jsParser.items)
                           {
                              _item = new name_1593();
                              _item.count = item.count;
                              _item.id = item.id;
                              _item.itemEffectTime = item.itemEffectTime;
                              _item.itemRestSec = item.itemRestSec;
                              _item.slotId = item.slotId;
                              items.push(_item);
                           }
                           this.var_903.name_1619(items);
                        }
                        else if(data.name_319[0] == "update_inventory")
                        {
                           jsParser = JSON.parse(data.name_319[1]);
                           items = new Array();
                           for each(item in jsParser.items)
                           {
                              _item = new name_1593();
                              _item.count = item.count;
                              _item.id = item.id;
                              _item.itemEffectTime = item.itemEffectTime;
                              _item.itemRestSec = item.itemRestSec;
                              _item.slotId = item.slotId;
                              items.push(_item);
                           }
                           this.var_903.name_1625(items);
                        }
                        else if(data.name_319[0] == "activate_item")
                        {
                           this.var_903.name_1623(data.name_319[1]);
                        }
                        else if(data.name_319[0] == "change_effect_time")
                        {
                           this.var_903.method_997(data.name_319[1],data.name_319[2]);
                        }
                        else if(data.name_319[0] == "activate_cooldown")
                        {
                           this.var_903.method_994(data.name_319[1],data.name_319[2]);
                        }
                        else if(data.name_319[0] == "enable_effect")
                        {
                           if(tankClientObjectByTankId[data.name_319[1]] != null)
                           {
                              this.var_903.name_1616(tankClientObjectByTankId[data.name_319[1]],data.name_319[2],data.name_319[3]);
                           }
                        }
                        else if(data.name_319[0] == "disnable_effect")
                        {
                           if(tankClientObjectByTankId[data.name_319[1]] != null)
                           {
                              this.var_903.name_1624(tankClientObjectByTankId[data.name_319[1]],data.name_319[2]);
                           }
                        }
                        else if(data.name_319[0] == "init_effects")
                        {
                           jsArray = JSON.parse(data.name_319[1]);
                           effects = new Array();
                           for each(obj in jsArray.effects)
                           {
                              effect = new name_1598();
                              effect.durationTime = obj.durationTime;
                              effect.itemIndex = obj.itemIndex;
                              effect.userID = obj.userID;
                              effects.push(effect);
                           }
                           this.var_903.name_1631(null,effects);
                        }
                        else if(data.name_319[0] == "local_user_killed")
                        {
                           this.var_903.name_1620();
                        }
                        else if(data.name_319[0] == "init_mine_model")
                        {
                           this.var_904.method_76(data.name_319[1]);
                        }
                        else if(data.name_319[0] == "remove_mines")
                        {
                           this.var_904.method_957(data.name_319[1]);
                        }
                        else if(data.name_319[0] == "put_mine")
                        {
                           json = JSON.parse(data.name_319[1]);
                           this.var_904.method_955(tankClientObjectByTankId[json.userId],json);
                        }
                        else if(data.name_319[0] == "activate_mine")
                        {
                           this.var_904.method_956(data.name_319[1]);
                        }
                        else if(data.name_319[0] == "hit_mine")
                        {
                           if(tankClientObjectByTankId[data.name_319[2]] != null)
                           {
                              this.var_904.method_958(tankClientObjectByTankId[data.name_319[2]],data.name_319[1]);
                           }
                        }
                        else if(data.name_319[0] == "init_mines")
                        {
                           this.var_904.method_954(data.name_319[1]);
                        }
                        else if(data.name_319[0] == "tank_capturing_point")
                        {
                           if(tankClientObjectByTankId[data.name_319[2]] != null)
                           {
                              DOMModel(Main.osgi.getService(IDOMModel)).serverTankCapturingPoint(data.name_319[1],tankClientObjectByTankId[data.name_319[2]]);
                           }
                        }
                        else if(data.name_319[0] == "tank_leave_capturing_point")
                        {
                           if(tankClientObjectByTankId[data.name_319[1]] != null)
                           {
                              DOMModel(Main.osgi.getService(IDOMModel)).serverTankLeaveCapturingPoint(tankClientObjectByTankId[data.name_319[1]],data.name_319[2]);
                           }
                        }
                        else if(data.name_319[0] == "set_point_score")
                        {
                           DOMModel(Main.osgi.getService(IDOMModel)).serverSetPointScore(data.name_319[1],data.name_319[2]);
                        }
                        else if(data.name_319[0] == "point_captured_by")
                        {
                           DOMModel(Main.osgi.getService(IDOMModel)).serverPointCapturedBy(data.name_319[1],data.name_319[2]);
                        }
                        else if(data.name_319[0] == "point_lost_by")
                        {
                           DOMModel(Main.osgi.getService(IDOMModel)).serverPointLostBy(data.name_319[1],data.name_319[2]);
                        }
                        else if(data.name_319[0] == "shaft_quick_shot")
                        {
                           this.method_1139(data.name_319[1],data.name_319[2]);
                        }
                        else if(data.name_319[0] == "update_point_predestal")
                        {
                           DOMModel(Main.osgi.getService(IDOMModel)).updatePedestal(data.name_319[1],data.name_319[2]);
                        }
                        else if(data.name_319[0] == "init_sfx_data")
                        {
                           LightDataManager.init(data.name_319[1]);
                        }
                        else if(data.name_319[0] == "init_bcsh_data")
                        {
                           this.method_1126(data.name_319[1]);
                        }
                     }
                  }
            }
         }
         catch(e:Error)
         {
            trace(e.getStackTrace());
            OSGi.clientLog.log("battleError",e.getStackTrace());
         }
      }
      
      private function method_1133(param1:String) : DamageType
      {
         var _loc2_:DamageType = null;
         switch(param1)
         {
            case "smoky":
               _loc2_ = DamageType.SMOKY;
               break;
            case "flamethrower":
               _loc2_ = DamageType.FIREBIRD;
               break;
            case "twins":
               _loc2_ = DamageType.TWINS;
               break;
            case "railgun":
               _loc2_ = DamageType.RAILGUN;
               break;
            case "isida":
               _loc2_ = DamageType.ISIS;
               break;
            case "shaft":
               _loc2_ = DamageType.SHAFT;
               break;
            case "frezee":
               _loc2_ = DamageType.FREEZE;
               break;
            case "ricochet":
               _loc2_ = DamageType.RICOCHET;
               break;
            case "thunder":
               _loc2_ = DamageType.THUNDER;
               break;
            case "mine":
               _loc2_ = DamageType.MINE;
               break;
            case "vulcan":
               _loc2_ = DamageType.MACHINE_GUN;
               break;
            case "shotgun":
               _loc2_ = DamageType.SHOTGUN;
         }
         return _loc2_;
      }
      
      private function method_1129(param1:ClientObject, param2:int, param3:String) : void
      {
         var _loc5_:DamageIndicatorType = null;
         var _loc4_:Boolean = BattlefieldModel(Main.osgi.getService(IBattleField)).isEnableDamageUpEffect();
         if(_loc4_)
         {
            _loc5_ = DamageIndicatorType.name_1621(param3);
            new DamageEffect().name_220(TankModel(Main.osgi.getService(ITank)).getTankData(tankClientObjectByTankId[param1.id] as ClientObject).tank,Math.floor(param2),_loc5_);
         }
      }
      
      private function method_1137(param1:String, param2:String) : void
      {
         var _loc3_:Object = JSON.parse(param2);
         var _loc4_:ClientObject = tankClientObjectByTankId[param1];
         if(_loc4_ == null || var_894 == null || _loc3_ == null)
         {
            return;
         }
         var_894.name_1603(_loc4_,_loc3_.victimId,new package_41.Vector3dData(_loc3_.hitPos3d.x,_loc3_.hitPos3d.y,_loc3_.hitPos3d.z),_loc3_.x,_loc3_.y,_loc3_.z,1);
      }
      
      private function method_1139(param1:String, param2:String) : void
      {
         var _loc3_:ClientObject = tankClientObjectByTankId[param1];
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:Object = JSON.parse(param2);
         shaftModel.name_1613(_loc3_,_loc4_.targets,_loc4_.hitPoints,new Vector3(_loc4_.dir.x,_loc4_.dir.y,_loc4_.dir.z));
      }
      
      private function method_1125(param1:ClientObject, param2:String) : void
      {
         var _loc3_:Object = JSON.parse(param2);
         var _loc4_:TankSpecification = new TankSpecification();
         _loc4_.speed = _loc3_.speed;
         _loc4_.turnSpeed = _loc3_.turnSpeed;
         _loc4_.turretRotationSpeed = _loc3_.turretRotationSpeed;
         _loc4_.turretRotationAccel = _loc3_.turretRotationAccel;
         TankModel(Main.osgi.getService(ITank)).changeSpecification(param1,_loc4_,_loc3_.immediate);
      }
      
      private function method_1114(param1:ClientObject, param2:String) : void
      {
         var _loc3_:Object = JSON.parse(param2);
         if(param1 == null || var_892 == null || _loc3_ == null)
         {
            return;
         }
         var_892.fire(param1,param1.id,_loc3_.realShotId,new package_41.Vector3dData(_loc3_.dirToTarget.x,_loc3_.dirToTarget.y,_loc3_.dirToTarget.z));
      }
      
      private function method_1134(param1:ClientObject, param2:String) : void
      {
         var _loc3_:Object = JSON.parse(param2);
         if(param1 == null || var_893 == null || _loc3_ == null)
         {
            return;
         }
         var_893.fire(param1,param1.id,_loc3_.currBarrel,_loc3_.realShotId,new package_41.Vector3dData(_loc3_.dirToTarget.x,_loc3_.dirToTarget.y,_loc3_.dirToTarget.z));
      }
      
      private function method_1117(param1:String) : void
      {
         var _loc4_:Object = null;
         var _loc5_:name_1099 = null;
         var _loc2_:Object = JSON.parse(param1);
         var _loc3_:Array = new Array();
         for each(_loc4_ in _loc2_.users)
         {
            _loc5_ = new name_1099(_loc4_.kills,_loc4_.deaths,_loc4_.id,_loc4_.rank,_loc4_.score,_loc4_.prize,BattleTeamType.getType(_loc4_.team_type),_loc4_.id,Boolean(_loc4_.suspicious == "true"),_loc4_.premiumBonusReward,_loc4_.newbiesAbonementBonusReward,_loc4_.stars);
            _loc3_.push(_loc5_);
         }
         StatisticsModel(Main.osgi.getService(IBattlefieldGUI)).finish(null,_loc3_,_loc2_.time_to_restart / 1000);
         BattlefieldModel(Main.osgi.getService(IBattleField)).battleFinish(null);
      }
      
      private function method_1123(param1:String) : void
      {
         var _loc2_:Object = JSON.parse(param1);
         var _loc3_:name_1099 = new name_1099(_loc2_.kills,_loc2_.deaths,_loc2_.id,_loc2_.rank,_loc2_.score,0,BattleTeamType.getType(_loc2_.team_type),_loc2_.id,Boolean(_loc2_.suspicious == "true"),0,0,0);
         StatisticsModel(Main.osgi.getService(IBattlefieldGUI)).changeUsersStat(null,new Array(_loc3_));
      }
      
      private function method_1124(param1:String) : void
      {
         var _loc2_:Object = JSON.parse(param1);
         var _loc3_:package_41.Vector3dData = new package_41.Vector3dData(_loc2_.x,_loc2_.y,_loc2_.z);
         var _loc4_:package_41.Vector3dData = new package_41.Vector3dData(0,0,_loc2_.rot);
         var _loc5_:TankSpecification = new TankSpecification();
         _loc5_.speed = _loc2_.speed;
         _loc5_.turnSpeed = _loc2_.turn_speed;
         _loc5_.turretRotationSpeed = _loc2_.turret_rotation_speed;
         TankModel(Main.osgi.getService(ITank)).spawn(tankClientObjectByTankId[_loc2_.tank_id],_loc5_,BattleTeamType.getType(_loc2_.team_type),_loc3_,_loc4_,_loc2_.health,_loc2_.incration_id);
      }
      
      private function method_1122(param1:String) : void
      {
         var _loc5_:Object = null;
         var _loc6_:name_1454 = null;
         var _loc7_:* = undefined;
         var _loc2_:Object = JSON.parse(param1);
         var _loc3_:name_32 = Main.osgi.getService(name_32) as name_32;
         var _loc4_:WeaponWeakeningModel = WeaponWeakeningModel(_loc3_.getModelsByInterface(IWeaponWeakeningModel)[0]);
         for each(_loc5_ in _loc2_.weapons)
         {
            _loc6_ = new name_1454(_loc5_.reload);
            _loc6_.name_1618.value = _loc5_.auto_aiming_down;
            _loc6_.name_1614.value = _loc5_.auto_aiming_up;
            _loc6_.name_1622.value = _loc5_.num_rays_down;
            _loc6_.name_1628.value = _loc5_.num_rays_up;
            if(Boolean(_loc5_.has_wwd))
            {
               _loc4_.initObject(WeaponsManager.name_185(_loc5_.id),_loc5_.max_damage_radius,_loc5_.min_damage_percent,_loc5_.min_damage_radius);
            }
            _loc7_ = _loc5_.special_entity;
            WeaponsManager.var_495[_loc5_.id] = _loc6_;
            WeaponsManager.var_497[_loc5_.id] = _loc7_;
         }
      }
      
      private function method_1126(param1:String) : void
      {
         var _loc9_:Vector.<name_1594> = null;
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         var _loc4_:String = null;
         var _loc5_:Object = null;
         var _loc6_:name_1600 = null;
         var _loc7_:BCSHModel = null;
         var _loc8_:Object = JSON.parse(param1);
         for each(_loc2_ in _loc8_.bcsh)
         {
            if(WeaponsManager.var_496[_loc2_.id] == null)
            {
               _loc4_ = String(_loc2_.id);
               _loc3_ = _loc2_.params;
               _loc7_ = new BCSHModel();
               for each(_loc5_ in _loc3_)
               {
                  _loc6_ = new name_1600(_loc5_.brightness,_loc5_.contrast,_loc5_.saturation,_loc5_.hue);
                  _loc7_.putData(_loc5_.key,_loc6_);
               }
               WeaponsManager.var_496[_loc4_] = _loc7_;
            }
         }
         _loc9_ = null;
         for each(_loc2_ in _loc8_.colorTransform)
         {
            if(WeaponsManager.colorTransform[_loc2_.id] == null)
            {
               _loc9_ = new Vector.<name_1594>();
               _loc4_ = String(_loc2_.id);
               _loc3_ = _loc2_.params;
               for each(_loc5_ in _loc3_)
               {
                  _loc9_.push(new name_1594(new name_1611(_loc5_.t,_loc5_.redMultiplier,_loc5_.greenMultiplier,_loc5_.blueMultiplier,_loc5_.alphaMultiplier,_loc5_.redOffset,_loc5_.greenOffset,_loc5_.blueOffset,_loc5_.alphaOffset)));
               }
               WeaponsManager.colorTransform[_loc4_] = _loc9_;
            }
         }
      }
      
      private function method_1121(param1:ClientObject, param2:String) : void
      {
         var _loc6_:FlamethrowerModel = null;
         if(TankModel(Main.osgi.getService(ITank)) == null)
         {
            return;
         }
         var _loc3_:name_32 = Main.osgi.getService(name_32) as name_32;
         if(TankModel(Main.osgi.getService(ITank)) == null || tankClientObjectByTankId[param1.id] as ClientObject == null)
         {
            return;
         }
         var _loc4_:TankData = TankModel(Main.osgi.getService(ITank)).getTankData(tankClientObjectByTankId[param1.id] as ClientObject);
         if(_loc4_ == null || _loc4_.turret == null || _loc4_.turret.id == null)
         {
            return;
         }
         var _loc5_:String = String(_loc4_.turret.id.split("_")[0]);
         switch(_loc5_)
         {
            case "flamethrower":
               _loc6_ = Main.osgi.getService(name_1595) as FlamethrowerModel;
               _loc6_.name_1602(param1,param2);
               break;
            case "isida":
               var_896.name_1617(param1,param2);
               break;
            case "frezee":
               var_902.name_1602(param1,param2);
               break;
            case "vulcan":
               var_895.name_1602(param1,param2);
         }
      }
      
      private function method_1119(param1:ClientObject, param2:String, param3:String) : void
      {
         var td:TankData;
         var models:name_32 = null;
         var id:String = null;
         var railgun:RailgunModel = null;
         var flamethrower:FlamethrowerModel = null;
         var action:name_1599 = null;
         var parser:Object = null;
         var localHitPoint:package_67.Vector3d = null;
         var user:ClientObject = param1;
         var firing:String = param2;
         var argsJSON:String = param3;
         models = Main.osgi.getService(name_32) as name_32;
         if(TankModel(Main.osgi.getService(ITank)) == null || tankClientObjectByTankId[user.id] as ClientObject == null)
         {
            return;
         }
         td = TankModel(Main.osgi.getService(ITank)).getTankData(tankClientObjectByTankId[user.id] as ClientObject);
         if(td == null || td.turret == null || td.turret.id == null)
         {
            return;
         }
         id = String(td.turret.id.split("_")[0]);
         try
         {
            switch(id)
            {
               case "railgun":
                  railgun = models.getModelsByInterface(name_1612)[0] as RailgunModel;
                  railgun.name_1601(user,firing);
                  break;
               case "flamethrower":
                  flamethrower = Main.osgi.getService(name_1595) as FlamethrowerModel;
                  flamethrower.name_1601(user,firing);
                  break;
               case "isida":
                  action = new name_1599();
                  parser = JSON.parse(argsJSON);
                  localHitPoint = parser.localHitPoint == null ? new package_67.Vector3d() : new package_67.Vector3d(parser.localHitPoint.x,parser.localHitPoint.y,parser.localHitPoint.z);
                  action.shooterId = parser.shooterId;
                  action.targetId = parser.targetId;
                  action.type = name_1610.getType(parser.type);
                  var_896.name_1615(user,action,BattleUtils.getVector3(localHitPoint));
                  break;
               case "frezee":
                  var_902.name_1601(user,firing);
                  break;
               case "ricochet":
                  parser = JSON.parse(argsJSON);
                  var_894.fire(user,firing,parser.x,parser.y,parser.z);
                  break;
               case "vulcan":
                  var_895.name_1601(user,firing);
            }
         }
         catch(e:Error)
         {
            trace("Error parsing fire! Known specs:");
            trace("ID: " + id);
            trace("Firing: " + firing);
            trace("Args: " + argsJSON);
            trace(e.getStackTrace().replace("Error",""));
         }
      }
      
      private function method_1118(param1:ClientObject, param2:String) : void
      {
         var id:String;
         var parser:Object = null;
         var td:TankData = null;
         var targetInc:Array = null;
         var hitPoints:Array = null;
         var targets:Array = null;
         var targetPostitions:Array = null;
         var railgun:RailgunModel = null;
         var hitPoint:package_41.Vector3dData = null;
         var smoky:SmokyModel = null;
         var hitPos:package_41.Vector3dData = null;
         var shaftModel:ShaftModel = null;
         var ids:Array = null;
         var static_point:Vector3 = null;
         var i:int = 0;
         var obj:Object = null;
         var objj:Object = null;
         var user:ClientObject = param1;
         var js:String = param2;
         parser = null;
         try
         {
            parser = JSON.parse(js);
         }
         catch(e:Error)
         {
            return;
         }
         td = TankModel(Main.osgi.getService(ITank)).getTankData(tankClientObjectByTankId[user.id] as ClientObject);
         if(td == null || td.turret == null || td.turret.id == null)
         {
            return;
         }
         id = String(td.turret.id.split("_")[0]);
         switch(id)
         {
            case "railgun":
               targetInc = parser.targetInc as Array;
               hitPoints = parser.hitPoints as Array;
               targets = parser.targets as Array;
               targetPostitions = parser.targetPostitions as Array;
               i = 0;
               while(i < hitPoints.length)
               {
                  hitPoints[i] = this.method_1130(hitPoints[i]);
                  i++;
               }
               railgun = getWeaponController(td.turret) as RailgunModel;
               if(!railgun)
               {
                  return;
               }
               railgun.fire(user,user.id,hitPoints,targets);
               break;
            case "smoky":
               if(parser.hitPos != null)
               {
                  hitPoint = new package_41.Vector3dData(parser.hitPos.x,parser.hitPos.y,parser.hitPos.z);
               }
               smoky = getWeaponController(td.turret) as SmokyModel;
               if(!smoky)
               {
                  return;
               }
               smoky.fire(user,user.id,hitPoint,parser.victimId,1);
               break;
            case "shotgun":
               this.method_1131(td,parser);
               break;
            case "smokyxt":
               if(parser.hitPos != null)
               {
                  hitPoint = new package_41.Vector3dData(parser.hitPos.x,parser.hitPos.y,parser.hitPos.z);
               }
               smoky = getWeaponController(td.turret) as SmokyModel;
               if(!smoky)
               {
                  return;
               }
               smoky.fire(user,user.id,hitPoint,parser.victimId,1);
               break;
            case "twins":
               var_893.name_1603(user,user.id,parser.shotId,new package_41.Vector3dData(parser.hitPos.x,parser.hitPos.y,parser.hitPos.z),parser.victimId,0.3);
               break;
            case "thunder":
               if(parser.hitPos != null)
               {
                  hitPos = new package_41.Vector3dData(parser.hitPos.x,parser.hitPos.y,parser.hitPos.z);
               }
               var_899.fire(user,user.id,hitPos,parser.mainTargetId,1,parser.splashTargetIds,null);
               break;
            case "shaft":
               shaftModel = getWeaponController(td.turret) as ShaftModel;
               if(!shaftModel)
               {
                  return;
               }
               ids = new Array();
               if(parser.static_shot != null)
               {
                  static_point = new Vector3(parser.static_shot.x,parser.static_shot.y,parser.static_shot.z);
               }
               for each(obj in parser.targets)
               {
                  objj = obj.target;
                  ids.push(new name_1609(new Vector3(objj.pos.x,objj.pos.y,objj.pos.z),new Vector3(objj.point_pos.x,objj.point_pos.y,objj.point_pos.z),objj.id));
               }
               shaftModel.fire(user,static_point,ids);
               break;
            case "snowman":
               var_892.name_1603(user,user.id,parser.shotId,new package_41.Vector3dData(parser.hitPos.x,parser.hitPos.y,parser.hitPos.z),parser.victimId,0.3);
         }
      }
      
      private function method_1131(param1:TankData, param2:Object) : void
      {
         var _loc5_:Object = null;
         var _loc6_:TankData = null;
         var _loc3_:name_301 = name_301(modelRegistry.getModel(Long.getLong(486222912,-663069007)));
         var _loc4_:Vector.<name_1243> = new Vector.<name_1243>();
         for each(_loc5_ in param2.targets)
         {
            _loc6_ = TankModel(Main.osgi.getService(ITank)).getTankData(tankClientObjectByTankId[_loc5_.target] as ClientObject);
            if(!(_loc6_ == null || _loc6_.turret == null || _loc6_.turret.id == null))
            {
               _loc4_.push(new name_1243(new package_67.Vector3d(_loc5_.dir.x,_loc5_.dir.y,_loc5_.dir.z),new package_67.Vector3d(_loc5_.localHitPoint.x,_loc5_.localHitPoint.y,_loc5_.localHitPoint.z),_loc5_.numberHits,_loc6_.object));
            }
         }
         Model.object = param1.object;
         _loc3_.shoot(param1.object,new package_67.Vector3d(param2.direction.x,param2.direction.y,param2.direction.z),_loc4_);
         Model.method_38();
      }
      
      private function method_1130(param1:Object) : package_41.Vector3dData
      {
         return new package_41.Vector3dData(param1.x,param1.y,param1.z);
      }
      
      private function method_1127(param1:String) : void
      {
         var _loc2_:Object = JSON.parse(param1);
         var _loc3_:ClientClass = new ClientClass(_loc2_.id,null,_loc2_.id,null);
         var _loc4_:ClientObject = new ClientObject(_loc2_.id,_loc3_,_loc3_.name,null);
         BattlefieldModel(Main.osgi.getService(IBattleField)).addBonus(_loc4_,_loc2_.id,Long.getLong(0,_loc2_.bonus_id),Long.getLong(0,_loc2_.cords),Long.getLong(0,_loc2_.parachute),Long.getLong(0,_loc2_.parachute_inner),new package_41.Vector3dData(_loc2_.x,_loc2_.y,_loc2_.z),false,_loc2_.disappearing_time);
      }
      
      private function method_1136(param1:String) : void
      {
         var _loc3_:Object = null;
         var _loc4_:ClientClass = null;
         var _loc5_:ClientObject = null;
         var _loc2_:Object = JSON.parse(param1);
         for each(_loc3_ in _loc2_)
         {
            _loc4_ = new ClientClass(_loc3_.id,null,_loc3_.id,null);
            _loc5_ = new ClientObject(_loc3_.id,_loc4_,_loc4_.name,null);
            BattlefieldModel(Main.osgi.getService(IBattleField)).addBonus(_loc5_,_loc3_.id,Long.getLong(0,_loc3_.bonus_id),Long.getLong(0,_loc3_.cords),Long.getLong(0,_loc3_.parachute),Long.getLong(0,_loc3_.parachute_inner),new package_41.Vector3dData(_loc3_.x,_loc3_.y,_loc3_.z),true);
         }
      }
      
      private function method_1142(param1:String) : void
      {
         var _loc2_:Object = JSON.parse(param1);
         var _loc3_:Number = Number(_loc2_.turretDir);
         var _loc4_:int = int(_loc2_.ctrlBits);
         if(tankClientObjectByTankId[_loc2_.tank_id] != null)
         {
            TankModel(Main.osgi.getService(ITank)).setControlState(TankModel(Main.osgi.getService(ITank)).getTankData(tankClientObjectByTankId[_loc2_.tank_id]),_loc4_);
         }
      }
      
      private function method_1116(param1:String) : void
      {
         var _loc2_:Object = JSON.parse(param1);
         var _loc3_:package_41.Vector3dData = new package_41.Vector3dData(0,0,0);
         var _loc4_:package_41.Vector3dData = new package_41.Vector3dData(0,0,0);
         var _loc5_:package_41.Vector3dData = new package_41.Vector3dData(0,0,0);
         var _loc6_:package_41.Vector3dData = new package_41.Vector3dData(0,0,0);
         _loc3_.x = _loc2_.position.x;
         _loc3_.y = _loc2_.position.y;
         _loc3_.z = _loc2_.position.z;
         _loc4_.x = _loc2_.orient.x;
         _loc4_.y = _loc2_.orient.y;
         _loc4_.z = _loc2_.orient.z;
         _loc5_.x = _loc2_.line.x;
         _loc5_.y = _loc2_.line.y;
         _loc5_.z = _loc2_.line.z;
         _loc6_.x = _loc2_.angle.x;
         _loc6_.y = _loc2_.angle.y;
         _loc6_.z = _loc2_.angle.z;
         var _loc7_:Number = Number(_loc2_.turretDir);
         var _loc8_:int = int(_loc2_.ctrlBits);
         if(tankClientObjectByTankId[_loc2_.tank_id] != null)
         {
            TankModel(Main.osgi.getService(ITank)).move(tankClientObjectByTankId[_loc2_.tank_id] as ClientObject,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,false);
         }
      }
      
      private function tracePing(param1:Number) : void
      {
         if(this.var_905 == null)
         {
            this.var_905 = new Label();
            this.var_905.filters = [new GlowFilter()];
            Main.systemUILayer.addChild(this.var_905);
         }
         this.var_905.text = "ping: " + param1;
         this.var_905.x = 15;
         this.var_905.y = 100;
      }
      
      private function removeUser(param1:String) : void
      {
         var _loc3_:Object = null;
         if(tankClientObjectByTankId[param1] == null)
         {
            return;
         }
         var _loc2_:ClientObject = tankClientObjectByTankId[param1];
         TankModel(Main.osgi.getService(ITank)).objectUnloaded(_loc2_);
         StatisticsModel(Main.osgi.getService(IBattlefieldGUI)).userDisconnect(null,param1);
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.method_19(TankModel);
            _loc3_ = null;
            delete tankClientObjectByTankId[param1];
            _loc2_ = null;
         }
      }
      
      private function method_1128(param1:String) : void
      {
         var _loc2_:Object = JSON.parse(param1);
         if(!_loc2_.system)
         {
            ChatModel(Main.osgi.getService(IChatBattle)).addMessage(null,null,_loc2_.message,BattleTeamType.getType(_loc2_.team_type),_loc2_.team,_loc2_.nickname,_loc2_.rank,_loc2_.chat_level);
         }
         else
         {
            ChatModel(Main.osgi.getService(IChatBattle)).addSystemMessage(null,_loc2_.message);
         }
      }
      
      private function method_1138(param1:String) : void
      {
         var _loc2_:Object = JSON.parse(param1);
         var _loc3_:package_41.Vector3dData = new package_41.Vector3dData(0,0,0);
         var _loc4_:package_41.Vector3dData = new package_41.Vector3dData(0,0,0);
         var _loc5_:package_41.Vector3dData = new package_41.Vector3dData(0,0,0);
         var _loc6_:package_41.Vector3dData = new package_41.Vector3dData(0,0,0);
         _loc3_.x = _loc2_.position.x;
         _loc3_.y = _loc2_.position.y;
         _loc3_.z = _loc2_.position.z;
         _loc4_.x = _loc2_.orient.x;
         _loc4_.y = _loc2_.orient.y;
         _loc4_.z = _loc2_.orient.z;
         _loc5_.x = _loc2_.line.x;
         _loc5_.y = _loc2_.line.y;
         _loc5_.z = _loc2_.line.z;
         _loc6_.x = _loc2_.angle.x;
         _loc6_.y = _loc2_.angle.y;
         _loc6_.z = _loc2_.angle.z;
         var _loc7_:Number = Number(_loc2_.turretDir);
         var _loc8_:int = int(_loc2_.ctrlBits);
         if(tankClientObjectByTankId[_loc2_.tank_id] != null)
         {
            TankModel(Main.osgi.getService(ITank)).move(tankClientObjectByTankId[_loc2_.tank_id] as ClientObject,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,true);
         }
      }
      
      private function method_1132(param1:String) : void
      {
         var _loc2_:Object = JSON.parse(param1);
         if(tankClientObjectByTankId[_loc2_.tank_id] == null)
         {
            return;
         }
         var _loc3_:ClientObject = tankClientObjectByTankId[_loc2_.tank_id];
         TankModel(Main.osgi.getService(ITank)).objectUnloaded(_loc3_);
         delete tankClientObjectByTankId[_loc2_.tank_id];
         this.initTank(param1);
         TankModel(Main.osgi.getService(ITank)).resetFirstSpawn();
         StatisticsModel(Main.osgi.getService(IBattlefieldGUI)).logUserAction(_loc2_.tank_id,name_102(Main.osgi.getService(name_102)).getText(name_390.name_1629));
      }
      
      private function initTank(param1:String) : void
      {
         var tankState:TankState = null;
         var jsonObject:Object = JSON.parse(param1);
         var tankResourceData:TankParts = new TankParts();
         tankResourceData.colormapId = jsonObject.colormap_id;
         tankResourceData.hullId = jsonObject.hull_id;
         tankResourceData.turretId = jsonObject.turret_id;
         tankResourceData.hullResourceId = Long.getLong(0,jsonObject.hull_resource);
         tankResourceData.turretResourceId = Long.getLong(0,jsonObject.turret_resource);
         tankResourceData.colorMapResourceId = Long.getLong(0,jsonObject.colormap_resource);
         var tankSpeedParams:TankSpecification = new TankSpecification();
         tankSpeedParams.speed = jsonObject.maxSpeed;
         tankSpeedParams.turnSpeed = jsonObject.turnMaxSpeed;
         tankSpeedParams.turretRotationSpeed = jsonObject.turret_turn_speed;
         tankSpeedParams.turretRotationAccel = jsonObject.turret_rotation_accel;
         var speedCharacteristics:SpeedCharacteristics = new SpeedCharacteristics();
         speedCharacteristics.maxSpeed = jsonObject.maxSpeed * 100;
         speedCharacteristics.acceleration = jsonObject.acceleration * 100;
         speedCharacteristics.reverseAcceleration = jsonObject.reverseAcceleration * 100;
         speedCharacteristics.deceleration = jsonObject.deceleration * 100;
         speedCharacteristics.turnMaxSpeed = jsonObject.turnMaxSpeed;
         speedCharacteristics.turnAcceleration = jsonObject.turnAcceleration;
         speedCharacteristics.turnReverseAcceleration = jsonObject.turnReverseAcceleration;
         speedCharacteristics.stabilizationAcceleration = jsonObject.reverseAcceleration * 100;
         speedCharacteristics.turnDeceleration = jsonObject.turnDeceleration;
         speedCharacteristics.sideAcceleration = jsonObject.sideAcceleration * 100;
         speedCharacteristics.damping = jsonObject.damping;
         var position:package_41.Vector3dData = new package_41.Vector3dData(0,0,0);
         var _loc7_:Array = String(jsonObject.position).split("@");
         position.x = int(_loc7_[0]);
         position.y = int(_loc7_[1]);
         position.z = int(_loc7_[2]);
         if(!jsonObject.state_null)
         {
            tankState = new TankState();
            tankState.health = jsonObject.health;
            tankState.orientation = new package_41.Vector3dData(0,0,_loc7_[3]);
            tankState.position = position;
            tankState.turretAngle = 0;
         }
         var clientTank:ClientTank = new ClientTank();
         clientTank.health = jsonObject.health;
         clientTank.incarnationId = jsonObject.icration;
         clientTank.self = jsonObject.tank_id == client.id;
         clientTank.speedCharacteristics = speedCharacteristics;
         var _loc10_:String = String(jsonObject.state);
         clientTank.tankSpawnState = _loc10_ == "newcome" ? TankSpawnState.NEWCOME : (_loc10_ == "active" ? TankSpawnState.ACTIVE : (_loc10_ == "suicide" ? TankSpawnState.SUICIDE : TankSpawnState.NEWCOME));
         clientTank.tankSpecification = tankSpeedParams;
         clientTank.tankState = tankState;
         clientTank.teamType = BattleTeamType.getType(jsonObject.team_type);
         this.var_908 = clientTank;
         var _loc11_:Object = jsonObject.sounds;
         var tankSoundResources:TankSoundResources = new TankSoundResources();
         tankSoundResources.engineIdleSoundId = Long.getLong(0,_loc11_.engineIdleSoundId);
         tankSoundResources.engineMovingSoundId = Long.getLong(0,_loc11_.engineMovingSoundId);
         tankSoundResources.engineStartMovingSoundId = Long.getLong(0,_loc11_.engineStartMovingSoundId);
         tankSoundResources.turretRotationSoundId = Long.getLong(0,_loc11_.turretRotationSoundId);
         var tankModel:TankModel = Main.osgi.getService(ITank) as TankModel;
         if(clientTank.self)
         {
            name_771 = true;
         }
         tankClientObjectByTankId[jsonObject.tank_id] = this.initClientObject(jsonObject.tank_id,jsonObject.tank_id);
         this.createTurretSfxModel(WeaponsManager.name_185(jsonObject.turret_id),jsonObject.turret_id,JSON.parse(jsonObject.sfxData));
         tankModel.initObject(tankClientObjectByTankId[jsonObject.tank_id],jsonObject.battleId,jsonObject.mass,jsonObject.power,tankSoundResources,tankResourceData,null,jsonObject.impact_force,jsonObject.kickback,jsonObject.turret_rotation_accel,jsonObject.turret_turn_speed,jsonObject.nickname,jsonObject.rank,tankResourceData.turretId);
         tankModel.initTank(tankClientObjectByTankId[jsonObject.tank_id],clientTank,tankResourceData,jsonObject.models,jsonObject.notificationOfEnter == "true" ? !clientTank.self : false);
      }
      
      private function createTurretSfxModel(param1:ClientObject, param2:String, param3:Object) : void
      {
         switch(param2.split("_")[0])
         {
            case "smoky":
               WeaponsManager.createSmokySFXModel(param1,param3);
               break;
            case "flamethrower":
               WeaponsManager.createFlamethrowerSFXModel(param1,param3);
               break;
            case "ricochet":
               WeaponsManager.createRicochetSFXModel(param1,param3);
               break;
            case "twins":
               WeaponsManager.createTwinsSFXModel(param1,param3);
               break;
            case "frezee":
               WeaponsManager.createFrezeeSFXModel(param1,param3);
               break;
            case "railgun":
               WeaponsManager.createRailgunSFXModel(param1,param3);
               break;
            case "shotgun":
               WeaponsManager.createShotGunSFXModel(param1,param3);
               break;
            case "shaft":
               WeaponsManager.createShaftSFXModel(param1,param3);
               break;
            case "thunder":
               WeaponsManager.createThunderSFXModel(param1,param3);
               break;
            case "isida":
               WeaponsManager.createIsidaSFXModel(param1,param3);
               break;
            case "vulcan":
               WeaponsManager.createVulcanSFXModel(param1,param3);
         }
      }
      
      private function method_1115(param1:String) : void
      {
         this.method_1120(PanelModel(Main.osgi.getService(name_115)).userName,PanelModel(Main.osgi.getService(name_115)).userName);
         var _loc2_:Object = JSON.parse(param1);
         var _loc3_:name_676 = new name_676();
         _loc3_.ambientSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_loc2_.ambientSound))).sound;
         _loc3_.name_761 = SoundResource(resourceRegistry.getResource(Long.getLong(0,_loc2_.bonusTakenSound))).sound;
         _loc3_.battleFinishSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_loc2_.battleFinishSound))).sound;
         _loc3_.killSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_loc2_.killSound))).sound;
         var _loc4_:Object = _loc2_.skybox;
         var _loc5_:name_673 = new name_673();
         _loc5_.back = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.back)));
         _loc5_.bottom = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.bottom)));
         _loc5_.front = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.front)));
         _loc5_.left = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.left)));
         _loc5_.right = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.right)));
         _loc5_.top = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.top)));
         this.battle.var_71.initObject(client,null,_loc3_,_loc2_.kick_period_ms,_loc2_.map_id,Long.getLong(0,_loc2_.map_resource_id),_loc2_.invisible_time,_loc2_.gravity,_loc5_,_loc2_.spectator,_loc2_.reArmorEnabled);
         name_272(OSGi.getInstance().getService(name_272)).setBonusLighting(1,null,null);
         var _loc6_:Object = JSON.parse(_loc2_.graphics_data);
         this.battle.var_71.var_117.viewport.method_782(_loc6_.fogColor,_loc6_.fogAlpha,_loc6_.fogNear,_loc6_.fogFar);
         this.battle.var_71.var_117.viewport.method_785(_loc6_.ssaoRadius,_loc6_.ssaoRange,_loc6_.ssaoColor,_loc6_.ssaoAlpha);
         this.battle.var_71.var_117.viewport.method_795(_loc6_.lightColor,_loc6_.shadowColor,_loc6_.angleX,_loc6_.angleZ);
         Model.object = this.battle.var_71.var_117.name_685;
         modelRegistry.getModel(Long.getLong(489200536,-1856903338)).method_18(new name_1409(ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc2_.billboard)))));
         name_141(modelRegistry.getModel(Long.getLong(489200536,-1856903338))).objectLoadedPost();
         Model.method_38();
      }
      
      private function method_1141(param1:String) : void
      {
         var _loc3_:Object = null;
         var _loc4_:package_41.Vector3dData = null;
         var _loc5_:String = null;
         var _loc6_:package_41.Vector3dData = null;
         var _loc7_:name_695 = null;
         var _loc2_:Object = JSON.parse(param1);
         for each(_loc3_ in _loc2_.zones)
         {
            _loc4_ = new package_41.Vector3dData(_loc3_.x,_loc3_.y,_loc3_.z);
            _loc5_ = String(_loc3_.type);
            _loc6_ = new package_41.Vector3dData(_loc3_.ox,_loc3_.oy,_loc3_.oz);
            _loc7_ = new name_695(_loc4_,_loc5_,_loc6_);
            this.battle.var_71.method_202(_loc7_);
         }
      }
      
      private function method_1140(param1:String) : void
      {
         var _loc3_:Object = null;
         var _loc4_:package_41.Vector3dData = null;
         var _loc5_:name_695 = null;
         var _loc2_:Object = JSON.parse(param1);
         for each(_loc3_ in _loc2_.zones)
         {
            _loc4_ = new package_41.Vector3dData(_loc3_.x,_loc3_.y,_loc3_.z);
            _loc5_ = new name_695(_loc4_);
            this.battle.var_71.method_203(_loc5_);
         }
      }
      
      public function initClientObject(param1:String, param2:String) : ClientObject
      {
         var _loc3_:ClientClass = new ClientClass(param1,null,param2);
         return new ClientObject(param1,_loc3_,param2,null);
      }
      
      private function method_1120(param1:String, param2:String) : void
      {
         var _loc3_:ClientClass = new ClientClass(param1,null,param2);
         var _loc4_:ClientObject = new ClientObject(param1,_loc3_,param2,null);
         client = _loc4_;
      }
      
      public function destroy() : void
      {
         BattlefieldModel(Main.osgi.getService(IBattleField)).spectatorMode = false;
         name_771 = false;
         BonusCache.destroy();
         LightDataManager.destroy();
         tankClientObjectByTankId = new Dictionary();
         WeaponsManager.destroy();
         if(var_897 != null)
         {
            var_897.objectUnloaded(null);
            var_897 = null;
         }
         if(var_900 != null)
         {
            var_900.objectUnloaded(null);
            var_900 = null;
         }
         if(var_898 != null)
         {
            var_898.objectUnloaded(null);
            var_898 = null;
         }
         if(var_895 != null)
         {
            var_895.objectUnloaded(null);
            var_895 = null;
         }
         if(var_901 != null)
         {
            var_901 = null;
         }
         if(var_893 != null)
         {
            var_893.objectUnloaded(null);
            var_893 = null;
         }
         if(var_896 != null)
         {
            var_896 = null;
         }
         if(var_899 != null)
         {
            var_899.objectUnloaded(null);
            var_899 = null;
         }
         if(var_894 != null)
         {
            var_894.objectUnloaded(null);
            var_894 = null;
         }
         if(shaftModel != null)
         {
            shaftModel.objectUnloaded(null);
            shaftModel = null;
         }
         if(var_892 != null)
         {
            var_892.objectUnloaded(null);
            var_892 = null;
         }
      }
   }
}
