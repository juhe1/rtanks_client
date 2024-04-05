package package_450
{
   import alternativa.osgi.OSGi;
   import controls.base.name_1134;
   import flash.display.Bitmap;
   import flash.text.TextFieldAutoSize;
   import forms.name_1139;
   import package_472.class_216;
   import package_472.name_3383;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class LootBoxPackageItem extends class_216
   {
      
      public static var localeService:name_102 = OSGi.getInstance().name_6(name_102) as name_102;
      
      private static const const_2659:int = 18;
      
      private static const const_2661:uint = 4144959;
       
      
      private const const_2660:uint = 3432728;
      
      private var label:name_1134;
      
      private var var_2229:name_1134;
      
      private var icon:Bitmap;
      
      private var var_3422:Object;
      
      public function LootBoxPackageItem(param1:String, param2:Object)
      {
         this.var_3422 = param2;
         super(param1,name_3383.name_3384);
      }
      
      override protected function init() : void
      {
         super.init();
         this.method_3091();
         this.method_3090();
         this.render();
      }
      
      private function method_3092(param1:int) : String
      {
         return param1.toString() + " " + this.method_3093(param1);
      }
      
      private function method_3093(param1:int) : String
      {
         if(localeService.language == "ru")
         {
            return localeService.getText(name_390.const_641) + this.method_3089(param1);
         }
         return localeService.getText(param1 == 1 ? name_390.const_641 : name_390.const_687);
      }
      
      private function method_3089(param1:int) : String
      {
         var _loc2_:int = param1 % 100;
         if(_loc2_ >= 11 && _loc2_ <= 20)
         {
            return "ов";
         }
         _loc2_ = param1 % 10;
         if(_loc2_ == 1)
         {
            return "";
         }
         if(_loc2_ >= 2 && _loc2_ <= 4)
         {
            return "а";
         }
         return "ов";
      }
      
      private function method_3091() : void
      {
         this.label = new name_1134();
         this.label.text = this.method_3092(this.var_3422.count);
         this.label.color = name_1139.const_1756;
         this.label.autoSize = TextFieldAutoSize.LEFT;
         this.label.size = 25;
         this.label.bold = true;
         this.label.mouseEnabled = false;
         addChild(this.label);
         this.var_2229 = new name_1134();
         method_3087(this.var_2229);
         this.var_2229.text = this.var_3422.price + " " + this.var_3422.currency;
         this.var_2229.color = 4144959;
         this.var_2229.autoSize = TextFieldAutoSize.LEFT;
         this.var_2229.size = 22;
         this.var_2229.bold = true;
         this.var_2229.mouseEnabled = false;
         addChild(this.var_2229);
      }
      
      private function method_3090() : void
      {
         this.icon = new Bitmap(LootBoxPackageItemIcons.name_3385);
         addChild(this.icon);
      }
      
      private function render() : void
      {
         this.icon.x = -2;
         this.label.x = this.icon.x + this.icon.width - 15;
         this.var_2229.x = this.label.x;
         this.icon.y = 143 - this.icon.height >> 1;
         this.label.y = this.icon.y + 2;
         this.var_2229.y = int(143 / 2);
      }
   }
}
