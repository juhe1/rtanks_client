package alternativa.tanks.models.weapon.shaft
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.RayIntersectionData;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.model.class_11;
   import alternativa.physics.Body;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_1194;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.ITank;
   import alternativa.tanks.models.weapon.IWeaponController;
   import alternativa.tanks.models.weapon.name_1495;
   import alternativa.tanks.models.weapon.name_903;
   import alternativa.tanks.models.weapon.name_911;
   import alternativa.tanks.services.materialregistry.IMaterialRegistry;
   import alternativa.tanks.utils.MathUtils;
   import alternativa.tanks.vehicles.tanks.Tank;
   import alternativa.tanks.vehicles.tanks.TankSkin;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import package_1.Main;
   import package_161.IWeaponWeakeningModel;
   import package_167.name_1454;
   import package_299.ShaftSFXModel;
   import package_308.name_1251;
   import package_308.name_2473;
   import package_335.name_1609;
   import package_362.class_83;
   import package_37.Matrix4;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_40.TankSpawnState;
   import package_41.ItemProperty;
   import package_41.Vector3dData;
   import package_42.TanksCollisionDetector;
   import package_42.name_73;
   import package_422.ShaftShotResult;
   import package_422.ShaftTargetSystem;
   import package_47.BattleTeamType;
   import package_52.WeaponsManager;
   import package_61.RayHit;
   import package_7.name_32;
   import package_71.name_277;
   import package_76.name_735;
   import package_78.name_281;
   import package_92.name_1188;
   import package_92.name_1451;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class ShaftModel implements class_83, class_11, IWeaponController
   {
      
      private static const const_363:Number = MathUtils.method_604(15);
      
      private static const const_1823:Number = 8;
      
      private static const const_1828:Number = 1;
      
      private static const const_1825:Number = 5000;
      
      private static const const_1824:Number = 50;
      
      private static const const_1821:Number = 4950;
      
      private static const const_1827:Number = 7;
      
      private static const const_1822:Number = 9;
      
      private static const const_1826:int = 75;
      
      private static const var_597:name_2473 = new name_2473();
      
      private static var var_1006:Vector3 = new Vector3();
      
      private static const const_1818:Vector3 = new Vector3();
      
      private static const _direction:Vector3 = new Vector3();
      
      private static const _m:Matrix4 = new Matrix4();
      
      private static const const_1819:Vector3 = new Vector3();
      
      private static const const_1820:Vector3 = new Vector3();
      
      private static const const_442:int = 1000;
      
      private static const const_1481:name_903 = new name_903();
      
      private static const const_492:Class = name_2480;
      
      private static var var_1001:TextureMaterial;
       
      
      private var var_1003:Vector3;
      
      private var var_1005:Vector3;
      
      private var var_1017:Vector3;
      
      private var var_1004:Vector3;
      
      private var var_1007:Vector3;
      
      private var var_1012:Vector3;
      
      private var _hitPos3d:Vector3dData;
      
      private var var_1049:Vector3dData;
      
      private var var_1016:name_911;
      
      private var tank:Tank;
      
      private var name_106:TankData;
      
      private var var_733:name_1454;
      
      private var var_727:name_1451;
      
      private var modelService:name_32;
      
      private var var_11:BattlefieldModel;
      
      private var var_13:TankModel;
      
      private var var_730:IWeaponWeakeningModel;
      
      private var name_247:TanksCollisionDetector;
      
      private var var_728:name_1188;
      
      private var var_1023:Number = 100000;
      
      private var var_2114:Boolean = false;
      
      private var var_2097:ReticleDisplay;
      
      private var image:Bitmap;
      
      private var activate:Boolean = false;
      
      private var var_2100:Number = 0;
      
      private var indicator:Indicator;
      
      private var var_2096:name_281;
      
      private var var_2104:Boolean = false;
      
      private var lock:Boolean = false;
      
      private var var_2099:Bitmap;
      
      private var var_2102:Boolean;
      
      private var var_2109:Number = 1000;
      
      private var var_2103:Number = -250;
      
      private var var_2108:int;
      
      private var var_586:int;
      
      private var var_583:Boolean;
      
      private var var_2106:name_1261;
      
      public var name_1271:name_1268;
      
      private var var_2101:Dictionary;
      
      private var var_2098:SetControllerForTemporaryItems;
      
      private var var_2110:MultybodyCollisionPredicate;
      
      private var var_711:RayHit;
      
      private var var_2107:ShaftTargetSystem;
      
      private var var_1082:ShaftShotResult;
      
      private var var_1008:name_1188;
      
      private var var_2105:Boolean;
      
      private var var_2112:RayHit;
      
      private var var_2111:name_1252;
      
      private var var_2113:name_1252;
      
      public function ShaftModel()
      {
         this.var_1003 = new Vector3();
         this.var_1005 = new Vector3();
         this.var_1017 = new Vector3();
         this.var_1004 = new Vector3();
         this.var_1007 = new Vector3();
         this.var_1012 = new Vector3();
         this._hitPos3d = new Vector3dData(0,0,0);
         this.var_1049 = new Vector3dData(0,0,0);
         this.var_1016 = name_911.getInstance();
         this.var_2106 = name_1261.RECHARGE;
         this.name_1271 = new name_1268();
         this.var_2110 = new MultybodyCollisionPredicate();
         this.var_711 = new RayHit();
         this.var_2107 = new ShaftTargetSystem();
         this.var_1082 = new ShaftShotResult();
         this.var_2112 = new RayHit();
         this.var_2111 = new name_1252();
         this.var_2113 = new name_1252();
         super();
      }
      
      public static function globalToLocal(param1:Body, param2:Vector3) : void
      {
         param2.subtract(param1.state.position);
         param2.vTransformBy3Tr(param1.name_225);
      }
      
      public static function localToGlobal(param1:Body, param2:Vector3) : void
      {
         param2.vTransformBy3(param1.name_225);
         param2.vAdd(param1.state.position);
      }
      
      private static function name_1453(param1:Vector3, param2:Vector3, param3:Vector3) : Vector3
      {
         if(param2 != null)
         {
            return new Vector3().diff(param2,param1).vNormalize();
         }
         if(param3 == null)
         {
            param3 = const_1481.direction;
         }
         return new Vector3().diff(param3,param1).vNormalize();
      }
      
      private static function method_2204(param1:Vector3, param2:Vector.<Vector3>, param3:Vector3) : void
      {
         var _loc4_:Number = NaN;
         var_1006.vCopy(param2[0]);
         var_1006.y = 0;
         param3.vCopy(var_1006);
         var _loc5_:Number = param1.distanceToSquared(var_1006);
         var _loc6_:int = 1;
         while(_loc6_ < param2.length)
         {
            var_1006.vCopy(param2[_loc6_]);
            var_1006.y = 0;
            _loc4_ = param1.distanceToSquared(var_1006);
            if(_loc4_ < _loc5_)
            {
               _loc5_ = _loc4_;
               param3.vCopy(var_1006);
            }
            _loc6_++;
         }
      }
      
      public function name_1436() : ItemProperty
      {
         return ItemProperty.SHAFT_RESISTANCE;
      }
      
      public function initObject(param1:ClientObject, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number, param11:Number, param12:Number, param13:Number) : void
      {
         var _loc14_:name_1268 = new name_1268();
         _loc14_.name_2469 = param2;
         _loc14_.chargeRate = param3;
         _loc14_.name_2482 = param4;
         _loc14_.name_1280 = param5;
         _loc14_.name_1277 = param6;
         _loc14_.name_1272 = param7;
         _loc14_.name_1267 = param8;
         _loc14_.name_1281 = param9;
         _loc14_.name_1262 = param10;
         _loc14_.name_1265 = param11;
         _loc14_.name_1275 = param12;
         _loc14_.name_2478 = param13 * name_1495.name_1499;
         param1.method_12(name_1268,_loc14_);
         this.objectLoaded(null);
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         if(this.modelService == null)
         {
            this.modelService = name_32(Main.osgi.getService(name_32));
            this.var_11 = Main.osgi.getService(IBattleField) as BattlefieldModel;
            this.var_13 = Main.osgi.getService(ITank) as TankModel;
            this.var_728 = Main.osgi.getService(name_1188) as name_1188;
            this.var_730 = IWeaponWeakeningModel(this.modelService.getModelsByInterface(IWeaponWeakeningModel)[0]);
            this.var_1008 = Main.osgi.getService(name_1188) as name_1188;
            this.var_2101 = this.var_11.var_117.viewport.const_393;
            this.var_2098 = new SetControllerForTemporaryItems(this.var_2101);
            this.name_247 = TanksCollisionDetector(this.var_11.var_117.name_678.name_247);
         }
         if(var_1001 == null)
         {
            var_1001 = IMaterialRegistry(Main.osgi.getService(IMaterialRegistry)).textureMaterialRegistry.getMaterial(null,new const_492().bitmapData,1);
         }
      }
      
      public function name_1270(param1:name_1261) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         if(this.var_11 == null || this.var_11.var_117 == null)
         {
            return;
         }
         if(param1 != this.var_2106)
         {
            _loc2_ = this.var_11.name_165().method_923();
            _loc3_ = this.name_1259(_loc2_);
            this.method_2198(param1,_loc3_,_loc2_);
         }
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         IMaterialRegistry(Main.osgi.getService(IMaterialRegistry)).textureMaterialRegistry.disposeMaterial(var_1001);
         var_1001 = null;
      }
      
      private function method_2217() : void
      {
      }
      
      private function method_2216() : void
      {
      }
      
      public function update(param1:int, param2:int) : Number
      {
         var _loc3_:int = 0;
         var _loc4_:Vector3 = null;
         var _loc5_:name_1451 = null;
         var _loc6_:Tank = null;
         var _loc7_:BitmapData = null;
         var _loc8_:name_735 = null;
         if(this.tank == null)
         {
            this.tank = TankData.localTankData.tank;
         }
         if(this.activate && TankData.localTankData.name_87 == TankSpawnState.ACTIVE)
         {
            this.var_2100 += param2;
         }
         else
         {
            if(TankData.localTankData.name_87 == TankSpawnState.ACTIVE && this.var_2100 > 0 && this.var_2100 < 300)
            {
               this.var_2105 = true;
            }
            this.var_2100 = 0;
         }
         if(this.var_2100 >= 300)
         {
            _loc3_ = this.name_1259(param1);
            if(!this.lock && _loc3_ == 1000 && param1 >= this.var_586 && (!(this.tank.name_180().name_936().name_2089 == 0 && this.tank.name_180().name_958().name_2089 == 0) || !this.method_2202()))
            {
               this.var_2104 = true;
               Main.stage.addChild(this.var_2097);
               this.var_2096.camera = this.var_11.var_117.viewport.camera;
               this.var_2096.skin = TankData.localTankData.tank.skin;
               this.var_2096.var_560.name_2486(TankData.localTankData.tank.skin.name_200);
               _loc4_ = new Vector3();
               _loc5_ = this.var_1008.name_1457(TankData.localTankData.turret);
               TankData.localTankData.tank.method_480(_loc4_,_loc5_.muzzles);
               this.var_2096.var_560.name_2489(_loc4_);
               this.var_2096.var_560.elevation = 0;
               this.var_2096.var_560.name_1269 = 0;
               this.var_2096.enter(param1);
               _loc6_ = TankData.localTankData.tank;
               _loc6_.title.hide();
               _loc7_ = _loc6_.title.method_670();
               this.var_2099 = new Bitmap(_loc7_);
               _loc8_ = this.var_11.var_117.viewport.camera;
               this.var_2099.x = Main.stage.stageWidth - this.var_2099.width >> 1;
               this.var_2099.y = (Main.stage.stageHeight >> 1) + 75;
               Main.stage.addChild(this.var_2099);
               this.lock = true;
               this.var_583 = false;
               this.var_2102 = true;
               this.var_586 = -1;
               this.method_2207();
            }
         }
         else if(this.var_2105)
         {
            _loc3_ = this.name_1259(param1);
            if(_loc3_ == 1000)
            {
               this.method_2210();
            }
            this.var_2105 = false;
         }
         else if(this.var_583)
         {
            this.var_2100 = 0;
            if(this.var_586 > 0)
            {
               if(param1 >= this.var_586)
               {
                  if(Main.stage.contains(this.var_2097))
                  {
                     Main.stage.removeChild(this.var_2097);
                     Main.stage.removeChild(this.var_2099);
                     _loc6_ = TankData.localTankData.tank;
                     _loc6_.title.show();
                     this.var_11.method_200();
                     this.var_11.method_198();
                     this.var_2096.exit();
                     this.var_2104 = false;
                     this.lock = false;
                     this.var_2102 = false;
                     this.var_583 = false;
                  }
               }
            }
         }
         else if(Main.stage.contains(this.var_2097))
         {
            this.name_1270(name_1261.RECHARGE);
            this.method_2212(1000);
            this.var_586 = getTimer() + 500;
            this.var_583 = true;
         }
         if(this.var_2104)
         {
            this.var_2097.method_870();
            if(!this.var_583)
            {
               this.method_2206();
            }
            this.var_2096.update(param1,param2);
            if(!(!(this.tank.name_180().name_936().name_2089 == 0 && this.tank.name_180().name_958().name_2089 == 0) || !this.method_2202()))
            {
               this.method_2208(param1);
            }
         }
         return this.getStatus();
      }
      
      private function method_2208(param1:int) : void
      {
         if(Main.stage.contains(this.var_2097))
         {
            this.var_2100 = 0;
            Main.stage.removeChild(this.var_2097);
            Main.stage.removeChild(this.var_2099);
            this.method_2197().method_878();
            this.tank.title.show();
            this.var_11.method_200();
            this.var_11.method_198();
            this.var_2096.exit();
            this.var_2104 = false;
            this.lock = false;
            this.var_2102 = false;
            this.var_583 = false;
            this.method_2198(name_1261.RECHARGE,Math.min(this.name_1259(param1),0),param1);
            this.var_2096.var_566 = name_1251.name_1266;
         }
      }
      
      private function method_2214(param1:ShaftShotResult) : void
      {
         Network(Main.osgi.getService(name_2)).send("battle;quick_shot_shaft;" + param1.name_2487());
      }
      
      private function method_2207() : void
      {
         Network(Main.osgi.getService(name_2)).send("battle;start_fire");
      }
      
      private function method_2211(param1:int, param2:Vector3, param3:Array) : void
      {
         var physTime:int = param1;
         var staticShot:Vector3 = param2;
         var aims:Array = param3;
         var json:Object = new Object();
         json.phys_time = physTime;
         json.static_shot = staticShot;
         json.targets = aims;
         json.energy = this.name_1259(this.var_11.name_165().method_923());
         json.muzzle = const_1481.name_1421;
         Network(Main.osgi.getService(name_2)).send("battle;fire;" + JSON.stringify(json,function(param1:*, param2:*):*
         {
            var _loc3_:* = undefined;
            var _loc4_:* = undefined;
            if(param2 is name_2474)
            {
               _loc3_ = param2 as name_2474;
               _loc4_ = _loc3_.targetHitPoint.vClone();
               globalToLocal(_loc3_.target,_loc4_);
               return {"target":{
                  "id":_loc3_.target.tankData.userName,
                  "pos":_loc3_.targetHitPoint,
                  "point_pos":_loc4_
               }};
            }
            return param2;
         }));
      }
      
      private function method_2210() : void
      {
         var _loc1_:int = 0;
         var _loc2_:TankData = null;
         var _loc3_:Tank = null;
         var _loc4_:TankData = TankData.localTankData;
         var _loc5_:name_1451 = this.var_1008.name_1457(_loc4_.turret);
         var _loc6_:ShaftSFXModel = WeaponsManager.createShaftSFXModel(TankData.localTankData.turret);
         this.var_1016.method_797(_loc4_.tank.skin.name_200,_loc5_.muzzles[0],const_1481.name_1421,var_1006,this.var_1012,const_1481.direction);
         this.var_2107.name_1705(_loc4_,var_1006,const_1481.direction,this.var_1012,this.var_11.getBattlefieldData().tanks,this.var_1082);
         if(this.var_1082.hitPoints.length != 0)
         {
            if(this.var_1082.targets.length == 0)
            {
               this.method_2199(_loc4_.user,this.var_1082.hitPoints[0] as Vector3,const_1481.direction);
               this.var_11.addDecal(this.var_1082.hitPoints[0] as Vector3,const_1481.name_1421,50,var_1001);
            }
            else
            {
               _loc1_ = 0;
               while(_loc1_ < this.var_1082.targets.length)
               {
                  _loc2_ = this.var_1082.targets[_loc1_];
                  _loc3_ = _loc2_.tank;
                  this.method_2200(_loc4_.user,this.var_1082.hitPoints[_loc1_],const_1481.direction);
                  _loc3_.method_432(this.var_1082.hitPoints[_loc1_],const_1481.direction,this.name_1271.name_2478);
                  _loc1_++;
               }
               if(this.var_1082.hitPoints.length > this.var_1082.targets.length)
               {
                  this.method_2199(_loc4_.user,this.var_1082.hitPoints[this.var_1082.targets.length] as Vector3,const_1481.direction);
                  this.var_11.addDecal(this.var_1082.hitPoints[this.var_1082.targets.length] as Vector3,const_1481.name_1421,50,var_1001);
               }
            }
         }
         _loc6_.method_2103(_loc4_.turret,_loc4_.tank.skin.name_909.name_929,_loc4_.tank.skin.name_200);
         _loc6_.method_2101(_loc4_.turret,_loc4_.user,const_1481.name_1421);
         TankData.localTankData.tank.method_432(const_1481.name_1421,const_1481.direction,-_loc5_.kickback);
         this.method_2198(name_1261.RECHARGE,0,this.var_11.name_165().method_923());
         this.method_2214(this.var_1082);
      }
      
      public function name_1613(param1:ClientObject, param2:Array, param3:Array, param4:Vector3) : void
      {
         var _loc5_:Vector3 = null;
         var _loc6_:int = 0;
         var _loc7_:Vector3 = null;
         var _loc8_:TankData = null;
         var _loc9_:Tank = null;
         var _loc10_:TankData = this.var_13.getTankData(param1);
         if(_loc10_ == TankData.localTankData)
         {
            return;
         }
         if(param2 == null || param3 == null)
         {
            return;
         }
         if(this.var_1008 == null)
         {
            this.var_1008 = Main.osgi.getService(name_1188) as name_1188;
         }
         var _loc11_:name_1451 = this.var_1008.name_1457(_loc10_.turret);
         var _loc12_:name_1268 = _loc10_.turret.method_16(name_1268) as name_1268;
         this.var_1016.name_1702(_loc10_.tank.skin.name_200,_loc11_.muzzles[0],const_1481.name_1421,const_1481.direction);
         var _loc13_:ShaftSFXModel = WeaponsManager.createShaftSFXModel(_loc10_.turret);
         _loc13_.method_2103(_loc10_.turret,_loc10_.tank.skin.name_909.name_929,_loc10_.tank.skin.name_200);
         _loc10_.tank.method_432(const_1481.name_1421,const_1481.direction,-_loc11_.kickback);
         if(param3.length == 0)
         {
            return;
         }
         if(param2.length == 0)
         {
            _loc5_ = new Vector3(param3[0].x,param3[0].y,param3[0].z);
            this.method_2199(_loc10_.user,_loc5_,const_1481.direction);
            this.var_11.addDecal(_loc5_,const_1481.name_1421,50,var_1001);
         }
         else
         {
            _loc6_ = 0;
            while(_loc6_ < param2.length)
            {
               _loc7_ = new Vector3(param3[_loc6_].x,param3[_loc6_].y,param3[_loc6_].z);
               _loc8_ = this.var_13.getTankData(BattleController.tankClientObjectByTankId[param2[_loc6_].target_id]);
               _loc9_ = _loc8_.tank;
               this.method_2200(_loc10_.user,_loc7_,const_1481.direction);
               _loc9_.method_432(_loc7_,const_1481.direction,_loc12_.name_2478);
               _loc6_++;
            }
            if(param3.length > param2.length)
            {
               _loc5_ = new Vector3(param3[param2.length].x,param3[param2.length].y,param3[param2.length].z);
               this.method_2199(_loc10_.user,_loc5_,const_1481.direction);
               this.var_11.addDecal(_loc5_,const_1481.name_1421,50,var_1001);
            }
         }
      }
      
      public function fire(param1:ClientObject, param2:Vector3, param3:Array) : void
      {
         var _loc4_:name_1609 = null;
         var _loc5_:Vector3 = null;
         var _loc6_:TankData = null;
         var _loc7_:TankData = this.var_13.getTankData(param1);
         if(_loc7_ == TankData.localTankData)
         {
            return;
         }
         if(this.var_1008 == null)
         {
            this.var_1008 = Main.osgi.getService(name_1188) as name_1188;
         }
         var _loc8_:name_1451 = this.var_1008.name_1457(_loc7_.turret);
         this.var_1016.name_1702(_loc7_.tank.skin.name_200,_loc8_.muzzles[0],const_1481.name_1421,const_1481.direction);
         var _loc9_:ShaftSFXModel = WeaponsManager.createShaftSFXModel(_loc7_.turret);
         _loc9_.method_2103(_loc7_.turret,_loc7_.tank.skin.name_909.name_929,_loc7_.tank.skin.name_200);
         var _loc10_:int = 0;
         while(_loc10_ < param3.length)
         {
            _loc4_ = param3[_loc10_];
            _loc6_ = this.var_13.getTankData(BattleController.tankClientObjectByTankId[_loc4_.targetId]);
            if(_loc6_ != null)
            {
               _loc5_ = _loc6_.tank.state.position;
            }
            localToGlobal(_loc6_.tank,_loc4_.name_2476);
            this.method_2200(_loc7_.user,_loc4_.name_2476,const_1481.direction);
            _loc6_.tank.method_432(_loc4_.name_2476,const_1481.direction,_loc8_.impactForce);
            _loc10_++;
         }
         if(param2 != null)
         {
            this.method_2199(_loc7_.user,param2,const_1481.direction);
            this.var_11.addDecal(param2,const_1481.name_1421,50,var_1001);
         }
         _loc9_.method_2101(_loc7_.turret,_loc7_.user,const_1481.name_1421);
      }
      
      public function method_2212(param1:Number) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Tank = null;
         var _loc4_:name_1451 = this.var_728.name_1457(TankData.localTankData.turret);
         var _loc5_:ShaftSFXModel = WeaponsManager.createShaftSFXModel(TankData.localTankData.turret);
         var _loc6_:int = this.var_11.name_165().method_923();
         _loc5_.method_2100(TankData.localTankData.user);
         this.method_2197().method_878();
         this.name_106.tank.method_491(const_1481,_loc4_.muzzles);
         var _loc7_:name_2472 = this.method_2205();
         this.var_2096.var_560.name_2477(_direction);
         var _loc8_:Number = param1 - this.name_1259(_loc6_);
         var _loc9_:int = 0;
         while(_loc9_ < _loc7_.aims.length)
         {
            _loc2_ = _loc7_.aims[_loc9_];
            this.method_2200(TankData.localTankData.user,_loc2_.targetHitPoint,_direction);
            _loc3_ = _loc2_.target;
            _loc3_.method_432(_loc2_.targetHitPoint,_direction,_loc4_.impactForce);
            _loc9_++;
         }
         if(_loc7_.name_2475 != null)
         {
            this.method_2199(TankData.localTankData.user,_loc7_.name_2475,_direction);
            this.var_11.addDecal(_loc7_.name_2475,const_1481.name_1421,50,var_1001);
         }
         _loc5_.method_2101(TankData.localTankData.turret,TankData.localTankData.user,const_1481.name_1421);
         TankData.localTankData.tank.method_432(const_1481.name_1421,const_1481.direction,-_loc4_.kickback);
         this.method_2211(_loc6_,_loc7_.name_2475,_loc7_.aims);
         this.method_2198(name_1261.RECHARGE,Math.min(this.name_1259(_loc6_),0),_loc6_);
         this.var_2096.var_566 = name_1251.name_1266;
      }
      
      private function method_2200(param1:ClientObject, param2:Vector3, param3:Vector3) : void
      {
         var _loc4_:TankData = this.var_13.getTankData(param1);
         if(this.var_1008 == null)
         {
            this.var_1008 = Main.osgi.getService(name_1188) as name_1188;
         }
         var _loc5_:name_1451 = this.var_1008.name_1457(_loc4_.turret);
         this.var_1016.name_1702(_loc4_.tank.skin.name_200,_loc5_.muzzles[0],const_1481.name_1421,const_1481.direction);
         var _loc6_:ShaftSFXModel = WeaponsManager.createShaftSFXModel(_loc4_.turret);
         _loc6_.method_2102(_loc4_.turret,_loc4_.user,null,param2,const_1481.name_1421,const_1481.direction,param3);
      }
      
      private function method_2199(param1:ClientObject, param2:Vector3, param3:Vector3) : void
      {
         var _loc4_:TankData = this.var_13.getTankData(param1);
         if(this.var_1008 == null)
         {
            this.var_1008 = Main.osgi.getService(name_1188) as name_1188;
         }
         var _loc5_:name_1451 = this.var_1008.name_1457(_loc4_.turret);
         this.var_1016.name_1702(_loc4_.tank.skin.name_200,_loc5_.muzzles[0],const_1481.name_1421,const_1481.direction);
         var _loc6_:ShaftSFXModel = WeaponsManager.createShaftSFXModel(_loc4_.turret);
         _loc6_.method_2102(_loc4_.turret,_loc4_.user,param2,null,const_1481.name_1421,const_1481.direction,param3);
      }
      
      public function method_2202() : Boolean
      {
         var _loc1_:Object3D = null;
         var _loc2_:name_1451 = this.var_728.name_1457(TankData.localTankData.turret);
         this.name_106.tank.method_491(const_1481,_loc2_.muzzles);
         var _loc3_:Vector3 = TankData.localTankData.tank.state.position;
         _direction.diff(const_1481.name_1422,_loc3_);
         this.var_2098.name_2470(this.name_106.tank.skin.name_200);
         this.var_2098.name_2470(this.name_106.tank.skin.name_123);
         var _loc4_:RayIntersectionData = this.var_11.raycast(_loc3_,_direction,this.var_2101);
         if(_loc4_ != null && _loc4_.time <= 1)
         {
            _loc1_ = _loc4_.object;
            this.var_2098.name_2471();
            return _loc1_.name == name_1194.name_252;
         }
         this.var_2098.name_2471();
         return false;
      }
      
      public function method_2197() : name_277
      {
         return name_277(this.name_106.object.name_176(name_277));
      }
      
      private function method_2206() : void
      {
         var _loc1_:name_735 = null;
         var _loc2_:Number = NaN;
         if(this.method_2215(var_597))
         {
            _loc1_ = this.var_11.var_117.viewport.camera;
            _loc2_ = Vector3.distanceBetween(_loc1_.pos,var_597.name_2485());
            this.method_873(this.method_2213(_loc2_));
         }
         else
         {
            this.method_873(1);
         }
         if(var_597.name_2490())
         {
            this.method_2197().method_875(var_597.getTank(),var_597.name_2484());
         }
         else
         {
            this.method_2197().method_877(_direction);
         }
         var_597.reset();
      }
      
      private function method_2213(param1:Number) : Number
      {
         if(param1 < 50)
         {
            return 8;
         }
         if(param1 > 5000)
         {
            return 1;
         }
         var _loc2_:Number = param1 - 50;
         return (1 - _loc2_ / 4950) * 7 + 1;
      }
      
      public function method_873(param1:Number) : void
      {
         this.var_2097.method_873(param1);
      }
      
      private function method_2215(param1:name_2473) : Boolean
      {
         var _loc2_:RayIntersectionData = null;
         var _loc3_:Object3D = null;
         var _loc4_:Tank = null;
         this.var_2096.var_560.name_2479(const_1818);
         this.var_2096.var_560.name_2477(_direction);
         this.method_2201(this.name_106.tank.skin);
         param1.reset();
         while(true)
         {
            _loc2_ = this.var_11.raycast(const_1818,_direction,this.var_2101);
            if(_loc2_ == null)
            {
               break;
            }
            _loc3_ = _loc2_.object;
            if(_loc3_.name == name_1194.name_252)
            {
               const_1818.addScaled(_loc2_.time,_direction);
               param1.name_2481(const_1818);
               this.var_2098.name_2471();
               return true;
            }
            if(_loc3_.name == name_1194.name_1201)
            {
               const_1818.addScaled(_loc2_.time,_direction);
               _loc4_ = this.var_11.var_140[_loc3_];
               if(this.method_2203(_loc4_,_loc3_,const_1818))
               {
                  param1.name_2481(const_1818,_loc4_);
                  this.var_2098.name_2471();
                  return true;
               }
            }
            this.var_2098.name_2470(_loc2_.object);
         }
         this.var_2098.name_2471();
         return false;
      }
      
      private function method_2205() : name_2472
      {
         var _loc1_:RayIntersectionData = null;
         var _loc2_:Object3D = null;
         var _loc3_:Vector3 = null;
         var _loc4_:Tank = null;
         var _loc5_:name_2472 = new name_2472();
         this.var_2096.var_560.name_2479(const_1818);
         this.var_2096.var_560.name_2477(_direction);
         this.method_2201(this.name_106.tank.skin);
         while(true)
         {
            _loc1_ = this.var_11.raycast(const_1818,_direction,this.var_2101);
            if(_loc1_ == null)
            {
               break;
            }
            _loc2_ = _loc1_.object;
            _loc3_ = const_1818.vClone().vAddScaled(_loc1_.time + 0.1,_direction);
            if(_loc2_.name == name_1194.name_252)
            {
               _loc5_.name_2488(_loc3_);
               break;
            }
            if(_loc2_.name == name_1194.name_1201)
            {
               _loc4_ = this.var_11.var_140[_loc2_];
               if(this.method_2203(_loc4_,_loc2_,_loc3_))
               {
                  _loc5_.name_758(_loc4_,_loc3_);
               }
               this.method_2201(_loc4_.skin);
            }
            else
            {
               this.var_2098.name_2470(_loc2_);
            }
            const_1818.vCopy(_loc3_);
         }
         this.var_2098.name_2471();
         return _loc5_;
      }
      
      private function method_2203(param1:Tank, param2:Object3D, param3:Vector3) : Boolean
      {
         var _loc4_:name_1451 = null;
         var _loc5_:TankSkin = param1.skin;
         if(_loc5_.name_200 == param2)
         {
            _m.name_943(param2.x,param2.y,param2.z,param2.rotationX,param2.rotationY,param2.rotationZ);
            _m.name_1334(param3,const_1819);
            _loc4_ = this.var_728.name_1457(param1.tankData.turret);
            method_2204(const_1819,_loc4_.muzzles,const_1820);
            _m.name_890(const_1820,const_1819);
            const_1819.subtract(param3);
            if(this.var_11.var_117.name_247.method_695(param3,const_1819,name_73.name_252,1))
            {
               return false;
            }
         }
         return _loc5_.name_123.alpha == 1;
      }
      
      private function method_2201(param1:TankSkin) : void
      {
         this.var_2098.name_2470(param1.name_123);
         this.var_2098.name_2470(param1.name_200);
      }
      
      public function name_1274() : void
      {
         this.var_13.lockControls(true);
         this.var_13.method_47(TankData.localTankData,0,true);
         this.var_13.setControlState(TankData.localTankData,0,true);
         var _loc1_:ShaftSFXModel = WeaponsManager.createShaftSFXModel(TankData.localTankData.turret);
         _loc1_.method_2104(TankData.localTankData.turret,TankData.localTankData.user,TankData.localTankData.tank.skin.name_200);
      }
      
      public function getStatus() : Number
      {
         return this.name_1259(getTimer()) / this.name_1271.name_2469;
      }
      
      public function method_2198(param1:name_1261, param2:Number, param3:int) : void
      {
         this.var_2106 = param1;
         switch(param1)
         {
            case name_1261.RECHARGE:
               this.var_2109 = 0;
               this.var_2103 = this.name_1271.chargeRate;
               this.var_2108 = param3 - param2 / this.var_2103 * 1000;
               break;
            case name_1261.DRAIN:
               this.var_2109 = this.name_1271.name_2469;
               this.var_2103 = -this.name_1271.name_2482;
               this.var_2108 = param3 + (this.name_1271.name_2469 - param2) / this.var_2103 * 1000;
               this.method_2209(param3);
         }
      }
      
      private function method_2209(param1:int) : void
      {
         Network(Main.osgi.getService(name_2)).send("battle;begin_enegry_drain;" + param1);
      }
      
      public function name_1259(param1:Number) : Number
      {
         var _loc2_:Number = this.var_2109 + (param1 - this.var_2108) * this.var_2103 / 1000;
         return MathUtils.method_218(_loc2_,0,this.name_1271.name_2469);
      }
      
      public function method_1550(param1:int, param2:int) : void
      {
         this.var_2099.x = param1 + 9;
         this.var_2099.y = param2;
      }
      
      private function method_2218() : void
      {
      }
      
      public function method_999(param1:TankData) : void
      {
         var _loc2_:Tank = null;
         if(TankData.localTankData == param1)
         {
            if(Main.stage.contains(this.var_2097))
            {
               Main.stage.removeChild(this.var_2097);
               Main.stage.removeChild(this.var_2099);
               _loc2_ = TankData.localTankData.tank;
               _loc2_.title.show();
               this.var_11.method_200();
               this.var_11.method_198();
               this.var_2096.exit();
               this.name_1270(name_1261.RECHARGE);
               this.var_2096.var_562.stop();
            }
            this.var_2104 = false;
            this.lock = false;
            this.var_2102 = false;
            this.var_583 = false;
            this.var_11.onResize(null);
         }
      }
      
      public function reset() : void
      {
         this.method_2198(name_1261.RECHARGE,this.name_1271.name_2469,this.var_11.name_165().method_923());
         if(TankData.localTankData == null)
         {
            return;
         }
         var _loc1_:ShaftSFXModel = WeaponsManager.createShaftSFXModel(TankData.localTankData.turret);
         _loc1_.method_2100(TankData.localTankData.user);
         this.var_2102 = false;
         var _loc2_:BattleTeamType = TankData.localTankData.teamType;
         if(this.var_2097 != null)
         {
            this.var_2097.method_872(this.method_968(_loc2_));
         }
      }
      
      private function method_968(param1:BattleTeamType) : uint
      {
         switch(param1)
         {
            case BattleTeamType.BLUE:
               return this.method_2197().method_874();
            case BattleTeamType.RED:
               return this.method_2197().method_876();
            default:
               return this.method_2197().method_876();
         }
      }
      
      public function name_125(param1:TankData) : void
      {
         this.objectLoaded(null);
         this.name_106 = param1;
         this.var_733 = WeaponsManager.var_495[param1.turret.id];
         this.var_727 = this.var_728.name_1457(param1.turret);
         this.var_2107.name_1804(this.var_11.getBattlefieldData().name_678.name_247,this.var_733.name_1614.value,this.var_733.name_1628.value,this.var_733.name_1618.value,this.var_733.name_1622.value,1,null);
         this.name_1271 = param1.turret.method_16(name_1268) as name_1268;
         this.var_2097 = new ReticleDisplay(Indicator.name_2483(param1.turret),0);
         this.var_2096 = new name_281(this);
         this.method_2198(name_1261.RECHARGE,this.name_1271.name_2469,this.var_11.name_165().method_923());
      }
      
      public function method_1000() : void
      {
         this.tank = null;
         this.name_106 = null;
      }
      
      public function method_1002(param1:int) : void
      {
         this.activate = true;
      }
      
      public function method_1001(param1:int, param2:Boolean) : void
      {
         this.activate = false;
      }
      
      public function get method_2219() : name_281
      {
         return this.var_2096;
      }
   }
}

import alternativa.physics.collision.name_1160;
import alternativa.physics.Body;
import flash.utils.Dictionary;

class MultybodyCollisionPredicate implements name_1160
{
    
   
   public var bodies:Dictionary;
   
   public function MultybodyCollisionPredicate()
   {
      this.bodies = new Dictionary();
      super();
   }
   
   public function considerBody(param1:Body) : Boolean
   {
      return this.bodies[param1] == null;
   }
}
