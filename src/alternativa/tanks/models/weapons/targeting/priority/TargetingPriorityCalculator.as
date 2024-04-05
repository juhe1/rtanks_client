package alternativa.tanks.models.weapons.targeting.priority
{
   import alternativa.physics.name_660;
   import package_320.class_38;
   import package_442.name_2708;
   import package_61.name_124;
   
   public class TargetingPriorityCalculator
   {
       
      
      private var var_2485:class_38;
      
      private var var_2484:Number;
      
      public function TargetingPriorityCalculator(param1:class_38, param2:Number = 0)
      {
         super();
         this.var_2485 = param1;
         this.var_2484 = param2;
      }
      
      public function method_2490(param1:Number, param2:Vector.<name_2708>) : Number
      {
         var _loc3_:name_2708 = null;
         var _loc4_:Number = 0;
         var _loc5_:int = param2.length - 1;
         while(_loc5_ >= 0)
         {
            _loc3_ = param2[_loc5_];
            _loc4_ = Math.max(this.method_2489(_loc3_,param1) + this.var_2484 * _loc4_,_loc4_);
            _loc5_--;
         }
         return _loc4_;
      }
      
      private function method_2489(param1:name_2708, param2:Number) : Number
      {
         return this.var_2485.method_960(param1.getTank(),param1.method_1242(),param2);
      }
      
      public function name_2705(param1:Number, param2:Vector.<name_124>) : Number
      {
         var _loc3_:name_124 = null;
         var _loc4_:Number = 1;
         var _loc5_:Number = 0;
         for each(_loc3_ in param2)
         {
            _loc5_ += this.method_2488(param1,_loc3_) * _loc4_;
            _loc4_ *= this.var_2484;
         }
         return _loc5_;
      }
      
      private function method_2488(param1:Number, param2:name_124) : Number
      {
         var _loc3_:name_660 = param2.var_81.name_787;
         if(param2.var_460)
         {
            return 0;
         }
         return this.var_2485.method_960(_loc3_.tank,param2.t,param1);
      }
   }
}
