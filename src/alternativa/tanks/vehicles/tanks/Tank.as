package alternativa.tanks.vehicles.tanks
{
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.osgi.OSGi;
   import alternativa.physics.Body;
   import alternativa.physics.name_886;
   import alternativa.physics.name_888;
   import alternativa.physics.name_889;
   import alternativa.physics.name_919;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.class_19;
   import alternativa.tanks.battle.class_21;
   import alternativa.tanks.battle.class_22;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.turret.name_914;
   import alternativa.tanks.models.weapon.name_903;
   import alternativa.tanks.models.weapon.name_911;
   import alternativa.tanks.vehicles.tanks.chassis.SpeedCharacteristics;
   import flash.display.Graphics;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import package_244.Dust;
   import package_276.TrackedChassis;
   import package_276.name_906;
   import package_277.name_904;
   import package_37.Matrix3;
   import package_37.Matrix4;
   import package_37.Vector3;
   import package_37.name_86;
   import package_41.Vector3dData;
   import package_42.name_73;
   import package_47.BattleTeamType;
   import package_48.UserTitle;
   import package_55.name_101;
   import package_57.name_167;
   import package_57.name_913;
   import package_61.name_767;
   import package_68.name_175;
   import package_76.FollowCameraController;
   import platform.client.fp10.core.type.name_70;
   
   public class Tank extends Body implements class_19, class_21, class_22, class_20
   {
      
      private static const const_61:name_888 = new name_888(0,1);
      
      private static const const_60:name_888 = new name_888(0,0.2);
      
      private static const PI:Number = 3.141592653589793;
      
      private static const PI2:Number = 6.283185307179586;
      
      private static var _m:Matrix3 = new Matrix3();
      
      private static const const_59:Matrix3 = new Matrix3();
      
      private static const const_62:Matrix3 = new Matrix3();
      
      private static const _m41:Matrix4 = new Matrix4();
      
      private static const _m42:Matrix4 = new Matrix4();
      
      private static var var_327:Vector3 = new Vector3();
      
      private static var var_322:name_86 = new name_86();
      
      private static var var_320:Vector3 = new Vector3();
      
      private static var var_325:Vector3 = new Vector3();
      
      private static var var_347:Vector.<Number> = Vector.<Number>([0,0,0]);
      
      private static var var_344:Vector.<Number> = Vector.<Number>([0,0,0]);
      
      private static var var_350:Vector3 = new Vector3();
      
      private static var var_349:Vector3 = new Vector3();
      
      private static var var_345:Vector3 = new Vector3();
      
      private static var var_351:Vector3 = new Vector3();
       
      
      private var var_321:TankBody;
      
      public var tankData:TankData;
      
      private var var_323:WeaponMount;
      
      public var var_338:Number = 0;
      
      public var var_339:name_904;
      
      public var name_264:Vector.<Vector3>;
      
      private var var_355:Vector3;
      
      private var var_324:TankSkin;
      
      private var var_333:UserTitle;
      
      private var var_356:Dictionary;
      
      private var var_170:name_175;
      
      private var var_330:Boolean;
      
      private var var_346:name_175;
      
      private var local:Boolean;
      
      private var var_354:Boolean;
      
      private var var_348:Number;
      
      public var var_329:name_913;
      
      private var var_352:name_913;
      
      private var var_343:name_167;
      
      public var var_332:Vector3;
      
      public var var_334:name_86;
      
      public var var_331:Matrix4;
      
      public var var_328:Vector3;
      
      public var var_326:Vector3;
      
      public var var_336:Vector3;
      
      public var var_335:Number;
      
      private const const_63:Number = 0;
      
      private var var_353:name_914;
      
      private var chassis:TrackedChassis;
      
      private var name_266:SpeedCharacteristics;
      
      private var var_341:Number = 0;
      
      public var var_337:Vector.<name_904>;
      
      private var var_340:name_918;
      
      private var var_342:name_886;
      
      public function Tank(param1:TankSkin, param2:TankData, param3:Number, param4:SpeedCharacteristics, param5:Boolean, param6:name_175)
      {
         this.var_342 = new name_886();
         this.var_337 = new Vector.<name_904>();
         this.var_355 = new Vector3();
         this.var_356 = new Dictionary();
         this.var_328 = new Vector3();
         super(param3,Matrix3.name_934,0);
         super.invMass = 1 / param3;
         super.tank = this;
         this.var_321 = new TankBody(this);
         this.var_324 = param1;
         this.var_346 = param6;
         this.local = param5;
         this.tankData = param2;
         this.var_333 = new UserTitle(this.local,param2.object);
         this.var_343 = new name_167(this);
         this.method_474(param3);
         this.method_479();
         this.var_334 = new name_86();
         this.var_332 = new Vector3();
         this.var_331 = new Matrix4();
         this.var_323 = new Turret(0,0);
         var _loc7_:Vector3 = method_466(this.skin.name_912.var_308);
         this.name_266 = param4;
         this.chassis = new TrackedChassis(this.var_321,this,_loc7_,this.name_266,this.name_266.damping);
         this.chassis.name_938();
         this.method_471(this.skin);
         this.var_321.name_960();
         this.var_340 = new name_918(this.var_321.name_787,null);
      }
      
      private static function method_466(param1:name_767) : Vector3
      {
         return new Vector3(param1.name_952(),param1.name_951(),param1.name_950());
      }
      
      override public function method_432(param1:Vector3, param2:Vector3, param3:Number) : void
      {
         if(isNaN(param1.x) || isNaN(param1.y) || isNaN(param1.z))
         {
            return;
         }
         if(isNaN(param2.x) || isNaN(param2.y) || isNaN(param2.z))
         {
            return;
         }
         super.method_432(param1,param2,param3);
      }
      
      public function method_496(param1:Vector3, param2:Vector3, param3:Number) : void
      {
         if(isNaN(param1.x) || isNaN(param1.y) || isNaN(param1.z))
         {
            return;
         }
         if(isNaN(param2.x) || isNaN(param2.y) || isNaN(param2.z))
         {
            return;
         }
         if(this.tankData.health > 0)
         {
            this.var_321.name_787.method_432(param1,param2,param3);
            this.var_321.name_961.addScaled(param3,param2);
         }
      }
      
      public function method_495() : WeaponMount
      {
         return this.var_323;
      }
      
      private function method_471(param1:TankSkin) : void
      {
         var _loc2_:name_907 = null;
         var _loc3_:name_904 = null;
         var _loc4_:Vector.<name_907> = param1.name_926();
         for each(_loc2_ in _loc4_)
         {
            _loc3_ = this.method_477(_loc2_.name_933());
            this.var_337.push(_loc3_);
            this.var_321.name_787.method_443(_loc3_,new Matrix4());
         }
         this.method_469(0);
      }
      
      private function method_477(param1:Vector3) : name_904
      {
         return new name_904(param1,0,name_888.name_947);
      }
      
      public function method_487(param1:Vector3, param2:Vector3) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Object3D = this.skin.name_144();
         param1.reset(_loc5_.x,_loc5_.y,_loc5_.z + 10);
         if(FollowCameraController.name_944() == FollowCameraController.name_964)
         {
            const_59.name_932(_loc5_.rotationX,_loc5_.rotationY,_loc5_.rotationZ);
            param2.reset(const_59.m01,const_59.m11,const_59.m21);
         }
         else
         {
            BattleUtils.name_928(param2,FollowCameraController.name_949());
         }
      }
      
      public function method_491(param1:name_903, param2:Vector.<Vector3>, param3:int = 0) : void
      {
         name_911.getInstance().name_920(this.skin.name_923(),param2[param3],param1);
      }
      
      public function method_457() : Vector3
      {
         return this.skin.name_909.name_963;
      }
      
      public function name_238(param1:name_914) : void
      {
         this.var_353 = param1;
      }
      
      public function name_121() : name_914
      {
         return this.var_353;
      }
      
      public function name_180() : TrackedChassis
      {
         return this.chassis;
      }
      
      public function method_64(param1:BattleTeamType) : Boolean
      {
         return this.tankData.teamType == param1 && param1 != BattleTeamType.NONE;
      }
      
      public function method_484() : name_70
      {
         return this.tankData.object;
      }
      
      public function method_481() : name_904
      {
         return this.var_321.name_908;
      }
      
      public function name_667() : TankBody
      {
         return this.var_321;
      }
      
      public function name_206() : void
      {
         this.var_329 = this.var_343;
         this.var_329.reset();
      }
      
      public function name_240() : void
      {
         this.var_329 = this.var_352;
         this.var_329.reset();
      }
      
      private function method_476(param1:Vector3) : void
      {
         var _loc2_:name_767 = this.skin.name_912.var_308;
         this.var_328.x = -0.5 * (_loc2_.name_714 + _loc2_.name_738);
         this.var_328.y = -0.5 * (_loc2_.name_699 + _loc2_.name_739);
         this.var_328.z = -0.5 * param1.z - name_906.name_915 + name_906.name_917;
      }
      
      public function method_490() : Number
      {
         return this.var_348;
      }
      
      private function method_475(param1:Vector3, param2:Number) : void
      {
         var _loc3_:Vector3 = new Vector3(param1.x,param1.y,param2 / 2);
         var _loc4_:Matrix4 = this.var_321.name_908.name_892;
         this.var_348 = _loc3_.length() + Math.abs(_loc4_.m23);
      }
      
      private function method_485(param1:Mesh) : Vector3
      {
         return new Vector3(param1.boundMaxX - param1.boundMinX,param1.boundMaxY - param1.boundMinY,param1.boundMaxZ - param1.boundMinZ);
      }
      
      public function setMaxTurretTurnSpeed(param1:Number, param2:Boolean) : void
      {
         this.var_323.name_201(param1,param2);
      }
      
      public function setTurretTurnAcceleration(param1:Number) : void
      {
         this.var_323.name_246(param1);
      }
      
      public function method_486(param1:Number) : void
      {
         this.var_323.method_486(param1);
      }
      
      public function setMaxTurnSpeed(param1:Number, param2:Boolean) : void
      {
         this.chassis.setMaxTurnSpeed(param1,param2);
      }
      
      public function setMaxSpeed(param1:Number, param2:Boolean) : void
      {
         this.chassis.setMaxSpeed(param1,param2);
      }
      
      public function setAcceleration(param1:Number) : void
      {
         this.chassis.setAccelaration(param1);
      }
      
      public function setTurnAccelaration(param1:Number) : void
      {
         this.chassis.setTurnAccelaration(param1);
      }
      
      public function setTemperature(param1:Number) : void
      {
         this.var_341 = param1;
      }
      
      public function method_489() : Number
      {
         return this.var_341;
      }
      
      public function get collisionGroup() : int
      {
         return this.var_321.name_908.collisionGroup;
      }
      
      public function set collisionGroup(param1:int) : void
      {
         var _loc2_:name_889 = var_302.head;
         while(_loc2_ != null)
         {
            _loc2_.name_899.collisionGroup = param1;
            _loc2_ = _loc2_.next;
         }
         var _loc3_:name_904 = null;
         this.var_321.name_908.collisionGroup = param1;
         for each(_loc3_ in this.var_337)
         {
            _loc3_.collisionGroup = param1 & name_73.WEAPON;
         }
      }
      
      public function set name_142(param1:int) : void
      {
         this.chassis.name_939(param1);
      }
      
      public function method_474(param1:Number) : void
      {
         if(isNaN(param1) || param1 <= 0)
         {
            throw new ArgumentError("Wrong mass");
         }
         this.var_336 = method_466(this.skin.name_912.var_308);
         this.var_326 = new Vector3(this.var_336.x / 2,this.var_336.y / 2,this.var_336.z / 2);
         this.var_335 = 2 * this.var_326.z - (name_906.name_915 - name_906.name_917);
         super.mass = param1;
         super.invMass = 1 / param1;
         name_919.name_941(param1,this.var_326,var_310);
         this.method_476(this.var_336);
         this.method_472();
         this.method_478(this.var_326);
      }
      
      public function name_742(param1:name_175) : void
      {
         if(this.var_170 != null)
         {
            this.name_775();
         }
         this.var_170 = param1;
         this.var_324.name_742(param1);
         if(this.var_333 != null)
         {
            this.var_333.name_742(this.var_346);
         }
         if(this.var_330)
         {
            this.method_467(param1);
         }
         this.method_475(this.var_326,this.var_335);
      }
      
      public function name_775() : void
      {
         this.var_324.name_775();
         if(this.var_333 != null)
         {
            this.var_333.name_775();
         }
         if(this.var_330)
         {
            this.method_468();
         }
         this.var_170 = null;
         this.var_323.reset();
      }
      
      public function get method_493() : int
      {
         return this.var_323.name_954();
      }
      
      public function get skin() : TankSkin
      {
         return this.var_324;
      }
      
      private function method_60(param1:Number) : void
      {
         this.var_323.rotate(param1,this.var_321.name_787.name_225);
         this.method_469(this.var_323.name_937());
         if(this.name_121() is name_101)
         {
            this.tankData.sounds.name_957(this.var_323.name_948());
         }
      }
      
      private function method_469(param1:Number) : void
      {
         var _loc2_:name_904 = null;
         var _loc3_:Matrix4 = null;
         var _loc4_:name_907 = null;
         var _loc5_:TankSkinHull = this.skin.name_912;
         var _loc6_:Vector.<name_907> = this.skin.name_926();
         var _loc7_:int = 0;
         while(_loc7_ < this.var_337.length)
         {
            _loc2_ = this.var_337[_loc7_];
            _loc3_ = _loc2_.name_892;
            _loc3_.name_943(_loc5_.name_942() + this.var_328.x,_loc5_.name_935() + this.var_328.y,_loc5_.name_959() + this.var_328.z,0,0,param1);
            _loc4_ = _loc6_[_loc7_];
            _loc3_.name_901(_loc4_.name_953());
            _loc7_++;
         }
      }
      
      public function method_465(param1:Number, param2:int) : void
      {
         this.var_321.name_787.interpolate(param1,this.var_332,this.var_334);
         this.var_334.normalize();
         this.var_334.toMatrix4(this.var_331);
         this.var_331.name_731(this.var_332);
         this.var_323.interpolate(param1,param2);
      }
      
      public function name_777() : void
      {
         var _loc1_:name_886 = this.var_321.name_787.state;
         this.var_332.copy(_loc1_.position);
         this.var_334.copy(_loc1_.orientation);
         this.var_334.toMatrix4(this.var_331);
         this.var_331.name_731(this.var_332);
      }
      
      public function name_210(param1:Number) : void
      {
         if(this.var_329 != null)
         {
            this.var_329.update(param1);
         }
         var_320.x += this.var_338 * _m.m02;
         var_320.y += this.var_338 * _m.m12;
         var_320.z += this.var_338 * _m.m22;
         this.skin.name_927 = this.var_323.name_930();
         this.skin.name_946(var_320,var_322);
         this.skin.name_956(this.var_341);
         var _loc2_:Object3D = this.skin.name_144();
         var_320.x = _loc2_.x;
         var_320.y = _loc2_.y;
         var_320.z = _loc2_.z;
         this.title.update(var_320);
      }
      
      public function name_234(param1:Number) : void
      {
         var _loc2_:Number = param1 * 0.001;
         this.chassis.render(_loc2_);
         this.var_324.name_234(_loc2_ * this.chassis.name_936().name_924,_loc2_ * this.chassis.name_958().name_924);
      }
      
      public function method_426(param1:Number) : void
      {
         this.tankData.name_197 = 0;
         this.chassis.update(param1);
         this.method_60(param1);
         this.method_470();
      }
      
      public function method_464(param1:Number) : void
      {
         this.method_473();
         this.var_340.refresh();
         this.var_323.var_165(this);
      }
      
      private function method_473() : void
      {
         var _loc1_:Body = this.var_321.name_787;
         var _loc2_:name_886 = _loc1_.state;
         if(!_loc2_.name_940())
         {
            _loc2_.copy(this.var_342);
            _loc1_.method_440();
         }
      }
      
      public function method_480(param1:Vector3, param2:Vector.<Vector3>, param3:int = 0) : void
      {
         param1.vCopy(param2[param3]);
         param1.y = 0;
      }
      
      public function method_482() : void
      {
         this.var_354 = true;
      }
      
      public function name_260(param1:int, param2:int, param3:Boolean) : void
      {
         if(this.chassis != null)
         {
            this.chassis.name_260(param1,param2,TrackedChassis.name_965,param3);
         }
      }
      
      public function method_479() : void
      {
         this.var_338 = -0.5 * this.skin.name_123.boundMaxZ - name_906.name_915 + name_906.name_917;
      }
      
      public function name_113(param1:Vector3dData, param2:Vector3dData, param3:Vector3dData, param4:Vector3dData) : void
      {
         this.vector3To3d(state.position,param1);
         state.orientation.name_182(var_325);
         param2.x = var_325.x;
         param2.y = var_325.y;
         param2.z = var_325.z;
         this.vector3To3d(state.name_187,param3);
         this.vector3To3d(state.name_181,param4);
      }
      
      public function method_494() : Number
      {
         return state.name_187.vLength();
      }
      
      public function name_243(param1:Vector3dData, param2:Vector3dData, param3:Vector3dData, param4:Vector3dData) : void
      {
         this.vector3dTo3(param1,state.position);
         var_322.name_916(1,0,0,param2.x);
         state.orientation.copy(var_322);
         var_322.name_916(0,1,0,param2.y);
         state.orientation.append(var_322);
         state.orientation.normalize();
         var_322.name_916(0,0,1,param2.z);
         state.orientation.append(var_322);
         state.orientation.normalize();
         this.vector3dTo3(param3,state.name_187);
         this.vector3dTo3(param4,state.name_181);
         var_299.copy(state);
         this.var_340.refresh();
      }
      
      private function method_470() : void
      {
         this.var_342.copy(this.var_321.name_787.state);
         this.var_340.validate();
      }
      
      public function get turretDir() : Number
      {
         return this.var_324.name_927;
      }
      
      public function method_483() : Number
      {
         BattleUtils.name_928(var_327,this.var_323.name_930());
         var_327.method_414(this.var_331);
         return BattleUtils.name_931(var_327);
      }
      
      public function set turretDir(param1:Number) : void
      {
         if(this.var_324 == null)
         {
            return;
         }
         if(this.var_323 == null)
         {
            return;
         }
         Turret(this.var_323).setRemoteDirection(param1);
      }
      
      public function get title() : UserTitle
      {
         return this.var_333;
      }
      
      public function method_488(param1:Vector3D) : void
      {
         this.title.name_962(param1);
      }
      
      public function method_492(param1:Graphics, param2:Camera3D) : void
      {
      }
      
      public function get showCollisionGeometry() : Boolean
      {
         return this.var_330;
      }
      
      public function set showCollisionGeometry(param1:Boolean) : void
      {
         if(this.var_330 == param1)
         {
            return;
         }
         this.var_330 = param1;
         if(this.var_330)
         {
            if(this.var_170 != null)
            {
               this.method_467(this.var_170);
            }
         }
         else if(this.var_170 != null)
         {
            this.method_468();
         }
      }
      
      public function name_135(param1:name_913) : void
      {
         this.var_329 = param1;
         this.var_352 = param1;
         this.var_329.reset();
      }
      
      private function method_472() : void
      {
         var _loc1_:Vector3 = new Vector3(this.var_326.x,this.var_326.y,this.var_335 / 2);
         var _loc2_:name_904 = new name_904(_loc1_,0,const_60);
         var _loc3_:Matrix4 = new Matrix4();
         _loc3_.m23 = this.var_335 / 2 - this.var_326.z;
         method_443(_loc2_,_loc3_);
         this.var_339 = _loc2_;
         this.var_321.name_908 = _loc2_;
         name_921.name_945(this.var_326,this.var_335,this.var_321);
      }
      
      private function method_478(param1:Vector3) : void
      {
         var _loc2_:Number = param1.x;
         var _loc3_:Number = param1.y;
         this.name_264 = Vector.<Vector3>([new Vector3(-_loc2_,_loc3_,0),new Vector3(_loc2_,_loc3_,0),new Vector3(-_loc2_,0,0),new Vector3(_loc2_,0,0),new Vector3(-_loc2_,-_loc3_,0),new Vector3(_loc2_,-_loc3_,0)]);
      }
      
      private function vector3To3d(param1:Vector3, param2:Vector3dData) : void
      {
         param2.x = param1.x;
         param2.y = param1.y;
         param2.z = param1.z;
      }
      
      private function vector3dTo3(param1:Vector3dData, param2:Vector3) : void
      {
         param2.x = param1.x;
         param2.y = param1.y;
         param2.z = param1.z;
      }
      
      private function method_467(param1:name_175) : void
      {
      }
      
      private function method_468() : void
      {
      }
      
      public function destroy(param1:Boolean = false) : *
      {
         var _loc2_:Vector3 = null;
         if(this.var_339 != null)
         {
            this.var_339.destroy();
         }
         this.var_339 = null;
         if(this.var_324 != null)
         {
            this.var_324.destroy();
         }
         this.var_328 = null;
         this.var_332 = null;
         for each(_loc2_ in this.name_264)
         {
            _loc2_ = null;
         }
         this.var_324 = null;
         this.chassis = null;
         this.name_266 = null;
      }
      
      public function method_458(param1:name_903, param2:int = 0) : Boolean
      {
         if(this.skin == null)
         {
            return false;
         }
         name_911.getInstance().name_920(this.skin.name_923(),this.skin.name_909.muzzles[param2],param1);
         return true;
      }
      
      public function method_456() : Body
      {
         return this;
      }
      
      public function method_463(param1:int = 0) : Vector3
      {
         return this.skin.name_909.name_929;
      }
      
      public function method_462(param1:int = 0) : Number
      {
         return Vector3(this.skin.name_909.name_929).y;
      }
      
      public function name_144() : Object3D
      {
         return this.skin.name_144();
      }
      
      public function method_461() : TankSkin
      {
         return this.skin;
      }
      
      public function method_459(param1:int = 7) : void
      {
         var _loc2_:BattlefieldModel = BattlefieldModel(OSGi.getInstance().getService(IBattleField));
         var _loc3_:Dust = null;
         var _loc4_:int = 0;
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.method_199();
            _loc4_ = 0;
            while(_loc4_ < param1)
            {
               _loc3_.name_955(this.tankData,0,0.9);
               _loc4_++;
            }
         }
      }
      
      public function get teamType() : BattleTeamType
      {
         return this.tankData.teamType;
      }
      
      public function method_460() : int
      {
         return this.skin.name_909.muzzles.length;
      }
   }
}

