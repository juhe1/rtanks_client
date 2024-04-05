package alternativa.tanks.models.weapons.targeting
{
   import alternativa.tanks.models.weapon.name_903;
   import alternativa.tanks.models.weapons.targeting.direction.name_2702;
   import alternativa.tanks.models.weapons.targeting.direction.name_2704;
   import alternativa.tanks.models.weapons.targeting.priority.TargetingPriorityCalculator;
   import package_100.class_39;
   import package_441.TargetingVisualDebug;
   import package_61.name_124;
   
   public class name_1750
   {
      
      private static const const_2023:TargetingVisualDebug = new TargetingVisualDebug();
       
      
      private var var_2481:name_2704;
      
      private var var_2480:TargetingPriorityCalculator;
      
      private var var_2479:class_39;
      
      private var result:TargetingResult;
      
      public function name_1750(param1:name_2704, param2:class_39, param3:TargetingPriorityCalculator)
      {
         this.result = new TargetingResult();
         super();
         this.var_2481 = param1;
         this.var_2479 = param2;
         this.var_2480 = param3;
      }
      
      public function name_1753() : class_39
      {
         return this.var_2479;
      }
      
      public function target(param1:name_903) : TargetingResult
      {
         var _loc2_:name_2702 = null;
         var _loc3_:Vector.<name_124> = null;
         var _loc4_:Number = NaN;
         var _loc5_:Vector.<name_2702> = this.var_2481.name_2707(param1);
         _loc5_.push(new name_2702(param1.direction,0,0));
         _loc5_.sort(name_2702.method_271);
         var _loc6_:Number = Number.NEGATIVE_INFINITY;
         const_2023.reset();
         for each(_loc2_ in _loc5_)
         {
            if(_loc2_.name_2507() < _loc6_)
            {
               break;
            }
            _loc3_ = this.var_2479.method_974(param1,_loc2_.name_1755());
            _loc4_ = this.var_2480.name_2705(_loc2_.name_2703(),_loc3_);
            if(_loc4_ > 0)
            {
               _loc4_ += _loc2_.name_2706();
            }
            if(_loc4_ > _loc6_ || _loc4_ == _loc6_ && _loc2_.name_2703() == 0)
            {
               _loc6_ = _loc4_;
               this.result.name_452(_loc2_.name_1755(),_loc3_);
            }
         }
         return this.result;
      }
   }
}
