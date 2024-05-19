package package_276
{
   import alternativa.physics.Body;
   import alternativa.tanks.utils.MathUtils;
   import alternativa.tanks.vehicles.tanks.TankBody;
   import alternativa.tanks.vehicles.tanks.chassis.TracksAnimator;
   import alternativa.tanks.vehicles.tanks.chassis.ValueSmoother;
   import alternativa.tanks.vehicles.tanks.chassis.class_160;
   import alternativa.tanks.vehicles.tanks.chassis.class_161;
   import alternativa.tanks.vehicles.tanks.chassis.name_2182;
   import alternativa.tanks.vehicles.tanks.chassis.SpeedCharacteristics;
   import package_37.Matrix3;
   import package_37.Vector3;
   
   public class TrackedChassis implements class_161, class_160
   {
      
      public static const name_965:int = 7;
      
      private static const const_1633:Number = 400;
      
      private static const var_1012:Vector3 = new Vector3();
      
      private static const const_1628:Vector3 = new Vector3();
      
      private static const const_1627:Vector3 = new Vector3();
      
      private static const const_1630:Vector3 = new Vector3();
      
      private static const const_1629:Vector3 = new Vector3();
      
      private static const const_1625:Vector3 = new Vector3();
      
      private static const const_1626:Vector3 = new Vector3();
      
      private static const const_1632:Vector3 = new Vector3();
      
      private static const const_1631:Vector3 = new Vector3();
       
      
      private var var_321:TankBody;
      
      private var name_787:Body;
      
      private var var_1713:name_906;
      
      private var maxSpeedSmoother:ValueSmoother;
      
      private var maxTurnSpeedSmoother:ValueSmoother;
      
      public var var_1708:Track;
      
      public var var_1707:Track;
      
      public var var_1710:int;
      
      public var var_1711:int;
      
      public var var_1715:int;
      
      public var var_1714:Boolean;
      
      private var name_266:SpeedCharacteristics;
      
      private var var_336:Vector3;
      
      private var var_1716:TracksAnimator;
      
      public function TrackedChassis(param1:TankBody, param2:Body, param3:Vector3, param4:SpeedCharacteristics, param5:Number)
      {
         this.var_1713 = new name_906();
         this.maxSpeedSmoother = new name_2182(100,1000,0,0);
         this.maxTurnSpeedSmoother = new name_2182(0.3,10,0,0);
         this.var_1716 = new TracksAnimator(this,this.maxSpeedSmoother);
         super();
         this.var_321 = param1;
         this.name_787 = param2;
         this.var_336 = param3;
         this.var_1713.method_1866(param5);
         this.name_266 = param4;
      }
      
      public function name_938() : void
      {
         this.method_1883(name_906.const_1616,this.var_336);
      }
      
      private function method_1883(param1:int, param2:Vector3) : void
      {
         var _loc3_:Number = param2.y * 0.8;
         var _loc4_:Number = param2.x - 40;
         this.var_1708 = new Track(this.name_787,param1,new Vector3(-0.5 * _loc4_,0,-0.5 * param2.z + name_906.name_917),_loc3_,this.var_1713,-1);
         this.var_1707 = new Track(this.name_787,param1,new Vector3(0.5 * _loc4_,0,-0.5 * param2.z + name_906.name_917),_loc3_,this.var_1713,1);
      }
      
      public function setAccelaration(param1:Number) : void
      {
         this.name_266.acceleration = param1;
      }
      
      public function setTurnAccelaration(param1:Number) : void
      {
         this.name_266.turnAcceleration = param1;
      }
      
      public function method_1890() : Number
      {
         return this.name_266.acceleration;
      }
      
      public function method_1891() : int
      {
         return this.var_1710;
      }
      
      public function method_1892() : int
      {
         return this.var_1711;
      }
      
      public function name_1178() : Boolean
      {
         return this.var_1708.name_1168() || this.var_1707.name_1168();
      }
      
      public function method_1859(param1:Number, param2:Number, param3:Number) : void
      {
         this.method_1887();
         this.method_1885(param3);
         this.method_1884(param1,param2,param3);
         this.method_1882();
      }
      
      private function method_1887() : void
      {
         var _loc1_:Number = this.name_787.var_318.gravity.length() * this.name_787.mass;
         this.var_1713.method_1867(_loc1_ / (2 * name_906.const_1616 * (name_906.const_1618 - name_906.name_915)));
      }
      
      private function method_1885(param1:Number) : void
      {
         this.var_1708.method_1885(param1);
         this.var_1707.method_1885(param1);
      }
      
      private function method_1884(param1:Number, param2:Number, param3:Number) : void
      {
         if(this.var_1708.name_2089 + this.var_1707.name_2089 > 0)
         {
            this.method_1886(param1,param2,param3);
         }
      }
      
      private function method_1886(param1:Number, param2:Number, param3:Number) : void
      {
         var _loc4_:Vector3 = null;
         var _loc5_:Matrix3 = null;
         var _loc6_:Number = NaN;
         var _loc25_:Vector3 = null;
         _loc4_ = null;
         _loc5_ = null;
         _loc6_ = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:int = 0;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:int = 0;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         _loc25_ = this.name_787.state.name_187;
         _loc4_ = this.name_787.state.name_181;
         _loc5_ = this.name_787.name_225;
         var_1012.x = _loc5_.m00;
         var_1012.y = _loc5_.m10;
         var_1012.z = _loc5_.m20;
         const_1628.x = _loc5_.m01;
         const_1628.y = _loc5_.m11;
         const_1628.z = _loc5_.m21;
         const_1627.x = _loc5_.m02;
         const_1627.y = _loc5_.m12;
         const_1627.z = _loc5_.m22;
         _loc6_ = 1;
         var _loc26_:Number = Math.PI / 4;
         var _loc27_:Number = name_906.const_1617;
         if(const_1627.z < Math.cos(_loc26_))
         {
            if(const_1627.z < Math.cos(_loc27_))
            {
               _loc6_ = 0;
            }
            else
            {
               _loc6_ = (_loc27_ - Math.acos(const_1627.z)) / (_loc27_ - _loc26_);
            }
         }
         this.method_1888(const_1630,const_1629);
         const_1625.x = _loc25_.x - const_1630.x;
         const_1625.y = _loc25_.y - const_1630.y;
         const_1625.z = _loc25_.z - const_1630.z;
         const_1626.x = _loc4_.x - const_1629.x;
         const_1626.y = _loc4_.y - const_1629.y;
         const_1626.z = _loc4_.z - const_1629.z;
         var _loc28_:Number = const_1625.x * const_1628.x + const_1625.y * const_1628.y + const_1625.z * const_1628.z;
         var _loc29_:Number = const_1626.x * const_1627.x + const_1626.y * const_1627.y + const_1626.z * const_1627.z;
         var _loc30_:Number = const_1625.x * var_1012.x + const_1625.y * var_1012.y + const_1625.z * var_1012.z;
         var _loc31_:Number = this.name_266.sideAcceleration * _loc6_ * param3;
         if(_loc30_ < 0)
         {
            if(_loc31_ > -_loc30_)
            {
               _loc30_ = 0;
            }
            else
            {
               _loc30_ += _loc31_;
            }
         }
         else if(_loc30_ > 0)
         {
            if(_loc31_ > _loc30_)
            {
               _loc30_ = 0;
            }
            else
            {
               _loc30_ -= _loc31_;
            }
         }
         const_1625.setLengthAlongDirection(var_1012,_loc30_);
         _loc25_.x = const_1630.x + const_1625.x;
         _loc25_.y = const_1630.y + const_1625.y;
         _loc25_.z = const_1630.z + const_1625.z;
         var _loc32_:int = this.var_1708.name_2089;
         var _loc33_:int = this.var_1707.name_2089;
         var _loc34_:Number = this.name_266.acceleration;
         var _loc35_:Number = this.name_266.turnAcceleration;
         if(_loc32_ > 0 || _loc33_ > 0)
         {
            _loc7_ = 0;
            if(this.var_1710 == 0)
            {
               _loc7_ = -MathUtils.method_613(_loc28_) * _loc34_ * param3;
               if(MathUtils.method_613(_loc28_) != MathUtils.method_613(_loc28_ + _loc7_))
               {
                  _loc7_ = -_loc28_;
               }
            }
            else
            {
               if(MathUtils.method_613(_loc28_) * MathUtils.method_613(this.var_1710) < 0)
               {
                  _loc34_ = this.name_266.reverseAcceleration;
               }
               _loc7_ = this.var_1710 * _loc34_ * param3;
            }
            _loc8_ = MathUtils.method_218(_loc28_ + _loc7_,-param1,param1);
            _loc9_ = _loc8_ - _loc28_;
            _loc10_ = 1;
            _loc11_ = MathUtils.method_218(1 - Math.abs(_loc28_ / param1),0,1);
            if(_loc11_ < _loc10_ && this.var_1710 * MathUtils.method_613(_loc28_) > 0)
            {
               _loc9_ *= _loc11_ / _loc10_;
            }
            _loc12_ = _loc9_ / param3;
            if(Math.abs(_loc12_) < 400 && Math.abs(_loc8_) > 0.5 * this.maxSpeedSmoother.getTargetValue())
            {
               _loc12_ = MathUtils.method_607(_loc12_,0.1) * 400;
            }
            _loc13_ = _loc12_ * this.name_787.mass;
            _loc14_ = _loc32_ + _loc33_;
            _loc15_ = _loc13_ * (_loc14_ + 0.21 * (20 - _loc14_)) / 10;
            _loc16_ = _loc15_ / _loc14_;
            _loc17_ = Math.PI / 4;
            _loc18_ = Math.PI / 3;
            _loc19_ = 0;
            while(_loc19_ < name_906.const_1616)
            {
               this.method_1881(this.var_1708.name_2090[_loc19_],const_1628,_loc16_,_loc18_,_loc17_);
               this.method_1881(this.var_1707.name_2090[_loc19_],const_1628,_loc16_,_loc18_,_loc17_);
               _loc19_++;
            }
            _loc20_ = 1;
            if(_loc32_ == 0 || _loc33_ == 0)
            {
               _loc20_ = 0.5;
            }
            _loc21_ = 0;
            if(this.var_1711 == 0)
            {
               _loc21_ = -MathUtils.method_613(_loc29_) * this.name_266.turnReverseAcceleration * _loc6_ * param3;
               if(MathUtils.method_613(_loc29_) != MathUtils.method_613(_loc29_ + _loc21_))
               {
                  _loc21_ = -_loc29_;
               }
            }
            else
            {
               if(this.method_1889(this.var_1711,_loc29_,this.var_1710,this.var_1714))
               {
                  _loc35_ = this.name_266.turnReverseAcceleration;
               }
               _loc21_ = this.var_1711 * _loc35_ * _loc6_ * param3;
               if(this.var_1710 == -1 && this.var_1714)
               {
                  _loc21_ = -_loc21_;
               }
            }
            _loc22_ = param2;
            if(this.var_1711 != 0)
            {
               _loc22_ = param2 * this.var_1715 / 7;
            }
            _loc23_ = _loc22_ * _loc20_;
            _loc24_ = MathUtils.method_218(_loc29_ + _loc21_,-_loc23_,_loc23_);
            const_1626.setLengthAlongDirection(const_1627,_loc24_);
            _loc4_.x = const_1629.x + const_1626.x;
            _loc4_.y = const_1629.y + const_1626.y;
            _loc4_.z = const_1629.z + const_1626.z;
         }
      }
      
      private function method_1889(param1:int, param2:Number, param3:int, param4:Boolean) : Boolean
      {
         var _loc5_:int = param4 && param3 < 0 ? int(-1) : int(1);
         return param1 * param2 * _loc5_ < 0;
      }
      
      private function method_1888(param1:Vector3, param2:Vector3) : void
      {
         var _loc3_:name_2088 = null;
         var _loc4_:int = 0;
         var _loc5_:Vector3 = null;
         var _loc6_:Number = 1 / (this.var_1708.name_2089 + this.var_1707.name_2089);
         var _loc7_:Number = 0;
         var _loc8_:Number = 0;
         var _loc9_:Number = 0;
         _loc4_ = 0;
         while(_loc4_ < name_906.const_1616)
         {
            _loc3_ = this.var_1708.name_2090[_loc4_];
            if(_loc3_.name_2181)
            {
               _loc5_ = _loc3_.var_397.position;
               _loc7_ += _loc5_.x;
               _loc8_ += _loc5_.y;
               _loc9_ += _loc5_.z;
            }
            _loc3_ = this.var_1707.name_2090[_loc4_];
            if(_loc3_.name_2181)
            {
               _loc5_ = _loc3_.var_397.position;
               _loc7_ += _loc5_.x;
               _loc8_ += _loc5_.y;
               _loc9_ += _loc5_.z;
            }
            _loc4_++;
         }
         _loc7_ *= _loc6_;
         _loc8_ *= _loc6_;
         _loc9_ *= _loc6_;
         const_1631.x = _loc7_;
         const_1631.y = _loc8_;
         const_1631.z = _loc9_;
         param1.x = 0;
         param1.y = 0;
         param1.z = 0;
         param2.x = 0;
         param2.y = 0;
         param2.z = 0;
         _loc4_ = 0;
         while(_loc4_ < name_906.const_1616)
         {
            this.method_1880(this.var_1708.name_2090[_loc4_],const_1631,param1,param2);
            this.method_1880(this.var_1707.name_2090[_loc4_],const_1631,param1,param2);
            _loc4_++;
         }
         param1.x *= _loc6_;
         param1.y *= _loc6_;
         param1.z *= _loc6_;
         param2.x *= _loc6_;
         param2.y *= _loc6_;
         param2.z *= _loc6_;
      }
      
      private function method_1880(param1:name_2088, param2:Vector3, param3:Vector3, param4:Vector3) : void
      {
         var _loc5_:Vector3 = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Vector3 = null;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         if(param1.name_2181)
         {
            param3.x += param1.name_2183.x;
            param3.y += param1.name_2183.y;
            param3.z += param1.name_2183.z;
            _loc5_ = param1.var_397.position;
            _loc6_ = _loc5_.x - param2.x;
            _loc7_ = _loc5_.y - param2.y;
            _loc8_ = _loc5_.z - param2.z;
            _loc9_ = _loc6_ * _loc6_ + _loc7_ * _loc7_ + _loc8_ * _loc8_;
            if(_loc9_ > 1)
            {
               _loc10_ = 1 / _loc9_;
               _loc11_ = param1.name_2183;
               _loc12_ = (_loc7_ * _loc11_.z - _loc8_ * _loc11_.y) * _loc10_;
               _loc13_ = (_loc8_ * _loc11_.x - _loc6_ * _loc11_.z) * _loc10_;
               _loc14_ = (_loc6_ * _loc11_.y - _loc7_ * _loc11_.x) * _loc10_;
               param4.x += _loc12_;
               param4.y += _loc13_;
               param4.z += _loc14_;
            }
         }
      }
      
      private function method_1881(param1:name_2088, param2:Vector3, param3:Number, param4:Number, param5:Number) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         if(param1.name_2181)
         {
            _loc6_ = param2.x;
            _loc7_ = param2.y;
            _loc8_ = param2.z;
            _loc9_ = _loc6_ * _loc6_ + _loc7_ * _loc7_ + _loc8_ * _loc8_;
            if(_loc9_ > 0.00001)
            {
               _loc10_ = Math.acos(param1.var_397.normal.z);
               if(_loc10_ < 0)
               {
                  _loc10_ = -_loc10_;
               }
               if(_loc10_ < param4)
               {
                  _loc11_ = param3 / Math.sqrt(_loc9_);
                  if(_loc10_ > param5)
                  {
                     _loc11_ *= (param4 - _loc10_) / (param4 - param5);
                  }
                  const_1632.x = _loc6_ * _loc11_;
                  const_1632.y = _loc7_ * _loc11_;
                  const_1632.z = _loc8_ * _loc11_;
                  this.name_787.method_451(param1.method_976(),const_1632);
               }
            }
         }
      }
      
      private function method_1882() : void
      {
         var _loc1_:Matrix3 = null;
         var _loc2_:Vector3 = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         if(this.var_1707.name_2089 >= this.var_1707.name_2092 >> 1 || this.var_1708.name_2089 >= this.var_1708.name_2092 >> 1)
         {
            _loc1_ = this.name_787.name_225;
            _loc2_ = this.name_787.var_318.gravity;
            _loc3_ = _loc2_.x * _loc1_.m02 + _loc2_.y * _loc1_.m12 + _loc2_.z * _loc1_.m22;
            _loc4_ = _loc2_.vLength();
            _loc5_ = Math.SQRT1_2 * _loc4_;
            if(_loc3_ < -_loc5_ || _loc3_ > _loc5_)
            {
               _loc6_ = (_loc1_.m02 * _loc3_ - _loc2_.x) * this.name_787.mass;
               _loc7_ = (_loc1_.m12 * _loc3_ - _loc2_.y) * this.name_787.mass;
               _loc8_ = (_loc1_.m22 * _loc3_ - _loc2_.z) * this.name_787.mass;
               this.name_787.method_439(_loc6_,_loc7_,_loc8_);
            }
         }
      }
      
      public function reset() : void
      {
         this.maxSpeedSmoother.reset(this.maxSpeedSmoother.getTargetValue());
         this.maxTurnSpeedSmoother.reset(this.maxTurnSpeedSmoother.getTargetValue());
      }
      
      public function setMaxSpeed(param1:Number, param2:Boolean) : void
      {
         if(param2)
         {
            this.maxSpeedSmoother.reset(param1);
         }
         else
         {
            this.maxSpeedSmoother.setTargetValue(param1);
         }
      }
      
      public function setMaxTurnSpeed(param1:Number, param2:Boolean) : void
      {
         if(param2)
         {
            this.maxTurnSpeedSmoother.reset(param1);
         }
         else
         {
            this.maxTurnSpeedSmoother.setTargetValue(param1);
         }
      }
      
      public function update(param1:Number) : void
      {
         var _loc2_:Number = Number(this.maxSpeedSmoother.update(param1));
         var _loc3_:Number = Number(this.maxTurnSpeedSmoother.update(param1));
         this.name_787.method_434(_loc2_);
         this.method_1859(_loc2_,_loc3_,param1);
         this.name_787.var_315 = !this.name_1178() && this.var_321.method_1874();
      }
      
      public function render(param1:Number) : void
      {
         this.var_1716.name_2186(param1);
      }
      
      public function name_260(param1:int, param2:int, param3:int, param4:Boolean) : void
      {
         this.var_1710 = param1;
         this.var_1711 = param2;
         this.var_1715 = param3;
         this.var_1714 = param4;
      }
      
      public function name_939(param1:int) : void
      {
         this.var_1708.name_939(param1);
         this.var_1707.name_939(param1);
      }
      
      public function name_199() : int
      {
         return this.var_1708.name_2089 + this.var_1707.name_2089;
      }
      
      public function name_936() : Track
      {
         return this.var_1708;
      }
      
      public function name_958() : Track
      {
         return this.var_1707;
      }
      
      public function lock(param1:int) : void
      {
      }
      
      public function unlock(param1:int) : void
      {
      }
   }
}
