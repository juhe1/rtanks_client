package package_451
{
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.text.TextFieldAutoSize;
   import package_472.class_216;
   import package_472.name_3383;
   import package_474.name_3388;
   
   public class PremiumPackageItem extends class_216
   {
      
      private static const const_2659:int = 18;
      
      private static const const_2661:uint = 4144959;
       
      
      private const const_2660:uint = 3432728;
      
      private var var_3424:LabelBase;
      
      private var var_2229:LabelBase;
      
      private var icon:Bitmap;
      
      private var var_3422:Object;
      
      public function PremiumPackageItem(param1:String, param2:Object)
      {
         this.var_3422 = param2;
         super(param1,name_3383.name_3384);
      }
      
      override protected function init() : void
      {
         super.init();
         this.method_3091();
         this.method_3101();
         this.render();
      }
      
      private function method_3091() : void
      {
         this.var_3424 = new LabelBase();
         this.var_3424.text = "+" + name_3388.name_3389(this.var_3422.premium_duration);
         this.var_3424.color = 3432728;
         this.var_3424.autoSize = TextFieldAutoSize.LEFT;
         this.var_3424.size = 30;
         this.var_3424.bold = true;
         this.var_3424.mouseEnabled = false;
         addChild(this.var_3424);
         this.var_2229 = new LabelBase();
         method_3087(this.var_2229);
         this.var_2229.text = this.var_3422.price + " " + this.var_3422.currency;
         this.var_2229.color = 4144959;
         this.var_2229.autoSize = TextFieldAutoSize.LEFT;
         this.var_2229.size = 22;
         this.var_2229.bold = true;
         this.var_2229.mouseEnabled = false;
         addChild(this.var_2229);
      }
      
      private function method_3101() : void
      {
         this.icon = new Bitmap(PremiumPackageItemIcons.var_2226);
         addChild(this.icon);
      }
      
      private function render() : void
      {
         this.icon.x = 18 - 5;
         this.var_3424.x = this.icon.x + this.icon.width - 7;
         this.var_2229.x = this.var_3424.x;
         this.icon.y = 143 - this.icon.height >> 1;
         this.var_3424.y = this.icon.y + 2;
         this.var_2229.y = this.icon.y + this.icon.height - this.var_2229.height;
      }
   }
}
