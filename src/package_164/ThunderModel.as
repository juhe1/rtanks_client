package package_164
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.model.class_11;
   import alternativa.model.name_66;
   import alternativa.physics.collision.name_1083;
   import alternativa.tanks.models.battlefield.name_128;
   import alternativa.tanks.models.battlefield.name_83;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.class_7;
   import alternativa.tanks.models.weapon.name_1074;
   import alternativa.tanks.models.weapon.name_1495;
   import alternativa.tanks.models.weapon.name_911;
   import alternativa.tanks.models.weapon.shared.CommonTargetSystem;
   import alternativa.tanks.models.weapon.shared.name_653;
   import alternativa.tanks.services.materialregistry.name_100;
   import alternativa.tanks.sfx.name_1497;
   import alternativa.tanks.vehicles.tanks.Tank;
   import package_1.Main;
   import package_161.name_1448;
   import package_165.name_1701;
   import package_167.name_1454;
   import package_278.name_1288;
   import package_356.class_68;
   import package_356.class_69;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_40.TankSpawnState;
   import package_41.name_320;
   import package_41.Vector3dData;
   import package_42.name_73;
   import package_52.WeaponsManager;
   import package_6.ObjectRegister;
   import package_61.name_124;
   import package_7.name_32;
   import package_92.name_1188;
   import package_92.name_1451;
   import package_92.name_1699;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class ThunderModel extends class_69 implements class_68, name_1074, class_11
   {
      
      private static const const_498:Number = 250;
      
      private static const const_492:Class = name_1700;
      
      private static var var_1001:TextureMaterial;
       
      
      private var var_1016:name_911;
      
      private var modelService:name_32;
      
      private var var_11:name_83;
      
      private var var_123:TankModel;
      
      private var var_1008:name_1188;
      
      private var var_1014:name_1448;
      
      private var var_564:name_1701;
      
      private var name_106:TankData;
      
      private var var_733:name_1454;
      
      private var var_1002:name_1698;
      
      private var var_727:name_1451;
      
      private var var_1011:Boolean;
      
      private var nextReadyTime:name_1288;
      
      private var targetSystem:CommonTargetSystem;
      
      private var hitInfo:name_1699;
      
      private var var_1003:Vector3;
      
      private var var_1005:Vector3;
      
      private var var_1017:Vector3;
      
      private var var_1004:Vector3;
      
      private var var_1007:Vector3;
      
      private var var_1006:Vector3;
      
      private var var_1012:Vector3;
      
      private var var_1000:Vector3;
      
      private var var_1015:Vector3;
      
      private var var_1021:name_124;
      
      private var _hitPos3d:Vector3dData;
      
      private var var_1020:Vector3dData;
      
      private var var_1018:Array;
      
      private var var_1019:Array;
      
      private var var_1013:Array;
      
      private var var_1010:Array;
      
      private var var_1009:Vector.<Vector3>;
      
      private var var_1022:Vector.<Vector3>;
      
      private var var_689:name_653;
      
      private var var_1023:Number = 100000;
      
      public function ThunderModel()
      {
         this.var_1016 = name_911.getInstance();
         this.nextReadyTime = new name_1288("nextReadyTime.value thunder");
         this.hitInfo = new name_1699();
         this.var_1003 = new Vector3();
         this.var_1005 = new Vector3();
         this.var_1017 = new Vector3();
         this.var_1004 = new Vector3();
         this.var_1007 = new Vector3();
         this.var_1006 = new Vector3();
         this.var_1012 = new Vector3();
         this.var_1000 = new Vector3();
         this.var_1015 = new Vector3();
         this.var_1021 = new name_124();
         this._hitPos3d = new Vector3dData(0,0,0);
         this.var_1020 = new Vector3dData(0,0,0);
         this.var_1018 = [];
         this.var_1019 = [];
         this.var_1013 = [];
         this.var_1010 = [];
         this.var_1009 = Vector.<Vector3>([new Vector3(),new Vector3(),new Vector3()]);
         this.var_1022 = Vector.<Vector3>([new Vector3(),new Vector3(),new Vector3()]);
         super();
         var_365.push(name_66,name_1074,class_11);
      }
      
      public function name_1436() : name_320
      {
         return name_320.name_433;
      }
      
      public function initObject(param1:ClientObject, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         var _loc6_:name_1698 = new name_1698(param3,param5,param4,param2 * name_1495.name_1499);
         param1.method_12(ThunderModel,_loc6_);
         this.objectLoaded(param1);
      }
      
      public function fire(param1:ClientObject, param2:String, param3:Vector3dData, param4:String, param5:Number, param6:Array, param7:Array) : void
      {
         var _loc14_:TankData = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:TankData = null;
         var _loc18_:Number = NaN;
         var _loc8_:ObjectRegister = param1.register;
         var _loc9_:TankData = this.getTankData(param2,_loc8_);
         if(_loc9_ == null || _loc9_.tank == null || _loc9_.tank.skin == null)
         {
            return;
         }
         if(this.var_123.localUserData != null)
         {
            if(_loc9_.userName == this.var_123.localUserData.userName)
            {
               return;
            }
         }
         var _loc10_:name_1451 = this.var_1008.name_1457(_loc9_.turret);
         this.var_1016.name_1702(_loc9_.tank.skin.name_200,_loc10_.muzzles[0],this.var_1007,this.var_1004);
         this.name_1249(_loc9_,_loc10_.muzzles[0]);
         this.var_1000.vCopy(this.var_1004).vScale(-_loc10_.kickback);
         _loc9_.tank.method_452(this.var_1007,this.var_1000);
         if(param3 == null)
         {
            return;
         }
         this.var_1003.x = param3.x;
         this.var_1003.y = param3.y;
         this.var_1003.z = param3.z;
         var _loc12_:name_1698 = this.getData(_loc9_.turret);
         if(param4 != null)
         {
            _loc14_ = this.getTankData(param4,_loc8_);
            if(_loc14_ == null || _loc14_.tank == null)
            {
               return;
            }
            _loc14_.tank.name_225.name_890(this.var_1003,this.var_1000);
            this.var_1003.sum(this.var_1000,_loc14_.tank.state.position);
            this.method_1216(_loc14_.tank,this.var_1003,this.var_1004,_loc10_.impactForce,_loc12_.impactForce,param5);
            this.var_11.method_144(_loc14_,this.var_1004,_loc10_.name_1498 * param5);
         }
         else
         {
            this.var_11.addDecal(this.var_1003,this.var_1006,250,var_1001);
         }
         this.method_502(_loc9_,this.var_1003);
         var _loc13_:Number = _loc12_.impactForce / name_1495.name_1499;
         if(param6 != null)
         {
            _loc15_ = int(param6.length);
            _loc16_ = 0;
            while(_loc16_ < _loc15_)
            {
               _loc17_ = this.getTankData(param6[_loc16_],_loc8_);
               if(!(_loc17_ == null || _loc17_.tank == null))
               {
                  this.var_1000.diff(_loc17_.tank.state.position,this.var_1003).vNormalize();
                  _loc18_ = 1;
                  this.var_11.method_144(_loc17_,this.var_1000,_loc18_ * _loc13_);
                  this.var_1000.vScale(_loc12_.impactForce * _loc18_);
                  _loc17_.tank.method_433(this.var_1000);
               }
               _loc16_++;
            }
         }
      }
      
      public function method_999(param1:TankData) : void
      {
      }
      
      public function reset() : void
      {
         this.var_1011 = false;
         this.nextReadyTime.value = 0;
      }
      
      public function name_125(param1:TankData) : void
      {
         this.name_106 = param1;
         this.var_733 = WeaponsManager.var_495[param1.turret.id];
         this.var_1002 = name_1698(param1.turret.method_16(ThunderModel));
         this.var_727 = this.var_1008.name_1457(param1.turret);
         this.var_689 = name_653.create(this.name_106,this.var_733,this.var_11,this.var_1014,this.modelService);
         this.targetSystem = new CommonTargetSystem(this.var_1023,this.var_733.name_1614.value,this.var_733.name_1628.value,this.var_733.name_1618.value,this.var_733.name_1622.value,this.var_11.getBattlefieldData().name_247,this.var_689);
      }
      
      public function method_1000() : void
      {
         this.name_106 = null;
         this.var_733 = null;
         this.var_727 = null;
         this.targetSystem = null;
         this.var_689 = null;
      }
      
      public function method_1002(param1:int) : void
      {
         this.var_1011 = true;
      }
      
      public function method_1001(param1:int, param2:Boolean) : void
      {
         this.var_1011 = false;
      }
      
      public function update(param1:int, param2:int) : Number
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:TankData = null;
         var _loc11_:int = 0;
         var _loc12_:Number = NaN;
         var _loc13_:* = undefined;
         var _loc14_:Vector3dData = null;
         var _loc15_:String = null;
         var _loc16_:int = 0;
         var _loc17_:Vector3dData = null;
         var _loc18_:Array = null;
         var _loc19_:Array = null;
         var _loc20_:Array = null;
         var _loc21_:Array = null;
         var _loc22_:TankData = null;
         var _loc23_:Tank = null;
         var _loc24_:Vector3 = null;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:Vector3dData = null;
         var _loc30_:Vector3 = null;
         if(!this.var_1011 || param1 < this.nextReadyTime.value)
         {
            if(param1 < this.nextReadyTime.value)
            {
               return 1 + (param1 - this.nextReadyTime.value) / this.var_733.reloadMsec.value;
            }
            return 1;
         }
         this.nextReadyTime.value = param1 + this.var_733.reloadMsec.value;
         this.var_1016.method_797(this.name_106.tank.skin.name_200,this.var_727.muzzles[0],this.var_1007,this.var_1006,this.var_1012,this.var_1004);
         this.var_1000.vCopy(this.var_1004).vScale(-this.var_727.kickback);
         this.name_106.tank.method_452(this.var_1007,this.var_1000);
         this.name_1249(this.name_106,this.var_727.muzzles[0]);
         var _loc3_:name_128 = this.var_11.getBattlefieldData();
         var _loc4_:name_1083 = _loc3_.name_247;
         if(this.targetSystem.name_670(this.var_1006,this.var_1004,this.var_1012,this.name_106.tank,this.hitInfo))
         {
            _loc5_ = this.hitInfo.distance * 0.01;
            _loc6_ = Number(this.var_1014.name_1458(this.name_106.turret,_loc5_));
            _loc7_ = this.hitInfo.position.x;
            _loc8_ = this.hitInfo.position.y;
            _loc9_ = this.hitInfo.position.z;
            _loc12_ = 10000 * this.var_1002.minSplashDamageRadius * this.var_1002.minSplashDamageRadius;
            for(_loc13_ in _loc3_.name_263)
            {
               _loc22_ = _loc13_;
               _loc23_ = _loc22_.tank;
               if(_loc22_.name_87 != TankSpawnState.NEWCOME)
               {
                  if(_loc23_ == this.hitInfo.name_787)
                  {
                     _loc10_ = _loc22_;
                  }
                  else
                  {
                     _loc24_ = _loc23_.state.position;
                     _loc25_ = _loc24_.x - _loc7_;
                     _loc26_ = _loc24_.y - _loc8_;
                     _loc27_ = _loc24_.z - _loc9_;
                     _loc28_ = _loc25_ * _loc25_ + _loc26_ * _loc26_ + _loc27_ * _loc27_;
                     if(_loc28_ <= _loc12_)
                     {
                        if(this.method_1219(_loc23_,this.hitInfo,_loc4_))
                        {
                           _loc28_ = Math.sqrt(_loc28_) * 0.01;
                           this.var_1018[_loc11_] = _loc22_.user.id;
                           this.var_1019[_loc11_] = _loc22_.name_149;
                           this.var_1013[_loc11_] = _loc28_;
                           _loc29_ = this.var_1010[_loc11_];
                           if(_loc29_ == null)
                           {
                              _loc29_ = new Vector3dData(0,0,0);
                              this.var_1010[_loc11_] = _loc29_;
                           }
                           _loc29_.x = _loc24_.x;
                           _loc29_.y = _loc24_.y;
                           _loc29_.z = _loc24_.z;
                           _loc11_++;
                           this.var_1000.vNormalize();
                           this.var_1000.vScale(this.var_1002.impactForce * _loc6_ * this.method_1218(_loc28_));
                           _loc23_.method_433(this.var_1000);
                        }
                     }
                  }
               }
            }
            _loc14_ = this._hitPos3d;
            if(_loc10_ != null)
            {
               _loc15_ = _loc10_.user.id;
               _loc16_ = _loc10_.name_149;
               _loc17_ = this.var_1020;
               _loc30_ = _loc10_.tank.state.position;
               _loc17_.x = _loc30_.x;
               _loc17_.y = _loc30_.y;
               _loc17_.z = _loc30_.z;
               this.method_1216(_loc10_.tank,this.hitInfo.position,this.var_1004,this.var_727.impactForce,this.var_1002.impactForce,_loc6_);
               this.var_1017.diff(this.hitInfo.position,_loc30_);
               _loc10_.tank.name_225.name_1334(this.var_1017,this.var_1005);
               _loc14_.x = this.var_1005.x;
               _loc14_.y = this.var_1005.y;
               _loc14_.z = this.var_1005.z;
            }
            else
            {
               _loc14_.x = _loc7_;
               _loc14_.y = _loc8_;
               _loc14_.z = _loc9_;
            }
            if(_loc11_ > 0)
            {
               _loc18_ = this.var_1018;
               _loc18_.length = _loc11_;
               _loc19_ = this.var_1019;
               _loc19_.length = _loc11_;
               _loc20_ = this.var_1013;
               _loc20_.length = _loc11_;
               _loc21_ = this.var_1010;
               _loc21_.length = _loc11_;
            }
            this.method_1217(this.name_106.turret,_loc14_,_loc15_,_loc16_,_loc17_,_loc5_,_loc18_,_loc19_,_loc20_,_loc21_);
            this.method_502(this.name_106,this.hitInfo.position);
            if(_loc10_ == null)
            {
               this.var_11.addDecal(this.hitInfo.position,this.var_1006,250,var_1001);
            }
         }
         else
         {
            this.method_1217(this.name_106.turret,null,null,0,null,0,null,null,null,null);
         }
         return 0;
      }
      
      private function method_1217(param1:ClientObject, param2:Vector3dData, param3:String, param4:int, param5:Vector3dData, param6:int, param7:Array, param8:Array, param9:Array, param10:Array) : void
      {
         var _loc11_:Object = new Object();
         _loc11_.hitPos = param2;
         _loc11_.mainTargetId = param3;
         _loc11_.mainTargetPosition = param5;
         _loc11_.distance = param6;
         _loc11_.splashTargetIds = param7;
         _loc11_.splashTargetDistances = param9;
         _loc11_.reloadTime = this.var_733.reloadMsec.value;
         Network(Main.osgi.name_6(name_2)).send("battle;fire;" + JSON.stringify(_loc11_));
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         if(this.var_1008 == null)
         {
            this.modelService = name_32(Main.osgi.name_6(name_32));
            this.var_11 = name_83(Main.osgi.name_6(name_83));
            this.var_123 = Main.osgi.name_6(class_7) as TankModel;
            this.var_1008 = name_1188(this.modelService.getModelsByInterface(name_1188)[0]);
            this.var_1014 = name_1448(this.modelService.getModelsByInterface(name_1448)[0]);
            this.nextReadyTime.value = 0;
         }
         if(var_1001 == null)
         {
            var_1001 = name_100(Main.osgi.name_6(name_100)).textureMaterialRegistry.getMaterial(null,new const_492().bitmapData,1);
         }
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         name_100(Main.osgi.name_6(name_100)).textureMaterialRegistry.disposeMaterial(var_1001);
         var_1001 = null;
      }
      
      private function method_1218(param1:Number) : Number
      {
         if(param1 < this.var_1002.maxSplashDamageRadius)
         {
            return 1;
         }
         return 0.01 * (this.var_1002.minSplashDamagePercent + (this.var_1002.minSplashDamageRadius - param1) * (100 - this.var_1002.minSplashDamagePercent) / (this.var_1002.minSplashDamageRadius - this.var_1002.maxSplashDamageRadius));
      }
      
      private function getTankData(param1:String, param2:ObjectRegister) : TankData
      {
         var _loc3_:ClientObject = BattleController.tankClientObjectByTankId[param1];
         if(_loc3_ == null)
         {
            return null;
         }
         return this.var_123.getTankData(_loc3_);
      }
      
      private function name_1249(param1:TankData, param2:Vector3) : void
      {
         if(this.var_564 == null)
         {
            this.var_564 = WeaponsManager.createThunderSFXModel(param1.turret);
         }
         var _loc3_:name_1497 = this.var_564.name_1249(param1.turret,param2,param1.tank.skin.name_200);
         this.var_11.name_217(_loc3_.name_1496);
         this.var_11.name_195(_loc3_.name_1494);
      }
      
      private function method_502(param1:TankData, param2:Vector3) : void
      {
         if(this.var_564 == null)
         {
            this.var_564 = WeaponsManager.createThunderSFXModel(param1.turret);
         }
         var _loc3_:name_1497 = this.var_564.method_502(param1.turret,param2);
         this.var_11.name_217(_loc3_.name_1496);
         this.var_11.name_195(_loc3_.name_1494);
      }
      
      private function method_1219(param1:Tank, param2:name_1699, param3:name_1083) : Boolean
      {
         var _loc7_:Vector3 = null;
         var _loc4_:Number = 0.75 * param1.var_339.hs.y;
         Vector3(this.var_1009[0]).y = -_loc4_;
         Vector3(this.var_1009[2]).y = _loc4_;
         this.var_1015.vCopy(param2.position).vAdd(param2.normal);
         var _loc5_:Vector3 = param1.state.position;
         var _loc6_:int = 0;
         while(_loc6_ < 3)
         {
            _loc7_ = this.var_1022[_loc6_];
            param1.name_225.name_890(this.var_1009[_loc6_],_loc7_);
            _loc7_.vAdd(_loc5_);
            this.var_1000.diff(_loc7_,param2.position);
            if(!param3.name_251(this.var_1015,this.var_1000,name_73.name_252,1,null,this.var_1021))
            {
               return true;
            }
            _loc6_++;
         }
         return false;
      }
      
      private function getData(param1:ClientObject) : name_1698
      {
         return name_1698(param1.method_16(ThunderModel));
      }
      
      private function method_1216(param1:Tank, param2:Vector3, param3:Vector3, param4:Number, param5:Number, param6:Number) : void
      {
         this.var_1000.vCopy(param3).vScale(param4 * param6);
         param1.method_452(param2,this.var_1000);
         this.var_1000.diff(param1.state.position,param2).vNormalize().vScale(param5 * param6);
         param1.method_433(this.var_1000);
      }
   }
}
