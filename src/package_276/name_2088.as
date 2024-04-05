package package_276
{
   import alternativa.physics.name_660;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_61.name_124;
   
   public class name_2088
   {
       
      
      public var collisionGroup:int;
      
      public var name_2181:Boolean = false;
      
      public var var_397:name_124;
      
      public var name_2793:Number = 0;
      
      public const name_2183:Vector3 = new Vector3();
      
      public var speed:Number = 0;
      
      private var name_787:name_660;
      
      private var const_114:Vector3;
      
      private var direction:Vector3;
      
      private var var_1713:name_906;
      
      private var var_2722:Vector3;
      
      private var var_2723:Vector3;
      
      private var var_2724:Number = 0;
      
      private var var_2184:name_2505;
      
      public function name_2088(param1:name_660, param2:Vector3, param3:Vector3, param4:name_906)
      {
         this.var_397 = new name_124();
         this.const_114 = new Vector3();
         this.direction = new Vector3();
         this.var_2722 = new Vector3();
         this.var_2723 = new Vector3();
         super();
         this.name_787 = param1;
         this.const_114.copy(param2);
         this.direction.copy(param3);
         this.var_1713 = param4;
         this.var_2184 = new name_2505(param1);
      }
      
      public function update(param1:Number) : void
      {
         this.raycast();
         if(this.name_2181)
         {
            this.method_2592(param1);
            this.method_2591();
         }
      }
      
      private function raycast() : void
      {
         var _loc1_:Matrix3 = this.name_787.name_225;
         this.var_2723.x = _loc1_.m00 * this.direction.x + _loc1_.m01 * this.direction.y + _loc1_.m02 * this.direction.z;
         this.var_2723.y = _loc1_.m10 * this.direction.x + _loc1_.m11 * this.direction.y + _loc1_.m12 * this.direction.z;
         this.var_2723.z = _loc1_.m20 * this.direction.x + _loc1_.m21 * this.direction.y + _loc1_.m22 * this.direction.z;
         var _loc2_:Vector3 = this.name_787.state.position;
         this.var_2722.x = _loc1_.m00 * this.const_114.x + _loc1_.m01 * this.const_114.y + _loc1_.m02 * this.const_114.z;
         this.var_2722.y = _loc1_.m10 * this.const_114.x + _loc1_.m11 * this.const_114.y + _loc1_.m12 * this.const_114.z;
         this.var_2722.z = _loc1_.m20 * this.const_114.x + _loc1_.m21 * this.const_114.y + _loc1_.m22 * this.const_114.z;
         this.var_2722.x += _loc2_.x;
         this.var_2722.y += _loc2_.y;
         this.var_2722.z += _loc2_.z;
         if(this.name_2181)
         {
            this.var_2724 = name_906.const_1618 - this.var_397.t;
         }
         this.name_2181 = this.name_787.var_318.name_247.raycast(this.var_2722,this.var_2723,this.collisionGroup,name_906.const_1618,this.var_2184,this.var_397);
         if(this.name_2181)
         {
            this.name_2181 = this.var_397.normal.z > name_906.const_1615;
         }
      }
      
      public function method_2592(param1:Number) : void
      {
         var _loc2_:Number = name_906.const_1618 - this.var_397.t;
         this.name_2793 = this.var_1713.method_1869 * _loc2_;
         var _loc3_:Number = (_loc2_ - this.var_2724) / param1;
         this.name_2793 += _loc3_ * this.var_1713.method_1868;
         if(this.name_2793 < 0)
         {
            this.name_2793 = 0;
         }
      }
      
      private function method_2591() : void
      {
         var _loc2_:Vector3 = null;
         var _loc3_:Vector3 = null;
         var _loc6_:Number = NaN;
         var _loc1_:Vector3 = null;
         _loc2_ = null;
         _loc3_ = null;
         var _loc4_:Vector3 = null;
         var _loc5_:Number = NaN;
         _loc6_ = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:name_660 = this.var_397.var_81.name_787;
         if(_loc8_.tank != null)
         {
            _loc1_ = _loc8_.state.position;
            _loc2_ = _loc8_.state.name_187;
            _loc3_ = _loc8_.state.name_181;
            _loc4_ = this.var_397.position;
            _loc5_ = _loc4_.x - _loc1_.x;
            _loc6_ = _loc4_.y - _loc1_.y;
            _loc7_ = _loc4_.z - _loc1_.z;
            this.name_2183.x = _loc3_.y * _loc7_ - _loc3_.z * _loc6_;
            this.name_2183.y = _loc3_.z * _loc5_ - _loc3_.x * _loc7_;
            this.name_2183.z = _loc3_.x * _loc6_ - _loc3_.y * _loc5_;
            this.name_2183.x += _loc2_.x;
            this.name_2183.y += _loc2_.y;
            this.name_2183.z += _loc2_.z;
         }
         else
         {
            this.name_2183.x = 0;
            this.name_2183.y = 0;
            this.name_2183.z = 0;
         }
      }
      
      public function name_2091() : Vector3
      {
         return this.var_2722;
      }
      
      public function name_2794() : Vector3
      {
         return this.var_2723;
      }
      
      public function method_976() : Vector3
      {
         return this.const_114;
      }
   }
}