import package_278.name_905;

class SecureValueSmoother implements IValueSmoother
{
    
   
   public var currentValue:name_905;
   
   public var targetValue_:name_905;
   
   public var smoothingSpeedUp:name_905;
   
   public var smoothingSpeedDown:name_905;
   
   public function SecureValueSmoother(param1:Number, param2:Number, param3:Number, param4:Number)
   {
      this.currentValue = new name_905("SecureValueSmoother::currentValue");
      this.targetValue_ = new name_905("SecureValueSmoother::targetValue_");
      this.smoothingSpeedUp = new name_905("SecureValueSmoother::smoothingSpeedUp");
      this.smoothingSpeedDown = new name_905("SecureValueSmoother::smoothingSpeedDown");
      super();
      this.smoothingSpeedUp.value = param1;
      this.smoothingSpeedDown.value = param2;
      this.targetValue_.value = param3;
      this.currentValue.value = param4;
   }
   
   public function reset(param1:Number) : void
   {
      this.currentValue.value = param1;
      this.targetValue_.value = param1;
   }
   
   public function update(param1:Number) : Number
   {
      if(this.currentValue.value < this.targetValue_.value)
      {
         this.currentValue.value += this.smoothingSpeedUp.value * param1;
         if(this.currentValue.value > this.targetValue_.value)
         {
            this.currentValue.value = this.targetValue_.value;
         }
      }
      else if(this.currentValue.value > this.targetValue_.value)
      {
         this.currentValue.value -= this.smoothingSpeedDown.value * param1;
         if(this.currentValue.value < this.targetValue_.value)
         {
            this.currentValue.value = this.targetValue_.value;
         }
      }
      return this.currentValue.value;
   }
   
