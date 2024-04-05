package alternativa.tanks.utils
{
   public class name_1398
   {
       
      
      private var mask:int;
      
      public function name_1398(param1:int = 0)
      {
         super();
         this.mask = param1;
      }
      
      public function name_1402() : int
      {
         return this.mask;
      }
      
      public function name_1404(param1:int) : void
      {
         this.mask |= param1;
      }
      
      public function name_1406(param1:int) : void
      {
         this.mask &= ~param1;
      }
      
      public function name_2080(param1:int) : void
      {
         this.name_1404(1 << param1);
      }
      
      public function name_2078(param1:int) : void
      {
         this.name_1406(1 << param1);
      }
      
      public function method_605(param1:int) : int
      {
         return 1 & this.mask >> param1;
      }
      
      public function clear() : void
      {
         this.mask = 0;
      }
      
      public function name_1400() : Boolean
      {
         return this.mask == 0;
      }
      
      public function method_2306(param1:int) : Boolean
      {
         return (this.mask & ~param1) == 0;
      }
      
      public function name_1401() : Boolean
      {
         return this.mask != 0;
      }
      
      public function name_1407(param1:int) : Boolean
      {
         return (this.mask & param1) != 0;
      }
      
      public function change(param1:int, param2:Boolean) : Boolean
      {
         var _loc3_:int = param1;
         if(param2)
         {
            this.name_1404(param1);
         }
         else
         {
            this.name_1406(param1);
         }
         return _loc3_ != param1;
      }
   }
}
