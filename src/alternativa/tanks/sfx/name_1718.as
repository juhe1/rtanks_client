package alternativa.tanks.sfx
{
   import alternativa.engine3d.core.Object3D;
   import flash.events.Event;
   import flash.media.SoundChannel;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_76.name_735;
   
   public class name_1718 extends class_30 implements name_132
   {
      
      private static const const_2022:Vector3 = new Vector3();
       
      
      private var sound:Sound3D;
      
      private var var_400:int;
      
      private var startTime:int;
      
      private var var_2478:int;
      
      private var object:Object3D;
      
      private var channel:SoundChannel;
      
      private var alive:Boolean;
      
      private var time:int;
      
      private var var_2476:Number;
      
      private var var_2477:Number;
      
      private var listener:class_177;
      
      private var _owner:ClientObject;
      
      public function name_1718(param1:ObjectPool)
      {
         super(param1);
      }
      
      public function method_2487(param1:Sound3D, param2:Object3D, param3:class_177 = null) : void
      {
         this.init(this._owner,param1,param2,0,1,0,param3);
      }
      
      public function init(param1:ClientObject, param2:Sound3D, param3:Object3D, param4:int = 0, param5:int = 1, param6:int = 0, param7:class_177 = null) : void
      {
         this._owner = param1;
         this.sound = param2;
         this.object = param3;
         this.var_400 = param4;
         this.var_2478 = param5;
         this.startTime = param6;
         this.listener = param7;
         this.alive = true;
         this.time = 0;
         this.var_2476 = param2.volume;
         this.var_2477 = 0;
      }
      
      public function get owner() : ClientObject
      {
         return this._owner;
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         if(!this.alive)
         {
            return false;
         }
         if(this.time < this.var_400)
         {
            this.time += param1;
            return false;
         }
         if(!this.sound.method_625())
         {
            this.channel = this.sound.play(this.startTime,this.var_2478);
            if(this.channel != null)
            {
               this.channel.addEventListener(Event.SOUND_COMPLETE,this.method_585);
            }
         }
         const_2022.x = this.object.x;
         const_2022.y = this.object.y;
         const_2022.z = this.object.z;
         if(this.var_2477 > 0)
         {
            this.var_2476 -= this.var_2477 * param1;
            if(this.var_2476 <= 0)
            {
               this.var_2477 = 0;
               this.var_2476 = 0;
            }
            this.sound.volume = this.var_2476;
         }
         this.sound.name_1084(param2.pos,const_2022,param2.name_1085);
         return this.alive;
      }
      
      public function destroy() : void
      {
         this.method_2486();
         Sound3D.destroy(this.sound);
         this.object = null;
         this.sound = null;
         if(this.listener != null)
         {
            this.listener.method_2188(this);
            this.listener = null;
         }
         method_584();
      }
      
      override protected function getClass() : Class
      {
         return name_1718;
      }
      
      public function kill() : void
      {
         this.alive = false;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(!param1)
         {
            this.method_2486();
         }
      }
      
      public function name_962(param1:Vector3) : void
      {
         param1.x = this.object.x;
         param1.y = this.object.y;
         param1.z = this.object.z;
      }
      
      public function get numSounds() : int
      {
         return this.alive ? int(1) : int(0);
      }
      
      public function name_2409(param1:int) : void
      {
         this.var_2477 = this.var_2476 / param1;
      }
      
      private function method_585(param1:Event) : void
      {
         this.method_2486();
         this.alive = false;
      }
      
      private function method_2486() : void
      {
         if(this.channel != null)
         {
            this.channel.removeEventListener(Event.SOUND_COMPLETE,this.method_585);
            this.channel = null;
         }
         this.sound.stop();
         if(this.var_2478 <= 1)
         {
            this.alive = false;
         }
      }
   }
}
