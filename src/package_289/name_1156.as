package package_289
{
   public class name_1156
   {
       
      
      private var var_1981:Number;
      
      private var var_1980:TurretControlType;
      
      private var _direction:Number;
      
      private var var_1979:int;
      
      public function name_1156(param1:Number = 0, param2:TurretControlType = null, param3:Number = 0, param4:int = 0)
      {
         super();
         this.var_1981 = param1;
         this.var_1980 = param2;
         this._direction = param3;
         this.var_1979 = param4;
      }
      
      public function get controlInput() : Number
      {
         return this.var_1981;
      }
      
      public function set controlInput(param1:Number) : void
      {
         this.var_1981 = param1;
      }
      
      public function get controlType() : TurretControlType
      {
         return this.var_1980;
      }
      
      public function set controlType(param1:TurretControlType) : void
      {
         this.var_1980 = param1;
      }
      
      public function get direction() : Number
      {
         return this._direction;
      }
      
      public function set direction(param1:Number) : void
      {
         this._direction = param1;
      }
      
      public function get rotationSpeedNumber() : int
      {
         return this.var_1979;
      }
      
      public function set rotationSpeedNumber(param1:int) : void
      {
         this.var_1979 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "TurretStateCommand [";
         _loc1_ += "controlInput = " + this.controlInput + " ";
         _loc1_ += "controlType = " + this.controlType + " ";
         _loc1_ += "direction = " + this.direction + " ";
         _loc1_ += "rotationSpeedNumber = " + this.rotationSpeedNumber + " ";
         return _loc1_ + "]";
      }
   }
}
