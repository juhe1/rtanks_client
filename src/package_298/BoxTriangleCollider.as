package package_298
{
   import alternativa.physics.ShapeContact;
   import alternativa.physics.collision.name_1172;
   import alternativa.physics.collision.CollisionPrimitive;
   import package_277.name_2398;
   import package_277.name_904;
   import package_37.Matrix4;
   import package_37.Vector3;
   
   public class BoxTriangleCollider implements name_1172
   {
       
      
      public var var_1991:Number;
      
      private var var_1990:Number;
      
      private const const_1774:Vector3 = new Vector3();
      
      private const axis:Vector3 = new Vector3();
      
      private const axis10:Vector3 = new Vector3();
      
      private const axis11:Vector3 = new Vector3();
      
      private const axis12:Vector3 = new Vector3();
      
      private const axis20:Vector3 = new Vector3();
      
      private const axis21:Vector3 = new Vector3();
      
      private const axis22:Vector3 = new Vector3();
      
      private const const_1769:Vector3 = new Vector3();
      
      private const const_1770:Matrix4 = new Matrix4();
      
      private const const_1768:Vector.<Vertex> = Vector.<Vertex>([new Vertex(),new Vertex(),new Vertex(),new Vertex()]);
      
      private const const_1775:Vector.<Vertex> = Vector.<Vertex>([new Vertex(),new Vertex(),new Vertex()]);
      
      public function BoxTriangleCollider(param1:Number)
      {
         super();
         this.var_1991 = param1;
      }
      
      public function method_694(param1:CollisionPrimitive, param2:CollisionPrimitive, param3:Vector.<ShapeContact>) : void
      {
         var _loc4_:name_2398 = null;
         var _loc5_:name_904 = null;
         if(!this.name_1176(param1,param2))
         {
            return;
         }
         if(param1 is name_904)
         {
            _loc5_ = name_904(param1);
            _loc4_ = name_2398(param2);
         }
         else
         {
            _loc5_ = name_904(param2);
            _loc4_ = name_2398(param1);
         }
         this.method_2088(_loc5_,_loc4_,this.const_1769,param3);
      }
      
      public function name_1176(param1:CollisionPrimitive, param2:CollisionPrimitive) : Boolean
      {
         var _loc5_:Matrix4 = null;
         var _loc7_:Vector3 = null;
         var _loc3_:name_2398 = null;
         var _loc4_:name_904 = null;
         _loc5_ = null;
         var _loc6_:Matrix4 = null;
         _loc7_ = null;
         if(param1 is name_904)
         {
            _loc4_ = name_904(param1);
            _loc3_ = name_2398(param2);
         }
         else
         {
            _loc4_ = name_904(param2);
            _loc3_ = name_2398(param1);
         }
         _loc5_ = _loc4_.transform;
         _loc6_ = _loc3_.transform;
         this.const_1774.x = _loc5_.m03 - _loc6_.m03;
         this.const_1774.y = _loc5_.m13 - _loc6_.m13;
         this.const_1774.z = _loc5_.m23 - _loc6_.m23;
         this.var_1990 = 10000000000;
         this.axis.x = _loc6_.m02;
         this.axis.y = _loc6_.m12;
         this.axis.z = _loc6_.m22;
         if(!this.method_2094(_loc4_,_loc3_,this.axis,this.const_1774))
         {
            return false;
         }
         this.axis10.x = _loc5_.m00;
         this.axis10.y = _loc5_.m10;
         this.axis10.z = _loc5_.m20;
         if(!this.method_2094(_loc4_,_loc3_,this.axis10,this.const_1774))
         {
            return false;
         }
         this.axis11.x = _loc5_.m01;
         this.axis11.y = _loc5_.m11;
         this.axis11.z = _loc5_.m21;
         if(!this.method_2094(_loc4_,_loc3_,this.axis11,this.const_1774))
         {
            return false;
         }
         this.axis12.x = _loc5_.m02;
         this.axis12.y = _loc5_.m12;
         this.axis12.z = _loc5_.m22;
         if(!this.method_2094(_loc4_,_loc3_,this.axis12,this.const_1774))
         {
            return false;
         }
         _loc7_ = _loc3_.e0;
         this.axis20.x = _loc6_.m00 * _loc7_.x + _loc6_.m01 * _loc7_.y + _loc6_.m02 * _loc7_.z;
         this.axis20.y = _loc6_.m10 * _loc7_.x + _loc6_.m11 * _loc7_.y + _loc6_.m12 * _loc7_.z;
         this.axis20.z = _loc6_.m20 * _loc7_.x + _loc6_.m21 * _loc7_.y + _loc6_.m22 * _loc7_.z;
         if(!this.method_2093(_loc4_,_loc3_,this.axis10,this.axis20,this.const_1774))
         {
            return false;
         }
         if(!this.method_2093(_loc4_,_loc3_,this.axis11,this.axis20,this.const_1774))
         {
            return false;
         }
         if(!this.method_2093(_loc4_,_loc3_,this.axis12,this.axis20,this.const_1774))
         {
            return false;
         }
         _loc7_ = _loc3_.e1;
         this.axis21.x = _loc6_.m00 * _loc7_.x + _loc6_.m01 * _loc7_.y + _loc6_.m02 * _loc7_.z;
         this.axis21.y = _loc6_.m10 * _loc7_.x + _loc6_.m11 * _loc7_.y + _loc6_.m12 * _loc7_.z;
         this.axis21.z = _loc6_.m20 * _loc7_.x + _loc6_.m21 * _loc7_.y + _loc6_.m22 * _loc7_.z;
         if(!this.method_2093(_loc4_,_loc3_,this.axis10,this.axis21,this.const_1774))
         {
            return false;
         }
         if(!this.method_2093(_loc4_,_loc3_,this.axis11,this.axis21,this.const_1774))
         {
            return false;
         }
         if(!this.method_2093(_loc4_,_loc3_,this.axis12,this.axis21,this.const_1774))
         {
            return false;
         }
         _loc7_ = _loc3_.e2;
         this.axis22.x = _loc6_.m00 * _loc7_.x + _loc6_.m01 * _loc7_.y + _loc6_.m02 * _loc7_.z;
         this.axis22.y = _loc6_.m10 * _loc7_.x + _loc6_.m11 * _loc7_.y + _loc6_.m12 * _loc7_.z;
         this.axis22.z = _loc6_.m20 * _loc7_.x + _loc6_.m21 * _loc7_.y + _loc6_.m22 * _loc7_.z;
         if(!this.method_2093(_loc4_,_loc3_,this.axis10,this.axis22,this.const_1774))
         {
            return false;
         }
         if(!this.method_2093(_loc4_,_loc3_,this.axis11,this.axis22,this.const_1774))
         {
            return false;
         }
         return this.method_2093(_loc4_,_loc3_,this.axis12,this.axis22,this.const_1774);
      }
      
      private function method_2094(param1:name_904, param2:name_2398, param3:Vector3, param4:Vector3) : Boolean
      {
         var _loc5_:Number = this.method_2086(param1,param2,param3,param4);
         return this.method_2087(_loc5_,param3);
      }
      
      private function method_2087(param1:Number, param2:Vector3) : Boolean
      {
         if(param1 < this.var_1991)
         {
            return false;
         }
         if(param1 + this.var_1991 < this.var_1990)
         {
            this.var_1990 = param1;
            this.const_1769.x = param2.x;
            this.const_1769.y = param2.y;
            this.const_1769.z = param2.z;
         }
         return true;
      }
      
      private function method_2093(param1:name_904, param2:name_2398, param3:Vector3, param4:Vector3, param5:Vector3) : Boolean
      {
         var _loc6_:Number = NaN;
         this.axis.x = param3.y * param4.z - param3.z * param4.y;
         this.axis.y = param3.z * param4.x - param3.x * param4.z;
         this.axis.z = param3.x * param4.y - param3.y * param4.x;
         var _loc7_:Number = this.axis.x * this.axis.x + this.axis.y * this.axis.y + this.axis.z * this.axis.z;
         if(_loc7_ < 1e-10)
         {
            return true;
         }
         _loc6_ = 1 / Math.sqrt(_loc7_);
         this.axis.x *= _loc6_;
         this.axis.y *= _loc6_;
         this.axis.z *= _loc6_;
         var _loc8_:Number = this.method_2086(param1,param2,this.axis,param5);
         return this.method_2087(_loc8_,this.axis);
      }
      
      private function method_2086(param1:name_904, param2:name_2398, param3:Vector3, param4:Vector3) : Number
      {
         var _loc5_:Number = NaN;
         var _loc6_:Matrix4 = param1.transform;
         var _loc7_:Vector3 = param1.hs;
         var _loc8_:Number = 0;
         _loc5_ = (_loc6_.m00 * param3.x + _loc6_.m10 * param3.y + _loc6_.m20 * param3.z) * _loc7_.x;
         if(_loc5_ < 0)
         {
            _loc8_ -= _loc5_;
         }
         else
         {
            _loc8_ += _loc5_;
         }
         _loc5_ = (_loc6_.m01 * param3.x + _loc6_.m11 * param3.y + _loc6_.m21 * param3.z) * _loc7_.y;
         if(_loc5_ < 0)
         {
            _loc8_ -= _loc5_;
         }
         else
         {
            _loc8_ += _loc5_;
         }
         _loc5_ = (_loc6_.m02 * param3.x + _loc6_.m12 * param3.y + _loc6_.m22 * param3.z) * _loc7_.z;
         if(_loc5_ < 0)
         {
            _loc8_ -= _loc5_;
         }
         else
         {
            _loc8_ += _loc5_;
         }
         var _loc9_:Number = param4.x * param3.x + param4.y * param3.y + param4.z * param3.z;
         var _loc10_:Matrix4 = param2.transform;
         var _loc11_:Number = _loc10_.m00 * param3.x + _loc10_.m10 * param3.y + _loc10_.m20 * param3.z;
         var _loc12_:Number = _loc10_.m01 * param3.x + _loc10_.m11 * param3.y + _loc10_.m21 * param3.z;
         var _loc13_:Number = _loc10_.m02 * param3.x + _loc10_.m12 * param3.y + _loc10_.m22 * param3.z;
         var _loc14_:Number = 0;
         var _loc15_:Vector3 = param2.v0;
         var _loc16_:Vector3 = param2.v1;
         var _loc17_:Vector3 = param2.v2;
         if(_loc9_ < 0)
         {
            _loc9_ = -_loc9_;
            _loc5_ = _loc15_.x * _loc11_ + _loc15_.y * _loc12_ + _loc15_.z * _loc13_;
            if(_loc5_ < _loc14_)
            {
               _loc14_ = _loc5_;
            }
            _loc5_ = _loc16_.x * _loc11_ + _loc16_.y * _loc12_ + _loc16_.z * _loc13_;
            if(_loc5_ < _loc14_)
            {
               _loc14_ = _loc5_;
            }
            _loc5_ = _loc17_.x * _loc11_ + _loc17_.y * _loc12_ + _loc17_.z * _loc13_;
            if(_loc5_ < _loc14_)
            {
               _loc14_ = _loc5_;
            }
            _loc14_ = -_loc14_;
         }
         else
         {
            _loc5_ = _loc15_.x * _loc11_ + _loc15_.y * _loc12_ + _loc15_.z * _loc13_;
            if(_loc5_ > _loc14_)
            {
               _loc14_ = _loc5_;
            }
            _loc5_ = _loc16_.x * _loc11_ + _loc16_.y * _loc12_ + _loc16_.z * _loc13_;
            if(_loc5_ > _loc14_)
            {
               _loc14_ = _loc5_;
            }
            _loc5_ = _loc17_.x * _loc11_ + _loc17_.y * _loc12_ + _loc17_.z * _loc13_;
            if(_loc5_ > _loc14_)
            {
               _loc14_ = _loc5_;
            }
         }
         return _loc8_ + _loc14_ - _loc9_;
      }
      
      private function method_2088(param1:name_904, param2:name_2398, param3:Vector3, param4:Vector.<ShapeContact>) : void
      {
         var _loc11_:Matrix4 = null;
         var _loc5_:Vector3 = null;
         var _loc6_:ShapeContact = null;
         var _loc7_:Vector3 = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         _loc11_ = param1.transform;
         var _loc12_:Matrix4 = param2.transform;
         _loc5_ = this.const_1774;
         _loc5_.x = _loc11_.m03 - _loc12_.m03;
         _loc5_.y = _loc11_.m13 - _loc12_.m13;
         _loc5_.z = _loc11_.m23 - _loc12_.m23;
         if(param3.x * _loc5_.x + param3.y * _loc5_.y + param3.z * _loc5_.z < 0)
         {
            param3.x = -param3.x;
            param3.y = -param3.y;
            param3.z = -param3.z;
         }
         var _loc13_:Matrix4 = this.const_1770;
         ColliderUtils.name_2396(param3,_loc11_,_loc12_,_loc13_);
         ColliderUtils.name_2395(param1,param3,name_2394.BACK,this.const_1768);
         ColliderUtils.name_2399(param2,param3,this.const_1775);
         ColliderUtils.name_2393(_loc13_,_loc11_,this.const_1768,4);
         ColliderUtils.name_2393(_loc13_,_loc12_,this.const_1775,3);
         var _loc14_:int = int(param4.length);
         PolygonsIntersectionUtils.method_2088(param1,this.const_1768,4,param2,this.const_1775,3,_loc13_,param4);
         var _loc15_:int = int(param4.length);
         var _loc16_:int = _loc14_;
         while(_loc16_ < _loc15_)
         {
            _loc6_ = param4[_loc16_];
            _loc7_ = _loc6_.normal;
            _loc8_ = _loc12_.m02;
            _loc9_ = _loc12_.m12;
            _loc10_ = _loc12_.m22;
            if(_loc7_.x * _loc8_ + _loc7_.y * _loc9_ + _loc7_.z * _loc10_ < 0)
            {
               _loc6_.dispose();
               _loc15_--;
               param4[_loc16_] = param4[_loc15_];
               param4[_loc15_] = null;
               _loc16_--;
            }
            _loc16_++;
         }
         if(_loc15_ < param4.length)
         {
            param4.length = _loc15_;
         }
      }
   }
}
