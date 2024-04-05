package alternativa.tanks.vehicles.tanks
{
   import alternativa.physics.name_660;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.utils.name_1398;
   import alternativa.tanks.utils.name_75;
   import alternativa.tanks.vehicles.tanks.chassis.ValueSmoother;
   import alternativa.tanks.vehicles.tanks.chassis.name_2189;
   import package_289.TurretControlType;
   import package_317.name_2188;
   import package_37.Matrix3;
   import package_37.Vector3;
   
   public final class name_910 implements name_922
   {
      
      public static const name_965:int = 3;
      
      private static const const_1642:Number = name_75.method_604(0.5);
      
      private static const v:Vector3 = new Vector3();
      
      private static const var_350:Vector3 = new Vector3();
      
      private static const var_349:Vector3 = new Vector3();
      
      private static const var_345:Vector3 = new Vector3();
      
      private static const var_351:Vector3 = new Vector3();
       
      
      private var controlType:TurretControlType;
      
      private var controlInput:Number = 0;
      
      private var var_403:TurretControlType;
      
      private var var_404:Number = 0;
      
      private var var_1712:ValueSmoother;
      
      private var var_1729:Number = 0;
      
      private var turnAcceleration:Number = 0;
      
      private var turnSpeed:Number = 0;
      
      private var var_1715:int = 3;
      
      private var var_1726:Number = 0;
      
      private var var_1724:Number = 0;
      
      private var var_1728:Number = 0;
      
      private var var_1727:int;
      
      private var var_1731:Number = 0;
      
      private var var_1730:Number;
      
      private var var_1725:name_1398;
      
      private const spring:name_2188 = new name_2188(10,1,0);
      
      public function name_910(param1:Number, param2:Number)
      {
         this.controlType = TurretControlType.ROTATION_DIRECTION;
         this.var_403 = TurretControlType.ROTATION_DIRECTION;
         this.var_1712 = new name_2189(0.3,10,0,0);
         this.var_1725 = new name_1398();
         super();
         this.name_201(param1,true);
         this.turnAcceleration = param2;
      }
      
      public function method_1902() : TurretControlType
      {
         return this.var_403;
      }
      
      public function method_1904() : Number
      {
         return this.var_404;
      }
      
      public function method_1905() : int
      {
         return this.var_1715;
      }
      
      public function name_1087(param1:TurretControlType, param2:Number, param3:int) : void
      {
         this.controlType = param1;
         this.controlInput = param2;
         this.var_1715 = param3;
         if(this.method_940())
         {
            this.method_1909(param1,param2);
         }
      }
      
      public function method_1908() : Number
      {
         return this.var_1731;
      }
      
      public function method_1907(param1:Number) : void
      {
         this.var_1731 = param1;
      }
      
      public function lock(param1:int) : void
      {
         var _loc2_:Boolean = this.isLocked();
         this.var_1725.change(param1,true);
         if(this.isLocked() && !_loc2_)
         {
            this.method_1909(TurretControlType.ROTATION_DIRECTION,0);
         }
      }
      
      public function unlock(param1:int) : void
      {
         var _loc2_:Boolean = this.isLocked();
         this.var_1725.change(param1,false);
         if(!this.isLocked() && _loc2_)
         {
            this.method_1909(this.controlType,this.controlInput);
         }
      }
      
      private function method_1909(param1:TurretControlType, param2:Number) : void
      {
         this.var_403 = param1;
         this.var_404 = param2;
      }
      
      public function method_1903(param1:Number) : void
      {
         this.var_1724 = name_75.method_612(param1);
      }
      
      public function name_937() : Number
      {
         return this.var_1724;
      }
      
      public function setRemoteDirection(param1:Number) : void
      {
         var _loc2_:Number = name_75.method_614(this.var_1728,param1);
         this.spring.name_2190(_loc2_);
         this.var_1726 = param1;
         this.var_1724 = param1;
      }
      
      public function rotate(param1:Number, param2:Matrix3) : void
      {
         var _loc3_:Number = NaN;
         this.var_1729 = this.var_1712.update(param1);
         this.var_1726 = this.var_1724;
         if(this.isLocked())
         {
            this.turnSpeed = 0;
            return;
         }
         switch(this.var_403)
         {
            case TurretControlType.ROTATION_DIRECTION:
               this.method_1911(param1);
               break;
            case TurretControlType.TARGET_ANGLE_LOCAL:
               this.name_226(param1,this.var_404);
               break;
            case TurretControlType.TARGET_ANGLE_WORLD:
               _loc3_ = this.method_693(this.controlInput,param2);
               this.name_226(param1,_loc3_);
         }
      }
      
      private function method_1911(param1:Number) : void
      {
         var _loc2_:Number = this.var_404;
         if(_loc2_ == 0)
         {
            this.turnSpeed = 0;
         }
         else
         {
            if(this.var_1727 != _loc2_)
            {
               this.turnSpeed = 0;
            }
            this.var_1724 = name_75.method_612(this.var_1724 + this.turnSpeed * param1);
            this.turnSpeed = this.method_1910(this.turnSpeed,_loc2_,param1);
         }
         this.var_1727 = _loc2_;
      }
      
      private function name_226(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = name_75.method_614(param2,this.var_1724);
         if(Math.abs(_loc3_) < const_1642)
         {
            this.var_1724 = param2;
            this.turnSpeed = 0;
            return;
         }
         if(_loc3_ * this.turnSpeed <= 0)
         {
            this.turnSpeed = 0;
         }
         var _loc4_:Number = this.turnSpeed * param1;
         if(Math.abs(_loc4_) > Math.abs(_loc3_))
         {
            this.var_1724 = param2;
         }
         else
         {
            this.var_1724 = name_75.method_612(this.var_1724 + _loc4_);
         }
         var _loc5_:Number = name_75.method_613(_loc3_);
         this.turnSpeed = this.method_1910(this.turnSpeed,_loc5_,param1);
      }
      
      private function method_1910(param1:Number, param2:Number, param3:Number) : Number
      {
         var _loc4_:Number = this.var_1729 * this.var_1715 / 3;
         return name_75.method_609(param1,param2 * _loc4_,this.turnAcceleration * param3);
      }
      
      private function method_693(param1:Number, param2:Matrix3) : Number
      {
         BattleUtils.name_928(v,param1);
         v.method_411(param2);
         return BattleUtils.name_931(v);
      }
      
      public function method_486(param1:Number) : void
      {
         this.var_1730 = param1;
      }
      
      public function var_165(param1:name_660) : void
      {
         this.method_1912(param1);
      }
      
      private function method_1912(param1:name_660) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this.var_1730 > 0)
         {
            param1.var_299.orientation.method_677(var_349);
            param1.var_299.orientation.method_675(var_350);
            param1.state.orientation.method_677(var_345);
            var_351.cross2(var_345,var_349);
            _loc2_ = var_351.vDot(var_350);
            _loc3_ = var_349.vDot(var_345);
            _loc4_ = Math.atan2(_loc2_,_loc3_);
            this.var_1724 = name_75.method_612(this.var_1724 + _loc4_ * this.var_1730);
         }
      }
      
      public function interpolate(param1:Number, param2:int) : void
      {
         this.spring.update(0.001 * param2,0);
         var _loc3_:Number = name_75.method_614(this.var_1724,this.var_1726);
         this.var_1728 = name_75.method_612(this.var_1726 + param1 * _loc3_ + this.spring.value);
      }
      
      public function name_930() : Number
      {
         return this.var_1728;
      }
      
      public function name_948() : Boolean
      {
         return this.turnSpeed != 0;
      }
      
      public function method_1906() : void
      {
         this.turnSpeed = 0;
      }
      
      public function reset() : void
      {
         this.turnSpeed = 0;
         this.var_1726 = 0;
         this.var_1724 = 0;
         this.var_1728 = 0;
         this.var_1712.reset(this.var_1712.name_2184());
         this.spring.reset(0,0);
      }
      
      public function name_201(param1:Number, param2:Boolean) : void
      {
         if(param2)
         {
            this.var_1729 = param1;
            this.var_1712.reset(param1);
         }
         else
         {
            this.var_1712.name_2185(param1);
         }
      }
      
      public function name_1159() : Number
      {
         return this.var_1729;
      }
      
      public function name_246(param1:Number) : void
      {
         this.turnAcceleration = param1;
      }
      
      public function name_1276() : Number
      {
         return this.turnAcceleration;
      }
      
      private function isLocked() : Boolean
      {
         return !this.var_1725.name_1400();
      }
      
      private function method_940() : Boolean
      {
         return this.var_1725.name_1400();
      }
      
      public function name_954() : int
      {
         return this.var_1727 < 0 ? int(-1) : (this.var_1727 > 0 ? int(1) : int(0));
      }
   }
}
