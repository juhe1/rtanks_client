package package_449
{
   import alternativa.tanks.model.shop.name_2246;
   import controls.base.name_1134;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.text.TextFieldAutoSize;
   import forms.name_1139;
   import package_1.Main;
   import package_472.class_216;
   import package_472.name_3383;
   import package_473.name_3386;
   import package_474.name_3388;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class CrystalPackageItem extends class_216
   {
      
      public static var localeService:name_102 = Main.osgi.name_6(name_102) as name_102;
      
      private static const const_2659:int = 18;
      
      private static const const_2667:int = 18;
      
      private static const const_2662:int = 17;
      
      private static const const_2668:int = 17;
      
      private static const const_2669:int = 153;
      
      private static const const_2666:int = -2;
      
      private static const const_2670:uint = 23704;
      
      private static const const_2661:uint = 4144959;
       
      
      private var var_3434:Bitmap;
      
      private var var_1827:name_1134;
      
      private var var_3435:Bitmap;
      
      private var var_2229:name_1134;
      
      private var var_3424:name_1134;
      
      private var var_2226:Bitmap;
      
      private var var_3431:name_1134;
      
      private var var_3432:name_1134;
      
      private var var_3433:Bitmap;
      
      private var var_3422:Object;
      
      public function CrystalPackageItem(param1:String, param2:Object)
      {
         this.var_3422 = param2;
         super(param1,name_3383.name_1428);
      }
      
      override protected function init() : void
      {
         super.init();
         if(this.method_3103)
         {
            this.method_3104();
         }
         else
         {
            this.method_3105();
         }
         this.method_3106();
         if(this.var_445)
         {
            this.method_3107();
         }
         this.render();
      }
      
      private function method_3106() : void
      {
         this.var_1827 = new name_1134();
         this.var_1827.text = name_3386.name_3387(this.var_3422.crystalls_count,0,false);
         this.var_1827.color = 23704;
         this.var_1827.autoSize = TextFieldAutoSize.LEFT;
         this.var_1827.size = 30;
         this.var_1827.bold = true;
         this.var_1827.mouseEnabled = false;
         addChild(this.var_1827);
         this.var_3435 = new Bitmap(CrystalPackageItemIcons.name_3398);
         addChild(this.var_3435);
         this.var_2229 = new name_1134();
         method_3087(this.var_2229);
         this.var_2229.text = name_3386.name_3387(this.var_3422.price,0,false) + " " + this.var_3422.currency;
         this.var_2229.color = 4144959;
         this.var_2229.autoSize = TextFieldAutoSize.LEFT;
         this.var_2229.size = 22;
         this.var_2229.bold = true;
         this.var_2229.mouseEnabled = false;
         addChild(this.var_2229);
      }
      
      private function method_3107() : void
      {
         this.var_3424 = new name_1134();
         this.var_3424.text = "+" + this.var_3422.premium_duration + " " + name_3388.name_3399(this.var_3422.premium_duration).charAt(0);
         this.var_3424.color = name_1139.name_2012;
         this.var_3424.autoSize = TextFieldAutoSize.LEFT;
         this.var_3424.size = 20;
         this.var_3424.mouseEnabled = false;
         this.var_3424.bold = true;
         addChild(this.var_3424);
         this.var_2226 = new Bitmap(CrystalPackageItemIcons.premium);
         addChild(this.var_2226);
      }
      
      private function method_3104() : void
      {
         if(name_2246.name_2252)
         {
            name_1146(name_3383.RED);
         }
         this.var_3431 = new name_1134();
         this.var_3431.text = "+" + name_3386.name_3387(this.var_3422.bonus_crystalls,0,false);
         this.var_3431.color = 16777215;
         this.var_3431.autoSize = TextFieldAutoSize.LEFT;
         this.var_3431.size = 22;
         this.var_3431.bold = true;
         this.var_3431.mouseEnabled = false;
         addChild(this.var_3431);
         this.var_3432 = new name_1134();
         this.var_3432.text = localeService.getText(name_390.const_589);
         this.var_3432.color = 16777215;
         this.var_3432.autoSize = TextFieldAutoSize.LEFT;
         this.var_3432.size = 18;
         this.var_3432.mouseEnabled = false;
         addChild(this.var_3432);
         this.var_3433 = new Bitmap(CrystalPackageItemIcons.name_3397);
         addChild(this.var_3433);
      }
      
      private function method_3105() : void
      {
         name_1146(name_3383.name_3384);
      }
      
      private function get var_445() : Boolean
      {
         return this.var_3422.premium_duration > 0;
      }
      
      private function get method_3103() : Boolean
      {
         return this.var_3422.bonus_crystalls > 0;
      }
      
      private function render() : void
      {
         this.var_1827.x = 18;
         this.var_1827.y = 17;
         this.var_3435.x = this.var_1827.x + this.var_1827.width + 3;
         this.var_3435.y = 17 + 8;
         this.var_2229.x = 18;
         this.var_2229.y = this.var_1827.y + this.var_1827.height - 5;
         if(Boolean(this.var_3434))
         {
            this.var_3434.x = 153;
            this.var_3434.y = -2;
         }
         if(this.var_445)
         {
            this.var_3424.x = 18;
            this.var_2226.x = this.var_3424.x + this.var_3424.width + 5;
            this.var_2226.y = 143 - 17 - this.var_2226.height;
            this.var_3424.y = this.var_2226.y + 4;
         }
         if(this.method_3103)
         {
            this.var_3433.x = 279 - 18 - this.var_3433.width;
            this.var_3431.x = this.var_3433.x - this.var_3431.width;
            this.var_3432.x = this.var_3431.x;
            this.var_3432.y = 143 - 17 - this.var_3432.height;
            this.var_3431.y = this.var_3432.y - this.var_3432.height + 4;
            this.var_3433.y = this.var_3431.y + 5;
         }
      }
      
      override public function set gridPosition(param1:int) : void
      {
         super.gridPosition = param1;
         var _loc2_:BitmapData = CrystalPackageItemIcons.name_3396[gridPosition];
         if(!_loc2_ && param1 != 0)
         {
            _loc2_ = CrystalPackageItemIcons.name_3396[CrystalPackageItemIcons.name_3396.length - 1];
         }
         if(Boolean(_loc2_))
         {
            this.var_3434 = new Bitmap(_loc2_);
            addChildAt(this.var_3434,2);
         }
         this.render();
      }
   }
}
