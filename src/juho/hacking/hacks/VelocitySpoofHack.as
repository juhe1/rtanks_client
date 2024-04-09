package juho.hacking.hacks {
   
   import alternativa.physics.collision.name_166;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.vehicles.tanks.Tank;
   import flash.geom.Vector3D;
   import juho.hacking.Hack;
   import juho.hacking.event.HackEventDispatcher;
   import juho.hacking.event.LocalTankDestroyedEvent;
   import juho.hacking.event.LocalTankInitedEvent;
   import juho.hacking.event.TankNormalStateSettedEvent;
   import package_1.Main;
   import alternativa.tanks.models.tank.TankModel;
   import package_41.Vector3dData;
   
	/**
    * ...
    * @author juhe
    */
   
   public class VelocitySpoofHack extends Hack {
      private static const NAME:String = "Velocity Spoof";
      
      // ID is used in saving to disk
      private static const ID:String = "VELOCITY_SPOOF";
      
      public function VelocitySpoofHack() {
         super(NAME, ID);
         
         this.addProperty("Linear Velocity", new Vector3D(0,0,0), "Vector3D", this.linearVelocityChanged);
         this.addProperty("Angular Velocity", new Vector3D(0,0,0), "Vector3D", this.angularVelocityChanged);
      }
      
      override public function enable():void {
         super.enable();
         this.spoofVelocityes();
      }
      
      override public function disable():void {
         super.disable();
         
         TankModel.spoofedLinearVelocity = null;
         TankModel.spoofedAngularVelocity = null;
      }
      
      private function linearVelocityChanged(value:*) : void {
         this.spoofVelocityes();
      }
      
      private function angularVelocityChanged(value:*) : void {
         this.spoofVelocityes();
      }
      
      private function spoofVelocityes() : void {
         var linearVelocity:Vector3D = this.getProperty("Linear Velocity").value;
         var angularVelocity:Vector3D = this.getProperty("Angular Velocity").value;
         
         TankModel.spoofedLinearVelocity = new Vector3dData(linearVelocity.x, linearVelocity.y, linearVelocity.z);
         TankModel.spoofedAngularVelocity = new Vector3dData(angularVelocity.x, angularVelocity.y, angularVelocity.z);
      }
   
   }

}