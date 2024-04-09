package package_92
{
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Object3D;
   import alternativa.model.class_11;
   import alternativa.model.IModel;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.dump.name_524;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.sfx.shoot.name_1187;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.ITank;
   import alternativa.tanks.models.weapon.IWeaponController;
   import alternativa.tanks.models.weapon.name_1495;
   import alternativa.tanks.models.weapon.name_213;
   import alternativa.tanks.sfx.name_1497;
   import alternativa.tanks.vehicles.tanks.Tank;
   import flash.geom.Vector3D;
   import flash.utils.getTimer;
   import package_1.Main;
   import package_32.class_2;
   import package_32.name_245;
   import package_325.class_45;
   import package_325.class_46;
   import package_33.GameActionEnum;
   import package_34.class_3;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_41.TankParts;
   import package_52.WeaponsManager;
   import package_7.name_32;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class WeaponCommonModel extends class_45 implements class_2, class_46, class_11, name_1188, name_213, class_3
   {
      
      public static var battleInputService:name_245;
       
      
      private var modelService:name_32;
      
      private var battlefield:IBattleField;
      
      private var var_13:ITank;
      
      private var localUserData:TankData;
      
      private var var_766:name_1451;
      
      public var var_760:IWeaponController;
      
      private var var_764:Boolean;
      
      private var enabled:Boolean;
      
      private var var_765:Number = 0;
      
      private var var_762:Boolean;
      
      private var var_761:Boolean;
      
      private var var_763:Vector3;
      
      private var numObjects:int;
      
      public function WeaponCommonModel()
      {
         this.var_763 = new Vector3();
         super();
         _interfaces.push(IModel,class_46,class_11,name_1188,name_213);
      }
      
      public function getWeaponController() : IWeaponController
      {
         return this.var_760;
      }
      
      public function initObject(param1:ClientObject, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         if(this.modelService == null)
         {
            this.modelService = Main.osgi.getService(name_32) as name_32;
            this.battlefield = Main.osgi.getService(IBattleField) as IBattleField;
            this.var_13 = Main.osgi.getService(ITank) as ITank;
         }
         var _loc6_:name_1451 = new name_1451();
         var _loc7_:Number = name_1495.name_1499;
         _loc6_.kickback = param3 * _loc7_;
         _loc6_.name_1498 = param2;
         _loc6_.impactForce = param2 * _loc7_;
         _loc6_.turretRotationAccel = param4;
         _loc6_.turretRotationSpeed = param5;
         _loc6_.muzzles = this.method_1026(param1);
         param1.method_12(WeaponCommonModel,_loc6_);
         ++this.numObjects;
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:name_1451 = this.name_1457(param1);
         _loc2_.name_1493 = BattleController.getWeaponController(param1);
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:name_524 = null;
         if(this.localUserData != null && this.localUserData.turret == param1)
         {
            this.method_170();
         }
         --this.numObjects;
         if(this.numObjects == 0)
         {
            _loc2_ = name_524(Main.osgi.getService(name_524));
            if(_loc2_ != null)
            {
               _loc2_.unregisterDumper(this.dumperName);
            }
         }
      }
      
      public function name_1457(param1:ClientObject) : name_1451
      {
         return name_1451(param1.method_16(WeaponCommonModel));
      }
      
      public function name_1249(param1:ClientObject, param2:Tank, param3:int, param4:Vector3, param5:Vector3) : void
      {
         var _loc6_:name_1451 = this.name_1457(param1);
         param2.method_432(param4,param5,-_loc6_.kickback);
         var _loc7_:name_1187 = WeaponsManager.method_721(WeaponsManager.name_185(param1.id));
         if(_loc7_ == null)
         {
            return;
         }
         if(this.battlefield == null)
         {
            this.battlefield = Main.osgi.getService(IBattleField) as IBattleField;
         }
         var _loc8_:name_1497 = _loc7_.name_1249(param1,_loc6_.muzzles[param3],param2.skin.name_144(),this.battlefield.getBattlefieldData().viewport.camera);
         this.battlefield.name_217(_loc8_.name_1496);
         this.battlefield.name_195(_loc8_.name_1494);
      }
      
      public function method_502(param1:ClientObject, param2:Camera3D, param3:Boolean, param4:Vector3, param5:Vector3, param6:TankData, param7:Number) : void
      {
         var _loc8_:name_1187 = WeaponsManager.method_721(param1);
         if(_loc8_ == null)
         {
            return;
         }
         if(param6 != null)
         {
            if(param3)
            {
               param6.tank.name_225.name_890(param4,this.var_763);
               this.var_763.vAdd(param6.tank.state.position);
            }
            else
            {
               this.var_763.vCopy(param4);
            }
            param6.tank.method_496(this.var_763,param5,this.name_1457(param1).impactForce * param7);
         }
         else
         {
            this.var_763.vCopy(param4);
         }
         var _loc9_:name_1497 = _loc8_.method_502(param1,this.var_763,param2,param7);
         if(this.battlefield == null)
         {
            this.battlefield = Main.osgi.getService(IBattleField) as IBattleField;
         }
         this.battlefield.name_217(_loc9_.name_1496);
         this.battlefield.name_195(_loc9_.name_1494);
      }
      
      public function name_190(param1:ClientObject) : void
      {
         var _loc2_:TankData = this.var_13.getTankData(param1);
         if(_loc2_.local)
         {
            this.var_765 = 0;
            this.localUserData = _loc2_;
            this.var_766 = this.name_1457(this.localUserData.turret);
            this.var_760 = this.var_766.name_1493;
            if(this.var_760 == null)
            {
               this.var_760 = BattleController.getWeaponController(param1);
            }
            if(this.var_760 != null)
            {
               this.var_760.name_125(_loc2_);
            }
            this.method_179();
            this.var_761 = false;
            this.var_762 = false;
            this.enabled = false;
         }
      }
      
      public function name_161(param1:ClientObject) : void
      {
         var _loc2_:TankData = this.var_13.getTankData(param1);
         var _loc3_:name_1451 = this.name_1457(_loc2_.turret);
         if(_loc3_.name_1493 != null)
         {
            _loc3_.name_1493.method_999(_loc2_);
         }
         if(_loc2_.local)
         {
            if(this.var_760 != null)
            {
               this.var_760.method_1001(getTimer(),false);
               this.var_760.method_1000();
            }
            this.enabled = false;
            this.localUserData = null;
            this.var_766 = null;
            this.var_760 = null;
            this.method_170();
         }
      }
      
      public function name_126(param1:ClientObject) : void
      {
         var _loc2_:TankData = this.var_13.getTankData(param1);
         var _loc3_:name_1451 = this.name_1457(_loc2_.turret);
         if(_loc3_.name_1493 != null)
         {
            _loc3_.name_1493.method_999(_loc2_);
         }
         if(_loc2_.local)
         {
            if(this.var_760 != null)
            {
               this.var_760.method_1001(getTimer(),false);
               this.var_760.reset();
            }
            if(this.var_762 && this.var_761)
            {
               this.var_761 = false;
               this.var_762 = false;
            }
            this.enabled = false;
            this.var_764 = false;
            this.var_765 = 0;
         }
      }
      
      public function reset() : void
      {
         if(this.var_760 != null)
         {
            this.var_760.reset();
         }
      }
      
      public function enable() : void
      {
         if(!this.enabled && this.var_760 != null)
         {
            this.enabled = true;
         }
      }
      
      public function disable() : void
      {
         if(!this.enabled || this.var_760 == null)
         {
            return;
         }
         this.enabled = false;
         this.var_762 = false;
         this.var_761 = false;
         this.var_764 = false;
         this.var_760.method_1001(getTimer(),true);
      }
      
      public function stop() : void
      {
         if(!this.enabled || this.var_760 == null)
         {
            return;
         }
         this.var_761 = true;
      }
      
      public function update(param1:int, param2:int) : Number
      {
         if(this.var_760 == null)
         {
            return 0;
         }
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = true;
         if(this.enabled)
         {
            if(this.var_762)
            {
               if(!this.var_764)
               {
                  this.var_764 = true;
                  _loc3_ = true;
                  this.var_760.method_1002(param1);
               }
            }
            if(this.var_761)
            {
               if(this.var_764)
               {
                  if(_loc3_)
                  {
                     this.var_765 = this.var_760.update(param1,param2);
                     _loc4_ = false;
                  }
                  this.var_760.method_1001(param1,true);
                  this.var_764 = false;
               }
               this.var_761 = false;
               this.var_762 = false;
            }
         }
         if(_loc4_)
         {
            this.var_765 = this.var_760.update(param1,param2);
         }
         return this.var_765;
      }
      
      public function method_576(param1:ClientObject) : Number
      {
         return this.name_1457(param1).turretRotationAccel;
      }
      
      public function method_577(param1:ClientObject) : Number
      {
         return this.name_1457(param1).turretRotationSpeed;
      }
      
      public function get dumperName() : String
      {
         return "weaponcommon";
      }
      
      public function dump(param1:Vector.<String>) : String
      {
         return "=== WeaponCommonModel dump ===\n" + "enabled=" + this.enabled + "\n" + "triggerPressed=" + this.var_764 + "\n" + "triggerKeyDown=" + this.var_762 + "\n" + "triggerKeyUp=" + this.var_761 + "\n" + "indicatorValue=" + this.var_765 + "\n" + "=== end of WeaponCommonModel dump ===";
      }
      
      private function method_1027(param1:Vector.<Vector3D>) : Vector.<Vector3>
      {
         var _loc3_:Vector3D = null;
         var _loc2_:Vector.<Vector3> = new Vector.<Vector3>();
         for each(_loc3_ in param1)
         {
            _loc2_.push(new Vector3(_loc3_.x,_loc3_.y,_loc3_.z));
         }
         return _loc2_;
      }
      
      private function method_1026(param1:ClientObject) : Vector.<Vector3>
      {
         var _loc7_:Object3D = null;
         var _loc2_:TankParts = param1.method_16(TankParts) as TankParts;
         if(_loc2_ == null)
         {
            throw new Error("No turret part found");
         }
         var _loc3_:Tanks3DSResource = Tanks3DSResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(_loc2_.turretResourceId));
         if(_loc3_ == null)
         {
            throw new Error("No turret model found");
         }
         var _loc4_:Vector.<Vector3> = new Vector.<Vector3>();
         var _loc5_:Vector3 = null;
         var _loc6_:Vector.<Object3D> = _loc3_.method_766(/muzzle.*/);
         if(_loc6_ != null)
         {
            for each(_loc7_ in _loc6_)
            {
               _loc5_ = new Vector3(_loc7_.x,_loc7_.y,_loc7_.z);
               _loc4_.push(_loc5_);
            }
         }
         return _loc4_;
      }
      
      public function method_28(param1:GameActionEnum, param2:Boolean) : void
      {
         if(param1 != GameActionEnum.SHOT || this.var_760 == null)
         {
            return;
         }
         if(param2)
         {
            this.var_762 = true;
            this.var_761 = false;
         }
         else if(!this.enabled)
         {
            this.var_761 = false;
            this.var_762 = false;
         }
         else
         {
            this.var_761 = true;
         }
      }
      
      private function method_179() : void
      {
         battleInputService.name_219(this);
      }
      
      private function method_170() : void
      {
         battleInputService.name_150(this);
      }
   }
}
