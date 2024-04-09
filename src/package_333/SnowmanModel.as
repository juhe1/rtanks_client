package package_333
{
   import alternativa.model.class_11;
   import alternativa.physics.Body;
   import alternativa.tanks.models.battlefield.name_128;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.ITank;
   import alternativa.tanks.models.weapon.IWeaponController;
   import alternativa.tanks.models.weapon.name_911;
   import alternativa.tanks.models.weapon.shared.CommonTargetSystem;
   import alternativa.tanks.models.weapon.shared.name_653;
   import flash.utils.Dictionary;
   import package_1.Main;
   import package_161.IWeaponWeakeningModel;
   import package_167.name_1454;
   import package_278.name_1288;
   import package_301.SnowmanSFXModel;
   import package_301.name_2411;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_41.ItemProperty;
   import package_41.Vector3dData;
   import package_42.TanksCollisionDetector;
   import package_42.name_73;
   import package_52.WeaponsManager;
   import package_61.RayHit;
   import package_7.name_32;
   import package_92.WeaponCommonModel;
   import package_92.name_1188;
   import package_92.name_1451;
   import package_92.name_1699;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class SnowmanModel implements class_11, class_186, IWeaponController
   {
       
      
      private var var_1011:Boolean;
      
      private var shotId:int;
      
      private var var_1071:Dictionary;
      
      private var name_106:TankData;
      
      private var var_733:name_1454;
      
      private var var_727:name_1451;
      
      private var modelService:name_32;
      
      private var var_11:IBattleField;
      
      private var var_13:TankModel;
      
      private var var_728:WeaponCommonModel;
      
      private var var_730:IWeaponWeakeningModel;
      
      private var targetSystem:CommonTargetSystem;
      
      private var hitInfo:name_1699;
      
      private var var_1016:name_911;
      
      private var nextReadyTime:name_1288;
      
      private var currentTime:name_1288;
      
      private var var_1070:Vector3;
      
      private var var_1006:Vector3;
      
      private var var_1004:Vector3;
      
      private var var_1012:Vector3;
      
      private var var_1017:Vector3;
      
      private var var_1005:Vector3;
      
      private var var_1007:Vector3;
      
      private var var_1003:Vector3;
      
      private var _hitPos3d:Vector3dData;
      
      private var var_1049:Vector3dData;
      
      private var _dirToTarget3d:Vector3dData;
      
      private var var_711:RayHit;
      
      private var var_689:name_653;
      
      private var var_1023:Number = 100000;
      
      public function SnowmanModel()
      {
         this.var_1071 = new Dictionary();
         this.hitInfo = new name_1699();
         this.var_1016 = name_911.getInstance();
         this.nextReadyTime = new name_1288("twins nextReadyTime");
         this.currentTime = new name_1288("twins currentTime");
         this.var_1070 = new Vector3();
         this.var_1006 = new Vector3();
         this.var_1004 = new Vector3();
         this.var_1012 = new Vector3();
         this.var_1017 = new Vector3();
         this.var_1005 = new Vector3();
         this.var_1007 = new Vector3();
         this.var_1003 = new Vector3();
         this._hitPos3d = new Vector3dData(0,0,0);
         this.var_1049 = new Vector3dData(0,0,0);
         this._dirToTarget3d = new Vector3dData(0,0,0);
         this.var_711 = new RayHit();
         super();
      }
      
      public function name_1436() : ItemProperty
      {
         return ItemProperty.MECH_RESISTANCE;
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         this.method_1223();
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:Dictionary = null;
         var _loc3_:SnowmanShot = null;
         for each(_loc2_ in this.var_1071)
         {
            for each(_loc3_ in _loc2_)
            {
               _loc3_.kill();
            }
         }
         this.var_1071 = new Dictionary();
      }
      
      public function initObject(param1:ClientObject, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc5_:name_2653 = new name_2653();
         _loc5_.shotSpeed = param4 * 100;
         _loc5_.name_1767 = param3 * 100;
         _loc5_.shotRadius = param2 * 100;
         param1.method_12(SnowmanModel,_loc5_);
      }
      
      public function fire(param1:ClientObject, param2:String, param3:int, param4:Vector3dData) : void
      {
         var _loc5_:ClientObject = null;
         var _loc6_:TankData = null;
         var _loc7_:name_1451 = null;
         this.objectLoaded(null);
         try
         {
            _loc5_ = BattleController.tankClientObjectByTankId[param2];
            if(_loc5_ == null)
            {
               return;
            }
            if(this.var_13.localUserData != null)
            {
               if(param2 == this.var_13.localUserData.user.id)
               {
                  return;
               }
            }
            _loc6_ = this.var_13.getTankData(_loc5_);
            if(_loc6_.tank == null)
            {
               return;
            }
            _loc7_ = this.var_728.name_1457(_loc6_.turret);
            this.var_1016.name_1702(_loc6_.tank.skin.name_200,_loc7_.muzzles[0],this.var_1007,this.var_1004);
            this.var_728.name_1249(_loc6_.turret,_loc6_.tank,0,this.var_1007,this.var_1004);
            if(param3 > -1)
            {
               this.var_1070.x = param4.x;
               this.var_1070.y = param4.y;
               this.var_1070.z = param4.z;
               this.method_1274(false,param3,_loc6_,this.var_1007,this.var_1070);
            }
         }
         catch(e:Error)
         {
         }
      }
      
      public function name_1603(param1:ClientObject, param2:String, param3:int, param4:Vector3dData, param5:String, param6:Number) : void
      {
         var _loc10_:SnowmanShot = null;
         var _loc11_:ClientObject = null;
         var _loc12_:TankData = null;
         var _loc13_:name_1451 = null;
         var _loc7_:ClientObject = BattleController.tankClientObjectByTankId[param2];
         if(_loc7_ == null)
         {
            return;
         }
         var _loc8_:TankData = this.var_13.getTankData(_loc7_);
         if(_loc8_.tank == null)
         {
            return;
         }
         var _loc9_:Dictionary = this.var_1071[param2];
         if(_loc9_ != null)
         {
            _loc10_ = _loc9_[param3];
            if(_loc10_ != null)
            {
               this.method_1273(_loc10_);
               _loc10_.kill();
            }
         }
         this.var_1003.x = param4.x;
         this.var_1003.y = param4.y;
         this.var_1003.z = param4.z;
         if(param5 != null)
         {
            _loc11_ = BattleController.tankClientObjectByTankId[param5];
            if(_loc11_ == null)
            {
               return;
            }
            _loc12_ = this.var_13.getTankData(_loc11_);
            if(_loc12_.tank == null)
            {
               return;
            }
            this.var_728.method_502(_loc8_.turret,this.var_11.getBattlefieldData().viewport.camera,true,this.var_1003,this.var_1004,_loc12_,param6);
            _loc13_ = this.var_728.name_1457(_loc8_.turret);
            this.var_11.method_144(_loc12_,this.var_1004,param6 * _loc13_.name_1498);
         }
         else
         {
            this.var_728.method_502(_loc8_.turret,this.var_11.getBattlefieldData().viewport.camera,false,this.var_1003,null,null,param6);
         }
      }
      
      public function name_125(param1:TankData) : void
      {
         this.objectLoaded(null);
         this.name_106 = param1;
         this.var_733 = WeaponsManager.var_495[param1.turret.id];
         this.var_727 = this.var_728.name_1457(param1.turret);
         this.var_689 = name_653.create(this.name_106,this.var_733,this.var_11,this.var_730,this.modelService);
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
      
      public function update(param1:int, param2:int) : Number
      {
         this.currentTime.value = param1;
         if(!this.var_1011 || this.currentTime.value < this.nextReadyTime.value)
         {
            if(this.currentTime.value < this.nextReadyTime.value)
            {
               return 1 + (this.currentTime.value - this.nextReadyTime.value) / this.var_733.reloadMsec.value;
            }
            return 1;
         }
         this.nextReadyTime.value = this.currentTime.value + this.var_733.reloadMsec.value;
         var _loc3_:name_128 = this.var_11.getBattlefieldData();
         var _loc4_:TanksCollisionDetector = TanksCollisionDetector(_loc3_.name_678.name_247);
         var _loc5_:Vector3 = this.var_727.muzzles[0];
         this.var_1016.method_797(this.name_106.tank.skin.name_200,_loc5_,this.var_1007,this.var_1006,this.var_1012,this.var_1004);
         var _loc6_:Boolean = !_loc4_.raycast(this.var_1006,this.var_1004,name_73.name_252,_loc5_.y,null,this.var_711);
         this.var_728.name_1249(this.name_106.turret,this.name_106.tank,this.var_727.currBarrel,this.var_1007,this.var_1004);
         var _loc7_:int = -1;
         if(_loc6_)
         {
            if(this.targetSystem.name_670(this.var_1007,this.var_1004,this.var_1012,this.name_106.tank,this.hitInfo))
            {
               this.var_1070.vCopy(this.hitInfo.direction);
            }
            else
            {
               this.var_1070.vCopy(this.var_1004);
            }
            this._dirToTarget3d.x = this.var_1070.x;
            this._dirToTarget3d.y = this.var_1070.y;
            this._dirToTarget3d.z = this.var_1070.z;
            _loc7_ = this.shotId;
            this.method_1274(true,this.shotId,this.name_106,this.var_1007,this.var_1070);
            ++this.shotId;
         }
         this.method_1217(this.name_106.turret,this.var_727.currBarrel,_loc7_,this._dirToTarget3d);
         this.var_727.currBarrel = 0;
         return 0;
      }
      
      private function method_1217(param1:ClientObject, param2:int, param3:int, param4:Vector3dData) : void
      {
         var _loc5_:Object = new Object();
         _loc5_.realShotId = param3;
         _loc5_.dirToTarget = param4;
         _loc5_.reloadTime = this.var_733.reloadMsec.value;
         Network(Main.osgi.getService(name_2)).send("battle;start_fire;" + JSON.stringify(_loc5_));
      }
      
      public function method_1002(param1:int) : void
      {
         this.var_1011 = true;
      }
      
      public function method_1001(param1:int, param2:Boolean) : void
      {
         this.var_1011 = false;
      }
      
      public function reset() : void
      {
         this.var_1011 = false;
         this.nextReadyTime.value = 0;
      }
      
      public function method_999(param1:TankData) : void
      {
      }
      
      public function method_2394(param1:SnowmanShot) : void
      {
         this.method_1273(param1);
      }
      
      public function method_2393(param1:SnowmanShot, param2:Vector3, param3:Vector3, param4:Body) : void
      {
         var _loc8_:* = undefined;
         var _loc9_:TankData = null;
         var _loc10_:Vector3 = null;
         this.method_1273(param1);
         var _loc5_:TankData = null;
         if(param4 != null)
         {
            for(_loc8_ in this.var_11.getBattlefieldData().name_263)
            {
               _loc9_ = _loc8_;
               if(param4 == _loc9_.tank)
               {
                  this.var_1017.diff(param2,param4.state.position);
                  param4.name_225.name_1334(this.var_1017,this.var_1005);
                  this._hitPos3d.x = this.var_1005.x;
                  this._hitPos3d.y = this.var_1005.y;
                  this._hitPos3d.z = this.var_1005.z;
                  _loc5_ = _loc9_;
                  break;
               }
            }
         }
         else
         {
            this._hitPos3d.x = param2.x;
            this._hitPos3d.y = param2.y;
            this._hitPos3d.z = param2.z;
         }
         var _loc6_:Number = 0.01 * param1.name_1769;
         var _loc7_:Number = Number(this.var_730.name_1458(param1.name_1764.turret,_loc6_));
         this.var_728.method_502(param1.name_1764.turret,this.var_11.getBattlefieldData().viewport.camera,false,param2,param3,_loc5_,_loc7_);
         if(_loc5_ != null)
         {
            _loc10_ = _loc5_.tank.state.position;
            this.var_1049.x = _loc10_.x;
            this.var_1049.y = _loc10_.y;
            this.var_1049.z = _loc10_.z;
            this.method_1225(param1.name_1764.turret,param1.shotId,this._hitPos3d,_loc5_.user.id,_loc5_.name_149,this.var_1049,_loc6_);
         }
         else
         {
            this.method_1225(param1.name_1764.turret,param1.shotId,this._hitPos3d,null,-1,null,_loc6_);
         }
      }
      
      private function method_1225(param1:ClientObject, param2:int, param3:Vector3dData, param4:String, param5:int, param6:Vector3dData, param7:int) : void
      {
         var _loc8_:Object = new Object();
         _loc8_.shotId = param2;
         _loc8_.hitPos = param3;
         _loc8_.victimId = param4;
         _loc8_.incr = param5;
         _loc8_.tankPos = param6;
         _loc8_.distance = param7;
         _loc8_.reloadTime = this.var_733.reloadMsec.value;
         Network(Main.osgi.getService(name_2)).send("battle;fire;" + JSON.stringify(_loc8_));
      }
      
      private function method_1275(param1:ClientObject) : name_2653
      {
         return param1.method_16(SnowmanModel) as name_2653;
      }
      
      private function method_1273(param1:SnowmanShot) : void
      {
         var _loc2_:Dictionary = this.var_1071[param1.name_1764.user.id];
         if(_loc2_ != null)
         {
            delete _loc2_[param1.shotId];
         }
      }
      
      private function method_1274(param1:Boolean, param2:int, param3:TankData, param4:Vector3, param5:Vector3) : void
      {
         var _loc6_:name_2653 = this.method_1275(param3.turret);
         var _loc7_:Dictionary = this.var_1071[param3.user.id];
         if(_loc7_ == null)
         {
            this.var_1071[param3.user.id] = _loc7_ = new Dictionary();
         }
         var _loc8_:name_128 = this.var_11.getBattlefieldData();
         var _loc9_:SnowmanSFXModel = WeaponsManager.method_715(WeaponsManager.name_185(param3.turret.id));
         var _loc10_:name_2411 = _loc9_.method_2105(param3.turret);
         var _loc11_:SnowmanShot = SnowmanShot.name_1766();
         _loc11_.init(param2,param1,_loc6_,param4,param5,param3,this,_loc10_,_loc8_.name_678.name_247,this.var_730);
         _loc7_[param2] = _loc11_;
         this.var_11.name_217(_loc11_);
      }
      
      private function method_1223() : void
      {
         if(this.modelService == null)
         {
            this.modelService = name_32(Main.osgi.getService(name_32));
            this.var_11 = IBattleField(Main.osgi.getService(IBattleField));
            this.var_13 = Main.osgi.getService(ITank) as TankModel;
            this.var_728 = Main.osgi.getService(name_1188) as WeaponCommonModel;
            this.var_730 = IWeaponWeakeningModel(this.modelService.getModelsByInterface(IWeaponWeakeningModel)[0]);
         }
      }
   }
}
