package package_298
{
   import alternativa.physics.ShapeContact;
   import alternativa.physics.collision.name_1172;
   import alternativa.physics.collision.CollisionPrimitive;
   import package_277.name_2400;
   import package_277.name_904;
   import package_37.Matrix4;
   import package_37.Vector3;
   
   public class BoxSphereCollider implements name_1172
   {
       
      
      private var center:Vector3;
      
      private var var_1998:Vector3;
      
      private var var_2000:Vector3;
      
      private var var_1999:Vector3;
      
      public function BoxSphereCollider()
      {
         this.center = new Vector3();
         this.var_1998 = new Vector3();
         this.var_2000 = new Vector3();
         this.var_1999 = new Vector3();
         super();
      }
      
      public function method_694(param1:CollisionPrimitive, param2:CollisionPrimitive, param3:Vector.<ShapeContact>) : void
      {
         var _loc4_:name_904 = null;
         var _loc5_:Matrix4 = null;
         var _loc6_:name_2400 = param1 as name_2400;
         if(_loc6_ == null)
         {
            _loc6_ = param2 as name_2400;
            _loc4_ = param1 as name_904;
         }
         else
         {
            _loc4_ = param2 as name_904;
         }
         var _loc7_:Matrix4 = _loc6_.transform;
         _loc7_.name_1282(3,this.var_1999);
         _loc5_ = _loc4_.transform;
         _loc5_.name_1282(3,this.var_2000);
         _loc5_.name_1334(this.var_1999,this.center);
         var _loc8_:Vector3 = _loc4_.hs;
         var _loc9_:Number = _loc8_.x + _loc6_.const_1653;
         var _loc10_:Number = _loc8_.y + _loc6_.const_1653;
         var _loc11_:Number = _loc8_.z + _loc6_.const_1653;
         if(this.center.x > _loc9_ || this.center.x < -_loc9_ || this.center.y > _loc10_ || this.center.y < -_loc10_ || this.center.z > _loc11_ || this.center.z < -_loc11_)
         {
            return;
         }
         if(this.center.x > _loc8_.x)
         {
            this.var_1998.x = _loc8_.x;
         }
         else if(this.center.x < -_loc8_.x)
         {
            this.var_1998.x = -_loc8_.x;
         }
         else
         {
            this.var_1998.x = this.center.x;
         }
         if(this.center.y > _loc8_.y)
         {
            this.var_1998.y = _loc8_.y;
         }
         else if(this.center.y < -_loc8_.y)
         {
            this.var_1998.y = -_loc8_.y;
         }
         else
         {
            this.var_1998.y = this.center.y;
         }
         if(this.center.z > _loc8_.z)
         {
            this.var_1998.z = _loc8_.z;
         }
         else if(this.center.z < -_loc8_.z)
         {
            this.var_1998.z = -_loc8_.z;
         }
         else
         {
            this.var_1998.z = this.center.z;
         }
         var _loc12_:Number = this.center.subtract(this.var_1998).vLengthSqr();
         if(_loc12_ > _loc6_.const_1653 * _loc6_.const_1653)
         {
            return;
         }
         var _loc13_:ShapeContact = ShapeContact.create();
         _loc13_.shape1 = _loc6_;
         _loc13_.shape2 = _loc4_;
         _loc13_.normal.vCopy(this.var_1998).vTransformBy4(_loc5_).subtract(this.var_1999).vNormalize().vReverse();
         _loc13_.var_1985 = _loc6_.const_1653 - Math.sqrt(_loc12_);
         _loc13_.position.vCopy(_loc13_.normal).vScale(-_loc6_.const_1653).vAdd(this.var_1999);
         param3[param3.length] = _loc13_;
      }
      
      public function name_1176(param1:CollisionPrimitive, param2:CollisionPrimitive) : Boolean
      {
         var _loc3_:name_904 = null;
         var _loc4_:name_2400 = param1 as name_2400;
         if(_loc4_ == null)
         {
            _loc4_ = param2 as name_2400;
            _loc3_ = param1 as name_904;
         }
         else
         {
            _loc3_ = param2 as name_904;
         }
         var _loc5_:Matrix4 = _loc4_.transform;
         _loc5_.name_1282(3,this.var_1999);
         var _loc6_:Matrix4 = _loc3_.transform;
         _loc6_.name_1282(3,this.var_2000);
         _loc6_.name_1334(this.var_1999,this.center);
         var _loc7_:Vector3 = _loc3_.hs;
         var _loc8_:Number = _loc7_.x + _loc4_.const_1653;
         var _loc9_:Number = _loc7_.y + _loc4_.const_1653;
         var _loc10_:Number = _loc7_.z + _loc4_.const_1653;
         if(this.center.x > _loc8_ || this.center.x < -_loc8_ || this.center.y > _loc9_ || this.center.y < -_loc9_ || this.center.z > _loc10_ || this.center.z < -_loc10_)
         {
            return false;
         }
         if(this.center.x > _loc7_.x)
         {
            this.var_1998.x = _loc7_.x;
         }
         else if(this.center.x < -_loc7_.x)
         {
            this.var_1998.x = -_loc7_.x;
         }
         else
         {
            this.var_1998.x = this.center.x;
         }
         if(this.center.y > _loc7_.y)
         {
            this.var_1998.y = _loc7_.y;
         }
         else if(this.center.y < -_loc7_.y)
         {
            this.var_1998.y = -_loc7_.y;
         }
         else
         {
            this.var_1998.y = this.center.y;
         }
         if(this.center.z > _loc7_.z)
         {
            this.var_1998.z = _loc7_.z;
         }
         else if(this.center.z < -_loc7_.z)
         {
            this.var_1998.z = -_loc7_.z;
         }
         else
         {
            this.var_1998.z = this.center.z;
         }
         var _loc11_:Number = this.center.subtract(this.var_1998).vLengthSqr();
         return _loc11_ <= _loc4_.const_1653 * _loc4_.const_1653;
      }
   }
}
