package package_71
{
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.models.tank.class_12;
   import alternativa.tanks.models.tank.class_7;
   import alternativa.tanks.vehicles.tanks.Tank;
   import package_20.name_1415;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_47.BattleTeamType;
   import package_62.LaserPointerModelBase;
   import package_62.name_317;
   import package_67.Vector3d;
   import platform.client.fp10.core.type.name_70;
   
   public class name_286 extends LaserPointerModelBase implements name_277, name_317
   {
      
      public static var localTankInfoService:class_12;
       
      
      public function name_286()
      {
         super();
      }
      
      public function updateRemoteDirection(param1:Number) : void
      {
         if(!isNaN(param1))
         {
            this.method_964(param1);
         }
      }
      
      public function aimRemoteAtTank(param1:name_70, param2:Vector3d) : void
      {
         if(param1 == null || BattleUtils.name_1417(param2) || param1 is name_1415 || param1.gameClass == null)
         {
            return;
         }
         var _loc3_:class_7 = class_7(param1.name_176(class_7));
         this.method_966(_loc3_.getTank(),BattleUtils.getVector3(param2));
      }
      
      public function hideRemote() : void
      {
         this.method_963();
      }
      
      public function method_877(param1:Vector3) : void
      {
         var _loc2_:Matrix3 = BattleUtils.name_1331;
         _loc2_.name_1333(localTankInfoService.method_42().skin.name_144());
         var _loc3_:Vector3 = BattleUtils.var_351;
         _loc2_.name_1418(_loc3_);
         var _loc4_:Number = _loc3_.dot(param1);
         if(this.method_964(_loc4_))
         {
            server.method_877(_loc4_);
         }
      }
      
      public function method_875(param1:Tank, param2:Vector3) : void
      {
         if(this.method_966(param1,param2))
         {
            server.method_875(param1.method_484(),BattleUtils.getVector3d(param2));
         }
      }
      
      public function method_878() : void
      {
         if(this.method_963() && this.method_969())
         {
            server.hide();
         }
      }
      
      private function method_969() : Boolean
      {
         var _loc1_:Tank = class_7(object.name_176(class_7)).getTank();
         var _loc2_:name_70 = localTankInfoService.method_43();
         var _loc3_:name_70 = _loc1_.method_484();
         return _loc2_ == _loc3_;
      }
      
      public function method_964(param1:Number) : Boolean
      {
         this.method_967();
         var _loc2_:LaserPointerEffect = LaserPointerEffect(getData(LaserPointerEffect));
         return _loc2_.method_877(param1);
      }
      
      private function method_966(param1:Tank, param2:Vector3) : Boolean
      {
         this.method_967();
         var _loc3_:LaserPointerEffect = LaserPointerEffect(getData(LaserPointerEffect));
         return _loc3_.method_875(param1,param2);
      }
      
      private function method_967() : void
      {
         var _loc1_:LaserPointerEffect = this.method_965();
         if(_loc1_.method_213())
         {
            return;
         }
         var _loc2_:Tank = this.getTank();
         var _loc3_:Boolean = Boolean(class_7(_loc2_.method_484().name_176(class_7)).isLocal());
         if(_loc3_ && !method_771().locallyVisible)
         {
            _loc1_.name_1416();
            return;
         }
         _loc1_.show(this.method_968(_loc2_.tankData.teamType));
      }
      
      private function method_965() : LaserPointerEffect
      {
         var _loc1_:LaserPointerEffect = LaserPointerEffect(getData(LaserPointerEffect));
         if(_loc1_ == null)
         {
            _loc1_ = new LaserPointerEffect(method_771().fadeInTimeMs,this.getTank());
            putData(LaserPointerEffect,_loc1_);
         }
         return _loc1_;
      }
      
      public function method_972(param1:Tank) : void
      {
         this.method_965().reset(param1);
      }
      
      private function getTank() : Tank
      {
         return class_7(object.name_176(class_7)).getTank();
      }
      
      private function method_963() : Boolean
      {
         var _loc1_:LaserPointerEffect = LaserPointerEffect(getData(LaserPointerEffect));
         if(Boolean(_loc1_) && _loc1_.method_213())
         {
            _loc1_.hide();
            return true;
         }
         return false;
      }
      
      private function method_968(param1:BattleTeamType) : uint
      {
         switch(param1)
         {
            case BattleTeamType.BLUE:
               return this.method_874();
            case BattleTeamType.RED:
               return this.method_876();
            default:
               return this.method_876();
         }
      }
      
      public function method_874() : uint
      {
         return uint(method_771().laserPointerBlueColor);
      }
      
      public function method_876() : uint
      {
         return uint(method_771().laserPointerRedColor);
      }
      
      public function method_971(param1:Tank, param2:Boolean) : void
      {
         this.method_963();
      }
      
      public function method_970(param1:Tank, param2:Boolean, param3:int) : void
      {
      }
   }
}
