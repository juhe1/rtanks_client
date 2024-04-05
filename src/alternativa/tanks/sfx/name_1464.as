package alternativa.tanks.sfx
{
   import alternativa.engine3d.lights.OmniLight;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_4.ClientObject;
   import package_68.name_175;
   import package_76.name_735;
   
   public class name_1464 extends class_30 implements name_657
   {
      
      public static const const_1905:Number = 0.45454545454545453;
       
      
      private var light:OmniLight;
      
      private var time:int;
      
      private var currentTime:int;
      
      private var var_2310:Number;
      
      private var var_170:name_175;
      
      private var var_2309:Number;
      
      public function name_1464(param1:ObjectPool)
      {
         super(param1);
         this.light = new OmniLight(0,0,0);
      }
      
      public function init(param1:OmniLight, param2:int, param3:Number = 0.45454545454545453) : void
      {
         this.light.intensity = param1.intensity;
         this.light.color = param1.color;
         this.light.attenuationBegin = param1.attenuationBegin;
         this.light.attenuationEnd = param1.attenuationEnd;
         this.light.x = param1.x;
         this.light.y = param1.y;
         this.light.z = param1.z;
         this.light.calculateBounds();
         this.time = param2;
         this.var_2310 = param3;
         this.var_2309 = param1.intensity;
         this.currentTime = 0;
      }
      
      public function name_742(param1:name_175) : void
      {
         this.var_170 = param1;
         param1.addChild(this.light);
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         this.currentTime += param1;
         this.currentTime = Math.min(this.currentTime,this.time);
         var _loc3_:Number = 1 - this.currentTime / this.time;
         this.light.intensity = this.var_2309 * Math.pow(_loc3_,this.var_2310);
         return this.currentTime < this.time;
      }
      
      public function destroy() : void
      {
         if(this.var_170 != null)
         {
            this.var_170.removeChild(this.light);
            this.var_170 = null;
         }
         method_584();
      }
      
      override protected function getClass() : Class
      {
         return name_1464;
      }
      
      public function kill() : void
      {
         this.light = null;
      }
      
      public function get owner() : ClientObject
      {
         return null;
      }
   }
}
