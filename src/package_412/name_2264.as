package package_412
{
   public class name_2264
   {
       
      
      private var var_2964:int;
      
      private var var_2956:int;
      
      public function name_2264(param1:int = 0, param2:int = 0)
      {
         super();
         this.var_2964 = param1;
         this.var_2956 = param2;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2964;
      }
      
      public function set scoreLimit(param1:int) : void
      {
         this.var_2964 = param1;
      }
      
      public function get timeLimitInSec() : int
      {
         return this.var_2956;
      }
      
      public function set timeLimitInSec(param1:int) : void
      {
         this.var_2956 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BattleLimits [";
         _loc1_ += "scoreLimit = " + this.scoreLimit + " ";
         _loc1_ += "timeLimitInSec = " + this.timeLimitInSec + " ";
         return _loc1_ + "]";
      }
   }
}
