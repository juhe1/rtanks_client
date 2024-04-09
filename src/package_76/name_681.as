package package_76
{
   import alternativa.tanks.utils.MathUtils;
   import package_37.Vector3;
   
   public class name_681 implements name_654
   {
      
      private static const const_1562:Number = 3000;
      
      private static const var_142:Vector3 = new Vector3();
       
      
      private var p1:Vector3;
      
      private var p2:Vector3;
      
      private var p3:Vector3;
      
      private var p4:Vector3;
      
      private var name_1769:Number;
      
      private var distance:Number;
      
      private var acceleration:Number;
      
      private var speed:Number;
      
      private var var_1402:name_2071;
      
      private var var_1403:name_2071;
      
      private var duration:int;
      
      private const var_664:Vector3 = new Vector3();
      
      private const const_1561:Vector3 = new Vector3();
      
      public function name_681(param1:int)
      {
         this.p1 = new Vector3();
         this.p2 = new Vector3();
         this.p3 = new Vector3();
         this.p4 = new Vector3();
         this.var_1402 = new name_2071();
         this.var_1403 = new name_2071();
         super();
         this.duration = param1;
      }
      
      public function init(param1:Vector3, param2:Vector3) : void
      {
         this.var_664.copy(param1);
         this.const_1561.copy(param2);
      }
      
      public function activate(param1:name_735) : void
      {
         this.p1.copy(param1.pos);
         this.p2.copy(this.p1);
         this.p4.copy(this.var_664);
         this.p3.copy(this.p4);
         this.p2.z = this.p3.z = (this.p1.z > this.p4.z ? this.p1.z : this.p4.z) + 3000;
         var _loc2_:Number = 4000000 / (this.duration * this.duration);
         this.var_1402.init(MathUtils.method_612(param1.rotationX),this.const_1561.x,_loc2_);
         this.var_1403.init(MathUtils.method_612(param1.rotationZ),this.const_1561.z,_loc2_);
         var _loc3_:Vector3 = new Vector3();
         _loc3_.vDiff(this.p4,this.p1);
         this.name_1769 = _loc3_.length();
         this.acceleration = this.name_1769 * _loc2_;
         this.distance = 0;
         this.speed = 0;
      }
      
      public function deactivate() : void
      {
      }
      
      public function update(param1:name_735, param2:int, param3:int) : void
      {
         if(this.speed < 0)
         {
            return;
         }
         if(this.distance > 0.5 * this.name_1769 && this.acceleration > 0)
         {
            this.acceleration = -this.acceleration;
            this.var_1402.reverseAcceleration();
            this.var_1403.reverseAcceleration();
         }
         var _loc4_:Number = 0.001 * param3;
         var _loc5_:Number = this.acceleration * _loc4_;
         this.distance += (this.speed + 0.5 * _loc5_) * _loc4_;
         this.speed += _loc5_;
         if(this.distance > this.name_1769)
         {
            this.distance = this.name_1769;
         }
         this.method_911(this.distance / this.name_1769,this.p1,this.p2,this.p3,this.p4,var_142);
         param1.name_731(var_142);
         param1.name_2072(this.var_1402.update(_loc4_),0,this.var_1403.update(_loc4_));
      }
      
      private function method_911(param1:Number, param2:Vector3, param3:Vector3, param4:Vector3, param5:Vector3, param6:Vector3) : void
      {
         var _loc8_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc7_:Number = NaN;
         _loc8_ = NaN;
         var _loc9_:Number = NaN;
         _loc10_ = NaN;
         var _loc11_:Number = 1 - param1;
         _loc7_ = _loc11_ * _loc11_;
         _loc8_ = 3 * param1 * _loc7_;
         _loc7_ *= _loc11_;
         _loc9_ = param1 * param1;
         _loc10_ = 3 * _loc9_ * _loc11_;
         _loc9_ *= param1;
         param6.x = _loc7_ * param2.x + _loc8_ * param3.x + _loc10_ * param4.x + _loc9_ * param5.x;
         param6.y = _loc7_ * param2.y + _loc8_ * param3.y + _loc10_ * param4.y + _loc9_ * param5.y;
         param6.z = _loc7_ * param2.z + _loc8_ * param3.z + _loc10_ * param4.z + _loc9_ * param5.z;
      }
   }
}
