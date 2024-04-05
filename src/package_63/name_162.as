package package_63
{
   public class name_162
   {
       
      
      private var var_406:Number;
      
      private var var_407:Number;
      
      private var var_405:int;
      
      public function name_162(param1:Number = 0, param2:Number = 0, param3:int = 0)
      {
         super();
         this.var_406 = param1;
         this.var_407 = param2;
         this.var_405 = param3;
      }
      
      public function get coneHorizontalAngle() : Number
      {
         return this.var_406;
      }
      
      public function set coneHorizontalAngle(param1:Number) : void
      {
         this.var_406 = param1;
      }
      
      public function get coneVerticalAngle() : Number
      {
         return this.var_407;
      }
      
      public function set coneVerticalAngle(param1:Number) : void
      {
         this.var_407 = param1;
      }
      
      public function get pelletCount() : int
      {
         return this.var_405;
      }
      
      public function set pelletCount(param1:int) : void
      {
         this.var_405 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ShotGunAimingCC [";
         _loc1_ += "coneHorizontalAngle = " + this.coneHorizontalAngle + " ";
         _loc1_ += "coneVerticalAngle = " + this.coneVerticalAngle + " ";
         _loc1_ += "pelletCount = " + this.pelletCount + " ";
         return _loc1_ + "]";
      }
   }
}
