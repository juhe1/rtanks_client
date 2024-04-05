package package_99
{
   public class name_1501
   {
       
      
      public var head:name_1500;
      
      public var tail:name_1500;
      
      public function name_1501()
      {
         super();
      }
      
      public function method_1046(param1:name_1500) : void
      {
         if(this.head == null)
         {
            this.head = this.tail = param1;
         }
         else
         {
            this.tail.next = param1;
            param1.prev = this.tail;
            this.tail = param1;
         }
      }
      
      public function method_1051(param1:name_1500) : void
      {
         if(this.head == null)
         {
            return;
         }
         if(param1 == this.head)
         {
            if(param1 == this.tail)
            {
               this.tail = null;
               this.head = null;
            }
            else
            {
               this.head = this.head.next;
               this.head.prev = null;
            }
         }
         else if(param1 == this.tail)
         {
            this.tail = this.tail.prev;
            this.tail.next = null;
         }
         else
         {
            param1.prev.next = param1.next;
            param1.next.prev = param1.prev;
         }
         param1.dispose();
      }
      
      public function name_1508() : void
      {
         while(this.head != null)
         {
            this.method_1051(this.head);
         }
      }
   }
}
