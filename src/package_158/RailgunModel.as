package package_158
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.model.class_11;
   import alternativa.model.IModel;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_128;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.ITank;
   import alternativa.tanks.models.weapon.IWeaponController;
   import alternativa.tanks.models.weapon.name_1495;
   import alternativa.tanks.models.weapon.name_903;
   import alternativa.tanks.models.weapon.name_911;
   import alternativa.tanks.services.materialregistry.IMaterialRegistry;
   import alternativa.tanks.sfx.name_132;
   import alternativa.tanks.sfx.name_657;
   import package_1.Main;
   import package_157.name_1798;
   import package_167.name_1454;
   import package_278.name_1288;
   import package_338.class_108;
   import package_338.name_1612;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_41.ItemProperty;
   import package_41.Vector3dData;
   import package_52.WeaponsManager;
   import package_7.name_32;
   import package_79.class_36;
   import package_92.name_1188;
   import package_92.name_1451;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class RailgunModel extends class_108 implements IModel, name_1612, IWeaponController, class_11
   {
      
      private static const const_1481:name_903 = new name_903();
      
      private static const const_498:Number = 50;
      
      private static const const_492:Class = name_1802;
      
      private static var var_1001:TextureMaterial;
       
      
      private const const_1490:Number = 20000;
      
      private var modelService:name_32;
      
      private var var_11:BattlefieldModel;
      
      private var var_13:ITank;
      
      private var var_1008:name_1188;
      
      private var name_106:TankData;
      
      private var var_733:name_1454;
      
      private var var_1083:name_1796;
      
      private var var_727:name_1451;
      
      private var var_1016:name_911;
      
      private var var_1011:Boolean;
      
      private var chargeTimeLeft:name_1288;
      
      private var nextReadyTime:name_1288;
      
      private var targetSystem:RailgunTargetSystem;
      
      private var var_1082:name_1801;
      
      private var var_1081:Vector3;
      
      private var var_1012:Vector3;
      
      private var var_1043:Vector3;
      
      private var var_1042:Vector3;
      
      private var var_1006:Vector3;
      
      private var _hitPos3d:Vector3dData;
      
      private var targetPositions:Array;
      
      private var var_1026:Array;
      
      private var var_1084:* = true;
      
      public function RailgunModel()
      {
         this.var_1016 = name_911.getInstance();
         this.chargeTimeLeft = new name_1288("chargeTimeLeft.value railgun");
         this.nextReadyTime = new name_1288("chargeTimeLeft.value railgun");
         this.targetSystem = new RailgunTargetSystem();
         this.var_1082 = new name_1801();
         this.var_1081 = new Vector3();
         this.var_1012 = new Vector3();
         this.var_1043 = new Vector3();
         this.var_1042 = new Vector3();
         this.var_1006 = new Vector3();
         this._hitPos3d = new Vector3dData(0,0,0);
         this.targetPositions = [];
         this.var_1026 = [];
         super();
         _interfaces.push(IModel,name_1612,IWeaponController,class_11);
         this.objectLoaded(null);
      }
      
      public function name_1436() : ItemProperty
      {
         return ItemProperty.RAIL_RESISTANCE;
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         if(this.var_1008 == null)
         {
            this.modelService = Main.osgi.getService(name_32) as name_32;
            this.var_11 = Main.osgi.getService(IBattleField) as BattlefieldModel;
            this.var_13 = Main.osgi.getService(ITank) as ITank;
            this.var_1008 = Main.osgi.getService(name_1188) as name_1188;
         }
         if(var_1001 == null)
         {
            var_1001 = IMaterialRegistry(Main.osgi.getService(IMaterialRegistry)).textureMaterialRegistry.getMaterial(null,new const_492().bitmapData,1);
         }
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         IMaterialRegistry(Main.osgi.getService(IMaterialRegistry)).textureMaterialRegistry.disposeMaterial(var_1001);
         var_1001 = null;
      }
      
      public function initObject(param1:ClientObject, param2:int, param3:Number) : void
      {
         var _loc4_:name_1796 = new name_1796();
         _loc4_.name_1797 = param2;
         _loc4_.weakeningCoeff = param3;
         param1.method_12(RailgunModel,_loc4_);
         this.objectLoaded(param1);
      }
      
      public function name_1601(param1:ClientObject, param2:String) : void
      {
         var _loc3_:ClientObject = param1;
         if(_loc3_ == null)
         {
            return;
         }
         if(this.var_13 == null)
         {
            this.var_13 = Main.osgi.getService(ITank) as ITank;
         }
         var _loc4_:TankData = this.var_13.getTankData(_loc3_);
         if(_loc4_.tank == null || !_loc4_.enabled || _loc4_.local)
         {
            return;
         }
         if(this.var_1008 == null)
         {
            this.var_1008 = Main.osgi.getService(name_1188) as name_1188;
         }
         var _loc5_:name_1451 = this.var_1008.name_1457(_loc4_.turret);
         this.var_1016.name_1702(_loc4_.tank.skin.name_200,_loc5_.muzzles[0],this.var_1043,this.var_1042);
         var _loc6_:name_1798 = WeaponsManager.createRailgunSFXModel(_loc4_.turret);
         var _loc7_:name_1796 = this.method_1289(_loc4_.turret);
         var _loc8_:name_657 = _loc6_.name_1800(_loc4_.turret,_loc4_.user,_loc5_.muzzles[_loc5_.currBarrel],_loc4_.tank.skin.name_200,_loc7_.name_1797);
         if(this.var_11 == null)
         {
            this.var_11 = Main.osgi.getService(IBattleField) as BattlefieldModel;
         }
         if(this.var_1084)
         {
            this.var_1084 = false;
            this.var_11.name_217(_loc8_);
            _loc8_ = _loc6_.name_1800(_loc4_.turret,_loc4_.user,_loc5_.muzzles[_loc5_.currBarrel],_loc4_.tank.skin.name_200,_loc7_.name_1797);
         }
         this.var_11.name_217(_loc8_);
         var _loc9_:name_132 = _loc6_.name_1803(_loc4_.turret,_loc4_.user,this.var_1043);
         if(_loc9_ != null)
         {
            this.var_11.name_195(_loc9_);
         }
      }
      
      public function fire(param1:ClientObject, param2:String, param3:Array, param4:Array) : void
      {
         var _loc6_:TankData = null;
         var _loc7_:name_1451 = null;
         var _loc8_:name_1796 = null;
         var _loc9_:Vector3 = null;
         var _loc11_:Vector3dData = null;
         var _loc12_:Number = NaN;
         var _loc15_:name_657 = null;
         var _loc16_:int = 0;
         var _loc17_:ClientObject = null;
         var _loc18_:TankData = null;
         var _loc5_:ClientObject = param1;
         if(_loc5_ == null)
         {
            return;
         }
         _loc6_ = this.var_13.getTankData(_loc5_);
         if(_loc6_ == null || _loc6_.tank == null || !_loc6_.enabled || _loc6_.local)
         {
            return;
         }
         if(this.var_1008 == null)
         {
            this.var_1008 = Main.osgi.getService(name_1188) as name_1188;
         }
         if(this.var_11 == null)
         {
            this.var_11 = Main.osgi.getService(IBattleField) as BattlefieldModel;
         }
         _loc7_ = this.var_1008.name_1457(_loc6_.turret);
         _loc8_ = this.method_1289(_loc6_.turret);
         _loc6_.tank.method_458(const_1481);
         this.var_1016.name_1702(_loc6_.tank.skin.name_200,_loc7_.muzzles[0],this.var_1043,this.var_1042);
         _loc9_ = null;
         var _loc10_:int = int(param3.length);
         _loc12_ = _loc7_.impactForce;
         if(param4 != null)
         {
            _loc11_ = param3[param3.length - 1];
            _loc9_ = new Vector3();
            _loc9_.vDiff(new Vector3(_loc11_.x,_loc11_.y,_loc11_.z),const_1481.name_1422).normalize();
            _loc16_ = 0;
            while(_loc16_ < _loc10_ - 1)
            {
               _loc17_ = BattleController.tankClientObjectByTankId[param4[_loc16_]];
               if(_loc17_ != null)
               {
                  _loc18_ = this.var_13.getTankData(_loc17_);
                  if(!(_loc18_ == null || _loc18_.tank == null))
                  {
                     _loc11_ = param3[_loc16_];
                     this.var_1081.x = _loc11_.x;
                     this.var_1081.y = _loc11_.y;
                     this.var_1081.z = _loc11_.z;
                     this.var_1081.vTransformBy3(_loc18_.tank.name_225);
                     this.var_1081.vAdd(_loc18_.tank.state.position);
                     _loc18_.tank.method_496(this.var_1081,_loc9_,_loc12_);
                     this.var_11.method_144(_loc18_,_loc9_,_loc12_ / name_1495.name_1499);
                     _loc12_ *= _loc8_.weakeningCoeff;
                  }
               }
               _loc16_++;
            }
         }
         _loc11_ = param3[_loc10_ - 1];
         this.var_1081.x = _loc11_.x;
         this.var_1081.y = _loc11_.y;
         this.var_1081.z = _loc11_.z;
         this.var_11.addDecal(this.var_1081,this.var_1043,50,var_1001);
         _loc6_.tank.method_432(this.var_1043,this.var_1042,-_loc7_.kickback);
         var _loc13_:name_1798 = WeaponsManager.createRailgunSFXModel(_loc6_.turret);
         var _loc14_:Number = this.var_1081.vClone().vSubtract(this.var_1043).vNormalize().vCosAngle(this.var_1042);
         if(_loc14_ < 0)
         {
            trace("Adding inversed ray");
            _loc15_ = _loc13_.name_1799(_loc6_.turret,this.var_1043,this.var_1043.vClone().vScale(2).vSubtract(this.var_1081));
         }
         else
         {
            _loc15_ = _loc13_.name_1799(_loc6_.turret,this.var_1043,this.var_1081);
         }
         if(_loc15_ != null)
         {
            this.var_11.name_217(_loc15_);
         }
      }
      
      public function method_1002(param1:int) : void
      {
         this.var_1011 = true;
      }
      
      public function method_1001(param1:int, param2:Boolean) : void
      {
         this.var_1011 = false;
      }
      
      public function name_125(param1:TankData) : void
      {
         this.name_106 = param1;
         this.var_733 = WeaponsManager.var_495[param1.turret.id];
         this.var_1083 = this.method_1289(param1.turret);
         this.var_727 = this.var_1008.name_1457(param1.turret);
         this.var_11 = Main.osgi.getService(IBattleField) as BattlefieldModel;
         this.targetSystem.name_1804(this.var_11.getBattlefieldData().name_678.name_247,this.var_733.name_1614.value,this.var_733.name_1628.value,this.var_733.name_1618.value,this.var_733.name_1622.value,this.var_1083.weakeningCoeff,null);
         this.reset();
         var _loc3_:Vector3 = this.var_727.muzzles[0];
      }
      
      public function method_1000() : void
      {
         this.name_106 = null;
         this.var_733 = null;
         this.var_1083 = null;
         this.var_727 = null;
      }
      
      public function update(param1:int, param2:int) : Number
      {
         var _loc3_:Vector3 = null;
         var _loc4_:name_1798 = null;
         var _loc5_:name_657 = null;
         var _loc6_:name_132 = null;
         if(this.chargeTimeLeft.value > 0)
         {
            this.chargeTimeLeft.value -= param2;
            if(this.chargeTimeLeft.value <= 0)
            {
               this.chargeTimeLeft.value = 0;
               this.method_1287(this.var_727,this.name_106,param1);
            }
            return this.chargeTimeLeft.value / this.var_1083.name_1797;
         }
         if(param1 < this.nextReadyTime.value)
         {
            return 1 - (this.nextReadyTime.value - param1) / this.var_733.reloadMsec.value;
         }
         if(this.var_1011)
         {
            this.chargeTimeLeft.value = this.var_1083.name_1797;
            _loc3_ = this.var_727.muzzles[0];
            this.var_1016.method_797(this.name_106.tank.skin.name_200,_loc3_,this.var_1043,this.var_1006,this.var_1012,this.var_1042);
            _loc4_ = WeaponsManager.createRailgunSFXModel(this.name_106.turret);
            _loc5_ = _loc4_.name_1800(this.name_106.turret,this.name_106.user,_loc3_,this.name_106.tank.skin.name_200,this.var_1083.name_1797);
            if(_loc5_ != null)
            {
               this.var_11.name_217(_loc5_);
            }
            _loc6_ = _loc4_.name_1803(this.name_106.turret,this.name_106.user,this.var_1043);
            if(_loc6_ != null)
            {
               this.var_11.name_195(_loc6_);
            }
            this.method_1222(this.name_106.turret);
         }
         return 1;
      }
      
      private function method_1222(param1:ClientObject) : void
      {
         Network(Main.osgi.getService(name_2)).send("battle;start_fire");
      }
      
      public function reset() : void
      {
         this.chargeTimeLeft.value = 0;
         this.nextReadyTime.value = 0;
         this.var_1011 = false;
      }
      
      public function method_999(param1:TankData) : void
      {
      }
      
      private function method_1289(param1:ClientObject) : name_1796
      {
         return param1.method_16(RailgunModel) as name_1796;
      }
      
      private function method_1287(param1:name_1451, param2:TankData, param3:int) : void
      {
         var _loc7_:name_657 = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Vector3 = null;
         var _loc11_:TankData = null;
         var _loc12_:Vector3 = null;
         this.nextReadyTime.value = param3 + this.var_733.reloadMsec.value;
         this.var_1016.method_797(param2.tank.skin.name_200,param1.muzzles[param1.currBarrel],this.var_1043,this.var_1006,this.var_1012,this.var_1042);
         var _loc4_:name_128 = this.var_11.getBattlefieldData();
         this.targetSystem.name_1705(param2,this.var_1006,this.var_1042,this.var_1012,_loc4_.tanks,this.var_1082);
         if(this.var_1082.hitPoints.length == 0)
         {
            this.var_1081.x = this._hitPos3d.x = this.var_1043.x + 20000 * this.var_1042.x;
            this.var_1081.y = this._hitPos3d.y = this.var_1043.y + 20000 * this.var_1042.y;
            this.var_1081.z = this._hitPos3d.z = this.var_1043.z + 20000 * this.var_1042.z;
            this.method_1217(param2.turret,null,[this._hitPos3d],null,null);
         }
         else
         {
            this.var_1081.vCopy(this.var_1082.hitPoints[this.var_1082.hitPoints.length - 1]);
            if(this.var_1082.hitPoints.length == this.var_1082.targets.length)
            {
               this.var_1081.subtract(this.var_1043).vNormalize().vScale(20000).vAdd(this.var_1043);
               this.var_1082.hitPoints.push(this.var_1081);
            }
            this.var_1082.hitPoints[this.var_1082.hitPoints.length - 1] = new Vector3dData(this.var_1081.x,this.var_1081.y,this.var_1081.z);
            this.targetPositions.length = 0;
            this.var_1026.length = 0;
            _loc8_ = int(this.var_1082.targets.length);
            _loc9_ = 0;
            while(_loc9_ < _loc8_)
            {
               _loc10_ = this.var_1082.hitPoints[_loc9_];
               _loc11_ = this.var_1082.targets[_loc9_];
               _loc11_.tank.method_496(_loc10_,this.var_1082.dir,param1.impactForce);
               this.var_1082.targets[_loc9_] = _loc11_.user.id;
               _loc10_.subtract(_loc11_.tank.state.position).vTransformBy3Tr(_loc11_.tank.name_225);
               this.var_1082.hitPoints[_loc9_] = new Vector3dData(_loc10_.x,_loc10_.y,_loc10_.z);
               _loc12_ = _loc11_.tank.state.position;
               this.targetPositions[_loc9_] = new Vector3dData(_loc12_.x,_loc12_.y,_loc12_.z);
               this.var_1026[_loc9_] = _loc11_.name_149;
               _loc9_++;
            }
            if(_loc8_ == 0)
            {
               this.var_11.addDecal(Vector3dData(this.var_1082.hitPoints[0]).toVector3(),this.var_1006,50,var_1001);
            }
            else
            {
               this.var_11.addDecal(this.var_1081,this.var_1006,50,var_1001);
            }
            this.method_1217(param2.turret,this.var_1026,this.var_1082.hitPoints,this.var_1082.targets,this.targetPositions);
         }
         param2.tank.method_432(this.var_1043,this.var_1042,-param1.kickback);
         var _loc5_:name_1798 = WeaponsManager.createRailgunSFXModel(param2.turret);
         var _loc6_:Number = this.var_1081.vClone().vSubtract(this.var_1043).vNormalize().vCosAngle(this.var_1042);
         if(_loc6_ < 0)
         {
            _loc7_ = _loc5_.name_1799(param2.turret,this.var_1043,this.var_1043.vClone().vScale(2).vSubtract(this.var_1081));
         }
         else
         {
            _loc7_ = _loc5_.name_1799(param2.turret,this.var_1043,this.var_1081);
         }
         if(_loc7_ != null)
         {
            this.var_11.name_217(_loc7_);
         }
      }
      
      public function method_1217(param1:ClientObject, param2:Array, param3:Array, param4:Array, param5:Array) : void
      {
         var _loc6_:Vector3dData = param3[0] as Vector3dData;
         var _loc7_:Object = new Object();
         _loc7_.hitPoints = param3;
         _loc7_.targetInc = param2;
         _loc7_.targets = param4;
         _loc7_.targetPostitions = param5;
         _loc7_.reloadTime = this.var_733.reloadMsec.value;
         Network(Main.osgi.getService(name_2)).send("battle;fire;" + JSON.stringify(_loc7_));
      }
   }
}
