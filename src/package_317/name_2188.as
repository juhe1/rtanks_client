package package_317
{
   public class name_2188
   {
       
      
      private var a:Number = 0;
      
      private var b:Number = 0;
      
      private var var_1991:Number = 0;
      
      private var name_187:Number = 0;
      
      private var acceleration:Number = 0;
      
      public var value:Number = 0;
      
      public function name_2188(param1:Number, param2:Number, param3:Number)
      {
         super();
         this.a = 2 * param1 * param2;
         this.b = param1 * param1;
         this.var_1991 = param3;
      }
      
      public function reset(param1:Number = 0, param2:Number = 0) : void
      {
         this.value = param1;
         this.name_187 = param2;
      }
      
      public function name_2190(param1:Number) : void
      {
         this.value = param1;
      }
      
      public function update(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = this.value - param2 + param1 * this.name_187;
         this.name_187 += param1 * this.acceleration;
         var _loc4_:Number = this.method_2680(_loc3_,0,this.var_1991);
         this.acceleration = -this.a * this.name_187 - this.b * _loc4_;
         this.value = param2 + _loc3_;
      }
      
      private function method_2680(param1:Number, param2:Number, param3:Number) : Number
      {
         var _loc4_:Number = param1 - param2;
         if(_loc4_ > param3)
         {
            return _loc4_ - param3;
         }
         if(_loc4_ < -param3)
         {
            return _loc4_ + param3;
         }
         return 0;
      }
   }
}