   public function set targetValue(param1:Number) : void
   {
      this.targetValue_.value = param1;
   }
   
   public function get targetValue() : Number
   {
      return this.targetValue_.value;
   }
}

interface IValueSmoother
{
    
   
   function reset(param1:Number) : void;
   
   function update(param1:Number) : Number;
   
   function set targetValue(param1:Number) : void;
   
   function get targetValue() : Number;
}

class ValueSmoother implements IValueSmoother
{
    
   
   public var currentValue:Number;
   
   public var targetValue_:Number;
   
   public var smoothingSpeedUp:Number;
   
   public var smoothingSpeedDown:Number;
   
   public function ValueSmoother(param1:Number, param2:Number, param3:Number, param4:Number)
   {
      super();
      this.smoothingSpeedUp = param1;
      this.smoothingSpeedDown = param2;
      this.targetValue_ = param3;
      this.currentValue = param4;
   }
   
   public function reset(param1:Number) : void
   {
      this.currentValue = param1;
      this.targetValue_ = param1;
   }
   
   public function update(param1:Number) : Number
   {
      if(this.currentValue < this.targetValue_)
      {
         this.currentValue += this.smoothingSpeedUp * param1;
         if(this.currentValue > this.targetValue_)
         {
            this.currentValue = this.targetValue_;
         }
      }
      else if(this.currentValue > this.targetValue_)
      {
         this.currentValue -= this.smoothingSpeedDown * param1;
         if(this.currentValue < this.targetValue_)
         {
            this.currentValue = this.targetValue_;
         }
      }
      return this.currentValue;
   }
   
   public function set targetValue(param1:Number) : void
   {
      this.targetValue_ = param1;
   }
   
   public function get targetValue() : Number
   {
      return this.targetValue_;
   }
}
