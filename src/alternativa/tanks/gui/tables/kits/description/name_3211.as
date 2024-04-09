package alternativa.tanks.gui.tables.kits.description
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.gui.tables.kits.name_3215;
   import assets.name_2295;
   import controls.Money;
   import controls.base.LabelBase;
   import flash.display.Sprite;
   import flash.text.TextFormatAlign;
   import forms.name_1139;
   import package_131.name_352;
   import package_483.name_3532;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_3211 extends Sprite
   {
      
      public static const const_2768:int = 12;
      
      public static const const_2767:int = 17;
      
      public static const WIDTH:int = 350;
      
      public static var localeService:name_102 = OSGi.getInstance().getService(name_102) as name_102;
       
      
      private var var_3601:name_3215;
      
      private var discount:int;
      
      private var price:int;
      
      public function name_3211()
      {
         super();
      }
      
      public function show(param1:name_3215, param2:int, param3:int) : void
      {
         this.var_3601 = param1;
         this.discount = param2;
         this.price = param3;
         this.method_3039();
         this.method_3189();
         this.method_3221();
         this.method_3220();
         this.method_3223();
         this.method_3222();
      }
      
      private function method_3039() : void
      {
         var _loc1_:name_3532 = new name_3532();
         _loc1_.resize(this.var_3601.name_3531().length + 2);
         addChild(_loc1_);
      }
      
      private function method_3189() : void
      {
         var _loc2_:LabelBase = null;
         var _loc1_:LabelBase = null;
         _loc2_ = new LabelBase();
         _loc2_.color = name_1139.name_1894;
         _loc2_.align = TextFormatAlign.LEFT;
         _loc2_.text = localeService.getText(name_390.const_734);
         _loc2_.x = 12;
         _loc2_.y = 12;
         addChild(_loc2_);
         _loc1_ = new LabelBase();
         _loc1_.color = name_1139.name_1894;
         _loc1_.align = TextFormatAlign.RIGHT;
         _loc1_.text = localeService.getText(name_390.const_1285);
         _loc1_.x = 350 - _loc1_.width - _loc2_.x;
         _loc1_.y = _loc2_.y;
         addChild(_loc1_);
      }
      
      private function method_3221() : void
      {
         var _loc2_:name_3530 = null;
         var _loc3_:int = 0;
         var _loc1_:name_352 = null;
         _loc2_ = null;
         _loc3_ = 12 + 17;
         for each(_loc1_ in this.var_3601.name_3531())
         {
            _loc2_ = new name_3530(_loc1_);
            _loc2_.y = _loc3_;
            addChild(_loc2_);
            _loc3_ += 17;
         }
      }
      
      private function method_3220() : void
      {
         var _loc1_:LabelBase = null;
         _loc1_ = new LabelBase();
         _loc1_.color = name_1139.name_1894;
         _loc1_.align = TextFormatAlign.LEFT;
         _loc1_.text = localeService.getText(name_390.const_1242);
         _loc1_.x = 12;
         _loc1_.y = 12 + (this.var_3601.name_3531().length + 1) * 17;
         addChild(_loc1_);
         var _loc2_:name_2295 = new name_2295();
         _loc2_.x = 350 - _loc1_.x - _loc2_.width;
         _loc2_.y = _loc1_.y + 4;
         addChild(_loc2_);
         var _loc3_:LabelBase = new LabelBase();
         _loc3_.color = name_1139.name_1894;
         _loc3_.align = TextFormatAlign.RIGHT;
         _loc3_.text = Money.name_876(this.method_3219(),false);
         _loc3_.x = _loc2_.x - _loc3_.width - 1;
         _loc3_.y = _loc1_.y;
         addChild(_loc3_);
      }
      
      private function method_3223() : void
      {
         var _loc1_:LabelBase = null;
         _loc1_ = new LabelBase();
         _loc1_.color = name_1139.name_1894;
         _loc1_.align = TextFormatAlign.LEFT;
         _loc1_.text = localeService.getText(name_390.const_1082);
         _loc1_.text = _loc1_.text.replace("{0}",this.discount + "%");
         _loc1_.x = 12;
         _loc1_.y = 12 + (this.var_3601.name_3531().length + 2) * 17 + 12;
         addChild(_loc1_);
         var _loc2_:name_2295 = new name_2295();
         _loc2_.x = 350 - _loc1_.x - _loc2_.width;
         _loc2_.y = _loc1_.y + 4;
         addChild(_loc2_);
         var _loc3_:LabelBase = new LabelBase();
         _loc3_.color = name_1139.name_1894;
         _loc3_.align = TextFormatAlign.RIGHT;
         _loc3_.text = Money.name_876(this.price,false);
         _loc3_.x = _loc2_.x - _loc3_.width - 1;
         _loc3_.y = _loc1_.y;
         addChild(_loc3_);
      }
      
      private function method_3222() : void
      {
         var _loc1_:name_352 = new name_352(1,this.method_3219() - this.price,localeService.getText(name_390.const_877));
         var _loc2_:name_3530 = new name_3530(_loc1_);
         _loc2_.y = 12 + (this.var_3601.name_3531().length + 3) * 17 + 12;
         addChild(_loc2_);
      }
      
      private function method_3219() : int
      {
         var _loc1_:name_352 = null;
         var _loc2_:int = 0;
         for each(_loc1_ in this.var_3601.name_3531())
         {
            _loc2_ += _loc1_.crystalPrice * _loc1_.count;
         }
         return _loc2_;
      }
   }
}
