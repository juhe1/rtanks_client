package package_166
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.tanks.sfx.Sound3D;
   import alternativa.tanks.sfx.name_132;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_334.name_1610;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_76.name_735;
   
   public class name_2711 extends class_30 implements name_132
   {
      
      private static const const_2585:int = 100000;
      
      private static var position:Vector3 = new Vector3();
       
      
      private var sfxData:name_1772;
      
      private var object:Object3D;
      
      private var var_931:name_1610;
      
      private var _enabled:Boolean;
      
      private var var_2454:Boolean;
      
      private var var_2001:Sound3D;
      
      private var var_3338:SoundChannel;
      
      private var listener:class_193;
      
      public function name_2711(param1:ObjectPool)
      {
         super(param1);
      }
      
      public function init(param1:class_193, param2:name_1610, param3:name_1772, param4:Object3D) : void
      {
         this.listener = param1;
         this.sfxData = param3;
         this.object = param4;
         this.var_931 = param2;
         this.var_2454 = false;
         this._enabled = false;
         this.method_2996();
      }
      
      public function set mode(param1:name_1610) : void
      {
         if(this.var_931 == param1)
         {
            return;
         }
         this.var_931 = param1;
         this.method_2996();
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(this._enabled == param1)
         {
            return;
         }
         this._enabled = param1;
         if(!this._enabled)
         {
            this.var_2001.stop();
            this.var_3338 = null;
         }
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         if(this.var_2454)
         {
            return false;
         }
         if(this.var_3338 == null)
         {
            this.var_3338 = this.var_2001.play(0,100000);
         }
         position.x = this.object.x;
         position.y = this.object.y;
         position.z = this.object.z;
         this.var_2001.name_1084(param2.pos,position,param2.name_1085);
         return true;
      }
      
      public function name_962(param1:Vector3) : void
      {
         param1.x = this.object.x;
         param1.y = this.object.y;
         param1.z = this.object.z;
      }
      
      public function destroy() : void
      {
         if(this.var_2001 != null)
         {
            Sound3D.destroy(this.var_2001);
            this.var_2001 = null;
            this.var_3338 = null;
         }
         this.sfxData = null;
         this.object = null;
         this.listener.method_2496(this);
         method_584();
      }
      
      override protected function getClass() : Class
      {
         return name_2711;
      }
      
      public function get numSounds() : int
      {
         return this.var_2454 ? int(0) : int(1);
      }
      
      public function kill() : void
      {
         this.var_2454 = true;
      }
      
      public function get owner() : ClientObject
      {
         return null;
      }
      
      private function method_2996() : void
      {
         var _loc1_:SoundTransform = null;
         var _loc2_:Sound = null;
         if(this.sfxData == null)
         {
            return;
         }
         if(this.var_3338 != null)
         {
            _loc1_ = this.var_3338.soundTransform;
            this.var_3338 = null;
         }
         if(this.var_2001 != null)
         {
            Sound3D.destroy(this.var_2001);
         }
         switch(this.var_931)
         {
            case name_1610.name_1183:
               _loc2_ = this.sfxData.idleSound;
               break;
            case name_1610.HEAL:
               _loc2_ = this.sfxData.name_1785;
               break;
            case name_1610.name_474:
               _loc2_ = this.sfxData.name_1787;
         }
         this.var_2001 = Sound3D.create(_loc2_,1000,2000,2,1);
         if(_loc1_ != null)
         {
            this.var_3338 = this.var_2001.play(0,100000);
            this.var_3338.soundTransform = _loc1_;
         }
      }
   }
}
