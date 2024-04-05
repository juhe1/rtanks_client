package package_285
{
   import controls.DefaultButton;
   import controls.base.name_1134;
   import controls.name_1891;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import forms.name_1139;
   import forms.name_1838;
   
   public class PremiumWelcomeAlert extends Sprite
   {
      
      private static const const_1649:Class = name_2194;
       
      
      private var bitmap:Bitmap;
      
      private var window:name_1838;
      
      private var var_1737:name_1891;
      
      public var name_1021:DefaultButton;
      
      public var var_1739:int = 410;
      
      public var var_1738:int = 220;
      
      public function PremiumWelcomeAlert()
      {
         this.bitmap = new Bitmap(new const_1649().bitmapData);
         this.name_1021 = new DefaultButton();
         super();
         this.window = name_1838.name_1844("ПРЕМИУМ АККАУНТ");
         this.window.width = this.var_1739;
         this.window.height = this.var_1738;
         addChild(this.window);
         this.var_1737 = new name_1891(0,0,name_1891.name_1428);
         this.var_1737.width = this.window.width - 20;
         this.var_1737.height = this.window.height - 55;
         this.var_1737.x = 10;
         this.var_1737.y = 10;
         addChild(this.var_1737);
         this.bitmap.x = this.var_1737.width / 2 - this.bitmap.width / 2;
         this.bitmap.y = 10;
         this.var_1737.addChild(this.bitmap);
         var _loc1_:name_1134 = this.method_582();
         _loc1_.x = this.var_1737.width / 2 - _loc1_.width / 2;
         _loc1_.y = this.var_1737.height - _loc1_.height - 10;
         this.var_1737.addChild(_loc1_);
         this.name_1021.x = this.window.width - this.name_1021.width - 10;
         this.name_1021.y = this.window.height - this.name_1021.height - 10;
         this.name_1021.label = "Закрыть";
         addChild(this.name_1021);
      }
      
      private function method_582() : name_1134
      {
         var _loc1_:name_1134 = new name_1134();
         _loc1_.multiline = true;
         _loc1_.text = "Добро пожаловать в ряды Премиум танкистов!";
         _loc1_.size = 18;
         _loc1_.color = name_1139.name_2195;
         return _loc1_;
      }
   }
}
