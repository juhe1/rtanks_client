package alternativa.tanks.models.weapon.healing
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.model.IModel;
   import alternativa.osgi.service.dump.name_524;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.class_15;
   import alternativa.tanks.models.tank.ITank;
   import alternativa.tanks.models.tank.ITankEventDispatcher;
   import alternativa.tanks.models.tank.name_77;
   import alternativa.tanks.models.weapon.IWeaponController;
   import alternativa.tanks.models.weapon.name_903;
   import alternativa.tanks.models.weapon.name_911;
   import alternativa.tanks.models.weapon.shared.name_653;
   import alternativa.tanks.models.weapons.targeting.TargetingResult;
   import alternativa.tanks.models.weapons.targeting.name_1750;
   import alternativa.tanks.models.weapons.targeting.priority.TargetingPriorityCalculator;
   import alternativa.tanks.utils.name_1388;
   import alternativa.tanks.utils.name_1391;
   import alternativa.tanks.vehicles.tanks.Tank;
   import flash.utils.getTimer;
   import package_1.Main;
   import package_100.SingleTargetDirectionProcessor;
   import package_166.HealingGunSFXModel;
   import package_278.name_1288;
   import package_331.name_1599;
   import package_334.class_89;
   import package_334.class_90;
   import package_334.name_1610;
   import package_34.class_3;
   import package_365.name_1752;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_41.ItemProperty;
   import package_41.Vector3dData;
   import package_47.BattleTeamType;
   import package_52.WeaponsManager;
   import package_6.ObjectRegister;
   import package_61.RayHit;
   import package_7.name_32;
   import package_84.IsisDirectionCalculator;
   import package_84.name_300;
   import package_92.name_1188;
   import package_92.name_1451;
   import scpacker.networking.Network;
   import scpacker.networking.INetworker;
   
   public class HealingGunModel extends class_89 implements class_90, IWeaponController, class_15, class_3
   {
      
      private static const const_1483:int = 250;
      
      private static const const_442:name_1391 = new name_1388(1000);
      
      private static const const_1481:name_903 = new name_903();
      
      private static const localHitPoint:Vector3 = new Vector3();
      
      private static const const_1482:Vector3 = new Vector3();
      
      private static const const_430:Matrix3 = new Matrix3();
       
      
      private var modelService:name_32;
      
      private var var_1067:IBattleField;
      
      private var var_123:TankModel;
      
      private var var_1069:name_1188;
      
      private var var_564:HealingGunSFXModel;
      
      private var var_1016:name_911;
      
      private var active:Boolean;
      
      private var var_1060:int;
      
      private var name_106:TankData;
      
      private var var_766:name_1451;
      
      private var var_1058:name_1413;
      
      private var var_1065:Number = 0;
      
      private var var_1061:name_1288;
      
      private var vec:Vector3;
      
      private var pos3d:Vector3dData;
      
      private var var_1062:name_300;
      
      private var var_1063:IsisDirectionCalculator;
      
      private var var_1066:SingleTargetDirectionProcessor;
      
      private var var_1064:name_1750;
      
      private var currentTarget:Body;
      
      private var var_1059:RayHit;
      
      private var var_1068:int;
      
      private var state:name_1610;
      
      public function HealingGunModel()
      {
         this.var_1016 = new name_911();
         this.var_1061 = new name_1288("nextTickTime isida",0);
         this.vec = new Vector3();
         this.pos3d = new Vector3dData(0,0,0);
         super();
         _interfaces.push(IModel,class_90,IWeaponController);
      }
      
      public function name_1436() : ItemProperty
      {
         return ItemProperty.VAMPIRE_RESISTANCE;
      }
      
      public function initObject(param1:ClientObject, param2:int, param3:int, param4:int, param5:Number, param6:int, param7:int, param8:int, param9:Number) : void
      {
         var _loc11_:ITankEventDispatcher = null;
         if(this.modelService == null)
         {
            this.modelService = Main.osgi.getService(name_32) as name_32;
            this.var_1067 = Main.osgi.getService(IBattleField) as IBattleField;
            this.var_123 = Main.osgi.getService(ITank) as TankModel;
            this.var_1069 = this.modelService.getModelsByInterface(name_1188)[0] as name_1188;
            this.var_564 = WeaponsManager.createIsidaSFXModel(param1);
            _loc11_ = ITankEventDispatcher(Main.osgi.getService(ITankEventDispatcher));
            _loc11_.name_718(name_77.name_192,this);
            _loc11_.name_718(name_77.UNLOADED,this);
         }
         var _loc10_:name_1413 = new name_1413();
         _loc10_.capacity.value = param2;
         _loc10_.tickPeriod.value = param4;
         _loc10_.name_1414.value = param9 * 100;
         _loc10_.coneAngle.value = param5;
         _loc10_.chargeRate.value = param3;
         _loc10_.dischargeDamageRate.value = param6;
         _loc10_.dischargeHealingRate.value = param7;
         _loc10_.dischargeIdleRate.value = param8;
         param1.method_12(HealingGunModel,_loc10_);
      }
      
      public function init(param1:ClientObject, param2:Array, param3:Vector3) : void
      {
         var _loc7_:name_1599 = null;
         var _loc8_:TankData = null;
         var _loc9_:TankData = null;
         var _loc4_:ObjectRegister = param1.register;
         var _loc5_:int = int(param2.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc7_ = param2[_loc6_];
            _loc8_ = this.getTankData(_loc4_,_loc7_.shooterId);
            if(_loc8_ != null)
            {
               if(_loc7_.type == name_1610.name_1183)
               {
                  this.var_564.name_1748(_loc8_,_loc7_.type,null);
               }
               else
               {
                  _loc9_ = this.getTankData(_loc4_,_loc7_.targetId);
                  if(_loc9_ != null)
                  {
                     this.var_564.name_1748(_loc8_,_loc7_.type,_loc9_,param3);
                  }
               }
            }
            _loc6_++;
         }
      }
      
      public function name_1615(param1:ClientObject, param2:name_1599, param3:Vector3) : void
      {
         var _loc6_:TankData = null;
         var _loc4_:ObjectRegister = param1.register;
         var _loc5_:TankData = this.getTankData(_loc4_,param2.shooterId);
         if(_loc5_ == null || !_loc5_.enabled)
         {
            return;
         }
         if(this.var_123.localUserData != null)
         {
            if(_loc5_ == this.var_123.localUserData)
            {
               return;
            }
         }
         if(param2.type == name_1610.name_1183)
         {
            this.var_564.name_1748(_loc5_,param2.type,null);
         }
         else
         {
            _loc6_ = this.getTankData(_loc4_,param2.targetId);
            if(_loc6_ == null || !_loc6_.enabled)
            {
               return;
            }
            this.var_564.name_1748(_loc5_,param2.type,_loc6_,param3);
         }
      }
      
      public function name_1617(param1:ClientObject, param2:String) : void
      {
         var _loc3_:TankData = this.getTankData(param1.register,param2);
         if(this.var_123.localUserData != null)
         {
            if(_loc3_ == this.var_123.localUserData)
            {
               return;
            }
         }
         if(_loc3_ != null)
         {
            this.var_564.name_1749(_loc3_);
         }
      }
      
      public function method_999(param1:TankData) : void
      {
         this.var_564.name_1749(param1);
      }
      
      public function reset() : void
      {
         this.var_1061.value = int.MAX_VALUE;
         this.var_1065 = this.var_1058 == null ? 0 : this.var_1058.capacity.value;
         this.var_1060 = 0;
      }
      
      public function name_125(param1:TankData) : void
      {
         var _loc2_:name_524 = name_524(Main.osgi.getService(name_524));
         if(_loc2_ != null)
         {
            _loc2_.registerDumper(this);
         }
         this.name_106 = param1;
         this.var_1058 = this.method_1260(param1.turret);
         this.var_766 = this.var_1069.name_1457(param1.turret);
         this.var_1065 = this.var_1058.capacity.value;
         this.active = false;
         this.var_1060 = 0;
         this.var_1067.method_147(new name_653(this.name_106,null,this.var_1058.name_1414.value,this.var_1058.coneAngle.value));
         this.var_1067.method_149(new name_1752());
         this.var_1062 = new name_300(this.var_1058);
         this.var_1063 = new IsisDirectionCalculator(this.var_1058.coneAngle.value);
         this.var_1066 = new SingleTargetDirectionProcessor(param1.user,this.var_1058.name_1414.value);
         this.var_1064 = new name_1750(this.var_1063,this.var_1066,new TargetingPriorityCalculator(this.var_1062));
         this.var_1064.name_1753().method_973();
      }
      
      public function method_1000() : void
      {
         var _loc1_:name_524 = name_524(Main.osgi.getService(name_524));
         if(_loc1_ != null)
         {
            _loc1_.unregisterDumper(this.dumperName);
         }
         this.name_106 = null;
         this.var_1058 = null;
         this.var_766 = null;
         this.active = false;
         this.var_1060 = 0;
         this.state = name_1610.OFF;
         this.var_1062 = null;
         this.var_1063 = null;
         this.var_1066 = null;
         this.var_1064 = null;
         this.var_1059 = null;
         this.currentTarget = null;
      }
      
      public function method_1002(param1:int) : void
      {
         if(this.active)
         {
            return;
         }
         this.active = true;
         this.var_1061.value = param1 + this.var_1058.tickPeriod.value;
         this.var_1059 = this.target();
         this.currentTarget = Boolean(this.var_1059) ? this.var_1059.var_81.name_787 : null;
         if(this.currentTarget == null)
         {
            this.var_564.name_1748(this.name_106,name_1610.name_1183,null);
            this.method_1246(this.name_106.turret,0,null);
         }
         else
         {
            this.method_1263(this.name_106,this.currentTarget.tank.tankData);
         }
         this.var_1060 = this.method_1251(param1,this.method_1249(param1),this.state);
         this.method_1253(param1);
      }
      
      public function method_1001(param1:int, param2:Boolean) : void
      {
         if(!this.active)
         {
            return;
         }
         this.active = false;
         this.var_1062.method_962();
         this.currentTarget = null;
         this.var_1060 = this.method_1255(param1,this.method_1245(param1,this.state));
         this.var_564.name_1749(this.name_106);
         if(param2)
         {
            this.method_1256(this.name_106.turret);
         }
      }
      
      private function method_1256(param1:ClientObject) : void
      {
         Network(Main.osgi.getService(INetworker)).send("battle;stop_fire");
      }
      
      public function update(param1:int, param2:int) : Number
      {
         var _loc4_:Body = null;
         var _loc5_:Vector3 = null;
         var _loc3_:Number = NaN;
         if(this.active)
         {
            _loc3_ = this.method_1245(getTimer(),this.state);
            if(_loc3_ <= 0)
            {
               this.method_1001(param1,true);
            }
            else
            {
               _loc4_ = null;
               this.var_1016.name_920(this.name_106.tank.skin.name_144(),this.name_106.tank.skin.name_909.name_929,const_1481);
               if(BattleUtils.name_1452(this.name_106.tank as Body,const_1481))
               {
                  this.var_1059 = this.target();
                  _loc4_ = Boolean(this.var_1059) ? this.var_1059.var_81.name_787 : null;
               }
               else
               {
                  this.var_1059 = null;
                  _loc4_ = null;
               }
               if(_loc4_ != this.currentTarget)
               {
                  this.currentTarget = _loc4_;
                  this.method_1253(param1);
               }
               else if(this.currentTarget != null)
               {
                  if(this.var_1068 + 250 <= param1)
                  {
                     this.method_1247(param1);
                  }
                  this.method_1248();
               }
               if(param1 >= this.var_1061.value)
               {
                  this.var_1061.value += this.var_1058.tickPeriod.value;
                  if(this.currentTarget != null)
                  {
                     _loc5_ = this.currentTarget.tank.state.position;
                     this.pos3d.x = _loc5_.x;
                     this.pos3d.y = _loc5_.y;
                     this.pos3d.z = _loc5_.z;
                     this.vec.diff(_loc5_,this.name_106.tank.state.position);
                     this.method_1261(this.name_106.turret,this.currentTarget.tank.tankData.name_149,this.currentTarget.tank.tankData.user.id,this.pos3d,this.vec.vLength());
                  }
               }
            }
         }
         else
         {
            _loc3_ = this.method_1249(getTimer());
         }
         return _loc3_ / this.var_1058.capacity.value;
      }
      
      private function method_1250(param1:name_1610) : int
      {
         switch(param1)
         {
            case name_1610.name_474:
               return this.var_1058.dischargeDamageRate.value;
            case name_1610.HEAL:
               return this.var_1058.dischargeHealingRate.value;
            case name_1610.name_1183:
               return this.var_1058.dischargeIdleRate.value;
            default:
               return 0;
         }
      }
      
      private function method_1249(param1:int) : Number
      {
         var _loc2_:Number = this.var_1058.capacity.value;
         var _loc3_:Number = this.var_1058.chargeRate.value * (param1 - this.var_1060) / const_442.name_1390();
         return _loc3_ > _loc2_ ? Number(_loc2_) : Number(_loc3_);
      }
      
      private function method_1245(param1:int, param2:name_1610) : Number
      {
         var _loc3_:Number = this.var_1058.capacity.value - this.method_1250(param2) * (param1 - this.var_1060) / const_442.name_1390();
         return _loc3_ < 0 ? Number(0) : Number(_loc3_);
      }
      
      private function method_1255(param1:int, param2:Number) : int
      {
         return param1 - param2 / this.var_1058.chargeRate.value * const_442.name_1390();
      }
      
      private function method_1251(param1:int, param2:Number, param3:name_1610) : int
      {
         return param1 - (this.var_1058.capacity.value - param2) / this.method_1250(param3) * const_442.name_1390();
      }
      
      private function method_1253(param1:int) : void
      {
         this.method_1258(param1);
         this.method_1247(param1);
      }
      
      private function method_1247(param1:int) : void
      {
         this.var_1068 = param1;
         var _loc2_:Body = null;
         var _loc3_:Tank = null;
         if(this.var_1059 != null)
         {
            _loc2_ = this.var_1059.var_81.name_787;
            _loc3_ = _loc2_.tank;
         }
         else
         {
            this.method_962(param1);
         }
      }
      
      private function method_1258(param1:int) : void
      {
         var _loc2_:name_1610 = this.state;
         if(this.currentTarget == null)
         {
            this.state = name_1610.name_1183;
         }
         else if(this.method_1244(this.name_106,this.currentTarget.tank.tankData) == name_1610.HEAL)
         {
            this.state = name_1610.HEAL;
         }
         else
         {
            this.state = name_1610.name_474;
         }
         this.var_1060 = this.method_1251(param1,this.method_1245(param1,_loc2_),this.state);
         if(this.currentTarget == null)
         {
            this.method_1262();
         }
         else
         {
            this.method_1259(param1);
         }
      }
      
      public function name_1630(param1:ClientObject) : void
      {
         var _loc2_:TankData = this.var_123.getTankData(param1);
         if(_loc2_ == null)
         {
            return;
         }
         this.var_564.name_1748(_loc2_,name_1610.name_1183,null);
      }
      
      private function method_1262() : void
      {
         this.var_564.name_1748(this.name_106,name_1610.name_1183,null);
         this.var_1062.method_962();
      }
      
      private function method_1259(param1:int) : void
      {
         this.method_1248();
      }
      
      private function method_1248() : void
      {
         var _loc1_:Tank = this.currentTarget.tank;
         var _loc2_:Tank = this.name_106.tank;
         localHitPoint.copy(this.var_1059.position);
         BattleUtils.globalToLocal(this.currentTarget,localHitPoint);
         var _loc3_:name_1610 = this.method_1244(_loc2_.tankData,_loc1_.tankData);
         this.var_564.name_1748(_loc2_.tankData,_loc3_,_loc1_.tankData,localHitPoint);
      }
      
      public function method_962(param1:int) : void
      {
         var _loc2_:Object = new Object();
         _loc2_.physTime = param1;
         Network(Main.osgi.getService(INetworker)).send("battle;reset_target;" + JSON.stringify(_loc2_));
      }
      
      private function method_1261(param1:ClientObject, param2:int, param3:String, param4:Vector3dData, param5:int) : void
      {
         var _loc6_:Object = new Object();
         _loc6_.victimId = param3;
         _loc6_.distance = param5;
         _loc6_.tickPeriod = this.var_1058.tickPeriod.value;
         _loc6_.localHitPoint = localHitPoint.toVector3d();
         Network(Main.osgi.getService(INetworker)).send("battle;fire;" + JSON.stringify(_loc6_));
      }
      
      public function handleTankEvent(param1:int, param2:TankData) : void
      {
         if(param1 == name_77.name_192 || param1 == name_77.UNLOADED)
         {
            this.var_564.name_1749(param2);
            if(this.name_106 != null && param2.tank != null && param2.tank as Body == this.currentTarget)
            {
               this.currentTarget = null;
               this.var_564.name_1748(this.name_106,name_1610.name_1183,null);
               this.method_1246(this.name_106.turret,0,null);
            }
            else
            {
               this.var_564.name_1758(param2);
            }
         }
      }
      
      public function get dumperName() : String
      {
         return "healgun";
      }
      
      public function dump(param1:Vector.<String>) : String
      {
         return "=== HealingGunModel dump ===\n" + "active=" + this.active + "\n" + "currentCharge=" + this.var_1065 + "\n" + "currTarget=" + this.currentTarget + "\n" + "nextTickTime=" + this.var_1061 + "\n" + "=== end of HealingGunModel dump ===";
      }
      
      private function method_1260(param1:ClientObject) : name_1413
      {
         return name_1413(param1.method_16(HealingGunModel));
      }
      
      private function target() : RayHit
      {
         var _loc1_:RayHit = null;
         var _loc2_:Tank = null;
         this.var_1016.name_920(this.name_106.tank.skin.name_144(),this.name_106.tank.skin.name_909.name_929,const_1481);
         if(this.currentTarget != null)
         {
            this.method_1252();
            const_1482.transform3(const_430);
            this.var_1063.name_1754(const_1482);
         }
         else
         {
            this.var_1063.name_1756();
         }
         var _loc3_:TargetingResult = this.var_1064.target(const_1481);
         this.method_1254(_loc3_);
         if(_loc3_.name_1757())
         {
            _loc1_ = _loc3_.name_1751();
            _loc2_ = _loc1_.var_81.name_787.tank;
            if(_loc2_.tankData.health == 0)
            {
               return null;
            }
            this.var_1062.name_758(_loc2_);
            return _loc3_.name_1751();
         }
         return null;
      }
      
      private function method_1254(param1:TargetingResult) : void
      {
         const_1482.copy(param1.name_1755());
         this.method_1252();
         const_1482.method_411(const_430);
      }
      
      private function method_1252() : void
      {
         var _loc1_:Object3D = this.name_106.tank.skin.name_144();
         const_430.name_932(_loc1_.rotationX,_loc1_.rotationY,_loc1_.rotationZ);
      }
      
      private function method_1263(param1:TankData, param2:TankData) : void
      {
         var _loc3_:name_1610 = this.method_1244(param1,param2);
         this.var_564.name_1748(param1,_loc3_,param2,localHitPoint);
         this.method_1246(param1.turret,param2.name_149,param2.user.id);
      }
      
      private function method_1246(param1:ClientObject, param2:int, param3:String) : void
      {
         var _loc4_:Object = new Object();
         _loc4_.incId = param2;
         _loc4_.victimId = param3;
         _loc4_.localHitPoint = localHitPoint.toVector3d();
         Network(Main.osgi.getService(INetworker)).send("battle;start_fire;" + JSON.stringify(_loc4_));
      }
      
      private function getTankData(param1:ObjectRegister, param2:String) : TankData
      {
         var _loc3_:ClientObject = BattleController.tankClientObjectByTankId[param2];
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:TankData = this.var_123.getTankData(_loc3_);
         if(_loc4_ == null || _loc4_.tank == null)
         {
            return null;
         }
         return _loc4_;
      }
      
      private function method_1257(param1:TankData, param2:TankData) : Boolean
      {
         return param1.teamType == BattleTeamType.NONE || param1.teamType != param2.teamType;
      }
      
      private function method_1244(param1:TankData, param2:TankData) : name_1610
      {
         var _loc3_:Boolean = this.method_1257(param1,param2);
         return _loc3_ ? name_1610.name_474 : name_1610.HEAL;
      }
   }
}

import package_13.Long;

class InitData
{
    
   
   public var shooters:Vector.<Long>;
   
   public var targets:Vector.<Long>;
   
   public function InitData()
   {
      this.shooters = new Vector.<Long>();
      this.targets = new Vector.<Long>();
      super();
   }
}
