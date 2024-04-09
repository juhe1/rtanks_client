package alternativa.tanks.models.tank.turret
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.battlefield.logic.class_23;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.class_15;
   import alternativa.tanks.models.tank.ITank;
   import alternativa.tanks.models.tank.ITankEventDispatcher;
   import alternativa.tanks.models.tank.name_77;
   import alternativa.tanks.service.settings.IBattleSettings;
   import alternativa.tanks.utils.MathUtils;
   import alternativa.tanks.vehicles.tanks.Turret;
   import package_289.TurretControlType;
   import package_289.name_1156;
   import package_32.class_2;
   import package_32.name_1092;
   import package_32.name_1093;
   import package_32.name_245;
   import package_33.GameActionEnum;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_76.FollowCameraController;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class name_111 implements class_15, class_2, name_1092, name_1093, AutoClosable, class_23
   {
      
      public static var battleInputService:name_245;
      
      public static var settingsService:IBattleSettings;
      
      public static var battleService:IBattleField;
      
      private static var var_465:ITankEventDispatcher = ITankEventDispatcher(OSGi.getInstance().getService(ITankEventDispatcher));
      
      private static var v:Vector3 = new Vector3();
      
      private static const const_364:Number = 0.0001;
      
      private static const const_362:Number = MathUtils.method_604(1);
      
      private static const const_363:Number = 0.1308996938995747;
       
      
      private const const_361:name_1156 = new name_1156();
      
      private var var_403:TurretControlType;
      
      private var var_404:Number = 0;
      
      private var tankData:TankData;
      
      private var var_13:TankModel;
      
      private var var_464:Number = 0;
      
      private var var_469:Number = 0;
      
      private var var_467:Boolean = false;
      
      private var var_466:Boolean = false;
      
      private var var_468:int;
      
      public function name_111(param1:TankData)
      {
         super();
         this.tankData = param1;
         this.var_403 = TurretControlType.ROTATION_DIRECTION;
         this.var_13 = OSGi.getInstance().getService(ITank) as TankModel;
         battleInputService.name_219(this);
         battleInputService.method_598(this);
         battleInputService.method_602(this);
         var_465.name_718(name_77.name_184,this);
         var_465.name_718(name_77.name_192,this);
         battleService.name_165().name_212(this);
      }
      
      public function reset() : void
      {
         this.var_468 = 0;
         this.method_691(this.const_361);
      }
      
      private function method_692() : void
      {
         this.reset();
         this.var_13.method_85(this.tankData,this.var_404);
      }
      
      public function method_504(param1:int, param2:int) : void
      {
         if(!this.var_467 && FollowCameraController.name_944() == FollowCameraController.name_1088 && this.var_13.userControlsEnabled)
         {
            this.var_468 += param2;
            if(this.method_690())
            {
               this.method_692();
            }
         }
      }
      
      public function method_28(param1:GameActionEnum, param2:Boolean) : void
      {
         if(param1 == GameActionEnum.LOOK_AROUND)
         {
            this.var_467 = param2;
            if(FollowCameraController.name_944() == FollowCameraController.name_1088)
            {
               if(this.var_467)
               {
                  this.var_403 = TurretControlType.TARGET_ANGLE_LOCAL;
                  this.var_404 = this.tankData.tank.turretDir;
                  this.tankData.tank.method_495().name_1087(TurretControlType.TARGET_ANGLE_LOCAL,this.tankData.tank.method_495().name_937(),Turret.name_965);
               }
               else
               {
                  this.var_403 = TurretControlType.TARGET_ANGLE_WORLD;
                  this.var_404 = this.var_464;
                  this.tankData.tank.method_495().name_1087(TurretControlType.TARGET_ANGLE_WORLD,this.var_464,Turret.name_965);
               }
            }
         }
      }
      
      public function method_688(param1:Boolean) : void
      {
         if(this.tankData == null || this.tankData.tank == null)
         {
            return;
         }
         if(param1 && FollowCameraController.name_944() != FollowCameraController.name_1088)
         {
            this.var_464 = this.tankData.tank.method_483();
            FollowCameraController.name_1157(FollowCameraController.name_1088);
            FollowCameraController.name_1158(this.var_464);
            this.var_403 = TurretControlType.TARGET_ANGLE_WORLD;
            this.var_404 = this.var_464;
            this.tankData.tank.method_495().name_1087(TurretControlType.TARGET_ANGLE_WORLD,this.var_464,Turret.name_965);
         }
         else if(!param1 && FollowCameraController.name_944() == FollowCameraController.name_1088)
         {
            FollowCameraController.name_1157(FollowCameraController.name_964);
         }
      }
      
      public function method_689(param1:Number, param2:Number) : void
      {
         this.var_464 = MathUtils.method_612(this.var_464 - param1 * settingsService.mouseSensitivity * 0.0001);
         FollowCameraController.name_1158(this.var_464);
         if(!this.var_467)
         {
            this.var_403 = TurretControlType.TARGET_ANGLE_WORLD;
            this.var_404 = this.var_464;
            this.tankData.tank.method_495().name_1087(TurretControlType.TARGET_ANGLE_WORLD,this.var_464,Turret.name_965);
         }
      }
      
      private function method_693(param1:Number, param2:Matrix3) : Number
      {
         v.x = -Math.sin(param1);
         v.y = Math.cos(param1);
         v.z = 0;
         v.method_411(param2);
         return Math.atan2(-v.x,v.y);
      }
      
      public function handleTankEvent(param1:int, param2:TankData) : void
      {
         switch(param1)
         {
            case name_77.name_184:
               if(param2 == this.tankData)
               {
                  this.enable();
                  if(FollowCameraController.name_944() == FollowCameraController.name_1088)
                  {
                     this.var_464 = this.tankData.tank.method_483();
                     FollowCameraController.name_1158(this.var_464);
                     this.tankData.tank.method_495().name_1087(TurretControlType.TARGET_ANGLE_WORLD,this.var_464,Turret.name_965);
                  }
               }
               break;
            case name_77.name_192:
               if(param2 == this.tankData)
               {
                  this.disable();
                  break;
               }
         }
      }
      
      public function enable() : void
      {
         if(!this.var_466)
         {
            this.var_466 = true;
            battleInputService.name_219(this);
            battleInputService.method_598(this);
            battleInputService.method_602(this);
         }
      }
      
      public function disable() : void
      {
         if(this.var_466)
         {
            this.var_466 = false;
            battleInputService.name_150(this);
            battleInputService.method_597(this);
            battleInputService.method_600(this);
            FollowCameraController.name_1157(FollowCameraController.name_964);
            this.tankData.tank.method_495().name_1087(TurretControlType.ROTATION_DIRECTION,0,Turret.name_965);
         }
      }
      
      private function method_690() : Boolean
      {
         var _loc1_:Number = NaN;
         var _loc2_:TurretControlType = this.const_361.controlType;
         if(_loc2_ != this.var_403)
         {
            return true;
         }
         switch(_loc2_)
         {
            case TurretControlType.ROTATION_DIRECTION:
               if(this.const_361.controlInput != this.var_404)
               {
                  return true;
               }
               break;
            default:
               _loc1_ = MathUtils.method_614(this.var_404,this.const_361.controlInput);
               if(Math.abs(_loc1_) > const_362)
               {
                  return true;
               }
               break;
         }
         var _loc3_:Number = MathUtils.method_614(this.tankData.tank.turretDir,this.const_361.direction);
         return Math.abs(_loc3_) > 0.1308996938995747;
      }
      
      private function method_691(param1:name_1156) : void
      {
         param1.controlType = this.var_403;
         param1.controlInput = this.var_404;
         param1.direction = this.tankData.tank.turretDir;
         param1.rotationSpeedNumber = this.tankData.tank.method_495().name_1159();
      }
      
      public function close() : void
      {
         this.tankData = null;
         battleInputService.name_150(this);
         battleInputService.method_597(this);
         battleInputService.method_600(this);
         var_465.name_717(name_77.name_184,this);
         battleService.name_165().name_977(this);
      }
   }
}
