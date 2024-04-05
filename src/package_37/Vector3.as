package package_37
{
   import flash.geom.Vector3D;
   import package_67.Vector3d;
   
   public class Vector3
   {
      
      public static const ZERO:Vector3 = new Vector3(0,0,0);
      
      public static const X_AXIS:Vector3 = new Vector3(1,0,0);
      
      public static const Y_AXIS:Vector3 = new Vector3(0,1,0);
      
      public static const Z_AXIS:Vector3 = new Vector3(0,0,1);
      
      public static const DOWN:Vector3 = new Vector3(0,0,-1);
       
      
      public var x:Number;
      
      public var y:Number;
      
      public var z:Number;
      
      public function Vector3(param1:Number = 0, param2:Number = 0, param3:Number = 0)
      {
         super();
         this.x = param1;
         this.y = param2;
         this.z = param3;
      }
      
      public static function isFiniteVector(param1:Vector3) : Boolean
      {
         return param1 != null && isFinite(param1.x) && isFinite(param1.y) && isFinite(param1.z);
      }
      
      public static function interpolate(param1:Number, param2:Vector3, param3:Vector3, param4:Vector3) : void
      {
         param4.x = param2.x + param1 * (param3.x - param2.x);
         param4.y = param2.y + param1 * (param3.y - param2.y);
         param4.z = param2.z + param1 * (param3.z - param2.z);
      }
      
      public static function distanceBetween(param1:Vector3, param2:Vector3) : Number
      {
         var _loc3_:Number = param1.x - param2.x;
         var _loc4_:Number = param1.y - param2.y;
         var _loc5_:Number = param1.z - param2.z;
         return Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_ + _loc5_ * _loc5_);
      }
      
      public function length() : Number
      {
         return Math.sqrt(this.x * this.x + this.y * this.y + this.z * this.z);
      }
      
      public function lengthSqr() : Number
      {
         return this.x * this.x + this.y * this.y + this.z * this.z;
      }
      
      public function setLength(param1:Number) : Vector3
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = this.x * this.x + this.y * this.y + this.z * this.z;
         if(_loc3_ == 0)
         {
            this.x = param1;
         }
         else
         {
            _loc2_ = param1 / Math.sqrt(this.x * this.x + this.y * this.y + this.z * this.z);
            this.x *= _loc2_;
            this.y *= _loc2_;
            this.z *= _loc2_;
         }
         return this;
      }
      
      public function setLengthAlongDirection(param1:Vector3, param2:Number) : void
      {
         var _loc3_:Number = this.x * param1.x + this.y * param1.y + this.z * param1.z;
         var _loc4_:Number = param2 - _loc3_;
         this.x += _loc4_ * param1.x;
         this.y += _loc4_ * param1.y;
         this.z += _loc4_ * param1.z;
      }
      
      public function vLength() : Number
      {
         return Math.sqrt(this.x * this.x + this.y * this.y + this.z * this.z);
      }
      
      public function isFiniteVector() : Boolean
      {
         return isFinite(this.x) && isFinite(this.y) && isFinite(this.z);
      }
      
      public function vLengthSqr() : Number
      {
         return this.x * this.x + this.y * this.y + this.z * this.z;
      }
      
      public function vSetLength(param1:Number) : Vector3
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = this.x * this.x + this.y * this.y + this.z * this.z;
         if(_loc3_ == 0)
         {
            this.x = param1;
         }
         else
         {
            _loc2_ = param1 / Math.sqrt(this.x * this.x + this.y * this.y + this.z * this.z);
            this.x *= _loc2_;
            this.y *= _loc2_;
            this.z *= _loc2_;
         }
         return this;
      }
      
      public function vNormalize() : Vector3
      {
         var _loc1_:Number = this.x * this.x + this.y * this.y + this.z * this.z;
         if(_loc1_ == 0)
         {
            this.x = 1;
         }
         else
         {
            _loc1_ = Math.sqrt(_loc1_);
            this.x /= _loc1_;
            this.y /= _loc1_;
            this.z /= _loc1_;
         }
         return this;
      }
      
      public function vAdd(param1:Vector3) : Vector3
      {
         this.x += param1.x;
         this.y += param1.y;
         this.z += param1.z;
         return this;
      }
      
      public function vSubtract(param1:Vector3) : Vector3
      {
         this.x -= param1.x;
         this.y -= param1.y;
         this.z -= param1.z;
         return this;
      }
      
      public function vAddScaled(param1:Number, param2:Vector3) : Vector3
      {
         this.x += param1 * param2.x;
         this.y += param1 * param2.y;
         this.z += param1 * param2.z;
         return this;
      }
      
      public function subtract(param1:Vector3) : Vector3
      {
         this.x -= param1.x;
         this.y -= param1.y;
         this.z -= param1.z;
         return this;
      }
      
      public function sum(param1:Vector3, param2:Vector3) : Vector3
      {
         this.x = param1.x + param2.x;
         this.y = param1.y + param2.y;
         this.z = param1.z + param2.z;
         return this;
      }
      
      public function diff(param1:Vector3, param2:Vector3) : Vector3
      {
         this.x = param1.x - param2.x;
         this.y = param1.y - param2.y;
         this.z = param1.z - param2.z;
         return this;
      }
      
      public function vCosAngle(param1:Vector3) : Number
      {
         return (this.x * param1.x + this.y * param1.y + this.z * param1.z) / (Math.sqrt(this.x * this.x + this.y * this.y + this.z * this.z) * Math.sqrt(param1.x * param1.x + param1.y * param1.y + param1.z * param1.z));
      }
      
      public function vScale(param1:Number) : Vector3
      {
         this.x *= param1;
         this.y *= param1;
         this.z *= param1;
         return this;
      }
      
      public function vReverse() : Vector3
      {
         this.x = -this.x;
         this.y = -this.y;
         this.z = -this.z;
         return this;
      }
      
      public function distanceToSquared(param1:Vector3) : Number
      {
         var _loc2_:Number = this.x - param1.x;
         var _loc3_:Number = this.y - param1.y;
         var _loc4_:Number = this.z - param1.z;
         return _loc2_ * _loc2_ + _loc3_ * _loc3_ + _loc4_ * _loc4_;
      }
      
      public function dot(param1:Vector3) : Number
      {
         return this.x * param1.x + this.y * param1.y + this.z * param1.z;
      }
      
      public function cross(param1:Vector3) : Vector3
      {
         var _loc2_:Number = this.y * param1.z - this.z * param1.y;
         var _loc3_:Number = this.z * param1.x - this.x * param1.z;
         var _loc4_:Number = this.x * param1.y - this.y * param1.x;
         this.x = _loc2_;
         this.y = _loc3_;
         this.z = _loc4_;
         return this;
      }
      
      public function vCross2(param1:Vector3, param2:Vector3) : Vector3
      {
         this.x = param1.y * param2.z - param1.z * param2.y;
         this.y = param1.z * param2.x - param1.x * param2.z;
         this.z = param1.x * param2.y - param1.y * param2.x;
         return this;
      }
      
      public function vTransformBy3(param1:Matrix3) : Vector3
      {
         var _loc2_:Number = this.x;
         var _loc3_:Number = this.y;
         var _loc4_:Number = this.z;
         this.x = param1.m00 * _loc2_ + param1.m01 * _loc3_ + param1.m02 * _loc4_;
         this.y = param1.m10 * _loc2_ + param1.m11 * _loc3_ + param1.m12 * _loc4_;
         this.z = param1.m20 * _loc2_ + param1.m21 * _loc3_ + param1.m22 * _loc4_;
         return this;
      }
      
      public function vTransformBy3Tr(param1:Matrix3) : Vector3
      {
         var _loc2_:Number = this.x;
         var _loc3_:Number = this.y;
         var _loc4_:Number = this.z;
         this.x = param1.m00 * _loc2_ + param1.m10 * _loc3_ + param1.m20 * _loc4_;
         this.y = param1.m01 * _loc2_ + param1.m11 * _loc3_ + param1.m21 * _loc4_;
         this.z = param1.m02 * _loc2_ + param1.m12 * _loc3_ + param1.m22 * _loc4_;
         return this;
      }
      
      public function method_411(param1:Matrix3) : Vector3
      {
         var _loc2_:Number = this.x;
         var _loc3_:Number = this.y;
         var _loc4_:Number = this.z;
         this.x = param1.m00 * _loc2_ + param1.m10 * _loc3_ + param1.m20 * _loc4_;
         this.y = param1.m01 * _loc2_ + param1.m11 * _loc3_ + param1.m21 * _loc4_;
         this.z = param1.m02 * _loc2_ + param1.m12 * _loc3_ + param1.m22 * _loc4_;
         return this;
      }
      
      public function vTransformBy4(param1:Matrix4) : Vector3
      {
         var _loc2_:Number = this.x;
         var _loc3_:Number = this.y;
         var _loc4_:Number = this.z;
         this.x = param1.m00 * _loc2_ + param1.m01 * _loc3_ + param1.m02 * _loc4_ + param1.m03;
         this.y = param1.m10 * _loc2_ + param1.m11 * _loc3_ + param1.m12 * _loc4_ + param1.m13;
         this.z = param1.m20 * _loc2_ + param1.m21 * _loc3_ + param1.m22 * _loc4_ + param1.m23;
         return this;
      }
      
      public function method_418(param1:Matrix4) : Vector3
      {
         var _loc2_:Number = this.x - param1.m03;
         var _loc3_:Number = this.y - param1.m13;
         var _loc4_:Number = this.z - param1.m23;
         this.x = param1.m00 * _loc2_ + param1.m10 * _loc3_ + param1.m20 * _loc4_;
         this.y = param1.m01 * _loc2_ + param1.m11 * _loc3_ + param1.m21 * _loc4_;
         this.z = param1.m02 * _loc2_ + param1.m12 * _loc3_ + param1.m22 * _loc4_;
         return this;
      }
      
      public function method_414(param1:Matrix4) : Vector3
      {
         var _loc2_:Number = this.x;
         var _loc3_:Number = this.y;
         var _loc4_:Number = this.z;
         this.x = param1.m00 * _loc2_ + param1.m01 * _loc3_ + param1.m02 * _loc4_;
         this.y = param1.m10 * _loc2_ + param1.m11 * _loc3_ + param1.m12 * _loc4_;
         this.z = param1.m20 * _loc2_ + param1.m21 * _loc3_ + param1.m22 * _loc4_;
         return this;
      }
      
      public function vCopy(param1:Vector3) : Vector3
      {
         this.x = param1.x;
         this.y = param1.y;
         this.z = param1.z;
         return this;
      }
      
      public function vClone() : Vector3
      {
         return new Vector3(this.x,this.y,this.z);
      }
      
      public function toVector3D(param1:Vector3D) : Vector3D
      {
         param1.x = this.x;
         param1.y = this.y;
         param1.z = this.z;
         return param1;
      }
      
      public function interpolate(param1:Number, param2:Vector3, param3:Vector3) : void
      {
         this.x = param2.x + param1 * (param3.x - param2.x);
         this.y = param2.y + param1 * (param3.y - param2.y);
         this.z = param2.z + param1 * (param3.z - param2.z);
      }
      
      public function copyFromVector3D(param1:Vector3D) : Vector3
      {
         this.x = param1.x;
         this.y = param1.y;
         this.z = param1.z;
         return this;
      }
      
      public function copyFrom(param1:Vector3D) : void
      {
         this.x = param1.x;
         this.y = param1.y;
         this.z = param1.z;
      }
      
      public function scale(param1:Number) : Vector3
      {
         this.x *= param1;
         this.y *= param1;
         this.z *= param1;
         return this;
      }
      
      public function reset(param1:Number = 0, param2:Number = 0, param3:Number = 0) : Vector3
      {
         this.x = param1;
         this.y = param2;
         this.z = param3;
         return this;
      }
      
      public function distanceTo(param1:Vector3) : Number
      {
         var _loc2_:Number = this.x - param1.x;
         var _loc3_:Number = this.y - param1.y;
         var _loc4_:Number = this.z - param1.z;
         return Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_ + _loc4_ * _loc4_);
      }
      
      public function normalize() : Vector3
      {
         var _loc1_:Number = this.x * this.x + this.y * this.y + this.z * this.z;
         if(_loc1_ == 0)
         {
            this.x = 1;
         }
         else
         {
            _loc1_ = Math.sqrt(_loc1_);
            this.x /= _loc1_;
            this.y /= _loc1_;
            this.z /= _loc1_;
         }
         return this;
      }
      
      public function add(param1:Vector3) : Vector3
      {
         this.x += param1.x;
         this.y += param1.y;
         this.z += param1.z;
         return this;
      }
      
      public function addScaled(param1:Number, param2:Vector3) : Vector3
      {
         this.x += param1 * param2.x;
         this.y += param1 * param2.y;
         this.z += param1 * param2.z;
         return this;
      }
      
      public function vRemove(param1:Vector3) : Vector3
      {
         this.x -= param1.x;
         this.y -= param1.y;
         this.z -= param1.z;
         return this;
      }
      
      public function vSum(param1:Vector3, param2:Vector3) : Vector3
      {
         this.x = param1.x + param2.x;
         this.y = param1.y + param2.y;
         this.z = param1.z + param2.z;
         return this;
      }
      
      public function vDiff(param1:Vector3, param2:Vector3) : Vector3
      {
         this.x = param1.x - param2.x;
         this.y = param1.y - param2.y;
         this.z = param1.z - param2.z;
         return this;
      }
      
      public function diff2d(param1:Vector3, param2:Vector3) : Vector3
      {
         this.x = param1.x - param2.x;
         this.y = param1.y - param2.y;
         this.z = 0;
         return this;
      }
      
      public function reverse() : Vector3
      {
         this.x = -this.x;
         this.y = -this.y;
         this.z = -this.z;
         return this;
      }
      
      public function vDot(param1:Vector3) : Number
      {
         return this.x * param1.x + this.y * param1.y + this.z * param1.z;
      }
      
      public function vCross(param1:Vector3) : Vector3
      {
         var xx:Number = this.y * param1.z - this.z * param1.y;
         var yy:Number = this.z * param1.x - this.x * param1.z;
         var zz:Number = this.x * param1.y - this.y * param1.x;
         this.x = xx;
         this.y = yy;
         this.z = zz;
         return this;
      }
      
      public function cross2(param1:Vector3, param2:Vector3) : Vector3
      {
         this.x = param1.y * param2.z - param1.z * param2.y;
         this.y = param1.z * param2.x - param1.x * param2.z;
         this.z = param1.x * param2.y - param1.y * param2.x;
         return this;
      }
      
      public function transform3(param1:Matrix3) : Vector3
      {
         var _loc2_:Number = this.x;
         var _loc3_:Number = this.y;
         var _loc4_:Number = this.z;
         this.x = param1.m00 * _loc2_ + param1.m01 * _loc3_ + param1.m02 * _loc4_;
         this.y = param1.m10 * _loc2_ + param1.m11 * _loc3_ + param1.m12 * _loc4_;
         this.z = param1.m20 * _loc2_ + param1.m21 * _loc3_ + param1.m22 * _loc4_;
         return this;
      }
      
      public function transform4(param1:Matrix4) : Vector3
      {
         var _loc2_:Number = this.x;
         var _loc3_:Number = this.y;
         var _loc4_:Number = this.z;
         this.x = param1.m00 * _loc2_ + param1.m01 * _loc3_ + param1.m02 * _loc4_ + param1.m03;
         this.y = param1.m10 * _loc2_ + param1.m11 * _loc3_ + param1.m12 * _loc4_ + param1.m13;
         this.z = param1.m20 * _loc2_ + param1.m21 * _loc3_ + param1.m22 * _loc4_ + param1.m23;
         return this;
      }
      
      public function method_410(param1:Matrix4) : Vector3
      {
         var _loc2_:Number = this.x;
         var _loc3_:Number = this.y;
         var _loc4_:Number = this.z;
         this.x = param1.m00 * _loc2_ + param1.m01 * _loc3_ + param1.m02 * _loc4_;
         this.y = param1.m10 * _loc2_ + param1.m11 * _loc3_ + param1.m12 * _loc4_;
         this.z = param1.m20 * _loc2_ + param1.m21 * _loc3_ + param1.m22 * _loc4_;
         return this;
      }
      
      public function method_423(param1:Matrix4) : Vector3
      {
         var _loc2_:Number = this.x - param1.m03;
         var _loc3_:Number = this.y - param1.m13;
         var _loc4_:Number = this.z - param1.m23;
         this.x = param1.m00 * _loc2_ + param1.m10 * _loc3_ + param1.m20 * _loc4_;
         this.y = param1.m01 * _loc2_ + param1.m11 * _loc3_ + param1.m21 * _loc4_;
         this.z = param1.m02 * _loc2_ + param1.m12 * _loc3_ + param1.m22 * _loc4_;
         return this;
      }
      
      public function method_402(param1:Matrix4) : Vector3
      {
         var _loc2_:Number = this.x;
         var _loc3_:Number = this.y;
         var _loc4_:Number = this.z;
         this.x = param1.m00 * _loc2_ + param1.m01 * _loc3_ + param1.m02 * _loc4_;
      this.y = param1.m10 * _loc2_ + param1.m11 * _loc3_ + param1.m12 * _loc4_;
         this.z = param1.m20 * _loc2_ + param1.m21 * _loc3_ + param1.m22 * _loc4_;
         return this;
      }
      
      public function copy(param1:Vector3) : Vector3
      {
         this.x = param1.x;
         this.y = param1.y;
         this.z = param1.z;
         return this;
      }
      
      public function clone() : Vector3
      {
         return new Vector3(this.x,this.y,this.z);
      }
      
      public function toString() : String
      {
         return "Vector3(" + this.x + ", " + this.y + ", " + this.z + ")";
      }
      
      public function toVector3d() : Vector3d
      {
         return new Vector3d(this.x,this.y,this.z);
      }
   }
}
