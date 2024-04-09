package alternativa.tanks.vehicles.tanks.chassis
{
   import alternativa.physics.Body;
   import alternativa.tanks.utils.MathUtils;
   import package_276.Track;
   import package_276.TrackedChassis;
   import package_276.name_2088;
   import package_37.Matrix3;
   import package_37.Vector3;
   
   public class TracksAnimator
   {
      
      private static const const_2214:Number = 100;
      
      private static const const_2213:Vector3 = new Vector3();
       
      
      private var chassis:TrackedChassis;
      
      private var var_1709:ValueSmoother;
      
      public function TracksAnimator(param1:TrackedChassis, param2:ValueSmoother)
      {
         super();
         this.chassis = param1;
         this.var_1709 = param2;
      }
      
      public function name_2186(param1:Number) : void
      {
         this.method_2667(param1);
      }
      
      private function method_2667(param1:Number) : void
      {
         this.method_2665(this.chassis.var_1708,param1);
         this.method_2665(this.chassis.var_1707,param1);
      }
      
      private function method_2665(param1:Track, param2:Number) : void
      {
         if(this.method_2672(param1))
         {
            this.method_2669(param1,param2);
         }
         else
         {
            this.method_2666(param1,param2);
         }
      }
      
      private function method_2672(param1:Track) : Boolean
      {
         return param1.name_787.name_225.m22 > 0 && param1.name_2089 > 0;
      }
      
      private function method_2669(param1:Track, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = this.method_2671(param1);
         if(this.method_2670(param1,_loc4_))
         {
            param1.name_924 = _loc4_;
         }
         else
         {
            _loc3_ = this.method_2664(param1) * 100;
            param1.method_2590(_loc3_,this.chassis.method_1890() * param2);
         }
      }
      
      private function method_2671(param1:Track) : Number
      {
         var _loc2_:Vector3 = param1.const_2101;
         var _loc3_:name_2088 = param1.name_2090[param1.name_2092 >> 1];
         this.method_2668(param1.name_787,_loc3_.name_2091(),const_2213);
         var _loc4_:Number = const_2213.x - _loc2_.x;
         var _loc5_:Number = const_2213.y - _loc2_.y;
         var _loc6_:Number = const_2213.z - _loc2_.z;
         var _loc7_:Matrix3 = param1.name_787.name_225;
         return _loc4_ * _loc7_.m01 + _loc5_ * _loc7_.m11 + _loc6_ * _loc7_.m21;
      }
      
      private function method_2668(param1:Body, param2:Vector3, param3:Vector3) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Vector3 = null;
         var _loc7_:Vector3 = param1.state.position;
         _loc4_ = param2.x - _loc7_.x;
         _loc5_ = param2.y - _loc7_.y;
         var _loc8_:Number = param2.z - _loc7_.z;
         var _loc9_:Vector3 = param1.state.name_181;
         param3.x = _loc9_.y * _loc8_ - _loc9_.z * _loc5_;
         param3.y = _loc9_.z * _loc4_ - _loc9_.x * _loc8_;
         param3.z = _loc9_.x * _loc5_ - _loc9_.y * _loc4_;
         _loc6_ = param1.state.name_187;
         param3.x += _loc6_.x;
         param3.y += _loc6_.y;
         param3.z += _loc6_.z;
      }
      
      private function method_2670(param1:Track, param2:Number) : Boolean
      {
         var _loc3_:Number = this.method_2664(param1);
         return Math.abs(param2) > 0.8 * 100 || _loc3_ == 0 || MathUtils.method_607(param2,1) * MathUtils.method_613(_loc3_) == -1;
      }
      
      private function method_2664(param1:Track) : Number
      {
         var _loc2_:int = this.chassis.method_1891();
         var _loc3_:int = this.chassis.method_1892();
         var _loc4_:Number = 0;
         if(_loc2_ == 0)
         {
            _loc4_ = param1.var_2721 * _loc3_ * 0.5;
         }
         else if(_loc3_ == 0)
         {
            _loc4_ = _loc2_;
         }
         else
         {
            _loc4_ = _loc2_ * (3 + param1.var_2721 * _loc3_) / 4;
         }
         return _loc4_;
      }
      
      private function method_2666(param1:Track, param2:Number) : void
      {
         var _loc3_:Number = this.method_2664(param1);
         param1.method_2590(_loc3_ * this.var_1709.getTargetValue(),this.chassis.method_1890() * param2);
      }
   }
}
