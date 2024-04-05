package alternativa.tanks.utils
{
   public class name_1388 implements name_1391
   {
       
      
      private var mask:int;
      
      private var value:int;
      
      public function name_1388(param1:int = 0)
      {
         super();
         this.method_2305(param1);
      }
      
      public function method_2305(param1:int) : void
      {
         this.mask = Math.random() * 4294967295;
         this.value = param1 ^ this.mask;
      }
      
      public function name_1390() : int
      {
         return this.value ^ this.mask;
      }
   }
}
