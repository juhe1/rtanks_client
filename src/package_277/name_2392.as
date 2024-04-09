package package_277
{
   import alternativa.physics.collision.CollisionPrimitive;
   import alternativa.physics.name_888;
   import package_37.Matrix4;
   import package_37.Vector3;
   import package_61.name_767;
   
   public class name_2392 extends CollisionPrimitive
   {
      
      private static const const_2312:Number = 0.005;
       
      
      public var hs:Vector3;
      
      public function name_2392(param1:Vector3, param2:int, param3:name_888)
      {
         this.hs = new Vector3();
         super(4,param2,param3);
         this.hs.vCopy(param1);
      }
      
      override public function calculateAABB() : name_767
      {
         var _loc1_:Matrix4 = null;
         _loc1_ = null;
         _loc1_ = transform;
         var _loc2_:Number = _loc1_.m00 < 0 ? Number(-_loc1_.m00) : Number(_loc1_.m00);
         var _loc3_:Number = _loc1_.m01 < 0 ? Number(-_loc1_.m01) : Number(_loc1_.m01);
         var _loc4_:Number = _loc1_.m02 < 0 ? Number(-_loc1_.m02) : Number(_loc1_.m02);
         var _loc5_:name_767 = this.var_308;
         _loc5_.name_738 = this.hs.x * _loc2_ + this.hs.y * _loc3_ + 0.005 * _loc4_;
         _loc5_.name_714 = -_loc5_.name_738;
         _loc2_ = _loc1_.m10 < 0 ? Number(-_loc1_.m10) : Number(_loc1_.m10);
         _loc3_ = _loc1_.m11 < 0 ? Number(-_loc1_.m11) : Number(_loc1_.m11);
         _loc4_ = _loc1_.m12 < 0 ? Number(-_loc1_.m12) : Number(_loc1_.m12);
         _loc5_.name_739 = this.hs.x * _loc2_ + this.hs.y * _loc3_ + 0.005 * _loc4_;
         _loc5_.name_699 = -_loc5_.name_739;
         _loc2_ = _loc1_.m20 < 0 ? Number(-_loc1_.m20) : Number(_loc1_.m20);
         _loc3_ = _loc1_.m21 < 0 ? Number(-_loc1_.m21) : Number(_loc1_.m21);
         _loc4_ = _loc1_.m22 < 0 ? Number(-_loc1_.m22) : Number(_loc1_.m22);
         _loc5_.name_760 = this.hs.x * _loc2_ + this.hs.y * _loc3_ + 0.005 * _loc4_;
         _loc5_.minZ = -_loc5_.name_760;
         _loc5_.name_714 += _loc1_.m03;
         _loc5_.name_738 += _loc1_.m03;
         _loc5_.name_699 += _loc1_.m13;
         _loc5_.name_739 += _loc1_.m13;
         _loc5_.minZ += _loc1_.m23;
         _loc5_.name_760 += _loc1_.m23;
         return _loc5_;
      }
      
      override public function method_413(param1:CollisionPrimitive) : CollisionPrimitive
      {
         var _loc2_:name_2392 = param1 as name_2392;
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
         return new name_2392(this.hs,collisionGroup,material);
      }
      
      override public function raycast(param1:Vector3, param2:Vector3, param3:Number, param4:Vector3) : Number
      {
         var _loc5_:Matrix4 = this.transform;
         var _loc6_:Number = param1.x - _loc5_.m03;
         var _loc7_:Number = param1.y - _loc5_.m13;
         var _loc8_:Number = param1.z - _loc5_.m23;
         var _loc9_:Number = _loc5_.m00 * _loc6_ + _loc5_.m10 * _loc7_ + _loc5_.m20 * _loc8_;
         var _loc10_:Number = _loc5_.m01 * _loc6_ + _loc5_.m11 * _loc7_ + _loc5_.m21 * _loc8_;
         var _loc11_:Number = _loc5_.m02 * _loc6_ + _loc5_.m12 * _loc7_ + _loc5_.m22 * _loc8_;
         _loc6_ = _loc5_.m00 * param2.x + _loc5_.m10 * param2.y + _loc5_.m20 * param2.z;
         _loc7_ = _loc5_.m01 * param2.x + _loc5_.m11 * param2.y + _loc5_.m21 * param2.z;
         _loc8_ = _loc5_.m02 * param2.x + _loc5_.m12 * param2.y + _loc5_.m22 * param2.z;
         if(_loc8_ > -param3 && _loc8_ < param3)
         {
            return -1;
         }
         var _loc12_:Number = -_loc11_ / _loc8_;
         if(_loc12_ < 0)
         {
            return -1;
         }
         _loc9_ += _loc6_ * _loc12_;
         _loc10_ += _loc7_ * _loc12_;
         _loc11_ = 0;
         if(_loc9_ < -this.hs.x - param3 || _loc9_ > this.hs.x + param3 || _loc10_ < -this.hs.y - param3 || _loc10_ > this.hs.y + param3)
         {
            return -1;
         }
         if(param2.x * _loc5_.m02 + param2.y * _loc5_.m12 + param2.z * _loc5_.m22 > 0)
         {
            param4.x = -_loc5_.m02;
            param4.y = -_loc5_.m12;
            param4.z = -_loc5_.m22;
         }
         else
         {
            param4.x = _loc5_.m02;
            param4.y = _loc5_.m12;
            param4.z = _loc5_.m22;
         }
         return _loc12_;
      }
   }
}
