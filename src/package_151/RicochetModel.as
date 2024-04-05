package package_151
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.model.class_11;
   import alternativa.model.name_66;
   import alternativa.physics.name_660;
   import alternativa.tanks.engine3d.name_1072;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_83;
   import alternativa.tanks.models.sfx.LightDataManager;
   import alternativa.tanks.models.sfx.name_1096;
   import alternativa.tanks.models.sfx.name_1716;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.class_7;
   import alternativa.tanks.models.weapon.name_1074;
   import alternativa.tanks.models.weapon.name_903;
   import alternativa.tanks.models.weapon.name_911;
   import alternativa.tanks.models.weapon.shared.name_653;
   import alternativa.tanks.services.objectpool.name_118;
   import alternativa.tanks.sfx.Sound3D;
   import alternativa.tanks.sfx.Sound3DEffect;
   import alternativa.tanks.sfx.name_1070;
   import alternativa.tanks.sfx.name_1071;
   import alternativa.tanks.sfx.name_1760;
   import alternativa.tanks.sfx.name_89;
   import alternativa.tanks.vehicles.tanks.Tank;
   import flash.media.Sound;
   import flash.utils.getTimer;
   import package_1.Main;
   import package_152.name_1793;
   import package_152.name_1795;
   import package_161.name_1448;
   import package_167.name_1454;
   import package_278.name_1288;
   import package_278.name_905;
   import package_37.Vector3;
   import package_373.class_105;
   import package_373.class_106;
   import package_4.ClientObject;
   import package_41.name_320;
   import package_41.Vector3dData;
   import package_42.TanksCollisionDetector;
   import package_42.name_73;
   import package_52.WeaponsManager;
   import package_6.ObjectRegister;
   import package_61.name_124;
   import package_7.name_32;
   import package_92.name_1188;
   import package_92.name_1451;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class RicochetModel extends class_105 implements class_106, class_11, name_1074, class_107
   {
      
      private static const const_1489:name_903 = new name_903();
      
      private static const const_106:Number = 266;
      
      private static var var_138:name_118;
       
      
      private var var_728:name_1188;
      
      private var var_1014:name_1448;
      
      private var battlefield:BattlefieldModel;
      
      private var var_13:TankModel;
      
      private var var_1076:name_1795;
      
      private var name_106:TankData;
      
      private var var_1072:name_1792;
      
      private var var_1074:name_1793;
      
      private var var_733:name_1454;
      
      private var var_727:name_1451;
      
      private var var_764:Boolean;
      
      private var readyTime:name_1288;
      
      private var currentEnergy:name_905;
      
      private var targetSystem:name_1794;
      
      private var var_1016:name_911;
      
      private var var_1006:Vector3;
      
      private var var_1004:Vector3;
      
      private var var_1012:Vector3;
      
      private var var_1007:Vector3;
      
      private var var_1073:Vector3;
      
      private var var_1077:Vector3;
      
      private var var_1075:Vector3;
      
      private var var_397:name_124;
      
      private var var_1078:Number = 150;
      
      private var var_1079:int = 100;
      
      private var var_1080:int = 100;
      
      public function RicochetModel()
      {
         this.readyTime = new name_1288("readyTime.value ricochet");
         this.currentEnergy = new name_905("currentEnergy.value ricochet");
         this.var_1016 = name_911.getInstance();
         this.var_1006 = new Vector3();
         this.var_1004 = new Vector3();
         this.var_1012 = new Vector3();
         this.var_1007 = new Vector3();
         this.var_1073 = new Vector3();
         this.var_1077 = new Vector3();
         this.var_1075 = new Vector3();
         this.var_397 = new name_124();
         super();
         var_365.push(name_66,class_11,name_1074);
         var_138 = name_118(Main.osgi.name_6(name_118));
      }
      
      public function name_1436() : name_320
      {
         return name_320.name_491;
      }
      
      public function name_1603(param1:ClientObject, param2:String, param3:Vector3dData, param4:int, param5:int, param6:int, param7:Number) : void
      {
         var _loc8_:TankData = this.method_1221(param2,param1.register);
         var _loc9_:TankData = param1.method_16(TankModel) as TankData;
         if(_loc8_ == null || _loc9_ == null)
         {
            return;
         }
         var _loc10_:name_1451 = this.var_728.name_1457(_loc9_.turret);
         this.var_1077.reset(param3.x,param3.y,param3.z);
         this.var_1075.reset(param4 / 32767,param5 / 32767,param6 / 32767).vNormalize();
         this.battlefield.method_144(_loc8_,this.var_1075,param7 * _loc10_.name_1498);
         this.var_1075.vScale(param7 * _loc10_.impactForce);
         _loc8_.tank.method_451(this.var_1077,this.var_1075);
      }
      
      public function fire(param1:ClientObject, param2:String, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:TankData = this.method_1221(param2,param1.register);
         if(_loc6_ == null || _loc6_.tank == null || _loc6_.tank.skin == null)
         {
            return;
         }
         if(this.var_13.localUserData != null)
         {
            if(_loc6_ == this.var_13.localUserData)
            {
               return;
            }
         }
         if(this.var_1076 == null)
         {
            this.var_1076 = WeaponsManager.createRicochetSFXModel(_loc6_.turret);
         }
         var _loc7_:name_1792 = name_1792(_loc6_.turret.method_16(name_1792));
         var _loc8_:name_1451 = this.var_728.name_1457(_loc6_.turret);
         var _loc9_:name_1793 = this.var_1076.method_1264(_loc6_.turret);
         var _loc10_:Vector3 = _loc8_.muzzles[0];
         this.var_1016.method_797(_loc6_.tank.skin.name_200,_loc10_,this.var_1007,this.var_1006,this.var_1012,this.var_1004);
         this.var_1073.reset(param3 / 32767,param4 / 32767,param5 / 32767).vNormalize();
         this.name_1249(_loc6_,_loc7_,_loc9_,_loc8_,_loc10_,this.var_1007,this.var_1073,this.var_1004);
      }
      
      public function method_1288(param1:ClientObject, param2:String, param3:int) : void
      {
         var _loc4_:TankData = this.method_1221(param2,param1.register);
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:name_1451 = this.var_728.name_1457(param1);
         var _loc6_:name_1793 = this.var_1076.method_1264(param1);
         var _loc7_:Vector3 = _loc5_.muzzles[0];
         this.var_1016.method_797(_loc4_.tank.skin.name_200,_loc7_,this.var_1007,this.var_1006,this.var_1012,this.var_1004);
         this.method_1283(_loc4_,_loc6_,_loc5_,param3,this.var_1006,this.var_1004);
      }
      
      public function initObject(param1:ClientObject, param2:int, param3:int, param4:Number, param5:Number, param6:Number, param7:Number) : void
      {
         var _loc9_:name_32 = null;
         var _loc8_:name_1792 = new name_1792(100 * param6,100 * param7,param2,param3,param4,100 * param5);
         param1.method_12(name_1792,_loc8_);
         if(this.battlefield == null)
         {
            _loc9_ = name_32(Main.osgi.name_6(name_32));
            this.battlefield = BattlefieldModel(Main.osgi.name_6(name_83));
            this.var_13 = TankModel(Main.osgi.name_6(class_7));
            this.var_728 = name_1188(_loc9_.getModelsByInterface(name_1188)[0]);
         }
         this.objectLoaded(param1);
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:name_32 = null;
         if(this.var_1014 == null)
         {
            _loc2_ = name_32(Main.osgi.name_6(name_32));
            this.var_1014 = name_1448(_loc2_.getModelsByInterface(name_1448)[0]);
         }
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
      }
      
      public function method_999(param1:TankData) : void
      {
      }
      
      public function reset() : void
      {
         this.readyTime.value = 0;
         this.currentEnergy.value = this.var_1072.energyCapacity;
      }
      
      public function name_125(param1:TankData) : void
      {
         var _loc2_:ClientObject = param1.turret;
         this.name_106 = param1;
         this.var_1072 = name_1792(_loc2_.method_16(name_1792));
         this.var_1074 = name_1793(_loc2_.method_16(name_1793));
         var _loc3_:name_32 = name_32(Main.osgi.name_6(name_32));
         this.var_733 = WeaponsManager.var_495[_loc2_.id];
         this.var_727 = this.var_728.name_1457(param1.turret);
         var _loc4_:name_83 = name_83(Main.osgi.name_6(name_83));
         var _loc5_:TanksCollisionDetector = _loc4_.getBattlefieldData().name_247;
         var _loc6_:name_653 = name_653.create(this.name_106,this.var_733,this.battlefield,this.var_1014,_loc3_);
         this.targetSystem = new name_1794(this.var_733.name_1614.value,this.var_733.name_1628.value,this.var_733.name_1618.value,this.var_733.name_1622.value,this.var_1072.shotDistance,_loc5_,_loc6_);
      }
      
      public function method_1000() : void
      {
         this.name_106 = null;
         this.var_1072 = null;
         this.var_733 = null;
         this.var_727 = null;
         this.targetSystem = null;
      }
      
      public function method_1002(param1:int) : void
      {
         this.var_764 = true;
      }
      
      public function method_1001(param1:int, param2:Boolean) : void
      {
         this.var_764 = false;
      }
      
      public function update(param1:int, param2:int) : Number
      {
         var _loc3_:int = this.var_1072.energyCapacity;
         if(this.currentEnergy.value < _loc3_)
         {
            this.currentEnergy.value += this.var_1072.energyRechargeSpeed * param2 * 0.001;
            if(this.currentEnergy.value > _loc3_)
            {
               this.currentEnergy.value = _loc3_;
            }
         }
         if(this.var_764 && param1 >= this.readyTime.value && this.currentEnergy.value >= this.var_1072.energyPerShot)
         {
            this.method_1287(this.var_727);
         }
         return this.currentEnergy.value / this.var_1072.energyCapacity;
      }
      
      public function method_1282(param1:RicochetShot, param2:Vector3, param3:Vector3, param4:name_660) : void
      {
         var _loc5_:Tank = null;
         var _loc6_:TankData = null;
         var _loc7_:Vector3 = null;
         var _loc8_:Vector3dData = null;
         var _loc9_:Vector3dData = null;
         this.method_1284(param2,param1.sfxData,param1.name_1764.turret);
         if(param1.name_1764 == this.name_106)
         {
            _loc5_ = Tank(param4);
            _loc6_ = _loc5_.tankData;
            _loc7_ = new Vector3().vCopy(param2).subtract(_loc5_.state.position);
            _loc7_.vTransformBy3Tr(_loc5_.name_225);
            _loc8_ = new Vector3dData(_loc7_.x,_loc7_.y,_loc7_.z);
            _loc7_ = _loc5_.state.position;
            _loc9_ = new Vector3dData(_loc7_.x,_loc7_.y,_loc7_.z);
            this.method_1225(this.name_106.turret,_loc6_.user.id,param1.id,_loc6_.name_149,_loc8_,_loc9_,param3.x * 32767,param3.y * 32767,param3.z * 32767,0.01 * param1.name_1769);
         }
      }
      
      private function method_1225(param1:ClientObject, param2:String, param3:int, param4:int, param5:Vector3dData, param6:Vector3dData, param7:Number, param8:Number, param9:Number, param10:Number) : void
      {
         var _loc11_:Object = new Object();
         _loc11_.victimId = param2;
         _loc11_.shotId = param3;
         _loc11_.distance = param10;
         _loc11_.hitPos3d = param5;
         _loc11_.x = param7;
         _loc11_.y = param8;
         _loc11_.z = param9;
         _loc11_.reloadTime = this.var_733.reloadMsec.value;
         Network(Main.osgi.name_6(name_2)).send("battle;fire;" + JSON.stringify(_loc11_));
      }
      
      private function method_1284(param1:Vector3, param2:name_1793, param3:ClientObject) : void
      {
         var _loc4_:name_1070 = name_1070(var_138.objectPool.getObject(name_1070));
         var _loc5_:name_1071 = name_1071(var_138.objectPool.getObject(name_1071));
         _loc5_.init(param1,50);
         var _loc6_:name_1072 = param2.name_1762;
         _loc4_.init(266,266,_loc6_,Math.random() * Math.PI * 2,_loc5_,0.5,0.5,null,0);
         this.battlefield.name_217(_loc4_);
         this.method_1286(param2.explosionSound,param1,name_89.name_191,name_89.name_229,name_89.name_250,0.8);
         this.method_1267(param1,param3);
      }
      
      private function method_1286(param1:Sound, param2:Vector3, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         var _loc7_:Sound3D = null;
         var _loc8_:Sound3DEffect = null;
         if(param1 != null)
         {
            _loc7_ = Sound3D.create(param1,param3,param4,param5,param6);
            _loc8_ = Sound3DEffect.create(var_138.objectPool,null,param2,_loc7_);
            this.battlefield.name_195(_loc8_);
         }
      }
      
      private function method_1267(param1:Vector3, param2:ClientObject) : void
      {
         var _loc3_:name_1096 = name_1096(this.battlefield.getObjectPool().getObject(name_1096));
         var _loc4_:name_1071 = name_1071(this.battlefield.getObjectPool().getObject(name_1071));
         _loc4_.init(param1,50);
         _loc3_.init(_loc4_,LightDataManager.name_1098(param2.id));
         this.battlefield.name_217(_loc3_);
      }
      
      private function method_1287(param1:name_1451) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Vector3 = null;
         var _loc5_:Vector3dData = null;
         var _loc6_:RicochetShot = null;
         if(this.var_1074 == null)
         {
            this.var_1074 = name_1793(this.name_106.turret.method_16(name_1793));
         }
         this.readyTime.value = getTimer() + this.var_733.reloadMsec.value;
         this.currentEnergy.value -= this.var_1072.energyPerShot;
         var _loc2_:Vector3 = param1.muzzles[0];
         this.var_1016.method_797(this.name_106.tank.skin.name_200,_loc2_,this.var_1007,this.var_1006,this.var_1012,this.var_1004);
         if(this.battlefield.getBattlefieldData().name_247.name_251(this.var_1006,this.var_1004,name_73.name_252,_loc2_.y,null,this.var_397))
         {
            _loc3_ = this.var_397.t / _loc2_.y * 255 - 128;
            _loc4_ = this.name_106.tank.state.position;
            _loc5_ = new Vector3dData(_loc4_.x,_loc4_.y,_loc4_.z);
            this.method_1283(this.name_106,this.var_1074,this.var_727,_loc3_,this.var_1006,this.var_1004);
            this.method_1285(this.name_106.turret,this.name_106.name_149,_loc3_,_loc5_);
         }
         else if(this.battlefield.getBattlefieldData().name_247.name_251(this.name_106.tank.state.position,this.var_1006.vClone().vSubtract(this.name_106.tank.state.position).vNormalize(),name_73.name_252,_loc2_.y,null,this.var_397))
         {
            _loc3_ = this.var_397.t / _loc2_.y * 255 - 128;
            _loc4_ = this.name_106.tank.state.position;
            _loc5_ = new Vector3dData(_loc4_.x,_loc4_.y,_loc4_.z);
            this.method_1283(this.name_106,this.var_1074,this.var_727,_loc3_,this.var_1006,this.var_1004);
            this.method_1285(this.name_106.turret,this.name_106.name_149,_loc3_,_loc5_);
         }
         else
         {
            if(!this.targetSystem.name_1453(this.var_1007,this.var_1004,this.var_1012,this.name_106.tank,this.var_1073))
            {
               this.var_1073.vCopy(this.var_1004);
            }
            _loc6_ = this.name_1249(this.name_106,this.var_1072,this.var_1074,param1,_loc2_,this.var_1007,this.var_1073,this.var_1004);
            this.method_1217(this.name_106.turret,_loc6_.id,this.var_1073.x * 32767,this.var_1073.y * 32767,this.var_1073.z * 32767);
         }
      }
      
      private function method_1285(param1:ClientObject, param2:int, param3:int, param4:Vector3dData) : void
      {
         var _loc5_:Object = new Object();
         _loc5_.self_hit = true;
         _loc5_.reloadTime = this.var_733.reloadMsec.value;
         Network(Main.osgi.name_6(name_2)).send("battle;fire;" + JSON.stringify(_loc5_));
      }
      
      private function method_1217(param1:ClientObject, param2:int, param3:Number, param4:Number, param5:Number) : void
      {
         var _loc6_:Object = new Object();
         _loc6_.shotid = param2;
         _loc6_.x = param3;
         _loc6_.y = param4;
         _loc6_.z = param5;
         Network(Main.osgi.name_6(name_2)).send("battle;start_fire;" + JSON.stringify(_loc6_));
      }
      
      private function name_1249(param1:TankData, param2:name_1792, param3:name_1793, param4:name_1451, param5:Vector3, param6:Vector3, param7:Vector3, param8:Vector3) : RicochetShot
      {
         var _loc11_:Sound3D = null;
         var _loc12_:Sound3DEffect = null;
         var _loc9_:RicochetShot = RicochetShot(var_138.objectPool.getObject(RicochetShot));
         _loc9_.init(param6,param7,param1,param2,param3,this.battlefield.getBattlefieldData().name_247,this.var_1014,this,this.battlefield);
         this.battlefield.name_217(_loc9_);
         var _loc10_:name_1760 = name_1760(var_138.objectPool.getObject(name_1760));
         _loc10_.init(param5,param1.tank.skin.name_200,param3.name_1761,this.var_1079,this.var_1078,this.var_1078);
         this.battlefield.name_217(_loc10_);
         if(param3.shotSound != null)
         {
            _loc11_ = Sound3D.create(param3.shotSound,name_89.name_191,name_89.name_229,name_89.name_250,0.8);
            _loc12_ = Sound3DEffect.create(var_138.objectPool,null,param6,_loc11_);
            this.battlefield.name_195(_loc12_);
         }
         this.method_1237(param1.tank.skin.name_200,param5,param1.turret);
         param1.tank.method_496(param6,param8,-param4.kickback);
         return _loc9_;
      }
      
      private function method_1237(param1:Object3D, param2:Vector3, param3:ClientObject) : void
      {
         var _loc4_:name_1096 = name_1096(this.battlefield.getObjectPool().getObject(name_1096));
         var _loc5_:name_1716 = name_1716(this.battlefield.getObjectPool().getObject(name_1716));
         _loc5_.init(param1,param2);
         _loc4_.init(_loc5_,LightDataManager.name_1723(param3.id));
         this.battlefield.name_217(_loc4_);
      }
      
      private function method_1283(param1:TankData, param2:name_1793, param3:name_1451, param4:int, param5:Vector3, param6:Vector3) : void
      {
         var _loc9_:Sound3D = null;
         var _loc10_:Sound3DEffect = null;
         var _loc7_:Number = (param4 + 128) / 255 * param3.muzzles[0].y;
         var _loc8_:Vector3 = param5.vClone();
         _loc8_.vAddScaled(_loc7_,param6);
         if(param2.shotSound != null)
         {
            _loc9_ = Sound3D.create(param2.shotSound,name_89.name_191,name_89.name_229,name_89.name_250,0.8);
            _loc10_ = Sound3DEffect.create(var_138.objectPool,null,_loc8_,_loc9_);
            this.battlefield.name_195(_loc10_);
         }
         this.method_1284(_loc8_,param2,param1.turret);
         param1.tank.method_496(param5,param6,-param3.impactForce);
      }
      
      private function method_1221(param1:String, param2:ObjectRegister) : TankData
      {
         var _loc3_:ClientObject = BattleController.tankClientObjectByTankId[param1];
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
