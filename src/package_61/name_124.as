package package_61
{
   import alternativa.physics.collision.name_774;
   import package_37.Vector3;
   
   public class name_124
   {
       
      
      public var var_81:name_774;
      
      public var position:Vector3;
      
      public var normal:Vector3;
      
      public var t:Number = 0;
      
      public var var_460:Boolean;
      
      public function name_124()
      {
         this.position = new Vector3();
         this.normal = new Vector3();
         super();
      }
      
      public function clear() : void
      {
         this.var_81 = null;
      }
      
      public function copy(param1:name_124) : void
      {
         this.var_81 = param1.var_81;
         this.position.vCopy(param1.position);
         this.normal.vCopy(param1.normal);
         this.t = param1.t;
         this.var_460 = param1.var_460;
      }
      
      public function clone() : name_124
      {
         var _loc1_:name_124 = new name_124();
         _loc1_.copy(this);
         return _loc1_;
      }
   }
}
