package alternativa.tanks.sfx
{
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import package_37.Vector3;
   
   public class Sound3D
   {
      
      public static const const_122:int = 1000000;
      
      private static const const_121:Number = 1000;
      
      private static const const_119:Number = 5000;
      
      private static const const_120:Number = 5;
      
      private static var pool:Sound3D;
       
      
      internal var var_411:Sound3D;
      
      private var name_191:Number;
      
      private var var_414:Number;
      
      private var sound:Sound;
      
      private var var_409:SoundChannel;
      
      private var transform:SoundTransform;
      
      private var var_412:Number = 1;
      
      private var var_410:Number = 1;
      
      private var var_413:Number = 1;
      
      public function Sound3D(param1:Sound, param2:Number, param3:Number, param4:Number, param5:Number)
      {
         this.transform = new SoundTransform(0);
         super();
         this.init(param1,param2,param3,param4,param5);
      }
      
      public static function create(param1:Sound, param2:Number = 1, param3:Number = 1000, param4:Number = 5000, param5:Number = 5) : Sound3D
      {
         var _loc6_:Sound3D = null;
         if(pool == null)
         {
            return new Sound3D(param1,param2,param3,param4,param5);
         }
         _loc6_ = pool;
         _loc6_.init(param1,param2,param3,param4,param5);
         pool = _loc6_.var_411;
         _loc6_.var_411 = null;
         return _loc6_;
      }
      
      public static function destroy(param1:Sound3D) : void
      {
         param1.clear();
         if(pool == null)
         {
            pool = param1;
         }
         else
         {
            param1.var_411 = pool;
            pool = param1;
         }
      }
      
      public function method_625() : Boolean
      {
         return this.var_409 != null;
      }
      
      public function get channel() : SoundChannel
      {
         return this.var_409;
      }
      
      public function get position() : Number
      {
         return this.var_409 == null ? Number(0) : Number(this.var_409.position);
      }
      
      public function init(param1:Sound, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         this.sound = param1;
         this.name_191 = param2;
         this.var_410 = param5;
         this.var_414 = (Math.sqrt(param4) - 1) / (param3 - param2);
         this.volume = 1;
      }
      
      public function clear() : void
      {
         this.stop();
         this.sound = null;
      }
      
      public function get baseVolume() : Number
      {
         return this.var_410;
      }
      
      public function set baseVolume(param1:Number) : void
      {
         this.var_410 = param1;
         this.method_623();
      }
      
      public function get volume() : Number
      {
         return this.var_412;
      }
      
      public function set volume(param1:Number) : void
      {
         this.var_412 = param1;
         this.method_623();
      }
      
      public function method_624(param1:Vector3, param2:Vector3, param3:Vector3, param4:SoundTransform) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = param2.x - param1.x;
         var _loc7_:Number = param2.y - param1.y;
         var _loc8_:Number = param2.z - param1.z;
         var _loc9_:Number = Math.sqrt(_loc6_ * _loc6_ + _loc7_ * _loc7_ + _loc8_ * _loc8_);
         if(_loc9_ < this.name_191)
         {
            param4.volume = 1;
            param4.pan = 0;
         }
         else
         {
            _loc5_ = 1 + this.var_414 * (_loc9_ - this.name_191);
            _loc5_ = 1 / (_loc5_ * _loc5_);
            param4.volume = _loc5_;
            _loc9_ = 1 / _loc9_;
            _loc6_ *= _loc9_;
            _loc7_ *= _loc9_;
            _loc8_ *= _loc9_;
            param4.pan = (_loc6_ * param3.x + _loc7_ * param3.y + _loc8_ * param3.z) * (1 - _loc5_);
         }
      }
      
      public function name_1084(param1:Vector3, param2:Vector3, param3:Vector3) : void
      {
         if(this.var_409 != null)
         {
            this.method_624(param1,param2,param3,this.transform);
            this.transform.volume *= this.var_413;
            this.var_409.soundTransform = this.transform;
         }
      }
      
      public function play(param1:int, param2:int) : SoundChannel
      {
         if(this.var_409 != null)
         {
            this.var_409.stop();
         }
         return this.var_409 = this.sound.play(param1,param2);
      }
      
      public function stop() : void
      {
         if(this.var_409 != null)
         {
            this.var_409.stop();
            this.var_409 = null;
         }
      }
      
      private function method_623() : void
      {
         this.var_413 = this.var_410 * this.var_412;
      }
   }
}
