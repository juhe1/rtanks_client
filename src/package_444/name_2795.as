package package_444
{
   public class name_2795 extends TweenCore
   {
       
      
      protected var var_3382:TweenCore;
      
      protected var var_3381:TweenCore;
      
      public var name_2801:Boolean;
      
      public function name_2795(param1:Object = null)
      {
         super(0,param1);
      }
      
      public function name_2796(param1:TweenCore, param2:* = 0) : TweenCore
      {
         var _loc3_:name_2795 = param1.timeline;
         if(!param1.var_2739 && Boolean(_loc3_))
         {
            _loc3_.remove(param1,true);
         }
         param1.timeline = this;
         param1.var_2728 = Number(param2) + param1.delay;
         if(param1.gc)
         {
            param1.setEnabled(true,true);
         }
         if(param1.var_2730 && _loc3_ != this)
         {
            param1.var_2735 = param1.var_2728 + (this.name_2797 - param1.var_2728) / param1.var_2736;
         }
         if(Boolean(this.var_3381))
         {
            this.var_3381.var_2744 = param1;
         }
         else
         {
            this.var_3382 = param1;
         }
         param1.var_2743 = this.var_3381;
         this.var_3381 = param1;
         param1.var_2744 = null;
         param1.var_2739 = false;
         return param1;
      }
      
      public function remove(param1:TweenCore, param2:Boolean = false) : void
      {
         if(param1.var_2739)
         {
            return;
         }
         if(!param2)
         {
            param1.setEnabled(false,true);
         }
         if(Boolean(param1.var_2744))
         {
            param1.var_2744.var_2743 = param1.var_2743;
         }
         else if(this.var_3381 == param1)
         {
            this.var_3381 = param1.var_2743;
         }
         if(Boolean(param1.var_2743))
         {
            param1.var_2743.var_2744 = param1.var_2744;
         }
         else if(this.var_3382 == param1)
         {
            this.var_3382 = param1.var_2744;
         }
         param1.var_2739 = true;
      }
      
      override public function method_2598(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:TweenCore = null;
         var _loc6_:TweenCore = this.var_3382;
         this.var_2727 = param1;
         this.var_2738 = param1;
         while(Boolean(_loc6_))
         {
            _loc5_ = _loc6_.var_2744;
            if(_loc6_.active || param1 >= _loc6_.var_2728 && !_loc6_.var_2730 && !_loc6_.gc)
            {
               if(!_loc6_.var_2732)
               {
                  _loc6_.method_2598((param1 - _loc6_.var_2728) * _loc6_.var_2736,param2,false);
               }
               else
               {
                  _loc4_ = _loc6_.var_2737 ? Number(Number(_loc6_.totalDuration)) : Number(Number(_loc6_.var_2731));
                  _loc6_.method_2598(_loc4_ - (param1 - _loc6_.var_2728) * _loc6_.var_2736,param2,false);
               }
            }
            _loc6_ = _loc5_;
         }
      }
      
      public function get name_2797() : Number
      {
         return this.var_2727;
      }
   }
}
