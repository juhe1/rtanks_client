package alternativa.physics
{
   import alternativa.physics.collision.CollisionPrimitive;
   
   public class name_889
   {
      
      private static var var_1689:name_889;
       
      
      public var name_899:CollisionPrimitive;
      
      public var next:name_889;
      
      public var prev:name_889;
      
      public function name_889(param1:CollisionPrimitive)
      {
         super();
         this.name_899 = param1;
      }
      
      public static function create(param1:CollisionPrimitive) : name_889
      {
         var _loc2_:name_889 = null;
         if(var_1689 == null)
         {
            _loc2_ = new name_889(param1);
         }
         else
         {
            _loc2_ = var_1689;
            _loc2_.name_899 = param1;
            var_1689 = _loc2_.next;
            _loc2_.next = null;
         }
         return _loc2_;
      }
      
      public static function method_1865() : void
      {
         var _loc1_:name_889 = var_1689;
         while(_loc1_ != null)
         {
            var_1689 = _loc1_.next;
            _loc1_.next = null;
            _loc1_ = var_1689;
         }
      }
      
      public function dispose() : void
      {
         this.name_899 = null;
         this.prev = null;
         this.next = var_1689;
         var_1689 = this;
      }
   }
}
