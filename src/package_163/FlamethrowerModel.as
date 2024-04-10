package package_163
{
   import alternativa.model.IModel;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.ITank;
   import alternativa.tanks.models.weapon.IWeaponController;
   import alternativa.tanks.models.weapon.name_911;
   import alternativa.tanks.models.weapon.shared.ConicAreaTargetSystem;
   import alternativa.tanks.models.weapon.shared.name_1742;
   import alternativa.tanks.sfx.name_1497;
   import alternativa.tanks.vehicles.tanks.Tank;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import package_1.Main;
   import package_155.class_76;
   import package_161.IWeaponWeakeningModel;
   import package_278.name_1288;
   import package_363.class_85;
   import package_363.class_86;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_41.ItemProperty;
   import package_41.Vector3dData;
   import package_52.WeaponsManager;
   import package_7.name_32;
   import package_92.name_1188;
   import package_92.name_1451;
   import scpacker.networking.Network;
   import scpacker.networking.INetworker;
   
   public class FlamethrowerModel extends class_85 implements class_86, name_1595, IWeaponController
   {
       
      
      private var modelService:name_32;
      
      private var battlefield:IBattleField;
      
      private var var_123:TankModel;
      
      private var var_1008:name_1188;
      
      private var var_1014:IWeaponWeakeningModel;
      
      private var active:Boolean;
      
      private var lastUpdateTime:name_1288;
      
      private var nextTargetCheckTime:name_1288;
      
      private var var_1025:Array;
      
      private var targetPositions:Array;
      
      private var var_1026:Array;
      
      private var targetDistances:Array;
      
      private var var_1029:Array;
      
      private var var_1055:Vector3;
      
      private var var_1054:Vector3;
      
      private var var_1012:Vector3;
      
      private var var_1057:Vector3;
      
      private var name_106:TankData;
      
      private var var_1052:name_1729;
      
      private var var_727:name_1451;
      
      private var var_1051:Number = 0;
      
      private var var_1053:Dictionary;
      
      private var var_1016:name_911;
      
      private var targetSystem:ConicAreaTargetSystem;
      
      private var var_1056:name_1742;
      
      public function FlamethrowerModel()
      {
         this.lastUpdateTime = new name_1288("lastUpdateTime flame");
         this.nextTargetCheckTime = new name_1288("nextTargetCheckTime flame");
         this.var_1025 = [];
         this.targetPositions = [];
         this.var_1026 = [];
         this.targetDistances = [];
         this.var_1029 = [];
         this.var_1055 = new Vector3();
         this.var_1054 = new Vector3();
         this.var_1012 = new Vector3();
         this.var_1057 = new Vector3();
         this.var_1053 = new Dictionary();
         this.var_1016 = name_911.getInstance();
         this.var_1056 = new name_1704();
         super();
         _interfaces.push(IModel,class_86,name_1595,IWeaponController);
      }
      
      public function name_1436() : ItemProperty
      {
         return ItemProperty.FIRE_RESISTANCE;
      }
      
      public function initObject(param1:ClientObject, param2:Number, param3:int, param4:int, param5:int, param6:Number, param7:int) : void
      {
         if(this.modelService == null)
         {
            this.modelService = Main.osgi.getService(name_32) as name_32;
            this.battlefield = Main.osgi.getService(IBattleField) as IBattleField;
            this.var_123 = Main.osgi.getService(ITank) as TankModel;
            this.var_1008 = this.modelService.getModelsByInterface(name_1188)[0] as name_1188;
            this.var_1014 = this.modelService.getModelsByInterface(IWeaponWeakeningModel)[0] as IWeaponWeakeningModel;
         }
         var _loc8_:name_1729 = new name_1729();
         _loc8_.coneAngle.value = param2;
         _loc8_.coolingSpeed.value = param3;
         _loc8_.heatingSpeed.value = param5;
         _loc8_.heatLimit.value = param4;
         _loc8_.range.value = param6 * 100;
         _loc8_.targetDetectionInterval.value = param7;
         param1.method_12(FlamethrowerModel,_loc8_);
      }
      
      public function name_1601(param1:ClientObject, param2:String) : void
      {
         var _loc3_:ClientObject = param1;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:TankData = this.var_123.getTankData(_loc3_);
         if(_loc4_ == null || _loc4_.tank == null || !_loc4_.enabled)
         {
            return;
         }
         if(this.var_123.localUserData != null)
         {
            if(param2 == this.var_123.localUserData.user.id)
            {
               return;
            }
         }
         this.method_1241(this.var_1008.name_1457(_loc4_.turret),_loc4_);
      }
      
      public function name_1602(param1:ClientObject, param2:String) : void
      {
         this.method_1240(param2);
      }
      
      public function name_1735(param1:ClientObject) : name_1729
      {
         return param1.method_16(FlamethrowerModel) as name_1729;
      }
      
      public function name_125(param1:TankData) : void
      {
         this.name_106 = param1;
         this.var_1052 = this.name_1735(WeaponsManager.name_185(param1.turret.id));
         this.var_727 = this.var_1008.name_1457(param1.turret);
         this.lastUpdateTime.value = 0;
         this.var_1051 = 0;
         this.targetSystem = new ConicAreaTargetSystem(this.var_1052.range.value,this.var_1052.coneAngle.value,5,6,this.battlefield.getBattlefieldData().name_247,this.var_1056);
      }
      
      public function method_1000() : void
      {
         this.name_106 = null;
         this.var_1052 = null;
         this.var_727 = null;
         this.targetSystem = null;
      }
      
      public function update(param1:int, param2:int) : Number
      {
         var _loc3_:Vector3 = null;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Tank = null;
         var _loc8_:TankData = null;
         var _loc9_:Vector3 = null;
         var _loc10_:Vector3dData = null;
         if(!this.active)
         {
            if(this.var_1051 > 0)
            {
               this.var_1051 -= 0.001 * (param1 - this.lastUpdateTime.value) * this.var_1052.coolingSpeed.value;
               if(this.var_1051 < 0)
               {
                  this.var_1051 = 0;
               }
            }
            this.lastUpdateTime.value = param1;
            return 1 - this.var_1051 / this.var_1052.heatLimit.value;
         }
         if(this.var_1051 >= this.var_1052.heatLimit.value)
         {
            this.method_1001(param1,true);
            return 0;
         }
         if(param1 >= this.nextTargetCheckTime.value)
         {
            _loc3_ = this.var_727.muzzles[0];
            this.var_1016.method_797(this.name_106.tank.skin.name_200,_loc3_,this.var_1057,this.var_1055,this.var_1012,this.var_1054);
            this.var_1025.length = 0;
            _loc4_ = _loc3_.y;
            this.targetSystem.name_1705(this.name_106.tank,_loc4_,0.3,this.var_1055,this.var_1054,this.var_1012,this.var_1025,this.targetDistances,this.var_1029);
            _loc5_ = int(this.var_1025.length);
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
               this.method_1225(this.name_106.turret,this.var_1025,this.var_1026,this.targetPositions,this.targetDistances);
            }
            this.nextTargetCheckTime.value += this.var_1052.targetDetectionInterval.value;
         }
         this.var_1051 += 0.001 * (param1 - this.lastUpdateTime.value) * this.var_1052.heatingSpeed.value;
         this.lastUpdateTime.value = param1;
         if(this.var_1051 > this.var_1052.heatLimit.value)
         {
            return 0;
         }
         return 1 - this.var_1051 / this.var_1052.heatLimit.value;
      }
      
      private function method_1225(param1:ClientObject, param2:Array, param3:Array, param4:Array, param5:Array) : void
      {
         var _loc6_:Object = new Object();
         _loc6_.targetsIds = param2;
         _loc6_.targetPositions = param4;
         _loc6_.targetDistances = param5;
         _loc6_.tickPeriod = this.var_1052.targetDetectionInterval.value;
         trace(JSON.stringify(_loc6_));
         Network(Main.osgi.getService(INetworker)).send("battle;fire;" + JSON.stringify(_loc6_));
      }
      
      private function method_1222(param1:ClientObject) : void
      {
         Network(Main.osgi.getService(INetworker)).send("battle;start_fire");
      }
      
      private function method_1226(param1:ClientObject) : void
      {
         Network(Main.osgi.getService(INetworker)).send("battle;stop_fire");
      }
      
      public function method_1002(param1:int) : void
      {
         this.active = true;
         this.nextTargetCheckTime.value = param1 + this.var_1052.targetDetectionInterval.value;
         this.lastUpdateTime.value = param1;
         this.method_1241(this.var_727,this.name_106);
         this.method_1222(this.name_106.turret);
      }
      
      public function reset() : void
      {
         this.var_1051 = 0;
         this.nextTargetCheckTime.value = 0;
         this.lastUpdateTime.value = getTimer();
      }
      
      public function method_999(param1:TankData) : void
      {
         this.method_1240(param1.user.id);
      }
      
      public function method_1001(param1:int, param2:Boolean) : void
      {
         this.active = false;
         this.nextTargetCheckTime.value = 0;
         this.lastUpdateTime.value = param1;
         this.method_1240(this.name_106.user.id);
         if(param2)
         {
            this.method_1226(this.name_106.turret);
         }
      }
      
      private function method_1241(param1:name_1451, param2:TankData) : void
      {
         var _loc3_:class_76 = WeaponsManager.createFlamethrowerSFXModel(param2.turret);
         var _loc4_:name_1497 = _loc3_.method_1235(param2,param1.muzzles[param1.currBarrel],param2.tank.skin.name_200,this.var_1014);
         this.var_1053[param2.user.id] = _loc4_;
         this.battlefield.name_217(_loc4_.name_1496);
         this.battlefield.name_195(_loc4_.name_1494);
      }
      
      private function method_1240(param1:String) : void
      {
         var _loc2_:name_1497 = this.var_1053[param1];
         if(_loc2_ != null)
         {
            delete this.var_1053[param1];
            if(_loc2_.name_1496 != null)
            {
               _loc2_.name_1496.kill();
            }
            if(_loc2_.name_1494 != null)
            {
               _loc2_.name_1494.kill();
            }
            if(_loc2_.var_1046 != null && _loc2_.var_1045 != null)
            {
               _loc2_.var_1046.stop();
               _loc2_.var_1046 = null;
               _loc2_.var_1045.stop();
               _loc2_.var_1045 = null;
            }
         }
      }
   }
}
