package alternativa.tanks.sfx
{
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import package_37.Vector3;
   
   public class name_1182
   {
      
      public static const const_1776:int = 0;
      
      public static const name_1183:int = 1;
      
      public static const name_1185:int = 2;
      
      public static const const_1777:int = 3;
      
      public static const name_1184:int = 4;
       
      
      private var mode:int = 0;
      
      private var var_2001:Sound3D;
      
      private var var_2002:Sound3D;
      
      private var var_2005:Sound3D;
      
      private var var_2004:Sound3D;
      
      private var channel:SoundChannel;
      
      private var var_2003:Boolean;
      
      private var var_1880:Number = 0.001;
      
      private var var_2007:Number = 1;
      
      private var var_2006:Sound3D;
      
      public function name_1182(param1:Sound, param2:Sound, param3:Sound)
      {
         super();
         var _loc4_:Number = name_89.name_191;
         var _loc5_:Number = name_89.name_229;
         var _loc6_:Number = name_89.name_250;
         this.var_2002 = Sound3D.create(param1,_loc4_,_loc5_,_loc6_,2);
         this.var_2005 = Sound3D.create(param2,_loc4_,_loc5_,_loc6_,1);
         this.var_2004 = Sound3D.create(param3,_loc4_,_loc5_,_loc6_,1);
         this.var_2001 = this.var_2002;
      }
      
      public function update(param1:int, param2:Vector3, param3:Vector3, param4:Vector3) : void
      {
         if(this.mode == 0)
         {
            return;
         }
         if(this.var_2003)
         {
            this.var_2001.volume -= this.var_1880 * param1;
            if(this.var_2001.volume < this.var_2007)
            {
               this.var_2003 = false;
               this.stop();
               this.var_2001 = this.var_2002;
               this.var_2001.volume = this.mode == 1 ? 2 : 3;
               this.var_2001.play(0,10000);
            }
         }
         if(this.var_2006 != null)
         {
            this.channel = null;
            this.var_2001.stop();
            this.var_2001 = this.var_2006;
            this.var_2001.volume = 1;
            this.var_2001.play(0,10000);
            this.var_2006 = null;
         }
         this.var_2001.name_1084(param2,param3,param4);
      }
      
      public function name_1186() : void
      {
         if(this.mode == 0)
         {
            return;
         }
         this.mode = 0;
         this.stop();
      }
      
      public function name_145() : void
      {
         if(this.mode == 1)
         {
            return;
         }
         if(this.mode == 0)
         {
            this.var_2001 = this.var_2002;
            this.var_2001.volume = 1;
            this.var_2001.play(0,1000);
         }
         else
         {
            this.var_2003 = true;
            this.var_2007 = 0.2;
         }
         this.mode = 1;
      }
      
      public function name_189() : void
      {
         if(this.mode == 2 || this.mode == 3)
         {
            return;
         }
         this.var_2003 = false;
         this.mode = 2;
         this.var_2001.stop();
         this.var_2001 = this.var_2005;
         this.var_2001.volume = 1;
         this.channel = this.var_2001.play(0,0);
         if(this.channel != null)
         {
            this.channel.addEventListener(Event.SOUND_COMPLETE,this.method_2095);
         }
      }
      
      public function name_241() : void
      {
         if(this.mode == 4)
         {
            return;
         }
         if(this.mode == 1)
         {
            if(!this.var_2003)
            {
               this.var_2001.volume = 3;
            }
         }
         else
         {
            this.var_2003 = true;
         }
         this.var_2007 = 0.6;
         this.mode = 4;
      }
      
      public function stop() : void
      {
         if(this.channel != null)
         {
            this.channel.removeEventListener(Event.SOUND_COMPLETE,this.method_2095);
            this.channel = null;
         }
         this.var_2001.stop();
      }
      
      public function destroy() : void
      {
         this.stop();
         Sound3D.destroy(this.var_2002);
         this.var_2002 = null;
         Sound3D.destroy(this.var_2005);
         this.var_2005 = null;
         Sound3D.destroy(this.var_2004);
         this.var_2004 = null;
      }
      
      private function method_2095(param1:Event) : void
      {
         if(this.channel == null || this.mode != 2)
         {
            return;
         }
         this.channel.removeEventListener(Event.SOUND_COMPLETE,this.method_2095);
         this.mode = 3;
         this.var_2004.volume = this.var_2005.volume;
         this.var_2006 = this.var_2004;
      }
   }
}
