package projects.tanks.client.battlefield.models.tankparts.weapons.common
{
   import alternativa.tanks.vehicles.tanks.Tank;
   import package_67.Vector3d;
   
   public class name_1378
   {
       
      
      private var const_4:Vector3d;
      
      private var _position:Vector3d;
      
      private var _target:Tank;
      
      private var var_2233:Number;
      
      private var var_2077:Vector3d;
      
      public function name_1378(param1:Vector3d = null, param2:Vector3d = null, param3:Tank = null, param4:Number = 0, param5:Vector3d = null)
      {
         super();
         this.const_4 = param1;
         this._position = param2;
         this._target = param3;
         this.var_2233 = param4;
         this.var_2077 = param5;
      }
      
      public function get orientation() : Vector3d
      {
         return this.const_4;
      }
      
      public function set orientation(param1:Vector3d) : void
      {
         this.const_4 = param1;
      }
      
      public function get position() : Vector3d
      {
         return this._position;
      }
      
      public function set position(param1:Vector3d) : void
      {
         this._position = param1;
      }
      
      public function get target() : Tank
      {
         return this._target;
      }
      
      public function set target(param1:Tank) : void
      {
         this._target = param1;
      }
      
      public function get turretAngle() : Number
      {
         return this.var_2233;
      }
      
      public function set turretAngle(param1:Number) : void
      {
         this.var_2233 = param1;
      }
      
      public function get localHitPoint() : Vector3d
      {
         return this.var_2077;
      }
      
      public function set localHitPoint(param1:Vector3d) : void
      {
         this.var_2077 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "TargetPosition [";
         _loc1_ += "orientation = " + this.orientation + " ";
         _loc1_ += "position = " + this.position + " ";
         _loc1_ += "target = " + this.target + " ";
         _loc1_ += "turretAngle = " + this.turretAngle + " ";
         return _loc1_ + "]";
      }
   }
}
