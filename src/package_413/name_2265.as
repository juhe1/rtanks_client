package package_413
{
   public class name_2265
   {
       
      
      private var var_2900:int;
      
      private var var_2901:int;
      
      public function name_2265(param1:int = 0, param2:int = 0)
      {
         super();
         this.var_2900 = param1;
         this.var_2901 = param2;
      }
      
      public function get max() : int
      {
         return this.var_2900;
      }
      
      public function set max(param1:int) : void
      {
         this.var_2900 = param1;
      }
      
      public function get min() : int
      {
         return this.var_2901;
      }
      
      public function set min(param1:int) : void
      {
         this.var_2901 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "Range [";
         _loc1_ += "max = " + this.max + " ";
         _loc1_ += "min = " + this.min + " ";
         return _loc1_ + "]";
      }
   }
}
