package package_288
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.tanks.sfx.name_657;
   import flash.display.BlendMode;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_68.name_175;
   import package_76.name_735;
   
   public class name_1078 extends class_30 implements name_657
   {
      
      private static const var_514:Vector3 = new Vector3();
       
      
      private var var_1877:Sprite3D;
      
      private var delay:int;
      
      private var time:int;
      
      private var var_1878:Number;
      
      private var direction:Boolean;
      
      private var turret:Object3D;
      
      private var state:int;
      
      private var var_170:name_175;
      
      public function name_1078(param1:ObjectPool)
      {
         super(param1);
         this.var_1877 = new Sprite3D(10,10);
         this.var_1877.blendMode = BlendMode.ADD;
      }
      
      public function init(param1:int, param2:Number, param3:Number, param4:Boolean, param5:Object3D, param6:TextureMaterial) : void
      {
         this.delay = param1;
         this.var_1877.width = param2;
         this.var_1877.height = param2;
         this.var_1877.calculateBounds();
         this.var_1878 = param3;
         this.direction = param4;
         this.turret = param5;
         param6.resolution = 5;
         this.var_1877.material = param6;
         this.var_1877.scaleX = 1;
         this.var_1877.scaleY = 1;
         this.var_1877.scaleZ = 1;
         this.var_1877.rotation = 0;
         this.var_1877.alpha = 0;
         this.state = 0;
         this.var_1877.softAttenuation = 150;
         this.var_1877.depthMapAlphaThreshold = 2;
         this.var_1877.shadowMapAlphaThreshold = 2;
         this.var_1877.useShadowMap = false;
         this.var_1877.useLight = false;
         this.time = 0;
      }
      
      public function name_742(param1:name_175) : void
      {
         this.var_170 = param1;
         param1.addChild(this.var_1877);
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(this.state == 2)
         {
            return false;
         }
         var _loc6_:Number = 0.7 * 5;
         var _loc7_:Number = _loc6_ / 3;
         _loc3_ = 300;
         var_514.x = param2.x - this.turret.x;
         var_514.y = param2.y - this.turret.y;
         var_514.z = param2.z - this.turret.z;
         var_514.normalize();
         var_514.scale(_loc3_);
         this.var_1877.x = this.turret.x + var_514.x;
         this.var_1877.y = this.turret.y + var_514.y;
         this.var_1877.z = this.turret.z + var_514.z + 30;
         this.time += param1;
         if(this.time >= this.delay)
         {
            if(this.direction)
            {
               this.var_1877.rotation += 0.2 * param1 * 0.001;
            }
            else
            {
               this.var_1877.rotation -= 0.2 * param1 * 0.001;
            }
            if(this.state == 0)
            {
               _loc4_ = _loc6_ * param1 * 0.001;
               this.var_1877.scaleX += _loc4_;
               this.var_1877.scaleY += _loc4_;
               this.var_1877.scaleZ += _loc4_;
               if(this.var_1877.scaleX > this.var_1878)
               {
                  this.var_1877.scaleX = this.var_1878;
                  this.var_1877.scaleY = this.var_1878;
                  this.var_1877.scaleZ = this.var_1878;
                  this.state = 1;
               }
               this.var_1877.alpha = (this.var_1877.scaleX - 1) / (this.var_1878 - 1);
            }
            else if(this.state == 1)
            {
               _loc5_ = _loc7_ * param1 * 0.001;
               this.var_1877.scaleX -= _loc5_;
               this.var_1877.scaleY -= _loc5_;
               this.var_1877.scaleZ -= _loc5_;
               if(this.var_1877.scaleX < 1)
               {
                  this.var_1877.scaleX = 1;
                  this.var_1877.scaleY = 1;
                  this.var_1877.scaleZ = 1;
                  this.state = 2;
               }
               this.var_1877.alpha = (this.var_1877.scaleX - 1) / (this.var_1878 - 1) - 0.1;
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
         this.var_170.removeChild(this.var_1877);
         this.var_170 = null;
         this.var_1877.material = null;
         method_584();
      }
      
      override protected function getClass() : Class
      {
         return name_1078;
      }
      
      public function kill() : void
      {
         this.state = 2;
         this.var_1877.alpha = 0;
      }
   }
}
