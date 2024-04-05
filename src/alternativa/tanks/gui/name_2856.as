package alternativa.tanks.gui
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import package_471.class_209;
   import package_471.name_3346;
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class name_2856 extends Sprite implements class_209
   {
       
      
      private var var_3384:ImageResource;
      
      private var var_947:Bitmap;
      
      private var var_3386:Number;
      
      private var var_3385:Number;
      
      public function name_2856(param1:ImageResource, param2:Number, param3:Number)
      {
         super();
         this.var_3384 = param1;
         this.var_3386 = param2;
         this.var_3385 = param3;
         this.init();
      }
      
      private function init() : void
      {
         graphics.clear();
         graphics.beginFill(16711680,0);
         graphics.drawRect(0,0,this.var_3386,this.var_3385);
         graphics.endFill();
         if(this.var_3384.isLazy && !this.var_3384.isLoaded)
         {
            this.var_3384.loadLazyResource(new name_3346(this));
         }
         else
         {
            this.name_1550(this.var_3384.data);
         }
      }
      
      public function method_3046(param1:ImageResource) : void
      {
         if(this.var_3384.id == param1.id)
         {
            this.name_1550(this.var_3384.data);
         }
      }
      
      private function name_1550(param1:BitmapData) : void
      {
         if(this.var_947 != null && this.contains(this.var_947))
         {
            removeChild(this.var_947);
         }
         this.var_947 = new Bitmap(param1);
         addChild(this.var_947);
         this.var_947.x = this.var_3386 - this.var_947.width >> 1;
         this.var_947.y = this.var_3385 - this.var_947.height >> 1;
      }
   }
}
