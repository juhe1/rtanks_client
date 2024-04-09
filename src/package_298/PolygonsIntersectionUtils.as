package package_298
{
   import alternativa.physics.ShapeContact;
   import alternativa.physics.collision.CollisionPrimitive;
   import flash.geom.Point;
   import package_37.Matrix4;
   import package_37.Vector3;
   
   public class PolygonsIntersectionUtils
   {
      
      private static const projectedPoints1:Vector.<Point> = Vector.<Point>([new Point(),new Point(),new Point(),new Point(),new Point(),new Point(),new Point(),new Point()]);
      
      private static const projectedPoints2:Vector.<Point> = Vector.<Point>([new Point(),new Point(),new Point(),new Point(),new Point(),new Point(),new Point(),new Point()]);
      
      private static const var_711:Vector.<Point> = Vector.<Point>([new Point(),new Point(),new Point(),new Point(),new Point(),new Point(),new Point(),new Point()]);
      
      private static var points1:Vector.<Point> = Vector.<Point>([new Point(),new Point(),new Point(),new Point(),new Point(),new Point(),new Point(),new Point()]);
      
      private static var points2:Vector.<Point> = Vector.<Point>([new Point(),new Point(),new Point(),new Point(),new Point(),new Point(),new Point(),new Point()]);
      
      private static const point:Point = new Point();
      
      private static const normal1:Vector3 = new Vector3();
      
      private static const normal2:Vector3 = new Vector3();
       
      
      public function PolygonsIntersectionUtils()
      {
         super();
      }
      
      public static function method_2088(param1:CollisionPrimitive, param2:Vector.<Vertex>, param3:int, param4:CollisionPrimitive, param5:Vector.<Vertex>, param6:int, param7:Matrix4, param8:Vector.<ShapeContact>) : void
      {
         var _loc9_:Point = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:ShapeContact = null;
         var _loc13_:Vector3 = null;
         method_2844(param2,normal1);
         method_2844(param5,normal2);
         method_2843(param2,param3,projectedPoints1);
         method_2843(param5,param6,projectedPoints2);
         var _loc14_:int = method_2846(projectedPoints1,param3,projectedPoints2,param6,var_711);
         var _loc15_:int = 0;
         while(_loc15_ < _loc14_)
         {
            _loc9_ = var_711[_loc15_];
            _loc10_ = method_2842(_loc9_,Vertex(param2[0]).transformed,normal1);
            _loc11_ = method_2842(_loc9_,Vertex(param5[0]).transformed,normal2);
            if(_loc11_ > _loc10_)
            {
               _loc12_ = ShapeContact.create();
               _loc12_.shape1 = param1;
               _loc12_.shape2 = param4;
               _loc13_ = _loc12_.position;
               _loc13_.x = _loc9_.x;
               _loc13_.y = _loc9_.y;
               _loc13_.z = 0.5 * (_loc10_ + _loc11_);
               _loc13_.vTransformBy4(param7);
               _loc12_.var_1985 = _loc11_ - _loc10_;
               _loc12_.normal.x = param7.m02;
               _loc12_.normal.y = param7.m12;
               _loc12_.normal.z = param7.m22;
               param8[param8.length] = _loc12_;
            }
            _loc15_++;
         }
      }
      
      private static function method_2844(param1:Vector.<Vertex>, param2:Vector3) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         _loc3_ = NaN;
         _loc4_ = NaN;
         _loc5_ = NaN;
         _loc6_ = NaN;
         var _loc7_:Vertex = param1[0];
         var _loc8_:Vertex = param1[1];
         var _loc9_:Vertex = param1[2];
         var _loc10_:Vector3 = _loc7_.transformed;
         var _loc11_:Vector3 = _loc8_.transformed;
         var _loc12_:Vector3 = _loc9_.transformed;
         _loc3_ = _loc11_.x - _loc10_.x;
         _loc4_ = _loc11_.y - _loc10_.y;
         var _loc13_:Number = _loc11_.z - _loc10_.z;
         _loc5_ = _loc12_.x - _loc10_.x;
         _loc6_ = _loc12_.y - _loc10_.y;
         var _loc14_:Number = _loc12_.z - _loc10_.z;
         param2.x = _loc4_ * _loc14_ - _loc13_ * _loc6_;
         param2.y = _loc13_ * _loc5_ - _loc3_ * _loc14_;
         param2.z = _loc3_ * _loc6_ - _loc4_ * _loc5_;
         param2.normalize();
      }
      
      private static function method_2843(param1:Vector.<Vertex>, param2:int, param3:Vector.<Point>) : void
      {
         var _loc4_:Vertex = null;
         var _loc5_:Point = null;
         var _loc6_:int = 0;
         while(_loc6_ < param2)
         {
            _loc4_ = param1[_loc6_];
            _loc5_ = param3[_loc6_];
            _loc5_.x = _loc4_.transformed.x;
            _loc5_.y = _loc4_.transformed.y;
            _loc6_++;
         }
      }
      
      private static function method_2846(param1:Vector.<Point>, param2:int, param3:Vector.<Point>, param4:int, param5:Vector.<Point>) : int
      {
         var _loc6_:Point = null;
         var _loc7_:Vector.<Point> = null;
         method_2845(param3,points1,param4);
         var _loc8_:int = param4;
         var _loc9_:Point = param1[param2 - 1];
         var _loc10_:int = 0;
         while(_loc10_ < param2)
         {
            _loc6_ = param1[_loc10_];
            _loc8_ = clip(_loc9_,_loc6_,points1,points2,_loc8_);
            if(_loc8_ == 0)
            {
               break;
            }
            _loc9_ = _loc6_;
            _loc7_ = points1;
            points1 = points2;
            points2 = _loc7_;
            _loc10_++;
         }
         method_2845(points1,param5,_loc8_);
         return _loc8_;
      }
      
      private static function method_2845(param1:Vector.<Point>, param2:Vector.<Point>, param3:int) : void
      {
         var _loc4_:Point = null;
         var _loc5_:Point = null;
         var _loc6_:int = 0;
         while(_loc6_ < param3)
         {
            _loc4_ = param1[_loc6_];
            _loc5_ = param2[_loc6_];
            _loc5_.x = _loc4_.x;
            _loc5_.y = _loc4_.y;
            _loc6_++;
         }
      }
      
      private static function clip(param1:Point, param2:Point, param3:Vector.<Point>, param4:Vector.<Point>, param5:int) : int
      {
         var _loc6_:Point = null;
         var _loc7_:Boolean = false;
         var _loc8_:Point = param3[param5 - 1];
         var _loc9_:Boolean = method_2841(param1,param2,_loc8_);
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         while(_loc11_ < param5)
         {
            _loc6_ = param3[_loc11_];
            _loc7_ = method_2841(param1,param2,_loc6_);
            if(_loc7_)
            {
               if(!_loc9_)
               {
                  method_2840(param1,param2,_loc8_,_loc6_,point);
                  method_2839(point,param4,_loc10_++);
               }
               method_2839(_loc6_,param4,_loc10_++);
            }
            else if(_loc9_)
            {
               method_2840(param1,param2,_loc8_,_loc6_,point);
               method_2839(point,param4,_loc10_++);
            }
            _loc9_ = _loc7_;
            _loc8_ = _loc6_;
            _loc11_++;
         }
         return _loc10_;
      }
      
      private static function method_2839(param1:Point, param2:Vector.<Point>, param3:int) : void
      {
         var _loc4_:Point = param2[param3];
         _loc4_.x = param1.x;
         _loc4_.y = param1.y;
      }
      
      private static function method_2841(param1:Point, param2:Point, param3:Point) : Boolean
      {
         var _loc4_:Number = param2.x - param1.x;
         var _loc5_:Number = param2.y - param1.y;
         var _loc6_:Number = param3.x - param1.x;
         var _loc7_:Number = param3.y - param1.y;
         return _loc4_ * _loc7_ - _loc5_ * _loc6_ > 0;
      }
      
      private static function method_2840(param1:Point, param2:Point, param3:Point, param4:Point, param5:Point) : void
      {
         var _loc6_:Number = param2.x - param1.x;
         var _loc7_:Number = param2.y - param1.y;
         var _loc8_:Number = param4.x - param3.x;
         var _loc9_:Number = param4.y - param3.y;
         var _loc10_:Number = param3.x - param1.x;
         var _loc11_:Number = param3.y - param1.y;
         var _loc12_:Number = (_loc6_ * _loc11_ - _loc7_ * _loc10_) / (_loc7_ * _loc8_ - _loc6_ * _loc9_);
         param5.x = param3.x + _loc12_ * _loc8_;
         param5.y = param3.y + _loc12_ * _loc9_;
      }
      
      private static function method_2842(param1:Point, param2:Vector3, param3:Vector3) : Number
      {
         var _loc4_:Number = param2.dot(param3);
         return (_loc4_ - param1.x * param3.x - param1.y * param3.y) / param3.z;
      }
   }
}
