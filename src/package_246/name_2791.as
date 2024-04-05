package package_246
{
   internal class name_2791 implements name_2789
   {
       
      
      private var var_2527:int;
      
      private var timeLeft:int;
      
      public function name_2791(param1:int)
      {
         super();
         this.var_2527 = param1;
      }
      
      public function init() : void
      {
         this.timeLeft = this.var_2527;
      }
      
      public function update(param1:int) : Boolean
      {
         if(this.timeLeft <= 0)
         {
            return false;
         }
         this.timeLeft -= param1;
         return true;
      }
      
      public function name_2792(param1:int) : void
      {
         this.var_2527 = param1;
      }
   }
}
