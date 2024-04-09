package juho.hacking.event {
   
   import alternativa.tanks.vehicles.tanks.Tank;
   import flash.events.Event;
   
	/**
    * ...
    * @author juhe
    */
   
   public class LocalTankDestroyedEvent extends Event {
      
      public static const LOCAL_TANK_DESTROYED_EVENT:String = "LocalTankDestroyedEvent";
      
      public function LocalTankDestroyedEvent(bubbles:Boolean = false, cancelable:Boolean = false) {
         super(LOCAL_TANK_DESTROYED_EVENT, bubbles, cancelable);
      }
      
      override public function clone():Event {
        return new LocalTankDestroyedEvent(this.bubbles, this.cancelable);
      }
      
   }

}