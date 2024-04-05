package package_101
{
   public class name_1214
   {
       
      
      private var var_2043:int;
      
      public function name_1214(param1:int = 0)
      {
         super();
         this.var_2043 = param1;
      }
      
      public function get incarnationId() : int
      {
         return this.var_2043;
      }
      
      public function set incarnationId(param1:int) : void
      {
         this.var_2043 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "TankSpawnerCC [";
         _loc1_ += "incarnationId = " + this.incarnationId + " ";
         return _loc1_ + "]";
      }
   }
}
