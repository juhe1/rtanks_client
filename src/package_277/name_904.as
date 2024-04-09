package package_277
{
   import alternativa.physics.collision.CollisionPrimitive;
   import alternativa.physics.name_888;
   import package_37.Matrix4;
   import package_37.Vector3;
   import package_61.name_767;
   
   public class name_904 extends CollisionPrimitive
   {
       
      
      public var hs:Vector3;
      
      public function name_904(param1:Vector3, param2:int, param3:name_888)
      {
         this.hs = new Vector3();
         super(1,param2,param3);
         this.hs.vCopy(param1);
      }
      
      override public function calculateAABB() : name_767
      {
         var _loc1_:Matrix4 = null;
         var _loc2_:name_767 = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         _loc1_ = transform;
         _loc2_ = this.var_308;
         _loc3_ = _loc1_.m00 < 0 ? Number(-_loc1_.m00) : Number(_loc1_.m00);
         _loc4_ = _loc1_.m01 < 0 ? Number(-_loc1_.m01) : Number(_loc1_.m01);
         _loc5_ = _loc1_.m02 < 0 ? Number(-_loc1_.m02) : Number(_loc1_.m02);
         _loc2_.name_738 = this.hs.x * _loc3_ + this.hs.y * _loc4_ + this.hs.z * _loc5_;
         _loc2_.name_714 = -_loc2_.name_738;
         _loc3_ = _loc1_.m10 < 0 ? Number(-_loc1_.m10) : Number(_loc1_.m10);
         _loc4_ = _loc1_.m11 < 0 ? Number(-_loc1_.m11) : Number(_loc1_.m11);
         _loc5_ = _loc1_.m12 < 0 ? Number(-_loc1_.m12) : Number(_loc1_.m12);
         _loc2_.name_739 = this.hs.x * _loc3_ + this.hs.y * _loc4_ + this.hs.z * _loc5_;
         _loc2_.name_699 = -_loc2_.name_739;
         _loc3_ = _loc1_.m20 < 0 ? Number(-_loc1_.m20) : Number(_loc1_.m20);
         _loc4_ = _loc1_.m21 < 0 ? Number(-_loc1_.m21) : Number(_loc1_.m21);
         _loc5_ = _loc1_.m22 < 0 ? Number(-_loc1_.m22) : Number(_loc1_.m22);
         _loc2_.name_760 = this.hs.x * _loc3_ + this.hs.y * _loc4_ + this.hs.z * _loc5_;
         _loc2_.minZ = -_loc2_.name_760;
         _loc2_.name_714 += _loc1_.m03;
         _loc2_.name_738 += _loc1_.m03;
         _loc2_.name_699 += _loc1_.m13;
         _loc2_.name_739 += _loc1_.m13;
         _loc2_.minZ += _loc1_.m23;
         _loc2_.name_760 += _loc1_.m23;
         return _loc2_;
      }
      
      override public function method_413(param1:CollisionPrimitive) : CollisionPrimitive
      {
         var _loc2_:name_904 = param1 as name_904;
         if(_loc2_ == null)
         {
            return this;
         }
         super.method_413(_loc2_);
         this.hs.vCopy(_loc2_.hs);
         return this;
      }
      
      override protected function method_1641() : CollisionPrimitive
      {
         return new name_904(this.hs,collisionGroup,material);
      }
      
      override public function raycast(param1:Vector3, param2:Vector3, param3:Number, param4:Vector3) : Number
      {
         var _loc5_:Matrix4 = null;
         var _loc12_:Number = NaN;
         _loc5_ = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         _loc5_ = this.transform;
         var _loc9_:Number = -1;
         var _loc10_:Number = 1e+308;
         _loc8_ = param1.x - _loc5_.m03;
         var _loc11_:Number = param1.y - _loc5_.m13;
         _loc12_ = param1.z - _loc5_.m23;
         var _loc13_:Number = _loc5_.m00 * _loc8_ + _loc5_.m10 * _loc11_ + _loc5_.m20 * _loc12_;
         var _loc14_:Number = _loc5_.m01 * _loc8_ + _loc5_.m11 * _loc11_ + _loc5_.m21 * _loc12_;
         var _loc15_:Number = _loc5_.m02 * _loc8_ + _loc5_.m12 * _loc11_ + _loc5_.m22 * _loc12_;
         _loc8_ = _loc5_.m00 * param2.x + _loc5_.m10 * param2.y + _loc5_.m20 * param2.z;
         _loc11_ = _loc5_.m01 * param2.x + _loc5_.m11 * param2.y + _loc5_.m21 * param2.z;
         _loc12_ = _loc5_.m02 * param2.x + _loc5_.m12 * param2.y + _loc5_.m22 * param2.z;
         if(_loc8_ < param3 && _loc8_ > -param3)
         {
            if(_loc13_ < -this.hs.x || _loc13_ > this.hs.x)
            {
               return -1;
            }
         }
         else
         {
            _loc6_ = (-this.hs.x - _loc13_) / _loc8_;
            _loc7_ = (this.hs.x - _loc13_) / _loc8_;
            if(_loc6_ < _loc7_)
            {
               if(_loc6_ > _loc9_)
               {
                  _loc9_ = _loc6_;
                  param4.x = -1;
                  param4.y = param4.z = 0;
               }
               if(_loc7_ < _loc10_)
               {
                  _loc10_ = _loc7_;
               }
            }
            else
            {
               if(_loc7_ > _loc9_)
               {
                  _loc9_ = _loc7_;
                  param4.x = 1;
                  param4.y = param4.z = 0;
               }
               if(_loc6_ < _loc10_)
               {
                  _loc10_ = _loc6_;
               }
            }
            if(_loc10_ < _loc9_)
            {
               return -1;
            }
         }
         if(_loc11_ < param3 && _loc11_ > -param3)
         {
            if(_loc14_ < -this.hs.y || _loc14_ > this.hs.y)
            {
               return -1;
            }
         }
         else
         {
            _loc6_ = (-this.hs.y - _loc14_) / _loc11_;
            _loc7_ = (this.hs.y - _loc14_) / _loc11_;
            if(_loc6_ < _loc7_)
            {
               if(_loc6_ > _loc9_)
               {
                  _loc9_ = _loc6_;
                  param4.y = -1;
                  param4.x = param4.z = 0;
               }
               if(_loc7_ < _loc10_)
               {
                  _loc10_ = _loc7_;
               }
            }
            else
            {
               if(_loc7_ > _loc9_)
               {
                  _loc9_ = _loc7_;
                  param4.y = 1;
                  param4.x = param4.z = 0;
               }
               if(_loc6_ < _loc10_)
               {
                  _loc10_ = _loc6_;
               }
            }
            if(_loc10_ < _loc9_)
            {
               return -1;
            }
         }
         if(_loc12_ < param3 && _loc12_ > -param3)
         {
            if(_loc15_ < -this.hs.z || _loc15_ > this.hs.z)
            {
               return -1;
            }
         }
         else
         {
            _loc6_ = (-this.hs.z - _loc15_) / _loc12_;
            _loc7_ = (this.hs.z - _loc15_) / _loc12_;
            if(_loc6_ < _loc7_)
            {
               if(_loc6_ > _loc9_)
               {
                  _loc9_ = _loc6_;
                  param4.z = -1;
                  param4.x = param4.y = 0;
               }
               if(_loc7_ < _loc10_)
               {
                  _loc10_ = _loc7_;
               }
            }
            else
            {
               if(_loc7_ > _loc9_)
               {
                  _loc9_ = _loc7_;
                  param4.z = 1;
                  param4.x = param4.y = 0;
               }
               if(_loc6_ < _loc10_)
               {
                  _loc10_ = _loc6_;
               }
            }
            if(_loc10_ < _loc9_)
            {
               return -1;
            }
         }
         _loc8_ = param4.x;
         _loc11_ = param4.y;
         _loc12_ = param4.z;
         param4.x = _loc5_.m00 * _loc8_ + _loc5_.m01 * _loc11_ + _loc5_.m02 * _loc12_;
         param4.y = _loc5_.m10 * _loc8_ + _loc5_.m11 * _loc11_ + _loc5_.m12 * _loc12_;
         param4.z = _loc5_.m20 * _loc8_ + _loc5_.m21 * _loc11_ + _loc5_.m22 * _loc12_;
         return _loc9_;
      }
   }
}
