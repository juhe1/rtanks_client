package alternativa.tanks.sfx
{
   import alternativa.tanks.engine3d.name_1072;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_68.name_175;
   import package_76.name_735;
   
   public class name_1094 extends class_30 implements name_657
   {
      
      private static const const_1699:Number = 100;
       
      
      private var var_1887:Number;
      
      protected var scale:Number;
      
      protected var var_1885:Number;
      
      protected var var_610:AnimatedPlane;
      
      private var currentTime:int;
      
      private var var_1886:int;
      
      private var var_170:name_175;
      
      public function name_1094(param1:ObjectPool)
      {
         super(param1);
         this.var_610 = new AnimatedPlane(100,100);
         this.var_610.useShadowMap = false;
         this.var_610.useLight = false;
         this.var_610.shadowMapAlphaThreshold = 2;
         this.var_610.depthMapAlphaThreshold = 2;
         this.var_610.softAttenuation = 0;
      }
      
      public function init(param1:Number, param2:Vector3, param3:Vector3, param4:name_1072, param5:Number) : void
      {
         this.var_610.init(param4,0.001 * param4.fps);
         this.var_1886 = this.var_610.name_2329();
         this.currentTime = 0;
         this.var_1887 = 0.001 * param5;
         this.var_1885 = param1 / 100;
         this.scale = this.var_1885;
         this.var_610.x = param2.x;
         this.var_610.y = param2.y;
         this.var_610.z = param2.z;
         this.var_610.rotationX = param3.x;
         this.var_610.rotationY = param3.y;
         this.var_610.rotationZ = param3.z;
      }
      
      public function name_742(param1:name_175) : void
      {
         this.var_170 = param1;
         param1.addChild(this.var_610);
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         if(this.currentTime >= this.var_1886)
         {
            return false;
         }
         this.var_610.setTime(this.currentTime);
         this.currentTime += param1;
         this.var_610.scaleX = this.scale;
         this.var_610.scaleY = this.scale;
         this.scale = this.var_1885 + this.var_1885 * this.var_1887 * this.currentTime;
         return true;
      }
      
      public function destroy() : void
      {
         this.var_170.removeChild(this.var_610);
         this.var_170 = null;
         this.var_610.clear();
         method_584();
      }
      
      override protected function getClass() : Class
      {
         return name_1094;
      }
      
      public function kill() : void
      {
         this.currentTime = this.var_1886;
      }
      
      public function get owner() : ClientObject
      {
         return null;
      }
   }
}
