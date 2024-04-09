package juho.hacking.event {
   
   import alternativa.tanks.vehicles.tanks.Tank;
   import flash.events.Event;
   
	/**
    * ...
    * @author juhe
    */
   
   public class LocalTankInitedEvent extends Event {
      
      public static const LOCAL_TANK_INITED:String = "LocalTankInited";
      public var localTank:Tank;
      
      public function LocalTankInitedEvent(_localTank:Tank, bubbles:Boolean = false, cancelable:Boolean = false) {
         super(LOCAL_TANK_INITED, bubbles, cancelable);
         this.localTank = _localTank;
      }
      
      override public function clone():Event {
        return new LocalTankInitedEvent(this.localTank, this.bubbles, this.cancelable);
      }
      
   }

}