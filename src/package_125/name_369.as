package package_125
{
   import flash.events.EventDispatcher;
   
   public class name_369 extends EventDispatcher implements name_366
   {
       
      
      public function name_369()
      {
         super();
      }
      
      public function activatedSuccessfully() : void
      {
         dispatchEvent(new name_1576(name_1576.name_1577));
      }
      
      public function activatedFailed() : void
      {
         dispatchEvent(new name_1576(name_1576.name_1578));
      }
   }
}
