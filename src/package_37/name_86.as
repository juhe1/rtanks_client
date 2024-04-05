package package_37
{
   import flash.geom.Vector3D;
   
   public class name_86
   {
      
      private static var var_461:name_86 = new name_86();
       
      
      public var w:Number;
      
      public var x:Number;
      
      public var y:Number;
      
      public var z:Number;
      
      public function name_86(param1:Number = 1, param2:Number = 0, param3:Number = 0, param4:Number = 0)
      {
         super();
         this.w = param1;
         this.x = param2;
         this.y = param3;
         this.z = param4;
      }
      
      public static function method_678(param1:name_86, param2:name_86, param3:name_86) : void
      {
         param3.w = param1.w * param2.w - param1.x * param2.x - param1.y * param2.y - param1.z * param2.z;
         param3.x = param1.w * param2.x + param1.x * param2.w + param1.y * param2.z - param1.z * param2.y;
         param3.y = param1.w * param2.y + param1.y * param2.w + param1.z * param2.x - param1.x * param2.z;
         param3.z = param1.w * param2.z + param1.z * param2.w + param1.x * param2.y - param1.y * param2.x;
      }
      
      public static function method_676(param1:Vector3, param2:Number) : name_86
      {
         var _loc3_:name_86 = new name_86();
         _loc3_.method_674(param1,param2);
         return _loc3_;
      }
      
      public static function method_682(param1:Number, param2:Number, param3:Number, param4:Number) : name_86
      {
         var _loc5_:name_86 = new name_86();
         _loc5_.name_916(param1,param2,param3,param4);
         return _loc5_;
      }
      
      public function method_680() : Boolean
      {
         return isFinite(this.w) && isFinite(this.x) && isFinite(this.y) && isFinite(this.z);
      }
      
      public function reset(param1:Number = 1, param2:Number = 0, param3:Number = 0, param4:Number = 0) : name_86
      {
         this.w = param1;
         this.x = param2;
         this.y = param3;
         this.z = param4;
         return this;
      }
      
      public function normalize() : name_86
      {
         var _loc1_:Number = this.w * this.w + this.x * this.x + this.y * this.y + this.z * this.z;
         if(_loc1_ == 0)
         {
            this.w = 1;
         }
         else
         {
            _loc1_ = 1 / Math.sqrt(_loc1_);
            this.w *= _loc1_;
            this.x *= _loc1_;
            this.y *= _loc1_;
            this.z *= _loc1_;
         }
         return this;
      }
      
      public function toMatrix4(param1:Matrix4) : name_86
      {
         var _loc2_:Number = NaN;
         var _loc8_:Number = NaN;
         _loc2_ = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         _loc2_ = NaN;
         _loc3_ = NaN;
         _loc4_ = NaN;
         _loc5_ = NaN;
         _loc2_ = 2 * this.x * this.x;
         _loc8_ = 2 * this.y * this.y;
         _loc3_ = 2 * this.z * this.z;
         _loc6_ = 2 * this.x * this.y;
         _loc4_ = 2 * this.y * this.z;
         _loc7_ = 2 * this.z * this.x;
         _loc5_ = 2 * this.w * this.x;
         var _loc9_:Number = 2 * this.w * this.y;
         var _loc10_:Number = 2 * this.w * this.z;
         param1.m00 = 1 - _loc8_ - _loc3_;
         param1.m01 = _loc6_ - _loc10_;
         param1.m02 = _loc7_ + _loc9_;
         param1.m10 = _loc6_ + _loc10_;
         param1.m11 = 1 - _loc2_ - _loc3_;
         param1.m12 = _loc4_ - _loc5_;
         param1.m20 = _loc7_ - _loc9_;
         param1.m21 = _loc4_ + _loc5_;
         param1.m22 = 1 - _loc2_ - _loc8_;
         return this;
      }
      
      public function name_901(param1:name_86) : name_86
      {
         var _loc2_:Number = this.w * param1.w - this.x * param1.x - this.y * param1.y - this.z * param1.z;
         var _loc3_:Number = this.w * param1.x + this.x * param1.w + this.y * param1.z - this.z * param1.y;
         var _loc4_:Number = this.w * param1.y + this.y * param1.w + this.z * param1.x - this.x * param1.z;
         var _loc5_:Number = this.w * param1.z + this.z * param1.w + this.x * param1.y - this.y * param1.x;
         this.w = _loc2_;
         this.x = _loc3_;
         this.y = _loc4_;
         this.z = _loc5_;
         return this;
      }
      
      public function append(param1:name_86) : name_86
      {
         var _loc2_:Number = param1.w * this.w - param1.x * this.x - param1.y * this.y - param1.z * this.z;
         var _loc3_:Number = param1.w * this.x + param1.x * this.w + param1.y * this.z - param1.z * this.y;
         var _loc4_:Number = param1.w * this.y + param1.y * this.w + param1.z * this.x - param1.x * this.z;
         var _loc5_:Number = param1.w * this.z + param1.z * this.w + param1.x * this.y - param1.y * this.x;
         this.w = _loc2_;
         this.x = _loc3_;
         this.y = _loc4_;
         this.z = _loc5_;
         return this;
      }
      
      public function method_684(param1:Vector3) : name_86
      {
         var _loc2_:Number = -param1.x * this.x - param1.y * this.y - param1.z * this.z;
         var _loc3_:Number = param1.x * this.w + param1.y * this.z - param1.z * this.y;
         var _loc4_:Number = param1.y * this.w + param1.z * this.x - param1.x * this.z;
         var _loc5_:Number = param1.z * this.w + param1.x * this.y - param1.y * this.x;
         this.w = _loc2_;
         this.x = _loc3_;
         this.y = _loc4_;
         this.z = _loc5_;
         return this;
      }
      
      public function name_895(param1:Vector3, param2:Number) : name_86
      {
         var _loc3_:Number = param1.x * param2;
         var _loc4_:Number = param1.y * param2;
         var _loc5_:Number = param1.z * param2;
         var _loc6_:Number = -this.x * _loc3_ - this.y * _loc4_ - this.z * _loc5_;
         var _loc7_:Number = _loc3_ * this.w + _loc4_ * this.z - _loc5_ * this.y;
         var _loc8_:Number = _loc4_ * this.w + _loc5_ * this.x - _loc3_ * this.z;
         var _loc9_:Number = _loc5_ * this.w + _loc3_ * this.y - _loc4_ * this.x;
         this.w += 0.5 * _loc6_;
         this.x += 0.5 * _loc7_;
         this.y += 0.5 * _loc8_;
         this.z += 0.5 * _loc9_;
         var _loc10_:Number = this.w * this.w + this.x * this.x + this.y * this.y + this.z * this.z;
         if(_loc10_ == 0)
         {
            this.w = 1;
         }
         else
         {
            _loc10_ = 1 / Math.sqrt(_loc10_);
            this.w *= _loc10_;
            this.x *= _loc10_;
            this.y *= _loc10_;
            this.z *= _loc10_;
         }
         return this;
      }
      
      public function toMatrix3(param1:Matrix3) : name_86
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         _loc2_ = NaN;
         _loc3_ = NaN;
         var _loc4_:Number = NaN;
         _loc5_ = NaN;
         var _loc6_:Number = NaN;
         _loc2_ = 2 * this.x * this.x;
         _loc3_ = 2 * this.y * this.y;
         var _loc7_:Number = 2 * this.z * this.z;
         var _loc8_:Number = 2 * this.x * this.y;
         _loc4_ = 2 * this.y * this.z;
         _loc9_ = 2 * this.z * this.x;
         _loc10_ = 2 * this.w * this.x;
         _loc5_ = 2 * this.w * this.y;
         _loc6_ = 2 * this.w * this.z;
         param1.m00 = 1 - _loc3_ - _loc7_;
         param1.m01 = _loc8_ - _loc6_;
         param1.m02 = _loc9_ + _loc5_;
         param1.m10 = _loc8_ + _loc6_;
         param1.m11 = 1 - _loc2_ - _loc7_;
         param1.m12 = _loc4_ - _loc10_;
         param1.m20 = _loc9_ - _loc5_;
         param1.m21 = _loc4_ + _loc10_;
         param1.m22 = 1 - _loc2_ - _loc3_;
         return this;
      }
      
      public function method_675(param1:Vector3) : Vector3
      {
         var _loc2_:Number = NaN;
         _loc2_ = 2 * this.x * this.x;
         var _loc3_:Number = 2 * this.y * this.y;
         var _loc4_:Number = 2 * this.y * this.z;
         var _loc5_:Number = 2 * this.z * this.x;
         var _loc6_:Number = 2 * this.w * this.x;
         var _loc7_:Number = 2 * this.w * this.y;
         param1.x = _loc5_ + _loc7_;
         param1.y = _loc4_ - _loc6_;
         param1.z = 1 - _loc2_ - _loc3_;
         return param1;
      }
      
      public function method_677(param1:Vector3) : Vector3
      {
         var _loc3_:Number = NaN;
         var _loc2_:Number = NaN;
         _loc3_ = 2 * this.x * this.x;
         _loc2_ = 2 * this.z * this.z;
         var _loc4_:Number = 2 * this.x * this.y;
         var _loc5_:Number = 2 * this.y * this.z;
         var _loc6_:Number = 2 * this.w * this.x;
         var _loc7_:Number = 2 * this.w * this.z;
         param1.x = _loc4_ - _loc7_;
         param1.y = 1 - _loc3_ - _loc2_;
         param1.z = _loc5_ + _loc6_;
         return param1;
      }
      
      public function length() : Number
      {
         return Math.sqrt(this.w * this.w + this.x * this.x + this.y * this.y + this.z * this.z);
      }
      
      public function method_421() : Number
      {
         return this.w * this.w + this.x * this.x + this.y * this.y + this.z * this.z;
      }
      
      public function method_674(param1:Vector3, param2:Number) : name_86
      {
         this.w = Math.cos(0.5 * param2);
         var _loc3_:Number = Math.sin(0.5 * param2) / Math.sqrt(param1.x * param1.x + param1.y * param1.y + param1.z * param1.z);
         this.x = param1.x * _loc3_;
         this.y = param1.y * _loc3_;
         this.z = param1.z * _loc3_;
         return this;
      }
      
      public function name_916(param1:Number, param2:Number, param3:Number, param4:Number) : name_86
      {
         this.w = Math.cos(0.5 * param4);
         var _loc5_:Number = Math.sin(0.5 * param4) / Math.sqrt(param1 * param1 + param2 * param2 + param3 * param3);
         this.x = param1 * _loc5_;
         this.y = param2 * _loc5_;
         this.z = param3 * _loc5_;
         return this;
      }
      
      public function method_681(param1:Vector3 = null) : Vector3
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(this.w < -1 || this.w > 1)
         {
            this.normalize();
         }
         if(param1 == null)
         {
            param1 = new Vector3();
         }
         if(this.w > -1 && this.w < 1)
         {
            if(this.w == 0)
            {
               param1.x = this.x;
               param1.y = this.y;
               param1.z = this.z;
            }
            else
            {
               _loc2_ = 2 * Math.acos(this.w);
               _loc3_ = 1 / Math.sqrt(1 - this.w * this.w);
               param1.x = this.x * _loc3_ * _loc2_;
               param1.y = this.y * _loc3_ * _loc2_;
               param1.z = this.z * _loc3_ * _loc2_;
            }
         }
         else
         {
            param1.x = 0;
            param1.y = 0;
            param1.z = 0;
         }
         return param1;
      }
      
      public function name_182(param1:Vector3) : Vector3
      {
         var _loc2_:Number = 2 * this.x * this.x;
         var _loc3_:Number = 2 * this.y * this.y;
         var _loc4_:Number = 2 * this.z * this.z;
         var _loc5_:Number = 2 * this.x * this.y;
         var _loc6_:Number = 2 * this.y * this.z;
         var _loc7_:Number = 2 * this.z * this.x;
         var _loc8_:Number = 2 * this.w * this.x;
         var _loc9_:Number = 2 * this.w * this.y;
         var _loc10_:Number = 2 * this.w * this.z;
         var _loc11_:Number = 1 - _loc3_ - _loc4_;
         var _loc12_:Number = _loc5_ - _loc10_;
         var _loc13_:Number = _loc5_ + _loc10_;
         var _loc14_:Number = 1 - _loc2_ - _loc4_;
         var _loc15_:Number = _loc7_ - _loc9_;
         var _loc16_:Number = _loc6_ + _loc8_;
         var _loc17_:Number = 1 - _loc2_ - _loc3_;
         if(-1 < _loc15_ && _loc15_ < 1)
         {
            if(param1 == null)
            {
               param1 = new Vector3(Math.atan2(_loc16_,_loc17_),-Math.asin(_loc15_),Math.atan2(_loc13_,_loc11_));
            }
            else
            {
               param1.x = Math.atan2(_loc16_,_loc17_);
               param1.y = -Math.asin(_loc15_);
               param1.z = Math.atan2(_loc13_,_loc11_);
            }
         }
         else if(param1 == null)
         {
            param1 = new Vector3(0,0.5 * (_loc15_ <= -1 ? Math.PI : -Math.PI),Math.atan2(-_loc12_,_loc14_));
         }
         else
         {
            param1.x = 0;
            param1.y = _loc15_ <= -1 ? Number(Math.PI) : Number(-Math.PI);
            param1.y *= 0.5;
            param1.z = Math.atan2(-_loc12_,_loc14_);
         }
         return param1;
      }
      
      public function name_222(param1:Number, param2:Number, param3:Number) : void
      {
         this.name_916(1,0,0,param1);
         var_461.name_916(0,1,0,param2);
         this.append(var_461);
         this.normalize();
         var_461.name_916(0,0,1,param3);
         this.append(var_461);
         this.normalize();
      }
      
      public function method_683() : void
      {
         this.x = -this.x;
         this.y = -this.y;
         this.z = -this.z;
      }
      
      public function method_679(param1:name_86, param2:name_86, param3:Number) : name_86
      {
         var _loc4_:Number = 1 - param3;
         this.w = param1.w * _loc4_ + param2.w * param3;
         this.x = param1.x * _loc4_ + param2.x * param3;
         this.y = param1.y * _loc4_ + param2.y * param3;
         this.z = param1.z * _loc4_ + param2.z * param3;
         _loc4_ = this.w * this.w + this.x * this.x + this.y * this.y + this.z * this.z;
         if(_loc4_ == 0)
         {
            this.w = 1;
         }
         else
         {
            _loc4_ = 1 / Math.sqrt(_loc4_);
            this.w *= _loc4_;
            this.x *= _loc4_;
            this.y *= _loc4_;
            this.z *= _loc4_;
         }
         return this;
      }
      
      public function method_419(param1:name_86) : name_86
      {
         this.w -= param1.w;
         this.x -= param1.x;
         this.y -= param1.y;
         this.z -= param1.z;
         return this;
      }
      
      public function method_425(param1:name_86, param2:name_86) : name_86
      {
         this.w = param2.w - param1.w;
         this.x = param2.x - param1.x;
         this.y = param2.y - param1.y;
         this.z = param2.z - param1.z;
         return this;
      }
      
      public function copy(param1:name_86) : name_86
      {
         this.w = param1.w;
         this.x = param1.x;
         this.y = param1.y;
         this.z = param1.z;
         return this;
      }
      
      public function toVector3D(param1:Vector3D) : Vector3D
      {
         param1.x = this.x;
         param1.y = this.y;
         param1.z = this.z;
         param1.w = this.w;
         return param1;
      }
      
      public function clone() : name_86
      {
         return new name_86(this.w,this.x,this.y,this.z);
      }
      
      public function toString() : String
      {
         return "[" + this.w + ", " + this.x + ", " + this.y + ", " + this.z + "]";
      }
      
      public function name_205(param1:name_86, param2:name_86, param3:Number) : name_86
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = 1;
         var _loc11_:Number = param1.w * param2.w + param1.x * param2.x + param1.y * param2.y + param1.z * param2.z;
         if(_loc11_ < 0)
         {
            _loc11_ = -_loc11_;
            _loc10_ = -1;
         }
         if(1 - _loc11_ < 0.001)
         {
            _loc4_ = 1 - param3;
            _loc5_ = param3 * _loc10_;
            this.w = param1.w * _loc4_ + param2.w * _loc5_;
            this.x = param1.x * _loc4_ + param2.x * _loc5_;
            this.y = param1.y * _loc4_ + param2.y * _loc5_;
            this.z = param1.z * _loc4_ + param2.z * _loc5_;
            this.normalize();
         }
         else
         {
            _loc6_ = Math.acos(_loc11_);
            _loc7_ = Math.sin(_loc6_);
            _loc8_ = Math.sin((1 - param3) * _loc6_) / _loc7_;
            _loc9_ = Math.sin(param3 * _loc6_) / _loc7_ * _loc10_;
            this.w = param1.w * _loc8_ + param2.w * _loc9_;
            this.x = param1.x * _loc8_ + param2.x * _loc9_;
            this.y = param1.y * _loc8_ + param2.y * _loc9_;
            this.z = param1.z * _loc8_ + param2.z * _loc9_;
         }
         return this;
      }
   }
}
