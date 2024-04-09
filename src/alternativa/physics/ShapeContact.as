package alternativa.physics
{
   import alternativa.physics.collision.CollisionPrimitive;
   import package_37.Matrix3;
   import package_37.Vector3;
   
   public class ShapeContact
   {
      
      private static const pool:Vector.<ShapeContact> = new Vector.<ShapeContact>();
      
      private static var var_1982:int;
       
      
      public var position:Vector3;
      
      public var var_1985:Number;
      
      public var normal:Vector3;
      
      public var tangent1:Vector3;
      
      public var tangent2:Vector3;
      
      public var var_1984:Number;
      
      public var var_1986:Number;
      
      public var var_1983:Number;
      
      public var tangentSpeedDelta1:Number;
      
      public var tangentSpeedDelta2:Number;
      
      public var normalAngularInertiaTerm1:Number;
      
      public var normalAngularInertiaTerm2:Number;
      
      public var tangentAngularInertiaTerm11:Number;
      
      public var tangentAngularInertiaTerm12:Number;
      
      public var tangentAngularInertiaTerm21:Number;
      
      public var tangentAngularInertiaTerm22:Number;
      
      public var r1:Vector3;
      
      public var r2:Vector3;
      
      public var var_1987:Number;
      
      public var tangentImpulse1:Number;
      
      public var tangentImpulse2:Number;
      
      public var var_1988:Boolean;
      
      public var var_1687:Number;
      
      public var var_1688:Number;
      
      public var shape1:CollisionPrimitive;
      
      public var shape2:CollisionPrimitive;
      
      public function ShapeContact()
      {
         this.position = new Vector3();
         this.normal = new Vector3();
         this.tangent1 = new Vector3();
         this.tangent2 = new Vector3();
         this.r1 = new Vector3();
         this.r2 = new Vector3();
         super();
      }
      
      public static function create() : ShapeContact
      {
         if(var_1982 == 0)
         {
            return new ShapeContact();
         }
         --var_1982;
         var _loc1_:ShapeContact = pool[var_1982];
         pool[var_1982] = null;
         return _loc1_;
      }
      
      public function dispose() : void
      {
         this.shape1 = null;
         this.shape2 = null;
         pool[var_1982] = this;
         ++var_1982;
      }
      
      public function name_2172() : void
      {
         var _loc1_:Vector3 = null;
         var _loc2_:Body = this.shape1.name_787;
         var _loc3_:Body = this.shape2.name_787;
         this.var_1687 = this.shape1.material.var_1687;
         var _loc4_:Number = this.shape2.material.var_1687;
         if(_loc4_ < this.var_1687)
         {
            this.var_1687 = _loc4_;
         }
         this.var_1688 = this.shape1.material.var_1688;
         var _loc5_:Number = this.shape2.material.var_1688;
         if(_loc5_ < this.var_1688)
         {
            this.var_1688 = _loc5_;
         }
         if(_loc2_.var_315 && !_loc3_.var_317 || _loc3_.var_315 && !_loc2_.var_317)
         {
            this.var_1688 = 0;
         }
         _loc1_ = this.shape1.name_787.state.position;
         this.r1.x = this.position.x - _loc1_.x;
         this.r1.y = this.position.y - _loc1_.y;
         this.r1.z = this.position.z - _loc1_.z;
         _loc1_ = this.shape2.name_787.state.position;
         this.r2.x = this.position.x - _loc1_.x;
         this.r2.y = this.position.y - _loc1_.y;
         this.r2.z = this.position.z - _loc1_.z;
         if(Math.abs(this.normal.x) < Math.abs(this.normal.y))
         {
            this.tangent1.vCross2(this.normal,Vector3.X_AXIS).normalize();
         }
         else
         {
            this.tangent1.vCross2(this.normal,Vector3.Y_AXIS).normalize();
         }
         this.tangent2.vCross2(this.normal,this.tangent1);
         this.var_1987 = 0;
         this.tangentImpulse1 = 0;
         this.tangentImpulse2 = 0;
         this.var_1983 = 0;
         this.tangentSpeedDelta1 = 0;
         this.tangentSpeedDelta2 = 0;
         if(_loc2_.var_317)
         {
            this.normalAngularInertiaTerm1 = this.method_2082(this.normal,this.r1,_loc2_.var_295);
            this.tangentAngularInertiaTerm11 = this.method_2082(this.tangent1,this.r1,_loc2_.var_295);
            this.tangentAngularInertiaTerm12 = this.method_2082(this.tangent2,this.r1,_loc2_.var_295);
            this.var_1983 += _loc2_.invMass + this.normalAngularInertiaTerm1;
            this.tangentSpeedDelta1 += _loc2_.invMass + this.tangentAngularInertiaTerm11;
            this.tangentSpeedDelta2 += _loc2_.invMass + this.tangentAngularInertiaTerm12;
         }
         if(_loc3_.var_317)
         {
            this.normalAngularInertiaTerm2 = this.method_2082(this.normal,this.r2,_loc3_.var_295);
            this.tangentAngularInertiaTerm21 = this.method_2082(this.tangent1,this.r2,_loc3_.var_295);
            this.tangentAngularInertiaTerm22 = this.method_2082(this.tangent2,this.r2,_loc3_.var_295);
            this.var_1983 += _loc3_.invMass + this.normalAngularInertiaTerm2;
            this.tangentSpeedDelta1 += _loc3_.invMass + this.tangentAngularInertiaTerm21;
            this.tangentSpeedDelta2 += _loc3_.invMass + this.tangentAngularInertiaTerm22;
         }
         this.var_1984 = this.method_2083();
         if(this.var_1984 < 0)
         {
            this.var_1984 = -this.var_1687 * this.var_1984;
         }
         else
         {
            this.var_1984 = 0;
         }
      }
      
      private function method_2082(param1:Vector3, param2:Vector3, param3:Matrix3) : Number
      {
         var _loc4_:Number = param2.y * param1.z - param2.z * param1.y;
         var _loc5_:Number = param2.z * param1.x - param2.x * param1.z;
         var _loc6_:Number = param2.x * param1.y - param2.y * param1.x;
         var _loc7_:Number = param3.m00 * _loc4_ + param3.m01 * _loc5_ + param3.m02 * _loc6_;
         var _loc8_:Number = param3.m10 * _loc4_ + param3.m11 * _loc5_ + param3.m12 * _loc6_;
         var _loc9_:Number = param3.m20 * _loc4_ + param3.m21 * _loc5_ + param3.m22 * _loc6_;
         _loc4_ = _loc8_ * param2.z - _loc9_ * param2.y;
         _loc5_ = _loc9_ * param2.x - _loc7_ * param2.z;
         _loc6_ = _loc7_ * param2.y - _loc8_ * param2.x;
         return _loc4_ * param1.x + _loc5_ * param1.y + _loc6_ * param1.z;
      }
      
      public function method_2083() : Number
      {
         var _loc1_:Vector3 = this.shape1.name_787.state.name_181;
         var _loc2_:Number = _loc1_.y * this.r1.z - _loc1_.z * this.r1.y;
         var _loc3_:Number = _loc1_.z * this.r1.x - _loc1_.x * this.r1.z;
         var _loc4_:Number = _loc1_.x * this.r1.y - _loc1_.y * this.r1.x;
         var _loc5_:Vector3 = this.shape1.name_787.state.name_187;
         var _loc6_:Number = _loc5_.x + _loc2_;
         var _loc7_:Number = _loc5_.y + _loc3_;
         var _loc8_:Number = _loc5_.z + _loc4_;
         _loc1_ = this.shape2.name_787.state.name_181;
         _loc2_ = _loc1_.y * this.r2.z - _loc1_.z * this.r2.y;
         _loc3_ = _loc1_.z * this.r2.x - _loc1_.x * this.r2.z;
         _loc4_ = _loc1_.x * this.r2.y - _loc1_.y * this.r2.x;
         _loc5_ = this.shape2.name_787.state.name_187;
         _loc6_ -= _loc5_.x + _loc2_;
         _loc7_ -= _loc5_.y + _loc3_;
         _loc8_ -= _loc5_.z + _loc4_;
         return _loc6_ * this.normal.x + _loc7_ * this.normal.y + _loc8_ * this.normal.z;
      }
      
      public function name_2173(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Body = this.shape1.name_787;
         var _loc7_:Body = this.shape2.name_787;
         this.var_1983 = 0;
         this.tangentSpeedDelta1 = 0;
         this.tangentSpeedDelta2 = 0;
         if(_loc6_.var_317)
         {
            this.var_1983 += _loc6_.invMass + this.normalAngularInertiaTerm1;
            this.tangentSpeedDelta1 += _loc6_.invMass + this.tangentAngularInertiaTerm11;
            this.tangentSpeedDelta2 += _loc6_.invMass + this.tangentAngularInertiaTerm12;
         }
         if(_loc7_.var_317)
         {
            this.var_1983 += _loc7_.invMass + this.normalAngularInertiaTerm2;
            this.tangentSpeedDelta1 += _loc7_.invMass + this.tangentAngularInertiaTerm21;
            this.tangentSpeedDelta2 += _loc7_.invMass + this.tangentAngularInertiaTerm22;
         }
         if(this.var_1985 > param1)
         {
            _loc5_ = this.var_1985 - param1;
            if(_loc5_ > param3)
            {
               _loc5_ = param3;
            }
            this.var_1986 = param2 * _loc5_ / param4;
         }
         else
         {
            this.var_1986 = 0;
         }
      }
   }
}
