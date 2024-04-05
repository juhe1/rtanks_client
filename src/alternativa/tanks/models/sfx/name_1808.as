package alternativa.tanks.models.sfx
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.lights.TubeLight;
   import alternativa.tanks.sfx.name_2314;
   import alternativa.tanks.sfx.name_657;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_68.name_175;
   import package_76.name_735;
   
   public class name_1808 extends class_30 implements name_657
   {
      
      private static const const_2038:Number = 1.5;
      
      private static const position:Vector3 = new Vector3();
      
      private static const const_2037:Vector3 = new Vector3();
       
      
      private var light:TubeLight;
      
      private var var_1871:name_2314;
      
      private var var_2532:name_2314;
      
      private var animation:LightAnimation;
      
      private var currentTime:int;
      
      private var var_750:int;
      
      private var name_1432:Boolean;
      
      private var alive:Boolean;
      
      private var target:Object3D;
      
      private var var_170:name_175;
      
      public function name_1808(param1:ObjectPool)
      {
         super(param1);
         this.light = new TubeLight(0,0,0,0,0);
         this.target = new Object3D();
      }
      
      public function init(param1:name_2314, param2:name_2314, param3:LightAnimation, param4:Boolean = false) : void
      {
         this.name_1812(param1,param2,param3.method_2053(),param3,param4);
      }
      
      public function name_1812(param1:name_2314, param2:name_2314, param3:int, param4:LightAnimation, param5:Boolean = false) : void
      {
         this.var_1871 = param1;
         this.var_2532 = param2;
         this.var_750 = param3;
         this.currentTime = 0;
         this.animation = param4;
         this.name_1432 = param5;
         this.alive = true;
      }
      
      public function name_742(param1:name_175) : void
      {
         this.var_170 = param1;
         param1.addChild(this.light);
         param1.addChild(this.target);
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this.alive)
         {
            this.animation.method_2054(this.light,this.currentTime,this.var_750);
            this.var_1871.name_2315(this.light,param2,param1);
            this.var_2532.name_2315(this.target,param2,param1);
            this.currentTime += param1;
            position.x = this.light.x;
            position.y = this.light.y;
            position.z = this.light.z;
            const_2037.x = this.target.x;
            const_2037.y = this.target.y;
            const_2037.z = this.target.z;
            _loc3_ = Vector3.distanceBetween(position,const_2037);
            _loc4_ = param2.farClipping / 1.5;
            _loc3_ = _loc3_ > _loc4_ ? Number(Number(_loc4_)) : Number(Number(_loc3_));
            this.light.length = _loc3_;
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
            this.light.lookAt(this.target.x,this.target.y,this.target.z);
            this.light.falloff = this.light.attenuationEnd - this.light.attenuationBegin;
            return this.alive;
         }
         return false;
      }
      
      public function destroy() : void
      {
         this.var_170.removeChild(this.light);
         this.var_170.removeChild(this.target);
         this.var_170 = null;
         this.animation = null;
         this.var_1871 = null;
         method_584();
      }
      
      override protected function getClass() : Class
      {
         return name_1808;
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
