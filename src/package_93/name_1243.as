package package_93
{
   import package_67.Vector3d;
   import platform.client.fp10.core.type.name_70;
   
   public class name_1243
   {
       
      
      private var _direction:Vector3d;
      
      private var var_2077:Vector3d;
      
      private var var_2078:int;
      
      private var _target:name_70;
      
      public function name_1243(param1:Vector3d = null, param2:Vector3d = null, param3:int = 0, param4:name_70 = null)
      {
         super();
         this._direction = param1;
         this.var_2077 = param2;
         this.var_2078 = param3;
         this._target = param4;
      }
      
      public function get direction() : Vector3d
      {
         return this._direction;
      }
      
      public function set direction(param1:Vector3d) : void
      {
         this._direction = param1;
      }
      
      public function get localHitPoint() : Vector3d
      {
         return this.var_2077;
      }
      
      public function set localHitPoint(param1:Vector3d) : void
      {
         this.var_2077 = param1;
      }
      
      public function get numberHits() : int
      {
         return this.var_2078;
      }
      
      public function set numberHits(param1:int) : void
      {
         this.var_2078 = param1;
      }
      
      public function get target() : name_70
      {
         return this._target;
      }
      
      public function set target(param1:name_70) : void
      {
         this._target = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "TargetHit [";
         _loc1_ += "direction = " + this.direction + " ";
         _loc1_ += "localHitPoint = " + this.localHitPoint + " ";
         _loc1_ += "numberHits = " + this.numberHits + " ";
         _loc1_ += "target = " + this.target + " ";
         return _loc1_ + "]";
      }
   }
}
