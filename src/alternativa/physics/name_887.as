package alternativa.physics
{
   import alternativa.physics.collision.CollisionPrimitive;
   
   public class name_887
   {
       
      
      public var head:name_889;
      
      public var tail:name_889;
      
      public var size:int;
      
      public function name_887()
      {
         super();
      }
      
      public function append(param1:CollisionPrimitive) : void
      {
         var _loc2_:name_889 = name_889.create(param1);
         if(this.head == null)
         {
            this.head = this.tail = _loc2_;
         }
         else
         {
            this.tail.next = _loc2_;
            _loc2_.prev = this.tail;
            this.tail = _loc2_;
         }
         ++this.size;
      }
      
      public function remove(param1:CollisionPrimitive) : void
      {
         var _loc2_:name_889 = this.method_1853(param1);
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_ == this.head)
         {
            if(this.size == 1)
            {
               this.head = this.tail = null;
            }
            else
            {
               this.head = _loc2_.next;
               this.head.prev = null;
            }
         }
         else if(_loc2_ == this.tail)
         {
            this.tail = this.tail.prev;
            this.tail.next = null;
         }
         else
         {
            _loc2_.prev.next = _loc2_.next;
            _loc2_.next.prev = _loc2_.prev;
         }
         _loc2_.dispose();
         --this.size;
      }
      
      public function method_1853(param1:CollisionPrimitive) : name_889
      {
         var _loc2_:name_889 = this.head;
         while(_loc2_ != null && _loc2_.name_899 != param1)
         {
            _loc2_ = _loc2_.next;
         }
         return _loc2_;
      }
      
      public function clear() : void
      {
         var _loc1_:name_889 = null;
         while(this.head != null)
         {
            _loc1_ = this.head;
            this.head = this.head.next;
            _loc1_.dispose();
         }
         this.tail = null;
         this.size = 0;
      }
   }
}
