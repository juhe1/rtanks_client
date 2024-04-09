package juho.hacking.hacks {
   
   import alternativa.physics.collision.name_166;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.vehicles.tanks.Tank;
   import juho.hacking.Hack;
   import juho.hacking.event.HackEventDispatcher;
   import juho.hacking.event.LocalTankDestroyedEvent;
   import juho.hacking.event.LocalTankInitedEvent;
   import juho.hacking.event.TankNormalStateSettedEvent;
   import package_1.Main;
   
	/**
    * ...
    * @author juhe
    */
   
   public class TankIgnoreHack extends Hack {
      private static const NAME:String = "Tank Ignore";
      
      // ID is used in saving to disk
      private static const ID:String = "TANK_IGNORE";
      
      private var localTank:Tank;
      
      private var battlefield:BattlefieldModel;
      
      public function TankIgnoreHack() {
         super(NAME, ID);
         HackEventDispatcher.singleton.addEventListener(LocalTankInitedEvent.LOCAL_TANK_INITED, this.localTankInited);
         HackEventDispatcher.singleton.addEventListener(LocalTankDestroyedEvent.LOCAL_TANK_DESTROYED_EVENT, this.localTankDestroyed);
         HackEventDispatcher.singleton.addEventListener(TankNormalStateSettedEvent.TANK_NORMAL_STATE_SETTED_EVENT, this.tankNormalStateSettedEvent);
      }
      
      override public function enable():void {
         super.enable();
         
         if (this.localTank != null) {
            this.localTank.postCollisionPredicate = name_166(this.battlefield);
         }
      }
      
      override public function disable():void {
         super.disable();
         
         if (this.localTank != null) {
            this.localTank.postCollisionPredicate = null;
         }
      }
      
      private function localTankInited(e:LocalTankInitedEvent) : void {
         this.localTank = e.localTank;
         this.battlefield = Main.osgi.getService(IBattleField) as BattlefieldModel;
      }
      
      private function localTankDestroyed(e:LocalTankDestroyedEvent) : void {
         this.localTank = null;
      }
      
      private function tankNormalStateSettedEvent(e:TankNormalStateSettedEvent) {
         if (e.tank == this.localTank && this.isEnabled) {
            e.tank.postCollisionPredicate =  name_166(this.battlefield);
         }
      }
   
   }

}