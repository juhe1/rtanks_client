package alternativa.tanks.sfx
{
   public class name_2384
   {
       
      
      private var var_3069:int;
      
      private var var_3064:int;
      
      private var var_3067:int;
      
      private var maxValue:Number;
      
      private var minValue:Number;
      
      private var var_3068:Number;
      
      private var value:Number;
      
      private var speed:Number;
      
      private var var_3065:Number;
      
      private var var_3066:int;
      
      private var var_3063:int;
      
      public function name_2384(param1:int, param2:int, param3:int, param4:Number, param5:Number, param6:Number)
      {
         super();
         this.var_3069 = param1;
         this.var_3064 = param2;
         this.var_3067 = param3;
         this.minValue = param4;
         this.maxValue = param5;
         this.var_3068 = param6;
         this.var_3065 = param5 - param4;
      }
      
      public function init(param1:int) : void
      {
         this.value = this.maxValue;
         this.var_3063 = this.var_3069;
         this.speed = this.method_2836(-1);
         this.var_3066 = param1 + this.var_3063;
      }
      
      public function method_2837(param1:Number) : void
      {
         if(param1 < this.minValue)
         {
            return;
         }
         this.maxValue = param1;
         this.var_3065 = this.maxValue - this.minValue;
      }
      
      public function name_2389(param1:Number) : void
      {
         if(param1 > this.maxValue)
         {
            return;
         }
         this.minValue = param1;
         this.var_3065 = this.maxValue - this.minValue;
      }
      
      public function name_2390(param1:int, param2:int) : Number
      {
         this.value += this.speed * param2;
         if(this.value > this.maxValue)
         {
            this.value = this.maxValue;
         }
         if(this.value < this.minValue)
         {
            this.value = this.minValue;
         }
         if(param1 >= this.var_3066)
         {
            if(this.var_3063 > this.var_3064)
            {
               this.var_3063 -= this.var_3067;
               if(this.var_3063 < this.var_3064)
               {
                  this.var_3063 = this.var_3064;
               }
            }
            this.var_3066 = param1 + this.var_3063;
            if(this.speed < 0)
            {
               this.speed = this.method_2836(1);
            }
            else
            {
               this.speed = this.method_2836(-1);
            }
         }
         return this.value;
      }
      
      private function method_2836(param1:Number) : Number
      {
         return param1 * this.var_3068 * this.var_3065 / this.var_3063;
      }
   }
}
