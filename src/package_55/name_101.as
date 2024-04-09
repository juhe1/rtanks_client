package package_55
{
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.ITank;
   import alternativa.tanks.models.tank.turret.name_914;
   import alternativa.tanks.vehicles.tanks.Tank;
   import alternativa.tanks.vehicles.tanks.Turret;
   import package_1.Main;
   import package_289.TurretControlType;
   import package_32.name_245;
   import package_76.FollowCameraController;
   
   public class name_101 implements name_914
   {
      
      public static var battleInputService:name_245;
       
      
      private var tankData:TankData;
      
      private var var_13:TankModel;
      
      private var var_403:TurretControlType;
      
      private var var_404:Number = 0;
      
      public function name_101(param1:TankData)
      {
         super();
         this.tankData = param1;
         this.var_403 = TurretControlType.ROTATION_DIRECTION;
         this.var_13 = Main.osgi.getService(ITank) as TankModel;
      }
      
      public function method_60(param1:Number) : void
      {
         var _loc2_:Tank = this.tankData.tank;
         var _loc3_:int = ((this.tankData.ctrlBits & TankModel.const_6) >> 4) - ((this.tankData.ctrlBits & TankModel.const_5) >> 5);
         if(_loc3_ != 0)
         {
            if((this.tankData.ctrlBits & TankModel.CENTER_TURRET) != 0)
            {
               this.tankData.ctrlBits &= ~TankModel.CENTER_TURRET;
               if(this.tankData.local)
               {
                  this.var_13.var_26 &= ~TankModel.CENTER_TURRET;
               }
            }
            this.var_403 = TurretControlType.ROTATION_DIRECTION;
            _loc2_.method_495().name_1087(TurretControlType.ROTATION_DIRECTION,_loc3_,Turret.name_965);
            if(this.tankData.local)
            {
               battleInputService.name_1089();
            }
         }
         else if((this.tankData.ctrlBits & TankModel.CENTER_TURRET) != 0)
         {
            this.var_403 = TurretControlType.TARGET_ANGLE_LOCAL;
            _loc2_.method_495().name_1087(TurretControlType.TARGET_ANGLE_LOCAL,0,Turret.name_965);
            if(this.tankData.local)
            {
               battleInputService.name_1089();
            }
         }
         else if(FollowCameraController.name_944() != FollowCameraController.name_1088 && this.tankData.local || !this.tankData.local)
         {
            if(this.var_403 != TurretControlType.TARGET_ANGLE_WORLD)
            {
               _loc2_.method_495().name_1087(TurretControlType.ROTATION_DIRECTION,0,Turret.name_965);
            }
            else
            {
               _loc2_.method_495().name_1087(TurretControlType.TARGET_ANGLE_WORLD,this.var_404,Turret.name_965);
            }
         }
      }
      
      public function method_594(param1:Boolean) : void
      {
      }
      
      public function name_226(param1:Number) : void
      {
         this.var_404 = param1;
         this.var_403 = TurretControlType.TARGET_ANGLE_WORLD;
      }
      
      public function close() : void
      {
         this.tankData = null;
      }
   }
}
