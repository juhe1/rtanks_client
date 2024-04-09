package package_61
{
   import alternativa.physics.collision.CollisionPrimitive;
   import package_37.Vector3;
   
   public class RayHit
   {
       
      
      public var var_81:CollisionPrimitive;
      
      public var position:Vector3;
      
      public var normal:Vector3;
      
      public var t:Number = 0;
      
      public var var_460:Boolean;
      
      public function RayHit()
      {
         this.position = new Vector3();
         this.normal = new Vector3();
         super();
      }
      
      public function clear() : void
      {
         this.var_81 = null;
      }
      
      public function copy(param1:RayHit) : void
      {
         this.var_81 = param1.var_81;
         this.position.vCopy(param1.position);
         this.normal.vCopy(param1.normal);
         this.t = param1.t;
         this.var_460 = param1.var_460;
      }
      
      public function clone() : RayHit
      {
         var _loc1_:RayHit = new RayHit();
         _loc1_.copy(this);
         return _loc1_;
      }
   }
}
