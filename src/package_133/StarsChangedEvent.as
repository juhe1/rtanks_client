package package_133
{
   import flash.events.Event;
   
   public class StarsChangedEvent extends Event
   {
      
      public static const STARS_CHANGED:String = "StarsChangedEvent.STARS_CHANGED";
       
      
      public function StarsChangedEvent()
      {
         super("StarsChangedEvent.STARS_CHANGED");
      }
   }
}
