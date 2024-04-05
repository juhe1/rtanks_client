package package_77
{
   public class MovementMethods
   {
       
      
      private var var_2344:Vector.<name_1517>;
      
      private var var_2345:int;
      
      public function MovementMethods(param1:Vector.<name_1517>)
      {
         super();
         this.var_2344 = param1;
      }
      
      public function name_1513() : name_1517
      {
         return this.var_2344[this.var_2345];
      }
      
      public function name_1521() : void
      {
         this.var_2345 = (this.var_2345 + 1) % this.var_2344.length;
      }
   }
}
