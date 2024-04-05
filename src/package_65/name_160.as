package package_65
{
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.class_7;
   import alternativa.tanks.models.tank.turret.name_914;
   import alternativa.tanks.vehicles.tanks.Tank;
   import alternativa.tanks.vehicles.tanks.name_910;
   import package_1.Main;
   import package_289.TurretControlType;
   import package_32.name_245;
   import package_76.FollowCameraController;
   
   public class name_160 implements name_914
   {
      
      public static var battleInputService:name_245;
       
      
      private var tankData:TankData;
      
      private var var_13:TankModel;
      
      private var playSound:Boolean = true;
      
      private var var_403:TurretControlType;
      
      private var var_404:Number = 0;
      
      public function name_160(param1:TankData)
      {
         super();
         this.tankData = param1;
         this.var_403 = TurretControlType.ROTATION_DIRECTION;
         this.var_13 = Main.osgi.name_6(class_7) as TankModel;
         param1.sounds.name_957(false);
      }
      
      public function method_60(param1:Number) : void
      {
         var _loc2_:Tank = this.tankData.tank;
         var _loc3_:int = ((this.tankData.ctrlBits & TankModel.const_6 || this.tankData.ctrlBits & TankModel.LEFT) >> 4) - ((this.tankData.ctrlBits & TankModel.const_5 || this.tankData.ctrlBits & TankModel.RIGHT) >> 5);
         var _loc4_:int = ((this.tankData.ctrlBits & TankModel.LEFT) >> 2) - ((this.tankData.ctrlBits & TankModel.RIGHT) >> 3);
         if(_loc3_ == 0)
         {
            _loc3_ = _loc4_;
         }
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
            _loc2_.method_495().name_1087(TurretControlType.ROTATION_DIRECTION,_loc3_,name_910.name_965);
            if(this.tankData.local)
            {
               battleInputService.name_1089();
            }
         }
         else if((this.tankData.ctrlBits & TankModel.CENTER_TURRET) != 0)
         {
            this.var_403 = TurretControlType.TARGET_ANGLE_LOCAL;
            _loc2_.method_495().name_1087(TurretControlType.TARGET_ANGLE_LOCAL,0,name_910.name_965);
         }
         else if(FollowCameraController.name_944() != FollowCameraController.name_1088 && this.tankData.local)
         {
            if(this.var_403 != TurretControlType.TARGET_ANGLE_WORLD)
            {
               _loc2_.method_495().name_1087(TurretControlType.ROTATION_DIRECTION,0,name_910.name_965);
            }
            else
            {
               _loc2_.method_495().name_1087(TurretControlType.TARGET_ANGLE_WORLD,this.var_404,name_910.name_965);
            }
         }
         if(this.playSound)
         {
            this.tankData.sounds.name_957(this.tankData.tank.method_495().name_948());
         }
      }
      
      public function method_594(param1:Boolean) : void
      {
         this.playSound = param1;
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
