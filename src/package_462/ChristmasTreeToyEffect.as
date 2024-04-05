package package_462
{
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.tanks.sfx.name_2314;
   import alternativa.tanks.sfx.name_657;
   import flash.display.BlendMode;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_68.name_175;
   import package_76.name_735;
   
   public class ChristmasTreeToyEffect extends class_30 implements name_657
   {
      
      private static const SIZE:Number = 256;
      
      private static const const_2740:Number = 2;
      
      private static const const_2736:Class = name_3487;
      
      private static const const_2732:TextureMaterial = new TextureMaterial(new const_2736().bitmapData,false,true,MipMapping.PER_PIXEL,2);
      
      private static const const_2729:Class = name_3485;
      
      private static const const_2735:TextureMaterial = new TextureMaterial(new const_2729().bitmapData,false,true,MipMapping.PER_PIXEL,2);
      
      private static const const_2734:Class = name_3484;
      
      private static const const_2731:TextureMaterial = new TextureMaterial(new const_2734().bitmapData,false,true,MipMapping.PER_PIXEL,2);
      
      private static const const_2730:Class = name_3486;
      
      private static const const_2733:TextureMaterial = new TextureMaterial(new const_2730().bitmapData,false,true,MipMapping.PER_PIXEL,2);
      
      private static const NEAR_1:Number = 100;
      
      private static const NEAR_2:Number = 300;
      
      private static const FAR_1:Number = 500;
      
      private static const FAR_2:Number = 1000;
      
      private static const name_3285:Number = 0.3;
      
      private static const const_2739:Number = 1.3;
      
      private static const const_2737:Number = 1.5707963267948966;
      
      private static const const_2738:Number = 3;
       
      
      private var sprite:Sprite3D;
      
      private var var_3547:OmniLight;
      
      private var var_170:name_175;
      
      private var var_1871:name_2314;
      
      private var alive:Boolean;
      
      private var time:Number;
      
      public function ChristmasTreeToyEffect(param1:ObjectPool)
      {
         this.var_3547 = new OmniLight(0,0,0);
         super(param1);
      }
      
      public function name_742(param1:name_175) : void
      {
         this.var_170 = param1;
         param1.addChild(this.sprite);
         param1.addChild(this.var_3547);
      }
      
      public function init(param1:Sprite3D, param2:name_2314, param3:Vector3) : void
      {
         this.sprite = param1;
         this.var_1871 = param2;
         param1.width = 256;
         param1.height = 256;
         param1.originX = 0.5;
         param1.originY = 0.5;
         param1.softAttenuation = 50;
         param1.useLight = false;
         param1.useShadowMap = false;
         param1.shadowMapAlphaThreshold = 2;
         param1.depthMapAlphaThreshold = 2;
         param1.blendMode = BlendMode.ADD;
         if(param1.name.indexOf("1") >= 0)
         {
            param1.material = const_2732;
            this.var_3547.color = 16727074;
         }
         else if(param1.name.indexOf("2") >= 0)
         {
            param1.material = const_2735;
            this.var_3547.color = 6356736;
         }
         else if(param1.name.indexOf("3") >= 0)
         {
            param1.material = const_2731;
            this.var_3547.color = 34047;
         }
         else if(param1.name.indexOf("4") >= 0)
         {
            param1.material = const_2733;
            this.var_3547.color = 16771584;
         }
         this.var_3547.intensity = 0.7;
         this.var_3547.attenuationBegin = 300;
         this.var_3547.attenuationEnd = 1000;
         this.var_3547.calculateBounds();
         var _loc5_:Number = param1.x - param3.x;
         var _loc6_:Number = param1.y - param3.y;
         var _loc7_:Number = Math.sqrt(_loc5_ * _loc5_ + _loc6_ * _loc6_);
         this.var_3547.x = param1.x + _loc5_ * 200 / _loc7_;
         this.var_3547.y = param1.y + _loc6_ * 200 / _loc7_;
         this.var_3547.z = param1.z + 200 / 2;
         this.time = Math.random() * 3;
         this.alive = true;
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         if(!this.alive)
         {
            return false;
         }
         this.var_1871.name_2315(this.sprite,param2,param1);
         var _loc3_:Number = param1 / 1000;
         this.time += _loc3_;
         this.time %= 3;
         var _loc4_:Number = Math.sin(Math.PI * 2 * this.time / 3) * 0.5 + 0.5;
         var _loc5_:Number = 0.3 + (1.3 - 0.3) * _loc4_;
         this.sprite.scaleX = _loc5_;
         this.sprite.scaleY = _loc5_;
         this.sprite.scaleZ = _loc5_;
         this.sprite.rotation += 1.5707963267948966 * _loc3_ * _loc4_;
         this.var_3547.attenuationBegin = 100 + (300 - 100) * _loc4_;
         this.var_3547.attenuationEnd = 500 + (1000 - 500) * _loc4_;
         return true;
      }
      
      public function destroy() : void
      {
         this.var_170.removeChild(this.sprite);
         this.var_170.removeChild(this.var_3547);
         this.sprite = null;
         this.var_170 = null;
         this.var_1871.destroy();
         this.var_1871 = null;
         super.method_584();
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
