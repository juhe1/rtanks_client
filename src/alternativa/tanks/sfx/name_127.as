package alternativa.tanks.sfx
{
   import alternativa.tanks.vehicles.tanks.Tank;
   import flash.media.Sound;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_76.name_735;
   
   public class name_127 implements name_132
   {
      
      private static var var_478:Vector3 = new Vector3();
       
      
      private var _owner:ClientObject;
      
      private var var_479:Tank;
      
      private var var_477:name_1182;
      
      private var var_480:Sound3D;
      
      private var var_481:Boolean;
      
      private var var_482:int = 1;
      
      private var _enabled:Boolean = false;
      
      public function name_127(param1:ClientObject, param2:Tank, param3:Sound, param4:Sound, param5:Sound, param6:Sound)
      {
         super();
         this._owner = param1;
         this.var_479 = param2;
         this.var_477 = new name_1182(param3,param4,param5);
         this.var_480 = Sound3D.create(param6,500,2000,5,0.5);
      }
      
      public function get owner() : ClientObject
      {
         return this._owner;
      }
      
      public function name_145() : void
      {
         this.var_482 = name_1182.name_1183;
         if(this._enabled)
         {
            this.var_477.name_145();
         }
      }
      
      public function name_189() : void
      {
         this.var_482 = name_1182.name_1185;
         if(this._enabled)
         {
            this.var_477.name_189();
         }
      }
      
      public function name_241() : void
      {
         this.var_482 = name_1182.name_1184;
         if(this._enabled)
         {
            this.var_477.name_241();
         }
      }
      
      public function get tank() : Tank
      {
         return this.var_479;
      }
      
      public function set tank(param1:Tank) : void
      {
         this.var_479 = param1;
      }
      
      public function name_957(param1:Boolean) : void
      {
         if(!this._enabled)
         {
            return;
         }
         if(param1)
         {
            if(!this.var_481)
            {
               this.var_481 = true;
               this.var_480.play(100,0);
            }
         }
         else if(this.var_481)
         {
            this.var_480.stop();
            this.var_481 = false;
         }
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         if(this.var_479 == null)
         {
            return false;
         }
         if(!this._enabled)
         {
            return true;
         }
         var_478.vCopy(this.var_479.state.position);
         this.var_477.update(param1,param2.pos,var_478,param2.name_1085);
         this.var_480.name_1084(param2.pos,var_478,param2.name_1085);
         return true;
      }
      
      public function destroy() : void
      {
         this.var_477.stop();
         this.var_480.stop();
      }
      
      public function kill() : void
      {
      }
      
      public function get numSounds() : int
      {
         return 2;
      }
      
      public function name_962(param1:Vector3) : void
      {
         param1.vCopy(this.var_479.state.position);
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(this._enabled == param1)
         {
            return;
         }
         this._enabled = param1;
         this.method_713();
      }
      
      private function method_713() : void
      {
         if(this._enabled)
         {
            switch(this.var_482)
            {
               case name_1182.name_1183:
                  this.var_477.name_145();
                  break;
               case name_1182.name_1185:
                  this.var_477.name_189();
                  break;
               case name_1182.name_1184:
                  this.var_477.name_241();
            }
         }
         else
         {
            this.var_480.stop();
            this.var_481 = false;
            this.var_477.name_1186();
         }
      }
   }
}
