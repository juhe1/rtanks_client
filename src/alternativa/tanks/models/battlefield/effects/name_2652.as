package alternativa.tanks.models.battlefield.effects
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.tanks.sfx.name_657;
   import controls.Label;
   import filters.name_1131;
   import flash.display.BitmapData;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_68.name_175;
   import package_76.name_735;
   
   public class name_2652 extends class_30 implements name_657
   {
      
      private static const const_2536:Number = 100;
      
      private static const const_2535:Number = 250;
      
      private static const const_1994:Number = 300;
      
      private static const const_2538:Number = 1000;
      
      private static const const_2537:Number = 100;
      
      private static var label:Label = new Label();
       
      
      private var sprite:Sprite3D;
      
      private var time:int;
      
      private var z:Number;
      
      private var const_114:Vector3;
      
      private var var_170:name_175;
      
      private var var_3275:Number;
      
      private var var_3274:Number;
      
      public function name_2652(param1:ObjectPool)
      {
         this.const_114 = new Vector3();
         super(param1);
         this.sprite = new Sprite3D(0,0);
         this.sprite.perspectiveScale = false;
         this.sprite.material = new TextureMaterial(null,false,false);
         this.sprite.useShadowMap = false;
         this.sprite.useLight = false;
         this.sprite.depthTest = false;
         label.size = 16;
         label.filters = name_1131.name_1147;
      }
      
      public function init(param1:Vector3, param2:uint, param3:int) : void
      {
         this.const_114.vCopy(param1);
         this.time = 0;
         this.z = 0;
         this.var_3275 = Math.random() - 0.5;
         this.var_3274 = Math.random() - 0.5;
         label.text = param3.toString();
         label.color = param2;
         var _loc4_:BitmapData = new BitmapData(60,20,true,0);
         _loc4_.draw(label);
         TextureMaterial(this.sprite.material).texture = _loc4_;
         this.sprite.width = _loc4_.width;
         this.sprite.height = _loc4_.height;
         this.sprite.calculateBounds();
      }
      
      public function name_742(param1:name_175) : void
      {
         this.var_170 = param1;
         param1.addChild(this.sprite);
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         this.sprite.x = this.const_114.x + this.z * this.var_3275;
         this.sprite.y = this.const_114.y + this.z * this.var_3274;
         this.sprite.z = this.const_114.z + this.z;
         this.time += param1;
         var _loc3_:Number = this.z < 100 ? Number(1000) : Number(100);
         this.z += _loc3_ * param1 * 0.001;
         if(this.z < 250)
         {
            this.sprite.alpha = 1;
         }
         else
         {
            this.sprite.alpha = (300 - this.z) / (300 - 250);
            if(this.sprite.alpha < 0)
            {
               this.sprite.alpha = 0;
               return false;
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
         this.var_170.removeChild(this.sprite);
         this.var_170 = null;
         method_584();
      }
      
      override protected function getClass() : Class
      {
         return name_2652;
      }
      
      public function kill() : void
      {
         this.sprite.alpha = 0;
      }
   }
}
