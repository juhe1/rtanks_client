package package_76
{
   public class name_2071
   {
       
      
      private var var_2715:Number;
      
      private var var_2713:Number;
      
      private var var_2716:Number;
      
      private var var_1401:Number;
      
      private var var_2714:Number;
      
      public function name_2071()
      {
         super();
      }
      
      public function init(param1:Number, param2:Number, param3:Number) : void
      {
         this.var_2713 = param2 - param1;
         if(this.var_2713 < 0)
         {
            this.var_2713 = -this.var_2713;
            this.var_2714 = -1;
         }
         else
         {
            this.var_2714 = 1;
         }
         if(this.var_2713 > Math.PI)
         {
            this.var_2714 = -this.var_2714;
            this.var_2713 = 2 * Math.PI - this.var_2713;
         }
         this.var_2716 = param3 * this.var_2713;
         this.var_1401 = 0;
         this.var_2715 = 0;
      }
      
      public function reverseAcceleration() : void
      {
         this.var_2716 = -this.var_2716;
      }
      
      public function update(param1:Number) : Number
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this.var_2715 < this.var_2713)
         {
            _loc2_ = this.var_2716 * param1;
            _loc3_ = (this.var_1401 + 0.5 * _loc2_) * param1;
            this.var_1401 += _loc2_;
            _loc4_ = this.var_2713 - this.var_2715;
            if(_loc4_ < _loc3_)
            {
               _loc3_ = _loc4_;
            }
            this.var_2715 += _loc3_;
            return _loc3_ * this.var_2714;
         }
         return 0;
      }
   }
}
