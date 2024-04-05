package package_240
{
   public class QueueItem
   {
      
      private static var var_1689:QueueItem;
       
      
      public var next:QueueItem;
      
      public var data:*;
      
      public function QueueItem(param1:*)
      {
         super();
         this.data = param1;
      }
      
      public static function create(param1:*) : QueueItem
      {
         if(var_1689 == null)
         {
            return new QueueItem(param1);
         }
         var _loc2_:QueueItem = var_1689;
         var_1689 = var_1689.next;
         _loc2_.data = param1;
         return _loc2_;
      }
      
      public function destroy() : void
      {
         this.data = null;
         this.next = var_1689;
         var_1689 = this;
      }
   }
}
