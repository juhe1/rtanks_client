package package_246
{
   internal class name_2790 implements name_2789
   {
       
      
      private var message:Message;
      
      private var var_3379:int;
      
      private var timeLeft:int;
      
      private var alpha1:Number;
      
      private var alpha2:Number;
      
      private var var_3380:Number;
      
      public function name_2790(param1:Message, param2:int, param3:Number, param4:Number)
      {
         super();
         this.message = param1;
         this.var_3379 = param2;
         this.alpha1 = param3;
         this.alpha2 = param4;
         this.var_3380 = param4 - param3;
      }
      
      public function init() : void
      {
         this.message.name_1068(this.alpha1);
         this.timeLeft = this.var_3379;
      }
      
      public function update(param1:int) : Boolean
      {
         if(this.timeLeft <= 0)
         {
            return false;
         }
         this.timeLeft -= param1;
         if(this.timeLeft < 0)
         {
            this.timeLeft = 0;
         }
         this.message.name_1068(this.alpha2 - this.var_3380 * this.timeLeft / this.var_3379);
         return true;
      }
      
      public function name_2792(param1:int) : void
      {
         this.var_3379 = param1;
      }
   }
}
