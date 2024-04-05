package package_133
{
   import flash.events.EventDispatcher;
   
   public class name_546 extends EventDispatcher implements name_360
   {
       
      
      private var stars:int;
      
      public function name_546()
      {
         super();
      }
      
      public function method_1103() : int
      {
         return this.stars;
      }
      
      public function setStars(param1:int) : void
      {
         this.stars = param1;
         dispatchEvent(new StarsChangedEvent());
      }
   }
}
