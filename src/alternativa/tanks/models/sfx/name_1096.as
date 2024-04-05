package alternativa.tanks.models.sfx
{
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.tanks.sfx.name_2314;
   import alternativa.tanks.sfx.name_657;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_68.name_175;
   import package_76.name_735;
   
   public final class name_1096 extends class_30 implements name_657
   {
      
      public static const const_1705:Number = 99999;
       
      
      private var light:OmniLight;
      
      private var var_1871:name_2314;
      
      private var animation:LightAnimation;
      
      private var currentTime:int;
      
      private var var_750:int;
      
      private var name_1432:Boolean;
      
      private var alive:Boolean;
      
      private var maxDistance:Number;
      
      private var var_1890:Number;
      
      private var position:Vector3;
      
      private var var_170:name_175;
      
      public function name_1096(param1:ObjectPool)
      {
         this.position = new Vector3();
         super(param1);
         this.light = new OmniLight(0,0,0);
      }
      
      public function init(param1:name_2314, param2:LightAnimation, param3:Number = 99999, param4:Boolean = false) : void
      {
         this.name_1812(param1,param2.method_2053(),param2,param3,param4);
      }
      
      public function name_1812(param1:name_2314, param2:int, param3:LightAnimation, param4:Number = 99999, param5:Boolean = false) : void
      {
         this.var_1871 = param1;
         this.var_750 = param2;
         this.currentTime = 0;
         this.animation = param3;
         this.name_1432 = param5;
         this.alive = true;
         this.maxDistance = param4;
         this.var_1890 = param4 / 4 * 3;
      }
      
      public function name_742(param1:name_175) : void
      {
         this.var_170 = param1;
         param1.addChild(this.light);
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this.alive)
         {
            if(this.animation == null)
            {
               return false;
            }
            this.animation.method_2054(this.light,this.currentTime,this.var_750);
            this.var_1871.name_2315(this.light,param2,param1);
            this.currentTime += param1;
            if(this.currentTime > this.var_750)
            {
               if(this.name_1432)
               {
                  this.currentTime %= this.var_750;
               }
               else
               {
                  this.alive = false;
               }
            }
            this.position.x = this.light.x;
            this.position.y = this.light.y;
            this.position.z = this.light.z;
            _loc3_ = Vector3.distanceBetween(this.position,param2.pos);
            if(_loc3_ > this.var_1890)
            {
               _loc4_ = 1 - (_loc3_ - this.var_1890) / (this.maxDistance - this.var_1890);
               this.light.intensity *= _loc4_;
               this.light.visible = _loc3_ < this.maxDistance;
            }
            return this.alive;
         }
         return false;
      }
      
      public function destroy() : void
      {
         this.var_170.removeChild(this.light);
         this.var_170 = null;
         this.animation = null;
         this.var_1871.destroy();
         this.var_1871 = null;
         method_584();
      }
      
      override protected function getClass() : Class
      {
         return name_1096;
      }
      
      public function kill() : void
      {
         this.alive = false;
      }
      
      public function get owner() : ClientObject
      {
         return null;
      }
   }
}
