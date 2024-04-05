package package_62
{
   public class name_137
   {
       
      
      private var var_470:int;
      
      private var var_471:String;
      
      private var var_473:String;
      
      private var var_472:Boolean;
      
      public function name_137(param1:int = 0, param2:String = null, param3:String = null, param4:Boolean = false)
      {
         super();
         this.var_470 = param1;
         this.var_471 = param2;
         this.var_473 = param3;
         this.var_472 = param4;
      }
      
      public function get fadeInTimeMs() : int
      {
         return this.var_470;
      }
      
      public function set fadeInTimeMs(param1:int) : void
      {
         this.var_470 = param1;
      }
      
      public function get laserPointerBlueColor() : String
      {
         return this.var_471;
      }
      
      public function set laserPointerBlueColor(param1:String) : void
      {
         this.var_471 = param1;
      }
      
      public function get laserPointerRedColor() : String
      {
         return this.var_473;
      }
      
      public function set laserPointerRedColor(param1:String) : void
      {
         this.var_473 = param1;
      }
      
      public function get locallyVisible() : Boolean
      {
         return this.var_472;
      }
      
      public function set locallyVisible(param1:Boolean) : void
      {
         this.var_472 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "LaserPointerCC [";
         _loc1_ += "fadeInTimeMs = " + this.fadeInTimeMs + " ";
         _loc1_ += "laserPointerBlueColor = " + this.laserPointerBlueColor + " ";
         _loc1_ += "laserPointerRedColor = " + this.laserPointerRedColor + " ";
         _loc1_ += "locallyVisible = " + this.locallyVisible + " ";
         return _loc1_ + "]";
      }
   }
}
