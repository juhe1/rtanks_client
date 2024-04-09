package package_125
{
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.text.TextFieldAutoSize;
   import package_472.class_216;
   import package_472.name_3383;
   
   public class PromoPackageItem extends class_216
   {
      
      private static const const_2656:Class = name_3382;
      
      public static const const_2657:BitmapData = new const_2656().bitmapData;
      
      private static const const_2659:int = 17;
      
      private static const const_2658:uint = 23704;
       
      
      private var var_3421:LabelBase;
      
      private var icon:Bitmap;
      
      private var var_3422:Object;
      
      public function PromoPackageItem(param1:String, param2:Object)
      {
         this.var_3422 = param2;
         super(param1,name_3383.name_3384);
      }
      
      override protected function init() : void
      {
         super.init();
         this.method_3088();
         this.render();
      }
      
      private function method_3088() : void
      {
         this.var_3421 = new LabelBase();
         this.var_3421.text = Game.var_1 == null ? "Promocodes" : (Game.var_1 == "EN" ? "Promocodes" : "Промокоды");
         this.var_3421.color = 23704;
         this.var_3421.autoSize = TextFieldAutoSize.LEFT;
         this.var_3421.size = 22;
         this.var_3421.bold = true;
         this.var_3421.mouseEnabled = false;
         this.var_3421.wordWrap = true;
         this.var_3421.width = this.width / 2;
         addChild(this.var_3421);
         this.icon = new Bitmap(const_2657);
         addChild(this.icon);
      }
      
      private function render() : void
      {
         this.icon.x = this.width - 17 - 150 - 17;
         this.var_3421.x = 17;
         this.icon.y = 16;
         this.var_3421.y = this.height / 2 - this.var_3421.height / 2;
      }
   }
}
