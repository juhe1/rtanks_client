package juho.hacking.hacks {
   import alternativa.tanks.vehicles.tanks.Tank;
   import juho.hacking.Hack;
   import juho.hacking.event.HackEventDispatcher;
   import juho.hacking.event.LocalTankInitedEvent;
   import juho.hacking.event.TankSpecificationsChangedEvent;
   
   public class SpeedHack extends Hack {
  
      private static const NAME:String = "Speed Hack";
      
      // Name is used in saving to disk, so don't change it.
      private static const ID:String = "SPEED_HACK";
      
      private var localTank:Tank;
      
      public function SpeedHack() {
         super(NAME, ID);
         
         this.addProperty("Speed", 1000.0, "Number", speedChanged);
         this.addProperty("Turn Speed", 1000.0, "Number", speedChanged);
         this.addProperty("Turret Rotation Speed", 1000.0, "Number", speedChanged);
         this.addProperty("Accelaration", 1000.0, "Number", speedChanged);
         HackEventDispatcher.singleton.addEventListener(LocalTankInitedEvent.LOCAL_TANK_INITED, this.localTankInited);
         HackEventDispatcher.singleton.addEventListener(TankSpecificationsChangedEvent.TANK_SPECIFICATIONS_CHANGED_EVENT, this.tankSpecificationsChanged);
      }
      
      override public function enable():void {
         super.enable();
         this.setSpeed();
      }
      
      override public function disable():void {
         super.disable();
      }
      
      private function speedChanged(value:*):void {
         this.setSpeed();
      }
      
      private function localTankInited(e:LocalTankInitedEvent) : void {
         this.localTank = e.localTank;
      }
      
      public function tankSpecificationsChanged(e:TankSpecificationsChangedEvent) : void {
         if (e.tank == this.localTank) {
            this.setSpeed();
         }
      }
      
      private function setSpeed() : void {
         if (this.localTank == null || !this.isEnabled) {
            return;
         }
         
         var speed:Number = this.getProperty("Speed").value;
         var turnSpeed:Number = this.getProperty("Turn Speed").value;
         var accelaration:Number = this.getProperty("Accelaration").value;
         var turretRotationSpeed:Number = this.getProperty("Turret Rotation Speed").value;
         
         this.localTank.setMaxSpeed(speed, true);
         this.localTank.setMaxTurnSpeed(turnSpeed, true);
         this.localTank.setAcceleration(accelaration)
         this.localTank.setMaxTurretTurnSpeed(turretRotationSpeed, true);
         
         trace("Changed speed son");
      }
   
   }
}