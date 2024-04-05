package package_239
{
   import alternativa.tanks.sfx.name_132;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.utils.Dictionary;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_76.name_735;
   
   public class SoundManager implements name_655
   {
       
      
      private var var_1428:Number;
      
      private var var_1429:int = 10;
      
      private var maxSounds3D:int = 20;
      
      private var effects:Vector.<SoundEffectData>;
      
      private var var_1426:int;
      
      private var sounds:Dictionary;
      
      private var numSounds:int;
      
      private var _position:Vector3;
      
      private var var_1427:Vector.<int>;
      
      public function SoundManager()
      {
         this.effects = new Vector.<SoundEffectData>();
         this.sounds = new Dictionary();
         this._position = new Vector3();
         this.var_1427 = new Vector.<int>();
         super();
      }
      
      public static function name_736(param1:Sound) : name_655
      {
         var _loc2_:SoundChannel = param1.play(0,1,new SoundTransform(0));
         if(_loc2_ != null)
         {
            _loc2_.stop();
            return new SoundManager();
         }
         return new name_2085();
      }
      
      public function set maxDistance(param1:Number) : void
      {
         this.var_1428 = param1 * param1;
      }
      
      public function playSound(param1:Sound, param2:int = 0, param3:int = 0, param4:SoundTransform = null) : SoundChannel
      {
         if(this.numSounds == this.var_1429 || param1 == null)
         {
            return null;
         }
         var _loc5_:SoundChannel = param1.play(param2,param3,param4);
         if(_loc5_ == null)
         {
            return null;
         }
         this.method_1640(_loc5_);
         return _loc5_;
      }
      
      public function name_763(param1:SoundChannel) : void
      {
         if(param1 == null || this.sounds[param1] == null)
         {
            return;
         }
         this.method_1637(param1);
      }
      
      public function name_686() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.sounds)
         {
            this.method_1637(_loc1_ as SoundChannel);
         }
      }
      
      public function name_672(param1:name_132) : void
      {
         if(this.method_1639(param1) > -1)
         {
            return;
         }
         param1.enabled = true;
         this.effects.push(SoundEffectData.create(0,param1));
         ++this.var_1426;
      }
      
      public function name_696(param1:name_132) : void
      {
         var _loc3_:SoundEffectData = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_1426)
         {
            _loc3_ = this.effects[_loc2_];
            if(_loc3_.effect == param1)
            {
               param1.destroy();
               SoundEffectData.destroy(_loc3_);
               this.effects.splice(_loc2_,1);
               --this.var_1426;
               return;
            }
            _loc2_++;
         }
      }
      
      public function name_701() : void
      {
         var _loc1_:SoundEffectData = null;
         while(this.effects.length > 0)
         {
            _loc1_ = this.effects.pop();
            _loc1_.effect.destroy();
            SoundEffectData.destroy(_loc1_);
         }
         this.var_1426 = 0;
      }
      
      public function name_723(param1:int, param2:name_735) : void
      {
         var _loc3_:SoundEffectData = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(this.var_1426 == 0)
         {
            return;
         }
         this.method_1638(param2.pos);
         var _loc4_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < this.var_1426)
         {
            _loc3_ = this.effects[_loc5_];
            _loc6_ = int(_loc3_.effect.numSounds);
            if(_loc6_ == 0)
            {
               _loc3_.effect.destroy();
               SoundEffectData.destroy(_loc3_);
               this.effects.splice(_loc5_,1);
               --this.var_1426;
               _loc5_--;
            }
            else
            {
               if(_loc3_.distanceSqr > this.var_1428 || _loc4_ + _loc6_ > this.maxSounds3D)
               {
                  break;
               }
               _loc3_.effect.enabled = true;
               _loc3_.effect.play(param1,param2);
               _loc4_ += _loc6_;
            }
            _loc5_++;
         }
         while(_loc5_ < this.var_1426)
         {
            _loc3_ = this.effects[_loc5_];
            _loc3_.effect.enabled = false;
            if(_loc3_.effect.numSounds == 0)
            {
               _loc3_.effect.destroy();
               SoundEffectData.destroy(_loc3_);
               this.effects.splice(_loc5_,1);
               --this.var_1426;
               _loc5_--;
            }
            _loc5_++;
         }
      }
      
      public function name_783(param1:ClientObject) : void
      {
         var _loc3_:SoundEffectData = null;
         var _loc4_:name_132 = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_1426)
         {
            _loc3_ = this.effects[_loc2_];
            _loc4_ = _loc3_.effect;
            if(_loc4_.owner == param1)
            {
               _loc4_.kill();
            }
            _loc2_++;
         }
      }
      
      private function method_1640(param1:SoundChannel) : void
      {
         param1.addEventListener(Event.SOUND_COMPLETE,this.method_585);
         this.sounds[param1] = true;
         ++this.numSounds;
      }
      
      private function method_1637(param1:SoundChannel) : void
      {
         param1.stop();
         param1.removeEventListener(Event.SOUND_COMPLETE,this.method_585);
         delete this.sounds[param1];
         --this.numSounds;
      }
      
      private function method_585(param1:Event) : void
      {
         this.name_763(param1.target as SoundChannel);
      }
      
      private function method_1639(param1:name_132) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.var_1426)
         {
            if(SoundEffectData(this.effects[_loc2_]).effect == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      private function method_1638(param1:Vector3) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:SoundEffectData = null;
         var _loc9_:SoundEffectData = null;
         var _loc10_:SoundEffectData = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:int = this.var_1426 - 1;
         _loc2_ = 0;
         while(_loc2_ < this.var_1426)
         {
            _loc8_ = this.effects[_loc2_];
            _loc8_.effect.name_962(this._position);
            _loc11_ = param1.x - this._position.x;
            _loc12_ = param1.y - this._position.y;
            _loc13_ = param1.z - this._position.z;
            _loc8_.distanceSqr = _loc11_ * _loc11_ + _loc12_ * _loc12_ + _loc13_ * _loc13_;
            _loc2_++;
         }
         if(this.var_1426 == 1)
         {
            return;
         }
         this.var_1427[0] = _loc4_;
         this.var_1427[1] = _loc5_;
         _loc6_ = 2;
         while(_loc6_ > 0)
         {
            _loc3_ = _loc5_ = this.var_1427[--_loc6_];
            _loc2_ = _loc4_ = this.var_1427[--_loc6_];
            _loc7_ = SoundEffectData(this.effects[_loc5_ + _loc4_ >> 1]).distanceSqr;
            while(true)
            {
               if((_loc9_ = this.effects[_loc2_]).distanceSqr >= _loc7_)
               {
                  while((_loc10_ = this.effects[_loc3_]).distanceSqr > _loc7_)
                  {
                     _loc3_--;
                  }
                  if(_loc2_ <= _loc3_)
                  {
                     var _loc14_:* = _loc2_++;
                     this.effects[_loc14_] = _loc10_;
                     var _loc15_:* = _loc3_--;
                     this.effects[_loc15_] = _loc9_;
                  }
                  if(_loc2_ > _loc3_)
                  {
                     break;
                  }
               }
               else
               {
                  _loc2_++;
               }
            }
            if(_loc4_ < _loc3_)
            {
               _loc14_ = _loc6_++;
               this.var_1427[_loc14_] = _loc4_;
               _loc15_ = _loc6_++;
               this.var_1427[_loc15_] = _loc3_;
            }
            if(_loc2_ < _loc5_)
            {
               _loc14_ = _loc6_++;
               this.var_1427[_loc14_] = _loc2_;
               _loc15_ = _loc6_++;
               this.var_1427[_loc15_] = _loc5_;
            }
         }
      }
   }
}

import alternativa.tanks.sfx.name_132;

class SoundEffectData
{
   
   private static var pool:Vector.<SoundEffectData> = new Vector.<SoundEffectData>();
   
   private static var numObjects:int;
    
   
   public var distanceSqr:Number;
   
   public var effect:name_132;
   
   public function SoundEffectData(param1:Number, param2:name_132)
   {
      super();
      this.distanceSqr = param1;
      this.effect = param2;
   }
   
   public static function create(param1:Number, param2:name_132) : SoundEffectData
   {
      var _loc3_:SoundEffectData = null;
      if(numObjects > 0)
      {
         _loc3_ = pool[--numObjects];
         pool[numObjects] = null;
         _loc3_.distanceSqr = param1;
         _loc3_.effect = param2;
         return _loc3_;
      }
      return new SoundEffectData(param1,param2);
   }
   
   public static function destroy(param1:SoundEffectData) : void
   {
      param1.effect = null;
      var _loc2_:* = numObjects++;
      pool[_loc2_] = param1;
   }
}
