package package_298
{
   import alternativa.physics.ShapeContact;
   import alternativa.physics.collision.name_1172;
   import alternativa.physics.collision.name_774;
   import package_277.name_2392;
   import package_277.name_904;
   import package_37.Matrix4;
   import package_37.Vector3;
   
   public class BoxRectCollider implements name_1172
   {
      
      private static const const_1768:Vector.<Vertex> = Vector.<Vertex>([new Vertex(),new Vertex(),new Vertex(),new Vertex()]);
      
      private static const const_1767:Vector.<Vertex> = Vector.<Vertex>([new Vertex(),new Vertex(),new Vertex(),new Vertex()]);
      
      private static const const_1770:Matrix4 = new Matrix4();
       
      
      private const const_1766:Vector3 = new Vector3();
      
      private const const_1765:Vector3 = new Vector3();
      
      private const axis10:Vector3 = new Vector3();
      
      private const axis11:Vector3 = new Vector3();
      
      private const axis12:Vector3 = new Vector3();
      
      private const axis20:Vector3 = new Vector3();
      
      private const axis21:Vector3 = new Vector3();
      
      private const axis22:Vector3 = new Vector3();
      
      private const const_1769:Vector3 = new Vector3();
      
      private var var_1990:Number;
      
      private var var_1991:Number;
      
      public function BoxRectCollider(param1:Number)
      {
         super();
         this.var_1991 = param1;
      }
      
      public function method_694(param1:name_774, param2:name_774, param3:Vector.<ShapeContact>) : void
      {
         var _loc4_:name_2392 = null;
         var _loc5_:name_904 = null;
         if(this.name_1176(param1,param2))
         {
            if(param1 is name_2392)
            {
               _loc4_ = name_2392(param1);
               _loc5_ = name_904(param2);
            }
            else
            {
               _loc4_ = name_2392(param2);
               _loc5_ = name_904(param1);
            }
            this.method_2088(_loc5_,_loc4_,this.const_1769,param3);
         }
      }
      
      public function name_1176(param1:name_774, param2:name_774) : Boolean
      {
         var _loc5_:Matrix4 = null;
         var _loc3_:name_904 = null;
         var _loc4_:name_2392 = null;
         _loc5_ = null;
         var _loc6_:Matrix4 = null;
         this.var_1990 = 10000000000;
         if(param1 is name_904)
         {
            _loc3_ = name_904(param1);
            _loc4_ = name_2392(param2);
         }
         else
         {
            _loc3_ = name_904(param2);
            _loc4_ = name_2392(param1);
         }
         _loc5_ = _loc3_.transform;
         _loc6_ = _loc4_.transform;
         this.const_1766.x = _loc5_.m03 - _loc6_.m03;
         this.const_1766.y = _loc5_.m13 - _loc6_.m13;
         this.const_1766.z = _loc5_.m23 - _loc6_.m23;
         this.axis22.x = _loc6_.m02;
         this.axis22.y = _loc6_.m12;
         this.axis22.z = _loc6_.m22;
         if(!this.method_2085(_loc3_,_loc4_,this.axis22,this.const_1766))
         {
            return false;
         }
         this.axis10.x = _loc5_.m00;
         this.axis10.y = _loc5_.m10;
         this.axis10.z = _loc5_.m20;
         if(!this.method_2085(_loc3_,_loc4_,this.axis10,this.const_1766))
         {
            return false;
         }
         this.axis11.x = _loc5_.m01;
         this.axis11.y = _loc5_.m11;
         this.axis11.z = _loc5_.m21;
         if(!this.method_2085(_loc3_,_loc4_,this.axis11,this.const_1766))
         {
            return false;
         }
         this.axis12.x = _loc5_.m02;
         this.axis12.y = _loc5_.m12;
         this.axis12.z = _loc5_.m22;
         if(!this.method_2085(_loc3_,_loc4_,this.axis12,this.const_1766))
         {
            return false;
         }
         this.axis20.x = _loc6_.m00;
         this.axis20.y = _loc6_.m10;
         this.axis20.z = _loc6_.m20;
         this.axis21.x = _loc6_.m01;
         this.axis21.y = _loc6_.m11;
         this.axis21.z = _loc6_.m21;
         if(!this.method_2084(_loc3_,_loc4_,this.axis10,this.axis20,this.const_1766))
         {
            return false;
         }
         if(!this.method_2084(_loc3_,_loc4_,this.axis10,this.axis21,this.const_1766))
         {
            return false;
         }
         if(!this.method_2084(_loc3_,_loc4_,this.axis11,this.axis20,this.const_1766))
         {
            return false;
         }
         if(!this.method_2084(_loc3_,_loc4_,this.axis11,this.axis21,this.const_1766))
         {
            return false;
         }
         if(!this.method_2084(_loc3_,_loc4_,this.axis12,this.axis20,this.const_1766))
         {
            return false;
         }
         if(!this.method_2084(_loc3_,_loc4_,this.axis12,this.axis21,this.const_1766))
         {
            return false;
         }
         return true;
      }
      
      private function method_2085(param1:name_904, param2:name_2392, param3:Vector3, param4:Vector3) : Boolean
      {
         var _loc5_:Number = this.method_2086(param1,param2,param3,param4);
         return this.method_2087(_loc5_,param3);
      }
      
      private function method_2084(param1:name_904, param2:name_2392, param3:Vector3, param4:Vector3, param5:Vector3) : Boolean
      {
         this.const_1765.x = param3.y * param4.z - param3.z * param4.y;
         this.const_1765.y = param3.z * param4.x - param3.x * param4.z;
         this.const_1765.z = param3.x * param4.y - param3.y * param4.x;
         var _loc6_:Number = this.const_1765.x * this.const_1765.x + this.const_1765.y * this.const_1765.y + this.const_1765.z * this.const_1765.z;
         if(_loc6_ < 1e-10)
         {
            return true;
         }
         var _loc7_:Number = 1 / Math.sqrt(_loc6_);
         this.const_1765.x *= _loc7_;
         this.const_1765.y *= _loc7_;
         this.const_1765.z *= _loc7_;
         var _loc8_:Number = this.method_2086(param1,param2,this.const_1765,param5);
         return this.method_2087(_loc8_,this.const_1765);
      }
      
      private function method_2086(param1:name_904, param2:name_2392, param3:Vector3, param4:Vector3) : Number
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
         _loc6_ = param4.x * param3.x + param4.y * param3.y + param4.z * param3.z;
         if(_loc6_ < 0)
         {
            _loc6_ = -_loc6_;
         }
         return _loc7_ - _loc6_;
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
      
      private function method_2088(param1:name_904, param2:name_2392, param3:Vector3, param4:Vector.<ShapeContact>) : void
      {
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc5_:Matrix4 = null;
         var _loc6_:Matrix4 = null;
         var _loc7_:Vector3 = null;
         var _loc8_:ShapeContact = null;
         var _loc9_:Vector3 = null;
         var _loc10_:Number = NaN;
         _loc11_ = NaN;
         _loc12_ = NaN;
         _loc5_ = param1.transform;
         _loc6_ = param2.transform;
         _loc7_ = this.const_1766;
         _loc7_.x = _loc5_.m03 - _loc6_.m03;
         _loc7_.y = _loc5_.m13 - _loc6_.m13;
         _loc7_.z = _loc5_.m23 - _loc6_.m23;
         if(param3.x * _loc7_.x + param3.y * _loc7_.y + param3.z * _loc7_.z < 0)
         {
            param3.x = -param3.x;
            param3.y = -param3.y;
            param3.z = -param3.z;
         }
         var _loc13_:Matrix4 = const_1770;
         ColliderUtils.name_2396(param3,_loc5_,_loc6_,_loc13_);
         ColliderUtils.name_2395(param1,param3,name_2394.BACK,const_1768);
         ColliderUtils.name_2397(param2,param3,const_1767);
         ColliderUtils.name_2393(_loc13_,_loc5_,const_1768,4);
         ColliderUtils.name_2393(_loc13_,_loc6_,const_1767,4);
         var _loc14_:int = int(param4.length);
         PolygonsIntersectionUtils.method_2088(param1,const_1768,4,param2,const_1767,4,_loc13_,param4);
         var _loc15_:int = int(param4.length);
         var _loc16_:int = _loc14_;
         while(_loc16_ < _loc15_)
         {
            _loc8_ = param4[_loc16_];
            _loc9_ = _loc8_.normal;
            _loc10_ = _loc6_.m02;
            _loc11_ = _loc6_.m12;
            _loc12_ = _loc6_.m22;
            if(_loc9_.x * _loc10_ + _loc9_.y * _loc11_ + _loc9_.z * _loc12_ < 0)
            {
               _loc8_.dispose();
               _loc15_--;
               param4[_loc16_] = param4[_loc15_];
               param4[_loc15_] = null;
               _loc16_--;
            }
            else if(Math.abs(_loc6_.m22) > 0.999)
            {
               _loc9_.x = _loc10_;
               _loc9_.y = _loc11_;
               _loc9_.z = _loc12_;
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
