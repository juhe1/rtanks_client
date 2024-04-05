package package_298
{
   import alternativa.physics.ShapeContact;
   import alternativa.physics.collision.name_1172;
   import alternativa.physics.collision.name_774;
   import package_277.name_904;
   import package_37.Matrix4;
   import package_37.Vector3;
   
   public class BoxBoxCollider implements name_1172
   {
      
      private static const const_1765:Vector3 = new Vector3();
      
      private static const _axis10:Vector3 = new Vector3();
      
      private static const _axis11:Vector3 = new Vector3();
      
      private static const _axis12:Vector3 = new Vector3();
      
      private static const _axis20:Vector3 = new Vector3();
      
      private static const _axis21:Vector3 = new Vector3();
      
      private static const _axis22:Vector3 = new Vector3();
      
      private static const const_1766:Vector3 = new Vector3();
      
      private static const faceVertices1:Vector.<Vertex> = Vector.<Vertex>([new Vertex(),new Vertex(),new Vertex(),new Vertex()]);
      
      private static const faceVertices2:Vector.<Vertex> = Vector.<Vertex>([new Vertex(),new Vertex(),new Vertex(),new Vertex()]);
      
      private static const const_1770:Matrix4 = new Matrix4();
       
      
      private var var_1991:Number;
      
      private const const_1769:Vector3 = new Vector3();
      
      private var var_1990:Number;
      
      public function BoxBoxCollider(param1:Number)
      {
         super();
         this.var_1991 = param1;
      }
      
      public function method_694(param1:name_774, param2:name_774, param3:Vector.<ShapeContact>) : void
      {
         var _loc4_:name_904 = null;
         var _loc5_:name_904 = null;
         if(this.name_1176(param1,param2))
         {
            _loc4_ = name_904(param1);
            _loc5_ = name_904(param2);
            this.method_2088(_loc4_,_loc5_,this.const_1769,param3);
         }
      }
      
      public function name_1176(param1:name_774, param2:name_774) : Boolean
      {
         var _loc3_:name_904 = null;
         var _loc4_:name_904 = null;
         var _loc5_:Matrix4 = null;
         this.var_1990 = 10000000000;
         _loc3_ = name_904(param1);
         _loc4_ = name_904(param2);
         var _loc6_:Matrix4 = _loc3_.transform;
         _loc5_ = _loc4_.transform;
         var _loc7_:Vector3 = const_1766;
         _loc7_.x = _loc6_.m03 - _loc5_.m03;
         _loc7_.y = _loc6_.m13 - _loc5_.m13;
         _loc7_.z = _loc6_.m23 - _loc5_.m23;
         _axis10.x = _loc6_.m00;
         _axis10.y = _loc6_.m10;
         _axis10.z = _loc6_.m20;
         if(!this.method_2094(_loc3_,_loc4_,_axis10,_loc7_))
         {
            return false;
         }
         _axis11.x = _loc6_.m01;
         _axis11.y = _loc6_.m11;
         _axis11.z = _loc6_.m21;
         if(!this.method_2094(_loc3_,_loc4_,_axis11,_loc7_))
         {
            return false;
         }
         _axis12.x = _loc6_.m02;
         _axis12.y = _loc6_.m12;
         _axis12.z = _loc6_.m22;
         if(!this.method_2094(_loc3_,_loc4_,_axis12,_loc7_))
         {
            return false;
         }
         _axis20.x = _loc5_.m00;
         _axis20.y = _loc5_.m10;
         _axis20.z = _loc5_.m20;
         if(!this.method_2094(_loc3_,_loc4_,_axis20,_loc7_))
         {
            return false;
         }
         _axis21.x = _loc5_.m01;
         _axis21.y = _loc5_.m11;
         _axis21.z = _loc5_.m21;
         if(!this.method_2094(_loc3_,_loc4_,_axis21,_loc7_))
         {
            return false;
         }
         _axis22.x = _loc5_.m02;
         _axis22.y = _loc5_.m12;
         _axis22.z = _loc5_.m22;
         if(!this.method_2094(_loc3_,_loc4_,_axis22,_loc7_))
         {
            return false;
         }
         if(!this.method_2093(_loc3_,_loc4_,_axis10,_axis20,_loc7_))
         {
            return false;
         }
         if(!this.method_2093(_loc3_,_loc4_,_axis10,_axis21,_loc7_))
         {
            return false;
         }
         if(!this.method_2093(_loc3_,_loc4_,_axis10,_axis22,_loc7_))
         {
            return false;
         }
         if(!this.method_2093(_loc3_,_loc4_,_axis11,_axis20,_loc7_))
         {
            return false;
         }
         if(!this.method_2093(_loc3_,_loc4_,_axis11,_axis21,_loc7_))
         {
            return false;
         }
         if(!this.method_2093(_loc3_,_loc4_,_axis11,_axis22,_loc7_))
         {
            return false;
         }
         if(!this.method_2093(_loc3_,_loc4_,_axis12,_axis20,_loc7_))
         {
            return false;
         }
         if(!this.method_2093(_loc3_,_loc4_,_axis12,_axis21,_loc7_))
         {
            return false;
         }
         return this.method_2093(_loc3_,_loc4_,_axis12,_axis22,_loc7_);
      }
      
      private function method_2094(param1:name_904, param2:name_904, param3:Vector3, param4:Vector3) : Boolean
      {
         var _loc5_:Number = this.method_2086(param1,param2,param3,param4);
         return this.method_2087(_loc5_,param3);
      }
      
      private function method_2093(param1:name_904, param2:name_904, param3:Vector3, param4:Vector3, param5:Vector3) : Boolean
      {
         var _loc6_:Vector3 = null;
         var _loc7_:Number = NaN;
         _loc6_ = null;
         _loc7_ = NaN;
         _loc6_ = const_1765;
         _loc6_.x = param3.y * param4.z - param3.z * param4.y;
         _loc6_.y = param3.z * param4.x - param3.x * param4.z;
         _loc6_.z = param3.x * param4.y - param3.y * param4.x;
         var _loc8_:Number = _loc6_.x * _loc6_.x + _loc6_.y * _loc6_.y + _loc6_.z * _loc6_.z;
         if(_loc8_ < 1e-10)
         {
            return true;
         }
         _loc7_ = 1 / Math.sqrt(_loc8_);
         _loc6_.x *= _loc7_;
         _loc6_.y *= _loc7_;
         _loc6_.z *= _loc7_;
         var _loc9_:Number = this.method_2086(param1,param2,_loc6_,param5);
         return this.method_2087(_loc9_,_loc6_);
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
      
      public function method_2086(param1:name_904, param2:name_904, param3:Vector3, param4:Vector3) : Number
      {
         var _loc5_:Matrix4 = param1.transform;
         var _loc6_:Number = (_loc5_.m00 * param3.x + _loc5_.m10 * param3.y + _loc5_.m20 * param3.z) * param1.hs.x;
         if(_loc6_ < 0)
         {
            _loc6_ = -_loc6_;
         }
         var _loc7_:Number = _loc6_;
         _loc6_ = (_loc5_.m01 * param3.x + _loc5_.m11 * param3.y + _loc5_.m21 * param3.z) * param1.hs.y;
         if(_loc6_ < 0)
         {
            _loc6_ = -_loc6_;
         }
         _loc7_ += _loc6_;
         _loc6_ = (_loc5_.m02 * param3.x + _loc5_.m12 * param3.y + _loc5_.m22 * param3.z) * param1.hs.z;
         if(_loc6_ < 0)
         {
            _loc6_ = -_loc6_;
         }
         _loc7_ += _loc6_;
         _loc5_ = param2.transform;
         _loc6_ = (_loc5_.m00 * param3.x + _loc5_.m10 * param3.y + _loc5_.m20 * param3.z) * param2.hs.x;
         if(_loc6_ < 0)
         {
            _loc6_ = -_loc6_;
         }
         _loc7_ += _loc6_;
         _loc6_ = (_loc5_.m01 * param3.x + _loc5_.m11 * param3.y + _loc5_.m21 * param3.z) * param2.hs.y;
         if(_loc6_ < 0)
         {
            _loc6_ = -_loc6_;
         }
         _loc7_ += _loc6_;
         _loc6_ = (_loc5_.m02 * param3.x + _loc5_.m12 * param3.y + _loc5_.m22 * param3.z) * param2.hs.z;
         if(_loc6_ < 0)
         {
            _loc6_ = -_loc6_;
         }
         _loc7_ += _loc6_;
         _loc6_ = param4.x * param3.x + param4.y * param3.y + param4.z * param3.z;
         if(_loc6_ < 0)
         {
            _loc6_ = -_loc6_;
         }
         return _loc7_ - _loc6_;
      }
      
      private function method_2088(param1:name_904, param2:name_904, param3:Vector3, param4:Vector.<ShapeContact>) : void
      {
         var _loc5_:Matrix4 = null;
         _loc5_ = param1.transform;
         var _loc6_:Matrix4 = param2.transform;
         var _loc7_:Vector3 = const_1766;
         _loc7_.x = _loc5_.m03 - _loc6_.m03;
         _loc7_.y = _loc5_.m13 - _loc6_.m13;
         _loc7_.z = _loc5_.m23 - _loc6_.m23;
         if(param3.x * _loc7_.x + param3.y * _loc7_.y + param3.z * _loc7_.z < 0)
         {
            param3.x = -param3.x;
            param3.y = -param3.y;
            param3.z = -param3.z;
         }
         var _loc8_:Matrix4 = const_1770;
         ColliderUtils.name_2396(param3,_loc5_,_loc6_,_loc8_);
         ColliderUtils.name_2395(param1,param3,name_2394.BACK,faceVertices1);
         ColliderUtils.name_2395(param2,param3,name_2394.FRONT,faceVertices2);
         ColliderUtils.name_2393(_loc8_,param1.transform,faceVertices1,4);
         ColliderUtils.name_2393(_loc8_,param2.transform,faceVertices2,4);
         PolygonsIntersectionUtils.method_2088(param1,faceVertices1,4,param2,faceVertices2,4,_loc8_,param4);
      }
   }
}
