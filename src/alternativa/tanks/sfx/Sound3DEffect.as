package alternativa.tanks.sfx
{
   import flash.events.Event;
   import flash.media.SoundChannel;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_76.name_735;
   
   public class Sound3DEffect extends class_30 implements name_132
   {
      
      public static var var_402:int;
       
      
      private var _owner:ClientObject;
      
      private var position:Vector3;
      
      private var sound:Sound3D;
      
      private var var_400:int;
      
      private var startTime:int;
      
      private var channel:SoundChannel;
      
      private var _enabled:Boolean = false;
      
      private var var_401:Boolean = false;
      
      public function Sound3DEffect(param1:ObjectPool)
      {
         this.position = new Vector3();
         super(param1);
      }
      
      public static function create(param1:ObjectPool, param2:ClientObject, param3:Vector3, param4:Sound3D, param5:int = 0, param6:int = 0) : Sound3DEffect
      {
         var _loc7_:Sound3DEffect = Sound3DEffect(param1.getObject(Sound3DEffect));
         _loc7_.init(param2,param3,param4,param5,param6);
         return _loc7_;
      }
      
      public function init(param1:ClientObject, param2:Vector3, param3:Sound3D, param4:int = 0, param5:int = 0) : void
      {
         this._owner = param1;
         this.position.vCopy(param2);
         this.sound = param3;
         this.var_400 = param4;
         this.startTime = param5;
         this._enabled = false;
         this.var_401 = false;
      }
      
      public function get owner() : ClientObject
      {
         return this._owner;
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         this.var_400 -= param1;
         if(this.var_400 > 0)
         {
            return this._enabled;
         }
         if(!this.var_401)
         {
            this.var_401 = true;
            this.channel = this.sound.play(this.startTime,1);
            if(this.channel == null)
            {
               this._enabled = false;
               return false;
            }
            this.channel.addEventListener(Event.SOUND_COMPLETE,this.method_585);
         }
         this.sound.name_1084(param2.pos,this.position,param2.name_1085);
         return this._enabled;
      }
      
      public function destroy() : void
      {
         this._owner = null;
         Sound3D.destroy(this.sound);
         this.sound = null;
         this.method_585(null);
         method_584();
      }
      
      public function kill() : void
      {
         this._enabled = false;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(this._enabled == param1)
         {
            return;
         }
         if(!(this._enabled = param1))
         {
            this.method_585(null);
         }
      }
      
      public function name_962(param1:Vector3) : void
      {
         param1.x = this.position.x;
         param1.y = this.position.y;
         param1.z = this.position.z;
      }
      
      public function get numSounds() : int
      {
         return this._enabled ? 1 : 0;
      }
      
      private function method_585(param1:Event) : void
      {
         if(this.channel != null)
         {
            this.channel.removeEventListener(Event.SOUND_COMPLETE,this.method_585);
         }
         this._enabled = false;
         this.channel = null;
      }
      
      override protected function getClass() : Class
      {
         return Sound3DEffect;
      }
   }
}
