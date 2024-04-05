package package_88
{
   public class name_2498
   {
      
      private static const const_2336:Number = 0;
      
      private static const const_2335:Number = 1;
       
      
      private var var_3106:int;
      
      private var var_3107:int;
      
      private var var_3108:Number;
      
      private var var_3109:Number;
      
      public function name_2498()
      {
         super();
      }
      
      private static function method_218(param1:Number) : Number
      {
         return Math.max(0,Math.min(1,param1));
      }
      
      public function init(param1:int, param2:int, param3:Number) : void
      {
         this.var_3106 = param1;
         this.var_3107 = param2;
         this.var_3108 = param3;
      }
      
      public function reset() : void
      {
         this.var_3106 = -1;
         this.var_3107 = 0;
      }
      
      public function method_1623(param1:int, param2:Boolean) : Number
      {
         if(param1 > this.var_3106 + this.var_3107)
         {
            if(param2)
            {
               return 1;
            }
            return 0;
         }
         var _loc3_:Number = (param1 - this.var_3106) / this.var_3107;
         if(!param2)
         {
            _loc3_ = 1 - _loc3_;
         }
         return method_218(_loc3_);
      }
      
      public function name_2499(param1:int, param2:Boolean) : Number
      {
         var _loc3_:Number = NaN;
         if(param1 > this.var_3106 + this.var_3107)
         {
            if(param2)
            {
               return 1;
            }
            return 0;
         }
         var _loc4_:Number = (param1 - this.var_3106) / this.var_3107;
         if(param2)
         {
            _loc3_ = this.var_3108 + (1 - this.var_3108) * _loc4_;
         }
         else
         {
            _loc3_ = this.var_3108 * (1 - _loc4_);
         }
         return method_218(_loc3_);
      }
      
      public function get method_2886() : Number
      {
         return this.var_3108;
      }
      
      public function get newAlpha() : Number
      {
         return this.var_3109;
      }
      
      public function set newAlpha(param1:Number) : void
      {
         this.var_3109 = param1;
      }
   }
}
