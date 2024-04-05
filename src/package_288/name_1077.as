package package_288
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.tanks.sfx.name_657;
   import flash.display.BlendMode;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_4.ClientObject;
   import package_68.name_175;
   import package_76.name_735;
   
   public class name_1077 extends class_30 implements name_657
   {
      
      private static const const_1699:Number = 300;
       
      
      private var beam:name_2328;
      
      private var delay:int;
      
      private var time:int;
      
      private var height:Number;
      
      private var var_1879:Number;
      
      private var var_1881:Number;
      
      private var var_1880:Number;
      
      private var x:Number;
      
      private var y:Number;
      
      private var z:Number;
      
      private var turret:Object3D;
      
      private var var_170:name_175;
      
      public function name_1077(param1:ObjectPool)
      {
         super(param1);
         this.beam = new name_2328(300);
         this.beam.blendMode = BlendMode.ADD;
      }
      
      public function init(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Object3D, param11:TextureMaterial) : void
      {
         this.delay = param1;
         this.beam.scaleX = param2 / 300;
         this.height = param3;
         this.var_1879 = param4;
         this.var_1881 = param5;
         this.var_1880 = param6;
         this.x = param7;
         this.y = param8;
         this.z = param9;
         this.turret = param10;
         this.beam.init(param11);
         this.beam.softAttenuation = 150;
         this.beam.depthMapAlphaThreshold = 2;
         this.beam.shadowMapAlphaThreshold = 2;
         this.beam.useShadowMap = false;
         this.beam.useLight = false;
         this.beam.alpha = 0;
         this.time = 0;
      }
      
      public function name_742(param1:name_175) : void
      {
         this.var_170 = param1;
         param1.addChild(this.beam);
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         if(this.height >= this.var_1879 && this.beam.alpha <= 0)
         {
            return false;
         }
         this.beam.x = this.turret.x + this.x;
         this.beam.y = this.turret.y + this.y;
         this.beam.z = this.turret.z + this.z;
         this.beam.rotationZ = param2.rotationZ;
         this.time += param1;
         if(this.time >= this.delay)
         {
            if(this.height < this.var_1879)
            {
               this.height += this.var_1879 * this.var_1881 * param1 * 0.001;
               if(this.height >= this.var_1879)
               {
                  this.height = this.var_1879;
               }
               this.beam.scaleZ = this.height / 300;
               this.beam.alpha = this.height / this.var_1879;
            }
            else
            {
               this.beam.alpha -= this.var_1880 * param1 * 0.001;
               if(this.beam.alpha < 0)
               {
                  this.beam.alpha = 0;
               }
            }
         }
         return true;
      }
      
      public function get owner() : ClientObject
      {
         return null;
      }
      
      public function destroy() : void
      {
         this.var_170.removeChild(this.beam);
         this.var_170 = null;
         this.turret = null;
         this.beam.clear();
         method_584();
      }
      
      override protected function getClass() : Class
      {
         return name_1077;
      }
      
      public function kill() : void
      {
         this.height = this.var_1879;
         this.beam.alpha = 0;
      }
   }
}
