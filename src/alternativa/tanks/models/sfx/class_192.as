package alternativa.tanks.models.sfx
{
   import alternativa.engine3d.core.Light3D;
   import alternativa.tanks.sfx.name_2314;
   import alternativa.tanks.sfx.name_657;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_4.ClientObject;
   import package_68.name_175;
   import package_76.name_735;
   
   public class class_192 extends class_30 implements name_657
   {
      
      private static const const_2018:int = 250;
       
      
      protected var light:Light3D;
      
      protected var var_2469:LightAnimation;
      
      protected var var_2470:LightAnimation;
      
      protected var startTime:int;
      
      protected var var_2468:int;
      
      protected var var_2466:int;
      
      protected var currentTime:int;
      
      protected var var_2467:Boolean;
      
      protected var var_1871:name_2314;
      
      protected var alive:Boolean;
      
      protected var random:int;
      
      protected var var_2003:Boolean;
      
      protected var var_1411:int;
      
      protected var var_170:name_175;
      
      public function class_192(param1:ObjectPool, param2:Light3D)
      {
         super(param1);
         this.light = param2;
      }
      
      public function name_742(param1:name_175) : void
      {
         this.var_170 = param1;
         param1.addChild(this.light);
      }
      
      private function method_2484() : void
      {
         this.var_2466 = this.var_2468 + (Math.random() * this.random - this.random / 2);
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         if(!this.alive)
         {
            return false;
         }
         if(this.var_2467)
         {
            this.currentTime += param1;
            this.var_2469.method_2054(this.light,this.currentTime,this.startTime);
            if(this.currentTime >= this.startTime)
            {
               this.var_2467 = false;
               this.currentTime = 0;
               this.method_2484();
            }
         }
         else
         {
            this.currentTime += param1;
            if(this.currentTime > this.var_2466)
            {
               this.currentTime %= this.var_2466;
               this.method_2484();
            }
            this.var_2470.method_2054(this.light,this.currentTime,this.var_2468);
         }
         this.var_1871.name_2315(this.light,param2,param1);
         if(this.var_2003)
         {
            this.var_1411 += param1;
            if(this.var_1411 <= 250)
            {
               this.light.intensity *= 1 - this.var_1411 / 250;
            }
            else
            {
               this.light.intensity = 0;
               this.kill();
            }
         }
         return true;
      }
      
      override protected function getClass() : Class
      {
         return class_192;
      }
      
      public function destroy() : void
      {
         this.var_170.removeChild(this.light);
         this.var_170 = null;
         this.var_2469 = null;
         this.var_2470 = null;
         this.var_1871.destroy();
         this.var_1871 = null;
         method_584();
      }
      
      public function kill() : void
      {
         this.alive = false;
      }
      
      public function stop() : void
      {
         this.var_2003 = true;
         this.var_1411 = 0;
      }
      
      public function get owner() : ClientObject
      {
         return null;
      }
   }
}
