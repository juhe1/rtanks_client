package package_288
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.tanks.sfx.name_657;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_4.ClientObject;
   import package_68.name_175;
   import package_76.name_735;
   
   public class name_1075 extends class_30 implements name_657
   {
       
      
      private var var_1882:Sprite3D;
      
      private var delay:int;
      
      private var time:int;
      
      private var var_1879:Number;
      
      private var var_1883:Number;
      
      private var var_1881:Number;
      
      private var x:Number;
      
      private var y:Number;
      
      private var z:Number;
      
      private var object:Object3D;
      
      private var var_170:name_175;
      
      public function name_1075(param1:ObjectPool)
      {
         super(param1);
         this.var_1882 = new Sprite3D(10,10);
      }
      
      public function init(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number, param11:Object3D, param12:TextureMaterial, param13:String) : void
      {
         this.delay = param1;
         this.var_1882.width = param2;
         this.var_1882.height = param3;
         this.var_1882.calculateBounds();
         this.var_1882.rotation = param4;
         this.var_1879 = param5;
         this.var_1883 = param6;
         this.var_1881 = param7;
         this.x = param8;
         this.y = param9;
         this.z = param10;
         this.object = param11;
         this.var_1882.material = param12;
         this.var_1882.softAttenuation = 150;
         this.var_1882.depthMapAlphaThreshold = 2;
         this.var_1882.shadowMapAlphaThreshold = 2;
         this.var_1882.useShadowMap = false;
         this.var_1882.useLight = false;
         this.var_1882.blendMode = param13;
         this.var_1882.alpha = 0;
         this.time = 0;
      }
      
      public function name_742(param1:name_175) : void
      {
         this.var_170 = param1;
         param1.addChild(this.var_1882);
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         var _loc3_:Number = NaN;
         if(this.z >= this.var_1879)
         {
            return false;
         }
         this.var_1882.x = this.object.x + this.x;
         this.var_1882.y = this.object.y + this.y;
         this.var_1882.z = this.object.z + this.z;
         this.time += param1;
         if(this.time >= this.delay)
         {
            this.z += this.var_1879 * this.var_1881 * param1 * 0.001;
            if(this.z < this.var_1883)
            {
               this.var_1882.alpha = this.z / this.var_1883;
            }
            else
            {
               _loc3_ = (this.z - this.var_1883) / (this.var_1879 - this.var_1883);
               this.var_1882.alpha = 1 - _loc3_ * _loc3_ * _loc3_ * _loc3_ * _loc3_ * _loc3_ * _loc3_ * _loc3_;
            }
            if(this.var_1882.alpha < 0)
            {
               this.var_1882.alpha = 0;
            }
            if(this.var_1882.alpha > 1)
            {
               this.var_1882.alpha = 1;
            }
         }
         else
         {
            this.var_1882.alpha = 0;
         }
         return true;
      }
      
      public function get owner() : ClientObject
      {
         return null;
      }
      
      public function destroy() : void
      {
         this.var_170.removeChild(this.var_1882);
         this.var_170 = null;
         this.var_1882.material = null;
         method_584();
      }
      
      override protected function getClass() : Class
      {
         return name_1075;
      }
      
      public function kill() : void
      {
         this.z = this.var_1879;
         this.var_1882.alpha = 0;
      }
   }
}
