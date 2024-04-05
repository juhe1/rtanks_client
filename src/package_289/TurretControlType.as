package package_289
{
   public class TurretControlType
   {
      
      public static const ROTATION_DIRECTION:TurretControlType = new TurretControlType(0,"ROTATION_DIRECTION");
      
      public static const TARGET_ANGLE_LOCAL:TurretControlType = new TurretControlType(1,"TARGET_ANGLE_LOCAL");
      
      public static const TARGET_ANGLE_WORLD:TurretControlType = new TurretControlType(2,"TARGET_ANGLE_WORLD");
       
      
      private var _value:int;
      
      private var var_23:String;
      
      public function TurretControlType(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this.var_23 = param2;
      }
      
      public static function get method_393() : Vector.<TurretControlType>
      {
         var _loc1_:Vector.<TurretControlType> = new Vector.<TurretControlType>();
         _loc1_.push(ROTATION_DIRECTION);
         _loc1_.push(TARGET_ANGLE_LOCAL);
         _loc1_.push(TARGET_ANGLE_WORLD);
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "TurretControlType [" + this.var_23 + "]";
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function get name() : String
      {
         return this.var_23;
      }
   }
}
