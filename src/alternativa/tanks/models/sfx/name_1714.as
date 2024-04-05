package alternativa.tanks.models.sfx
{
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.tanks.sfx.name_2314;
   import package_238.ObjectPool;
   
   public final class name_1714 extends class_192
   {
       
      
      public function name_1714(param1:ObjectPool)
      {
         super(param1,new OmniLight(0,0,0));
      }
      
      public function init(param1:name_2314, param2:LightAnimation, param3:LightAnimation) : void
      {
         this.var_1871 = param1;
         this.startTime = param2.method_2053();
         this.var_2468 = param3.method_2053();
         this.var_2469 = param2;
         this.var_2470 = param3;
         this.random = var_2468 / 4;
         var_2467 = true;
         currentTime = 0;
         alive = true;
         var_2003 = false;
         var_1411 = 0;
      }
   }
}
