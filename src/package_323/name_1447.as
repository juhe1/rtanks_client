package package_323
{
   public class name_1447
   {
       
      
      private var var_2306:int;
      
      private var var_2308:int;
      
      private var var_2307:int;
      
      public function name_1447(param1:int = 0, param2:int = 0, param3:int = 0)
      {
         super();
         this.var_2306 = param1;
         this.var_2308 = param2;
         this.var_2307 = param3;
      }
      
      public function get reloadTime() : int
      {
         return this.var_2306;
      }
      
      public function set reloadTime(param1:int) : void
      {
         this.var_2306 = param1;
      }
      
      public function get magazineReloadTime() : int
      {
         return this.var_2308;
      }
      
      public function set magazineReloadTime(param1:int) : void
      {
         this.var_2308 = param1;
      }
      
      public function get magazineSize() : int
      {
         return this.var_2307;
      }
      
      public function set magazineSize(param1:int) : void
      {
         this.var_2307 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ShotgunShotCC [";
         _loc1_ += "magazineReloadTime = " + this.magazineReloadTime + " ";
         _loc1_ += "magazineSize = " + this.magazineSize + " ";
         return _loc1_ + "]";
      }
   }
}
