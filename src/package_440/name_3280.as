package package_440
{
   import alternativa.tanks.sfx.Sound3D;
   import alternativa.tanks.sfx.name_132;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_76.name_735;
   
   public class name_3280 extends class_30 implements name_132
   {
      
      private static const const_2793:int = 99999;
       
      
      private var tankHitSound:Sound3D;
      
      private var hitSound:Sound3D;
      
      private var var_3621:Sound3D;
      
      private var var_3622:Sound3D;
      
      private var position:Vector3;
      
      private var alive:Boolean;
      
      public function name_3280(param1:ObjectPool)
      {
         this.position = new Vector3();
         super(param1);
      }
      
      public function init(param1:Sound3D, param2:Sound3D) : void
      {
         this.hitSound = param1;
         this.tankHitSound = param2;
         this.alive = true;
         this.var_3621 = param1;
      }
      
      public function name_758(param1:Vector3, param2:Boolean) : void
      {
         this.position.vCopy(param1);
         this.var_3622 = this.var_3621;
         this.var_3621 = param2 ? this.tankHitSound : this.hitSound;
         if(this.var_3622 != this.var_3621)
         {
            this.method_3238();
         }
      }
      
      public function get owner() : ClientObject
      {
         return null;
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         if(!this.var_3621.method_625())
         {
            this.var_3621.play(0,99999);
         }
         this.var_3621.name_1084(param2.pos,this.position,param2.name_1085);
         return true;
      }
      
      public function destroy() : void
      {
         this.method_3238();
         this.hitSound = null;
         this.tankHitSound = null;
         this.var_3621 = null;
         this.var_3622 = null;
      }
      
      public function kill() : void
      {
         this.alive = false;
         this.method_3238();
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(!param1)
         {
            this.method_3238();
         }
      }
      
      public function name_962(param1:Vector3) : void
      {
         param1.vCopy(this.position);
      }
      
      public function get numSounds() : int
      {
         return this.alive ? int(1) : int(0);
      }
      
      private function method_3238() : void
      {
         if(this.hitSound != null)
         {
            this.hitSound.stop();
         }
         if(this.tankHitSound != null)
         {
            this.tankHitSound.stop();
         }
      }
   }
}
