package package_277
{
   import alternativa.physics.collision.CollisionPrimitive;
   import alternativa.physics.name_888;
   import package_37.Matrix4;
   import package_37.Vector3;
   import package_61.name_767;
   
   public class name_2398 extends CollisionPrimitive
   {
       
      
      public var v0:Vector3;
      
      public var v1:Vector3;
      
      public var v2:Vector3;
      
      public var e0:Vector3;
      
      public var e1:Vector3;
      
      public var e2:Vector3;
      
      public function name_2398(param1:Vector3, param2:Vector3, param3:Vector3, param4:int, param5:name_888)
      {
         this.v0 = new Vector3();
         this.v1 = new Vector3();
         this.v2 = new Vector3();
         this.e0 = new Vector3();
         this.e1 = new Vector3();
         this.e2 = new Vector3();
         super(8,param4,param5);
         this.method_2847(param1,param2,param3);
      }
      
      override public function calculateAABB() : name_767
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:name_767 = this.var_308;
         var _loc4_:Matrix4 = this.transform;
         var _loc6_:Number = 0.005 * _loc4_.m02;
         var _loc7_:Number = 0.005 * _loc4_.m12;
         var _loc8_:Number = 0.005 * _loc4_.m22;
         _loc1_ = this.v0.x * _loc4_.m00 + this.v0.y * _loc4_.m01;
         _loc3_.name_714 = _loc3_.name_738 = _loc1_ + _loc6_;
         _loc2_ = _loc1_ - _loc6_;
         if(_loc2_ > _loc3_.name_738)
         {
            _loc3_.name_738 = _loc2_;
         }
         else if(_loc2_ < _loc3_.name_714)
         {
            _loc3_.name_714 = _loc2_;
         }
         _loc1_ = this.v0.x * _loc4_.m10 + this.v0.y * _loc4_.m11;
         _loc3_.name_699 = _loc3_.name_739 = _loc1_ + _loc7_;
         _loc2_ = _loc1_ - _loc7_;
         if(_loc2_ > _loc3_.name_739)
         {
            _loc3_.name_739 = _loc2_;
         }
         else if(_loc2_ < _loc3_.name_699)
         {
            _loc3_.name_699 = _loc2_;
         }
         _loc1_ = this.v0.x * _loc4_.m20 + this.v0.y * _loc4_.m21;
         _loc3_.minZ = _loc3_.name_760 = _loc1_ + _loc8_;
         _loc2_ = _loc1_ - _loc8_;
         if(_loc2_ > _loc3_.name_760)
         {
            _loc3_.name_760 = _loc2_;
         }
         else if(_loc2_ < _loc3_.minZ)
         {
            _loc3_.minZ = _loc2_;
         }
         _loc1_ = this.v1.x * _loc4_.m00 + this.v1.y * _loc4_.m01;
         _loc2_ = _loc1_ + _loc6_;
         if(_loc2_ > _loc3_.name_738)
         {
            _loc3_.name_738 = _loc2_;
         }
         else if(_loc2_ < _loc3_.name_714)
         {
            _loc3_.name_714 = _loc2_;
         }
         _loc2_ = _loc1_ - _loc6_;
         if(_loc2_ > _loc3_.name_738)
         {
            _loc3_.name_738 = _loc2_;
         }
         else if(_loc2_ < _loc3_.name_714)
         {
            _loc3_.name_714 = _loc2_;
         }
         _loc1_ = this.v1.x * _loc4_.m10 + this.v1.y * _loc4_.m11;
         _loc2_ = _loc1_ + _loc7_;
         if(_loc2_ > _loc3_.name_739)
         {
            _loc3_.name_739 = _loc2_;
         }
         else if(_loc2_ < _loc3_.name_699)
         {
            _loc3_.name_699 = _loc2_;
         }
         _loc2_ = _loc1_ - _loc7_;
         if(_loc2_ > _loc3_.name_739)
         {
            _loc3_.name_739 = _loc2_;
         }
         else if(_loc2_ < _loc3_.name_699)
         {
            _loc3_.name_699 = _loc2_;
         }
         _loc1_ = this.v1.x * _loc4_.m20 + this.v1.y * _loc4_.m21;
         _loc2_ = _loc1_ + _loc8_;
         if(_loc2_ > _loc3_.name_760)
         {
            _loc3_.name_760 = _loc2_;
         }
         else if(_loc2_ < _loc3_.minZ)
         {
            _loc3_.minZ = _loc2_;
         }
         _loc2_ = _loc1_ - _loc8_;
         if(_loc2_ > _loc3_.name_760)
         {
            _loc3_.name_760 = _loc2_;
         }
         else if(_loc2_ < _loc3_.minZ)
         {
            _loc3_.minZ = _loc2_;
         }
         _loc1_ = this.v2.x * _loc4_.m00 + this.v2.y * _loc4_.m01;
         _loc2_ = _loc1_ + _loc6_;
         if(_loc2_ > _loc3_.name_738)
         {
            _loc3_.name_738 = _loc2_;
         }
         else if(_loc2_ < _loc3_.name_714)
         {
            _loc3_.name_714 = _loc2_;
         }
         _loc2_ = _loc1_ - _loc6_;
         if(_loc2_ > _loc3_.name_738)
         {
            _loc3_.name_738 = _loc2_;
         }
         else if(_loc2_ < _loc3_.name_714)
         {
            _loc3_.name_714 = _loc2_;
         }
         _loc1_ = this.v2.x * _loc4_.m10 + this.v2.y * _loc4_.m11;
         _loc2_ = _loc1_ + _loc7_;
         if(_loc2_ > _loc3_.name_739)
         {
            _loc3_.name_739 = _loc2_;
         }
         else if(_loc2_ < _loc3_.name_699)
         {
            _loc3_.name_699 = _loc2_;
         }
         _loc2_ = _loc1_ - _loc7_;
         if(_loc2_ > _loc3_.name_739)
         {
            _loc3_.name_739 = _loc2_;
         }
         else if(_loc2_ < _loc3_.name_699)
         {
            _loc3_.name_699 = _loc2_;
         }
         _loc1_ = this.v2.x * _loc4_.m20 + this.v2.y * _loc4_.m21;
         _loc2_ = _loc1_ + _loc8_;
         if(_loc2_ > _loc3_.name_760)
         {
            _loc3_.name_760 = _loc2_;
         }
         else if(_loc2_ < _loc3_.minZ)
         {
            _loc3_.minZ = _loc2_;
         }
         _loc2_ = _loc1_ - _loc8_;
         if(_loc2_ > _loc3_.name_760)
         {
            _loc3_.name_760 = _loc2_;
         }
         else if(_loc2_ < _loc3_.minZ)
         {
            _loc3_.minZ = _loc2_;
         }
         _loc3_.name_714 += _loc4_.m03;
         _loc3_.name_738 += _loc4_.m03;
         _loc3_.name_699 += _loc4_.m13;
         _loc3_.name_739 += _loc4_.m13;
         _loc3_.minZ += _loc4_.m23;
         _loc3_.name_760 += _loc4_.m23;
         return _loc3_;
      }
      
      override public function raycast(param1:Vector3, param2:Vector3, param3:Number, param4:Vector3) : Number
      {
         var _loc5_:Matrix4 = null;
         _loc5_ = this.transform;
         var _loc6_:Number = param2.x * _loc5_.m02 + param2.y * _loc5_.m12 + param2.z * _loc5_.m22;
         if(_loc6_ < param3 && _loc6_ > -param3)
         {
            return -1;
         }
         var _loc7_:Number = param1.x - _loc5_.m03;
         var _loc8_:Number = param1.y - _loc5_.m13;
         var _loc9_:Number = param1.z - _loc5_.m23;
         var _loc10_:Number = _loc7_ * _loc5_.m02 + _loc8_ * _loc5_.m12 + _loc9_ * _loc5_.m22;
         var _loc11_:Number = -_loc10_ / _loc6_;
         if(_loc11_ < 0)
         {
            return -1;
         }
         var _loc12_:Number = _loc7_ * _loc5_.m00 + _loc8_ * _loc5_.m10 + _loc9_ * _loc5_.m20;
         var _loc13_:Number = _loc7_ * _loc5_.m01 + _loc8_ * _loc5_.m11 + _loc9_ * _loc5_.m21;
         _loc7_ = _loc12_ + _loc11_ * (param2.x * _loc5_.m00 + param2.y * _loc5_.m10 + param2.z * _loc5_.m20);
         _loc8_ = _loc13_ + _loc11_ * (param2.x * _loc5_.m01 + param2.y * _loc5_.m11 + param2.z * _loc5_.m21);
         if(this.e0.x * (_loc8_ - this.v0.y) - this.e0.y * (_loc7_ - this.v0.x) < 0 || this.e1.x * (_loc8_ - this.v1.y) - this.e1.y * (_loc7_ - this.v1.x) < 0 || this.e2.x * (_loc8_ - this.v2.y) - this.e2.y * (_loc7_ - this.v2.x) < 0)
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
         return _loc11_;
      }
      
      override public function method_413(param1:CollisionPrimitive) : CollisionPrimitive
      {
         super.method_413(param1);
         var _loc2_:name_2398 = param1 as name_2398;
         if(_loc2_ != null)
         {
            this.v0.vCopy(_loc2_.v0);
            this.v1.vCopy(_loc2_.v1);
            this.v2.vCopy(_loc2_.v2);
            this.e0.vCopy(_loc2_.e0);
            this.e1.vCopy(_loc2_.e1);
            this.e2.vCopy(_loc2_.e2);
         }
         return this;
      }
      
      override protected function method_1641() : CollisionPrimitive
      {
         return new name_2398(this.v0,this.v1,this.v2,collisionGroup,material);
      }
      
      private function method_2847(param1:Vector3, param2:Vector3, param3:Vector3) : void
      {
         this.v0.vCopy(param1);
         this.v1.vCopy(param2);
         this.v2.vCopy(param3);
         this.e0.diff(param2,param1);
         this.e0.vNormalize();
         this.e1.diff(param3,param2);
         this.e1.vNormalize();
         this.e2.diff(param1,param3);
         this.e2.vNormalize();
      }
   }
}
