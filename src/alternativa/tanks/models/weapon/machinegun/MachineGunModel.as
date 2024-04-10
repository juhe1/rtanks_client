package alternativa.tanks.models.weapon.machinegun
{
   import alternativa.model.class_11;
   import alternativa.model.IModel;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.models.battlefield.logic.class_23;
   import alternativa.tanks.models.battlefield.name_128;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.ITank;
   import alternativa.tanks.models.weapon.IWeaponController;
   import alternativa.tanks.models.weapon.name_911;
   import alternativa.tanks.models.weapon.shared.CommonTargetSystem;
   import alternativa.tanks.models.weapon.shared.name_1709;
   import alternativa.tanks.models.weapon.shared.name_653;
   import alternativa.tanks.vehicles.tanks.Tank;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import package_1.Main;
   import package_161.IWeaponWeakeningModel;
   import package_167.name_1454;
   import package_278.name_1288;
   import package_278.name_905;
   import package_358.class_73;
   import package_358.class_74;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_41.ItemProperty;
   import package_41.Vector3dData;
   import package_52.WeaponsManager;
   import package_6.ObjectRegister;
   import package_7.name_32;
   import package_92.name_1188;
   import package_92.name_1451;
   import package_92.name_1699;
   import scpacker.networking.Network;
   import scpacker.networking.INetworker;
   
   public class MachineGunModel extends class_73 implements class_74, IWeaponController, class_75, class_11, class_23
   {
       
      
      private var modelService:name_32;
      
      private var var_11:IBattleField;
      
      private var var_13:TankModel;
      
      private var var_728:name_1188;
      
      private var var_730:IWeaponWeakeningModel;
      
      private var name_106:TankData;
      
      private var var_1031:name_1708;
      
      private var var_727:name_1451;
      
      private var currentEnergy:name_905;
      
      private var nextTargetCheckTime:name_1288;
      
      private var lastUpdateTime:name_1288;
      
      private var active:Boolean = false;
      
      private var var_1041:Boolean = false;
      
      private var var_1016:name_911;
      
      private var var_1035:CommonTargetSystem;
      
      private var var_1023:Number;
      
      private var var_689:name_1709;
      
      private var hitInfo:name_1699;
      
      private var var_1043:Vector3;
      
      private var var_1006:Vector3;
      
      private var var_1012:Vector3;
      
      private var var_1042:Vector3;
      
      private var var_733:name_1454;
      
      private var var_710:Number = 0;
      
      private var var_1037:Number;
      
      private var var_1038:Number;
      
      private var var_1034:int;
      
      private var var_1039:int;
      
      private var var_1040:Number;
      
      private var var_1036:Number;
      
      private var shooters:Dictionary;
      
      private var var_1032:MachineGunEffects;
      
      private var var_1044:Body;
      
      private var var_1033:name_1288;
      
      public function MachineGunModel()
      {
         this.var_1033 = new name_1288("nextTargetDamageTime machineGun");
         this.currentEnergy = new name_905("currentEnergy machineGun");
         this.nextTargetCheckTime = new name_1288("nextTargetCheckTime.value machineGun");
         this.lastUpdateTime = new name_1288("lastUpdateTime.value machineGun");
         this.var_1016 = name_911.getInstance();
         this.shooters = new Dictionary();
         this.var_1006 = new Vector3();
         this.var_1012 = new Vector3();
         this.var_1043 = new Vector3();
         this.var_1042 = new Vector3();
         this.hitInfo = new name_1699();
         this.var_1044 = null;
         this.var_1039 = 0;
         this.var_1034 = 0;
         this.var_1023 = 100000;
         super();
         _interfaces.push(IModel,IWeaponController,class_75,class_11);
      }
      
      public function name_1436() : ItemProperty
      {
         return ItemProperty.VULCAN_RESISTANCE;
      }
      
      public function initObject(param1:ClientObject, param2:int, param3:int, param4:int, param5:int, param6:int, param7:Number, param8:Number, param9:Number, param10:Number, param11:Number) : void
      {
         var _loc12_:name_1708 = new name_1708(param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         param1.method_12(MachineGunModel,_loc12_);
         this.var_1037 = 1 / param7;
         this.var_1038 = 1 / param8;
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         if(this.modelService != null)
         {
            return;
         }
         this.modelService = name_32(Main.osgi.getService(name_32));
         this.var_11 = Main.osgi.getService(IBattleField) as IBattleField;
         this.var_13 = Main.osgi.getService(ITank) as TankModel;
         this.var_728 = Main.osgi.getService(name_1188) as name_1188;
         this.var_730 = IWeaponWeakeningModel(this.modelService.getModelsByInterface(IWeaponWeakeningModel)[0]);
         this.var_11.name_165().name_212(this);
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
      }
      
      public function method_1227(param1:ClientObject) : name_1708
      {
         return name_1708(param1.method_16(MachineGunModel));
      }
      
      public function method_999(param1:TankData) : void
      {
         if(param1 == this.name_106)
         {
            this.var_1032.name_1706(param1);
            return;
         }
         var _loc2_:ShooterData = this.shooters[param1];
         if(_loc2_ != null)
         {
            _loc2_.active = false;
            _loc2_.machineGunEffects.name_1706(param1);
         }
      }
      
      public function reset() : void
      {
         this.currentEnergy.value = this.var_1031.energyCapacity;
         this.lastUpdateTime.value = getTimer();
         if(this.name_106 != null)
         {
            this.name_106.tank.method_486(0);
            if(this.var_710 > 0)
            {
               this.name_106.tank.method_495().name_201(this.var_1040,false);
               this.name_106.tank.method_495().name_246(this.var_1036);
            }
            this.var_1040 = this.name_106.tank.method_495().name_1159();
            this.var_1036 = this.name_106.tank.method_495().name_1276();
         }
         this.var_710 = 0;
      }
      
      public function name_125(param1:TankData) : void
      {
         var _loc2_:VulcanSFXModel = null;
         this.name_106 = param1;
         this.var_1031 = this.method_1227(param1.turret);
         this.var_727 = this.var_728.name_1457(param1.turret);
         this.currentEnergy.value = this.var_1031.energyCapacity;
         this.lastUpdateTime.value = 0;
         this.var_733 = WeaponsManager.var_495[param1.turret.id];
         if(this.var_1032 == null)
         {
            _loc2_ = WeaponsManager.createVulcanSFXModel(param1.turret);
            this.var_1032 = new MachineGunEffects(_loc2_);
         }
         this.var_689 = name_653.create(this.name_106,this.var_733,this.var_11,this.var_730,this.modelService);
         this.var_1035 = new CommonTargetSystem(this.var_1023,this.var_733.name_1614.value,this.var_733.name_1628.value,this.var_733.name_1618.value,this.var_733.name_1622.value,this.var_11.getBattlefieldData().name_247,this.var_689);
         this.reset();
      }
      
      public function method_1000() : void
      {
         this.name_106 = null;
         this.var_1031 = null;
         this.var_727 = null;
         this.var_1035 = null;
         this.var_689 = null;
         this.var_733 = null;
         this.var_1032 = null;
      }
      
      public function method_1002(param1:int) : void
      {
         this.active = true;
         this.nextTargetCheckTime.value = param1 + this.var_1031.weaponTickMsec.value;
         this.var_1033.value = param1 + this.var_1031.damageTickMsec.value;
         this.lastUpdateTime.value = param1;
         this.var_1034 = param1;
         this.method_1222(this.name_106.turret);
      }
      
      public function name_1602(param1:ClientObject, param2:String) : void
      {
         var _loc3_:TankData = this.method_1221(param1.register,param2);
         if(_loc3_ != null && _loc3_.enabled && _loc3_ != this.var_13.localUserData)
         {
            this.method_999(_loc3_);
         }
      }
      
      public function name_1601(param1:ClientObject, param2:String) : void
      {
         var _loc4_:ShooterData = null;
         var _loc3_:TankData = this.method_1221(param1.register,param2);
         if(_loc3_ == null || _loc3_ == this.var_13.localUserData)
         {
            return;
         }
         _loc4_ = this.shooters[_loc3_];
         if(_loc4_ != null)
         {
            _loc4_.active = true;
            return;
         }
         var _loc5_:MachineGunEffects = new MachineGunEffects(WeaponsManager.createVulcanSFXModel(_loc3_.turret));
         _loc5_.name_1710(false);
         _loc4_ = new ShooterData(_loc3_,_loc5_,true);
         if(this.var_733 == null)
         {
            this.var_733 = WeaponsManager.var_495[_loc3_.turret.id];
         }
         var _loc6_:name_1709 = name_653.create(_loc3_,this.var_733,this.var_11,this.var_730,this.modelService);
         if(_loc4_.targetSystem == null)
         {
            _loc4_.targetSystem = new CommonTargetSystem(this.var_1023,this.var_733.name_1614.value,this.var_733.name_1628.value,this.var_733.name_1618.value,this.var_733.name_1622.value,this.var_11.getBattlefieldData().name_247,_loc6_);
         }
         this.shooters[_loc3_] = _loc4_;
      }
      
      private function method_1222(param1:ClientObject) : void
      {
         var _loc2_:Object = new Object();
         _loc2_.energy = Math.floor(this.currentEnergy.value);
         Network(Main.osgi.getService(INetworker)).send("battle;start_fire;" + JSON.stringify(_loc2_));
      }
      
      public function method_1001(param1:int, param2:Boolean) : void
      {
         this.active = false;
         this.lastUpdateTime.value = param1;
         var _loc3_:int = this.var_710 * this.var_1031.spinDownTime;
         this.var_1039 = param1 + _loc3_;
         if(param2)
         {
            this.method_1226(this.name_106.turret);
         }
         this.method_999(this.name_106);
      }
      
      private function method_1226(param1:ClientObject) : void
      {
         Network(Main.osgi.getService(INetworker)).send("battle;stop_fire");
      }
      
      private function getStatus() : Number
      {
         return this.currentEnergy.value / this.var_1031.energyCapacity;
      }
      
      private function method_1228() : Boolean
      {
         return this.var_1034 >= this.var_1039;
      }
      
      public function update(param1:int, param2:int) : Number
      {
         this.var_1016.method_797(this.name_106.tank.skin.name_144(),this.var_727.muzzles[0],this.var_1043,this.var_1006,this.var_1012,this.var_1042);
         var _loc3_:Number = NaN;
         if(this.active && this.method_1228())
         {
            if(this.var_710 >= 1 && this.currentEnergy.value > 0)
            {
               this.currentEnergy.value -= this.var_1031.energyDischargeSpeed * (param1 - this.lastUpdateTime.value) * 0.001;
               this.var_1041 = true;
            }
            if(this.currentEnergy.value <= 0)
            {
               this.currentEnergy.value = 0;
               if(this.var_1041)
               {
                  Network(Main.osgi.getService(INetworker)).send("battle;start_heat_effect");
                  this.var_1041 = false;
               }
            }
         }
         else
         {
            _loc3_ = this.var_1031.energyCapacity;
            if(this.currentEnergy.value < _loc3_)
            {
               this.currentEnergy.value += this.var_1031.energyRechargeSpeed * (param1 - this.lastUpdateTime.value) * 0.001;
               if(this.currentEnergy.value > _loc3_)
               {
                  this.currentEnergy.value = _loc3_;
               }
            }
         }
         this.lastUpdateTime.value = param1;
         this.method_1231(param2,param1,this.active && this.method_1228(),this.name_106,this.var_1032,this.var_710,this.hitInfo,this.var_1035,this.var_1040,this.var_1036);
         this.method_1230(param2,this.active && this.method_1228());
         if(param1 >= this.nextTargetCheckTime.value)
         {
            this.nextTargetCheckTime.value += this.var_1031.weaponTickMsec.value;
         }
         this.var_1034 = param1;
         return this.getStatus();
      }
      
      public function method_504(param1:int, param2:int) : void
      {
         var _loc3_:Object = null;
         var _loc4_:ShooterData = null;
         var _loc5_:TankData = null;
         var _loc6_:MachineGunEffects = null;
         var _loc7_:Boolean = false;
         for(_loc3_ in this.shooters)
         {
            _loc4_ = this.shooters[_loc3_];
            if(!_loc4_.active && _loc4_.state <= 0)
            {
               _loc4_.machineGunEffects.name_1706(_loc4_.tankData);
               delete this.shooters[_loc3_];
            }
            else
            {
               _loc5_ = _loc4_.tankData;
               _loc6_ = _loc4_.machineGunEffects;
               _loc7_ = _loc4_.active;
               this.method_1230(param2,_loc7_,_loc4_);
               this.method_1231(param2,param1,_loc7_,_loc5_,_loc6_,_loc4_.state,_loc4_.hitInfo,_loc4_.targetSystem,_loc4_.maxTurretTurnSpeed,_loc4_.maxTurretAcceleration);
            }
         }
      }
      
      private function method_1225(param1:String, param2:Number) : void
      {
         var _loc3_:Object = new Object();
         _loc3_.victimId = param1;
         _loc3_.tickPeriod = this.var_1031.damageTickMsec.value;
         Network(Main.osgi.getService(INetworker)).send("battle;fire;" + JSON.stringify(_loc3_));
      }
      
      private function method_1234(param1:Vector3, param2:Number, param3:TankData, param4:Vector3, param5:Number) : void
      {
         this.method_1229(param3.tank,param4,param1,-param5 * param2);
      }
      
      private function method_1233(param1:Vector3, param2:Number, param3:Body, param4:Vector3, param5:Number) : void
      {
         this.method_1229(param3,param4,param1,param5 * param2);
      }
      
      private function method_1229(param1:Body, param2:Vector3, param3:Vector3, param4:Number) : void
      {
         var _loc5_:Tank = null;
         var _loc6_:int = 0;
         if(param1 != null && param2 != null)
         {
            param1.method_432(param2,param3,param4);
            if(param1 is Tank)
            {
               _loc5_ = param1 as Tank;
               if(_loc5_.name_180() != null)
               {
                  _loc6_ = _loc5_.name_180().name_199();
                  if(_loc6_ == 0 || BattleUtils.name_1712(param1))
                  {
                     param1.method_444(param3,-param4);
                  }
               }
            }
         }
      }
      
      public function method_1231(param1:int, param2:int, param3:Boolean, param4:TankData, param5:MachineGunEffects, param6:Number, param7:name_1699, param8:CommonTargetSystem, param9:Number, param10:Number) : void
      {
         var _loc18_:name_128 = null;
         var _loc19_:TankData = null;
         var _loc20_:Vector3dData = null;
         var _loc21_:Number = NaN;
         var _loc22_:* = undefined;
         if(param4 == null || param4.tank == null || param4.tank.skin == null)
         {
            return;
         }
         var _loc11_:name_1451 = this.var_728.name_1457(param4.turret);
         var _loc12_:Vector3 = new Vector3();
         var _loc13_:Vector3 = new Vector3();
         var _loc14_:Vector3 = new Vector3();
         var _loc15_:Vector3 = new Vector3();
         var _loc16_:name_1708 = this.method_1227(param4.turret);
         this.var_1016.method_797(param4.tank.skin.name_144(),_loc11_.muzzles[0],_loc12_,_loc13_,_loc14_,_loc15_);
         var _loc17_:Boolean = false;
         if(param2 >= this.nextTargetCheckTime.value)
         {
            _loc17_ = param8.name_670(_loc13_,_loc15_,_loc14_,param4.tank,param7);
            if(param6 >= 1 && _loc17_)
            {
               param5.name_1711(param7.position,param7.name_787 != null);
               if(param4 == this.name_106)
               {
                  _loc18_ = this.var_11.getBattlefieldData();
                  _loc19_ = null;
                  _loc20_ = null;
                  _loc21_ = 0;
                  if(param2 >= this.var_1033.value)
                  {
                     _loc21_ = param7.position.distanceTo(param4.tank.state.position);
                     _loc20_ = new Vector3dData(0,0,0);
                     _loc20_.x = param7.position.x;
                     _loc20_.y = param7.position.y;
                     _loc20_.z = param7.position.z;
                     _loc22_ = null;
                     if(this.hitInfo.name_787 != null)
                     {
                        for(_loc22_ in _loc18_.name_263)
                        {
                           if(this.hitInfo.name_787 == _loc22_.tank)
                           {
                              _loc19_ = _loc22_;
                              break;
                           }
                        }
                     }
                     if(_loc19_ != null)
                     {
                        this.method_1225(_loc19_.user.id,_loc21_);
                     }
                     this.var_1033.value += this.var_1031.damageTickMsec.value;
                  }
               }
            }
            else
            {
               param5.name_1710(false);
            }
         }
         if(param6 >= 1)
         {
            this.method_1234(_loc15_,1,param4,_loc12_,_loc16_.recoilForce);
            if(param7.name_787 != null)
            {
               this.method_1233(_loc15_,1,param7.name_787,param7.position,_loc16_.impactForce);
            }
         }
         this.method_1232(param4,param6,param9,param10);
         if(param5 != null)
         {
            param5.update(param1,param6,param3,param4,_loc11_,param4.tank.skin,_loc12_,_loc13_,_loc16_.spinUpTime,_loc16_.spinDownTime);
         }
      }
      
      private function method_1230(param1:int, param2:Boolean, param3:ShooterData = null) : void
      {
         if(param3 == null)
         {
            if(param2)
            {
               this.var_710 = Math.min(1,this.var_710 + param1 * this.var_1037);
            }
            else
            {
               this.var_710 = Math.max(0,this.var_710 - param1 * this.var_1038);
            }
         }
         else if(param2)
         {
            param3.state = Math.min(1,param3.state + param1 * this.var_1037);
         }
         else
         {
            param3.state = Math.max(0,param3.state - param1 * this.var_1038);
         }
      }
      
      private function method_1232(param1:TankData, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc5_:name_1708 = this.method_1227(param1.turret);
         var _loc6_:Number = _loc5_.weaponTurnDecelerationCoeff + (1 - param2) * (1 - _loc5_.weaponTurnDecelerationCoeff);
         if(param1.tank != null)
         {
            param1.tank.setMaxTurretTurnSpeed(param3 * _loc6_,true);
            param1.tank.setTurretTurnAcceleration(param4 * _loc6_);
            param1.tank.method_486(param2 / 2);
         }
      }
      
      private function method_1221(param1:ObjectRegister, param2:String) : TankData
      {
         var _loc3_:ClientObject = BattleController.tankClientObjectByTankId[param2];
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:TankData = this.var_13.getTankData(_loc3_);
         if(_loc4_ == null || _loc4_.tank == null)
         {
            return null;
         }
         return _loc4_;
      }
   }
}

import alternativa.tanks.models.tank.TankData;
import alternativa.tanks.models.weapon.machinegun.MachineGunEffects;
import alternativa.tanks.models.weapon.shared.CommonTargetSystem;
import package_92.name_1699;

class ShooterData
{
    
   
   public var tankData:TankData;
   
   public var machineGunEffects:MachineGunEffects;
   
   public var active:Boolean;
   
   public var state:Number;
   
   public var hitInfo:name_1699;
   
   public var targetSystem:CommonTargetSystem;
   
   public var maxTurretTurnSpeed:Number;
   
   public var maxTurretAcceleration:Number;
   
   public function ShooterData(param1:TankData, param2:MachineGunEffects, param3:Boolean)
   {
      super();
      this.tankData = param1;
      this.machineGunEffects = param2;
      this.active = param3;
      this.state = 0;
      this.hitInfo = new name_1699();
      this.targetSystem = null;
      this.maxTurretTurnSpeed = param1.tank.method_495().name_1159();
      this.maxTurretAcceleration = param1.tank.method_495().name_1276();
   }
}
