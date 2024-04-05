package package_277
{
   import alternativa.physics.collision.name_774;
   import alternativa.physics.name_888;
   import package_37.Matrix4;
   import package_37.Vector3;
   import package_61.name_767;
   
   public class name_2400 extends name_774
   {
       
      
      public var const_1653:Number = 0;
      
      public function name_2400(param1:Number, param2:int, param3:name_888)
      {
         super(2,param2,param3);
         this.const_1653 = param1;
      }
      
      override public function calculateAABB() : name_767
      {
         var _loc1_:name_767 = null;
         var _loc2_:Matrix4 = null;
         _loc1_ = null;
         _loc2_ = null;
         _loc1_ = this.var_308;
         _loc2_ = this.transform;
         _loc1_.name_738 = _loc2_.m03 + this.const_1653;
         _loc1_.name_714 = _loc2_.m03 - this.const_1653;
         _loc1_.name_739 = _loc2_.m13 + this.const_1653;
         _loc1_.name_699 = _loc2_.m13 - this.const_1653;
         _loc1_.name_760 = _loc2_.m23 + this.const_1653;
         _loc1_.minZ = _loc2_.m23 - this.const_1653;
         return _loc1_;
      }
      
      override public function raycast(param1:Vector3, param2:Vector3, param3:Number, param4:Vector3) : Number
      {
         var _loc5_:Matrix4 = this.transform;
         var _loc6_:Number = param1.x - _loc5_.m03;
         var _loc7_:Number = param1.y - _loc5_.m13;
         var _loc8_:Number = param1.z - _loc5_.m23;
         var _loc9_:Number = param2.x * _loc6_ + param2.y * _loc7_ + param2.z * _loc8_;
         if(_loc9_ > 0)
         {
            return -1;
         }
         var _loc10_:Number = param2.x * param2.x + param2.y * param2.y + param2.z * param2.z;
         var _loc11_:Number = _loc9_ * _loc9_ - _loc10_ * (_loc6_ * _loc6_ + _loc7_ * _loc7_ + _loc8_ * _loc8_ - this.const_1653 * this.const_1653);
         if(_loc11_ < 0)
         {
            return -1;
         }
         return -(_loc9_ + Math.sqrt(_loc11_)) / _loc10_;
      }
      
      override public function method_413(param1:name_774) : name_774
      {
         var _loc2_:name_2400 = param1 as name_2400;
         if(_loc2_ == null)
         {
            return this;
         }
         super.method_413(_loc2_);
         this.const_1653 = _loc2_.const_1653;
         return this;
      }
      
      override protected function method_1641() : name_774
      {
         return new name_2400(this.const_1653,collisionGroup,material);
      }
   }
}
