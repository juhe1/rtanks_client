package package_452
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.shop.items.kits.SpecialKitIcons;
   import alternativa.tanks.model.shop.items.kits.class_217;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.text.TextFieldAutoSize;
   import forms.name_1139;
   import package_473.name_3386;
   import package_474.name_3388;
   import package_54.name_102;
   
   public class BattlePassPackageButton extends class_217
   {
      
      public static var localeService:name_102 = OSGi.getInstance().getService(name_102) as name_102;
      
      private static const const_2663:int = 25;
      
      private static const const_2662:int = 10;
      
      private static const CENTER:int = 400;
       
      
      private var var_2229:LabelBase;
      
      private var var_2226:Bitmap;
      
      private var var_3423:Bitmap;
      
      private var var_3422:Object;
      
      public function BattlePassPackageButton(param1:String, param2:Object)
      {
         this.var_3422 = param2;
         super(param1,new BattlePassShopItemSkin());
      }
      
      override protected function init() : void
      {
         super.init();
         this.method_3098();
         this.method_3099();
         this.render();
      }
      
      private function method_3098() : void
      {
      }
      
      private function method_3099() : void
      {
         this.method_3096();
         this.addPremiumAndGoldIconAndLabel();
         this.addSuppliesIconAndLabel();
      }
      
      private function method_3094() : int
      {
         switch(localeService.language)
         {
            case "fa":
               return 25;
            default:
               return 35;
         }
      }
      
      private function method_3100() : int
      {
         switch(localeService.language)
         {
            case "fa":
               return 55;
            default:
               return 75;
         }
      }
      
      private function method_3096() : void
      {
         var _loc1_:LabelBase = null;
         _loc1_ = new LabelBase();
         _loc1_.text = name_3386.name_3387(this.var_3422.crystalls,0,false);
         _loc1_.color = name_1139.const_1763;
         _loc1_.autoSize = TextFieldAutoSize.LEFT;
         _loc1_.size = this.method_3100();
         _loc1_.x = 25;
         _loc1_.y = 10;
         _loc1_.bold = true;
         _loc1_.mouseEnabled = false;
         addChild(_loc1_);
         var _loc2_:Bitmap = new Bitmap(SpecialKitIcons.crystal);
         _loc2_.x = _loc1_.x + _loc1_.width + 5;
         _loc2_.y = _loc1_.y + 20;
         addChild(_loc2_);
         this.method_3097();
         this.var_2229.size = this.method_3094();
         this.var_2229.x = _loc1_.x;
         this.var_2229.y = _loc1_.y + _loc1_.height - 12;
      }
      
      private function method_3097() : void
      {
         this.var_2229 = new LabelBase();
         this.var_2229.text = name_3386.name_3387(this.var_3422.price,0,false) + " " + this.var_3422.currency;
         this.var_2229.color = name_1139.const_1757;
         this.var_2229.size = this.method_3094();
         this.var_2229.autoSize = TextFieldAutoSize.LEFT;
         this.var_2229.bold = true;
         this.var_2229.mouseEnabled = false;
         addChild(this.var_2229);
         this.method_3087(this.var_2229);
      }
      
      private function addPremiumAndGoldIconAndLabel() : void
      {
         var _loc1_:LabelBase = null;
         var _loc2_:LabelBase = null;
         _loc1_ = null;
         _loc2_ = null;
         this.var_2226 = new Bitmap();
         this.var_2226.x = 400;
         addChild(this.var_2226);
         var _loc3_:int = int(this.var_3422.premium);
         _loc1_ = new LabelBase();
         _loc1_.text = "+" + name_3388.name_3389(_loc3_);
         _loc1_.color = name_1139.name_2012;
         _loc1_.autoSize = TextFieldAutoSize.LEFT;
         _loc1_.bold = true;
         _loc1_.mouseEnabled = false;
         addChild(_loc1_);
         if(this.method_3095())
         {
            this.var_2226.bitmapData = SpecialKitIcons.name_3390;
            this.var_2226.y = 10 + 20;
            _loc1_.x = this.var_2226.x;
            _loc1_.y = this.var_2226.y + this.var_2226.height - 5;
            _loc1_.size = 26;
            this.var_3423 = new Bitmap(SpecialKitIcons.name_3395);
            this.var_3423.x = this.var_2226.x + this.var_2226.width + 15;
            this.var_3423.y = 10 + 20;
            addChild(this.var_3423);
            _loc2_ = new LabelBase();
            _loc2_.text = "+" + this.var_3422.golds;
            _loc2_.x = this.var_3423.x + 7;
            _loc2_.y = this.var_3423.y + this.var_3423.height - 15;
            _loc2_.color = name_1139.name_2012;
            _loc2_.autoSize = TextFieldAutoSize.LEFT;
            _loc2_.size = 26;
            _loc2_.bold = true;
            _loc2_.mouseEnabled = false;
            addChild(_loc2_);
         }
         else
         {
            this.var_2226.bitmapData = SpecialKitIcons.premium;
            this.var_2226.y = 10 + 5;
            addChild(this.var_2226);
            _loc1_.x = this.var_2226.x + 12;
            _loc1_.y = this.var_2226.y + this.var_2226.height - 10;
            _loc1_.size = this.method_3094();
         }
      }
      
      private function addSuppliesIconAndLabel() : void
      {
         var _loc1_:Bitmap = new Bitmap(SpecialKitIcons.name_3394);
         _loc1_.y = -8;
         addChild(_loc1_);
         _loc1_.x = this.var_2226.x + this.var_2226.width + 30;
      }
      
      private function method_3095() : Boolean
      {
         return this.var_3422.golds > 0;
      }
      
      private function render() : void
      {
         this.var_2229.x = 25;
      }
      
      override public function set gridPosition(param1:int) : void
      {
         super.gridPosition = param1;
         this.render();
      }
   }
}
