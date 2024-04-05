package package_483
{
   import alternativa.tanks.gui.tables.kits.description.name_3211;
   import flash.display.Bitmap;
   import flash.display.Shape;
   import flash.display.Sprite;
   
   public class name_3532 extends Sprite
   {
       
      
      private var top:Bitmap;
      
      private var var_2605:Bitmap;
      
      private var var_2606:Bitmap;
      
      private var left:Bitmap;
      
      private var right:Bitmap;
      
      private var bottom:Bitmap;
      
      private var var_2600:Bitmap;
      
      private var var_2603:Bitmap;
      
      private var center:Bitmap;
      
      private var var_3712:Shape;
      
      private var var_3711:Shape;
      
      public function name_3532()
      {
         super();
         this.var_2605 = new Bitmap(KitPackageDescriptionPanelBitmaps.name_3674);
         addChild(this.var_2605);
         this.top = new Bitmap(KitPackageDescriptionPanelBitmaps.name_3679);
         addChild(this.top);
         this.var_2606 = new Bitmap(KitPackageDescriptionPanelBitmaps.name_3676);
         addChild(this.var_2606);
         this.left = new Bitmap(KitPackageDescriptionPanelBitmaps.var_3645);
         addChild(this.left);
         this.right = new Bitmap(KitPackageDescriptionPanelBitmaps.name_3677);
         addChild(this.right);
         this.bottom = new Bitmap(KitPackageDescriptionPanelBitmaps.name_3681);
         addChild(this.bottom);
         this.var_2600 = new Bitmap(KitPackageDescriptionPanelBitmaps.name_3678);
         addChild(this.var_2600);
         this.var_2603 = new Bitmap(KitPackageDescriptionPanelBitmaps.name_3680);
         addChild(this.var_2603);
         this.center = new Bitmap(KitPackageDescriptionPanelBitmaps.name_3673);
         addChild(this.center);
         this.var_3712 = new Shape();
         addChild(this.var_3712);
         this.var_3711 = new Shape();
         addChild(this.var_3711);
      }
      
      public function resize(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc2_ = 0;
         _loc3_ = 0;
         _loc2_ = name_3211.WIDTH;
         _loc3_ = (param1 + 2) * name_3211.const_2767 + name_3211.const_2768 * 3 - this.var_2605.height;
         this.top.x = this.var_2605.width;
         this.top.width = _loc2_ - this.var_2606.width - this.var_2605.width;
         this.var_2606.x = _loc2_ - this.var_2606.width;
         this.var_2600.y = _loc3_ - this.var_2600.height;
         this.var_2603.x = this.var_2606.x;
         this.var_2603.y = this.var_2600.y;
         this.bottom.y = this.var_2600.y;
         this.bottom.x = this.top.x;
         this.bottom.width = this.top.width;
         this.left.y = this.var_2605.height;
         this.left.height = this.var_2600.y - this.left.y;
         this.right.y = this.left.y;
         this.right.x = this.var_2606.x;
         this.right.height = this.var_2603.y - this.right.y;
         this.center.x = 1;
         this.center.y = _loc3_ - name_3211.const_2768 * 3 - name_3211.const_2767 + this.center.height;
         this.center.width = _loc2_ - 2;
         this.method_3301(this.var_3712,this.var_2605.width,this.var_2605.height,this.top.width,this.center.y - this.center.height);
         this.method_3301(this.var_3711,this.var_2605.width,this.center.y + this.center.height,this.top.width,name_3211.const_2768 * 3 + name_3211.const_2767 - this.center.height * 3);
      }
      
      private function method_3301(param1:Shape, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         param1.graphics.clear();
         param1.graphics.beginBitmapFill(KitPackageDescriptionPanelBitmaps.name_3675);
         param1.graphics.drawRect(param2,param3,param4,param5);
      }
   }
}
