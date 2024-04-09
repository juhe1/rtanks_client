package package_149
{
   import alternativa.model.IModel;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.ITank;
   import alternativa.tanks.models.weapon.IWeaponController;
   import alternativa.tanks.models.weapon.name_911;
   import alternativa.tanks.models.weapon.shared.ConicAreaTargetSystem;
   import alternativa.tanks.vehicles.tanks.Tank;
   import flash.utils.getTimer;
   import package_1.Main;
   import package_161.IWeaponWeakeningModel;
   import package_163.name_1704;
   import package_278.name_1288;
   import package_278.name_905;
   import package_357.class_71;
   import package_357.class_72;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_41.ItemProperty;
   import package_41.Vector3dData;
   import package_52.WeaponsManager;
   import package_6.ObjectRegister;
   import package_7.name_32;
   import package_92.name_1188;
   import package_92.name_1451;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class FreezeModel extends class_72 implements class_71, IWeaponController, class_70
   {
       
      
      private var modelService:name_32;
      
      private var var_11:IBattleField;
      
      private var var_13:TankModel;
      
      private var var_728:name_1188;
      
      private var var_730:IWeaponWeakeningModel;
      
      private var var_564:name_1707;
      
      private var name_106:TankData;
      
      private var var_1024:name_1703;
      
      private var var_727:name_1451;
      
      private var currentEnergy:name_905;
      
      private var nextTargetCheckTime:name_1288;
      
      private var lastUpdateTime:name_1288;
      
      private var active:Boolean;
      
      private var var_1016:name_911;
      
      private var targetSystem:ConicAreaTargetSystem;
      
      private var var_1025:Array;
      
      private var targetPositions:Array;
      
      private var var_1026:Array;
      
      private var targetDistances:Array;
      
      private var var_1029:Array;
      
      private var name_1422:Vector3;
      
      private var var_1028:Vector3;
      
      private var var_1027:Vector3;
      
      private var var_1030:Vector3;
      
      public function FreezeModel()
      {
         this.currentEnergy = new name_905("currentEnergy freeze");
         this.nextTargetCheckTime = new name_1288("nextTargetCheckTime.value freeze");
         this.lastUpdateTime = new name_1288("lastUpdateTime.value freeze");
         this.var_1016 = name_911.getInstance();
         this.var_1025 = [];
         this.targetPositions = [];
         this.var_1026 = [];
         this.targetDistances = [];
         this.var_1029 = [];
         this.name_1422 = new Vector3();
         this.var_1028 = new Vector3();
         this.var_1027 = new Vector3();
         this.var_1030 = new Vector3();
         super();
         _interfaces.push(IModel,IWeaponController,class_70);
      }
      
      public function name_1436() : ItemProperty
      {
         return ItemProperty.FREEZE_RESISTANCE;
      }
      
      public function name_1601(param1:ClientObject, param2:String) : void
      {
         var _loc3_:TankData = this.method_1221(param1.register,param2);
         if(_loc3_ != null && _loc3_ != this.var_13.localUserData)
         {
            this.method_739(_loc3_,this.var_728.name_1457(_loc3_.turret));
         }
      }
      
      public function name_1602(param1:ClientObject, param2:String) : void
      {
         var _loc3_:TankData = this.method_1221(param1.register,param2);
         if(_loc3_ != null && _loc3_.enabled && _loc3_ != this.var_13.localUserData)
         {
            this.method_999(_loc3_);
         }
      }
      
      public function initObject(param1:ClientObject, param2:Number, param3:Number, param4:int, param5:int, param6:int, param7:int) : void
      {
         this.method_1223();
         var _loc8_:name_1703 = new name_1703(param2,100 * param3,param4,param5,param6,param7);
         param1.method_12(FreezeModel,_loc8_);
      }
      
      public function method_1220(param1:ClientObject) : name_1703
      {
         return name_1703(param1.method_16(FreezeModel));
      }
      
      public function method_999(param1:TankData) : void
      {
         if(this.var_564 != null)
         {
            this.var_564.name_1706(param1);
         }
      }
      
      public function reset() : void
      {
         this.currentEnergy.value = this.var_1024.energyCapacity;
         this.lastUpdateTime.value = getTimer();
      }
      
      public function name_125(param1:TankData) : void
      {
         this.name_106 = param1;
         this.var_1024 = this.method_1220(param1.turret);
         this.var_727 = this.var_728.name_1457(param1.turret);
         this.currentEnergy.value = this.var_1024.energyCapacity;
         this.lastUpdateTime.value = 0;
         this.targetSystem = new ConicAreaTargetSystem(this.var_1024.damageAreaRange,this.var_1024.damageAreaConeAngle,5,6,this.var_11.getBattlefieldData().name_247,new name_1704());
      }
      
      public function method_1000() : void
      {
         this.name_106 = null;
         this.var_1024 = null;
         this.var_727 = null;
         this.targetSystem = null;
      }
      
      public function method_1002(param1:int) : void
      {
         this.active = true;
         this.nextTargetCheckTime.value = param1 + this.var_1024.weaponTickMsec.value;
         this.lastUpdateTime.value = param1;
         this.method_1222(this.name_106.turret);
         this.method_739(this.name_106,this.var_727);
      }
      
      private function method_1222(param1:ClientObject) : void
      {
         Network(Main.osgi.getService(name_2)).send("battle;start_fire");
      }
      
      public function method_1001(param1:int, param2:Boolean) : void
      {
         this.active = false;
         this.lastUpdateTime.value = param1;
         if(param2)
         {
            this.method_1226(this.name_106.turret);
         }
         this.method_999(this.name_106);
      }
      
      private function method_1226(param1:ClientObject) : void
      {
         Network(Main.osgi.getService(name_2)).send("battle;stop_fire");
      }
      
      public function update(param1:int, param2:int) : Number
      {
         var _loc3_:Number = NaN;
         if(this.active)
         {
            if(param1 >= this.nextTargetCheckTime.value)
            {
               this.nextTargetCheckTime.value += this.var_1024.weaponTickMsec.value;
               this.method_1224(this.var_727,this.name_106);
            }
            this.currentEnergy.value -= this.var_1024.energyDischargeSpeed * (param1 - this.lastUpdateTime.value) * 0.001;
            if(this.currentEnergy.value <= 0)
            {
               this.currentEnergy.value = 0;
               this.method_1001(param1,true);
            }
         }
         else
         {
            _loc3_ = this.var_1024.energyCapacity;
            if(this.currentEnergy.value < _loc3_)
            {
               this.currentEnergy.value += this.var_1024.energyRechargeSpeed * (param1 - this.lastUpdateTime.value) * 0.001;
               if(this.currentEnergy.value > _loc3_)
               {
                  this.currentEnergy.value = _loc3_;
               }
            }
         }
         this.lastUpdateTime.value = param1;
         return this.currentEnergy.value / this.var_1024.energyCapacity;
      }
      
      private function method_1224(param1:name_1451, param2:TankData) : void
      {
         var _loc6_:int = 0;
         var _loc7_:Tank = null;
         var _loc8_:TankData = null;
         var _loc9_:Vector3 = null;
         var _loc10_:Vector3dData = null;
         var _loc3_:Vector3 = param1.muzzles[0];
         this.var_1016.method_797(param2.tank.skin.name_200,_loc3_,this.var_1030,this.name_1422,this.var_1027,this.var_1028);
         this.var_1025.length = 0;
         var _loc4_:Number = _loc3_.y;
         this.targetSystem.name_1705(this.name_106.tank,_loc4_,0.3,this.name_1422,this.var_1028,this.var_1027,this.var_1025,this.targetDistances,this.var_1029);
         var _loc5_:int = int(this.var_1025.length);
         if(_loc5_ > 0)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc7_ = this.var_1025[_loc6_];
               _loc8_ = _loc7_.tankData;
               this.var_1025[_loc6_] = _loc8_.user.id;
               this.targetDistances[_loc6_] = 0.01 * this.targetDistances[_loc6_];
               this.var_1026[_loc6_] = _loc8_.name_149;
               _loc9_ = _loc7_.state.position;
               _loc10_ = this.targetPositions[_loc6_];
               if(_loc10_ == null)
               {
                  _loc10_ = new Vector3dData(_loc9_.x,_loc9_.y,_loc9_.z);
                  this.targetPositions[_loc6_] = _loc10_;
               }
               else
               {
                  _loc10_.x = _loc9_.x;
                  _loc10_.y = _loc9_.y;
                  _loc10_.z = _loc9_.z;
               }
               _loc6_++;
            }
            this.var_1026.length = _loc5_;
            this.targetPositions.length = _loc5_;
            this.method_1225(param2.turret,this.var_1025,this.var_1026,this.targetPositions,this.targetDistances);
         }
      }
      
      private function method_1225(param1:ClientObject, param2:Array, param3:Array, param4:Array, param5:Array) : void
      {
         var _loc6_:Object = new Object();
         _loc6_.victims = param2;
         _loc6_.targetDistances = param5;
         _loc6_.tickPeriod = this.var_1024.weaponTickMsec.value;
         Network(Main.osgi.getService(name_2)).send("battle;fire;" + JSON.stringify(_loc6_));
      }
      
      private function method_739(param1:TankData, param2:name_1451) : void
      {
         if(this.var_564 == null)
         {
            this.var_564 = WeaponsManager.createFrezeeSFXModel(param1.turret);
         }
         this.var_564.method_739(param1,param2);
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
      
      private function method_1223() : void
      {
         if(this.modelService == null)
         {
            this.modelService = name_32(Main.osgi.getService(name_32));
            this.var_11 = IBattleField(Main.osgi.getService(IBattleField));
            this.var_13 = TankModel(Main.osgi.getService(ITank));
            this.var_728 = name_1188(this.modelService.getModelsByInterface(name_1188)[0]);
            this.var_730 = IWeaponWeakeningModel(this.modelService.getModelsByInterface(IWeaponWeakeningModel)[0]);
         }
      }
   }
}
