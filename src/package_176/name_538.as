package package_176
{
   import flash.events.EventDispatcher;
   
   public class name_538 extends EventDispatcher implements name_549
   {
       
      
      private var var_1114:Boolean;
      
      public function name_538()
      {
         super();
      }
      
      public function name_1065() : Boolean
      {
         return this.var_1114;
      }
      
      public function open() : void
      {
         this.var_1114 = true;
         dispatchEvent(new DialogWindowsDispatcherServiceEvent(DialogWindowsDispatcherServiceEvent.OPEN));
      }
      
      public function close() : void
      {
         this.var_1114 = false;
         dispatchEvent(new DialogWindowsDispatcherServiceEvent(DialogWindowsDispatcherServiceEvent.CLOSE));
      }
      
      public function method_1307() : void
      {
         this.var_1114 = false;
         dispatchEvent(new DialogWindowsDispatcherServiceEvent(DialogWindowsDispatcherServiceEvent.FORCIBLY_CLOSE));
      }
   }
}
