package alternativa.tanks.sfx
{
   import alternativa.tanks.engine3d.AnimatedSprite3D;
   import alternativa.tanks.engine3d.name_1072;
   import flash.geom.ColorTransform;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_68.name_175;
   import package_76.name_735;
   
   public class name_2087 extends class_30 implements name_657
   {
      
      private static const const_2102:Vector3 = new Vector3();
       
      
      public var sprite:AnimatedSprite3D;
      
      private var var_1869:Number;
      
      private var var_1872:Number;
      
      private var var_1870:int;
      
      private var var_1871:name_2314;
      
      private var var_2726:Number;
      
      private var var_2725:Number;
      
      private var alphaMultiplier:Number;
      
      private var var_170:name_175;
      
      public function name_2087(param1:ObjectPool)
      {
         super(param1);
         this.sprite = new AnimatedSprite3D(1,1);
      }
      
      public function init(param1:Number, param2:Number, param3:name_1072, param4:Number, param5:name_2314, param6:Number = 0.5, param7:Number = 0.5, param8:ColorTransform = null, param9:Number = 130, param10:String = "normal", param11:Number = 1000000, param12:Number = 1000000, param13:Number = 1, param14:Boolean = false) : void
      {
         this.alphaMultiplier = param13;
         this.method_2029(param1,param2,param4,param6,param7,param8,param3,param9,param10);
         this.var_2726 = param11;
         this.var_2725 = param12;
         param5.name_2316(this.sprite);
         this.var_1872 = 0.001 * param3.fps;
         this.var_1871 = param5;
         this.var_1869 = 0;
         this.var_1870 = 1;
         this.sprite.useShadowMap = param14;
         this.sprite.useLight = param14;
         this.sprite.softAttenuation = 80;
      }
      
      public function name_742(param1:name_175) : void
      {
         this.var_170 = param1;
         param1.addChild(this.sprite);
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         this.sprite.name_1431(this.var_1869);
         this.var_1869 += param1 * this.var_1872;
         this.var_1871.name_2315(this.sprite,param2,param1);
         if(this.var_1870 > 0 && this.var_1869 >= this.sprite.name_2313())
         {
            --this.var_1870;
            if(this.var_1870 == 0)
            {
               return false;
            }
            this.var_1869 -= this.sprite.name_2313();
         }
         const_2102.x = this.sprite.x;
         const_2102.y = this.sprite.y;
         const_2102.z = this.sprite.z;
         var _loc3_:Number = const_2102.distanceTo(param2.pos);
         if(_loc3_ > this.var_2725)
         {
            this.sprite.visible = false;
         }
         else
         {
            this.sprite.visible = true;
            if(_loc3_ > this.var_2726)
            {
               this.sprite.alpha = this.alphaMultiplier * (this.var_2725 - _loc3_) / (this.var_2725 - this.var_2726);
            }
            else
            {
               this.sprite.alpha = this.alphaMultiplier;
            }
         }
         return true;
      }
      
      public function destroy() : void
      {
         this.var_170.removeChild(this.sprite);
         this.var_170 = null;
         this.sprite.clear();
         this.var_1871.destroy();
         this.var_1871 = null;
         method_584();
      }
      
      override protected function getClass() : Class
      {
         return name_2087;
      }
      
      public function kill() : void
      {
         this.var_1870 = 1;
         this.var_1869 = this.sprite.name_2313();
      }
      
      private function method_2029(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:ColorTransform, param7:name_1072, param8:Number, param9:String) : void
      {
         this.sprite.width = param1;
         this.sprite.height = param2;
         this.sprite.rotation = param3;
         this.sprite.originX = param4;
         this.sprite.originY = param5;
         this.sprite.blendMode = param9;
         this.sprite.colorTransform = param6;
         this.sprite.softAttenuation = param8;
         this.sprite.name_1433(param7);
      }
      
      public function get owner() : ClientObject
      {
         return null;
      }
   }
}
