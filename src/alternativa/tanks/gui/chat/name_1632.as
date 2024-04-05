package alternativa.tanks.gui.chat
{
   import controls.base.name_1134;
   import controls.base.name_998;
   import controls.name_1891;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   import forms.name_1838;
   import package_379.class_123;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_1632 extends class_123
   {
      
      public static var localeService:name_102;
      
      private static var var_2406:Class = name_2658;
      
      private static var bitmapData:BitmapData = Bitmap(new var_2406()).bitmapData;
      
      private static const const_1518:int = 608;
      
      private static const const_1598:int = 11;
       
      
      private var name_983:name_998;
      
      private var window:name_1838;
      
      private var var_2405:Bitmap;
      
      private var var_2404:name_1134;
      
      private var var_1737:name_1891;
      
      public function name_1632(param1:String)
      {
         super();
         this.method_1327();
         this.method_2402();
         this.method_2404(param1);
         this.method_2403();
         this.method_1331();
         this.method_2405();
      }
      
      private function method_1327() : void
      {
         this.window = name_1838.name_1844(localeService.getText(name_390.const_710));
         addChild(this.window);
         this.window.width = 608;
      }
      
      private function method_2402() : void
      {
         this.var_2405 = new Bitmap(bitmapData);
         this.var_2405.x = 11 - 2;
         this.var_2405.y = 11;
         this.window.addChild(this.var_2405);
      }
      
      private function method_2404(param1:String) : void
      {
         this.var_1737 = new name_1891(0,0,name_1891.name_1428);
         this.var_1737.x = 11;
         this.var_1737.width = 608 - 11 * 2;
         this.window.addChild(this.var_1737);
         this.var_2404 = new name_1134();
         this.var_2404.wordWrap = true;
         this.var_2404.multiline = true;
         this.var_2404.text = localeService.getText(name_390.const_929).replace("%link%",param1);
         this.var_2404.size = 12;
         this.var_2404.x = 11 * 2;
         this.var_2404.y = this.var_2405.y + this.var_2405.height + 11 * 2;
         this.var_2404.width = 608 - 11 * 4;
         this.window.addChild(this.var_2404);
      }
      
      private function method_2403() : void
      {
         var _loc1_:name_1134 = new name_1134();
         _loc1_.wordWrap = true;
         _loc1_.multiline = true;
         _loc1_.text = localeService.getText(name_390.const_690);
         _loc1_.size = 12;
         _loc1_.x = this.var_2404.x;
         _loc1_.y = this.var_2404.y + this.var_2404.height + 11;
         _loc1_.width = this.var_2404.width;
         this.window.addChild(_loc1_);
         this.var_1737.y = this.var_2404.y - 11;
         this.var_1737.height = _loc1_.height + this.var_2404.height + 11 * 3;
      }
      
      private function method_1331() : void
      {
         this.name_983 = new name_998();
         this.name_983.label = localeService.getText(name_390.const_1168);
         this.name_983.x = 608 - 11 - this.name_983.width;
         this.name_983.y = this.var_1737.y + this.var_1737.height + 11;
         this.name_983.addEventListener(MouseEvent.CLICK,this.method_1323);
         this.window.addChild(this.name_983);
      }
      
      public function show() : void
      {
         var_864.name_1585(this);
      }
      
      private function method_2405() : void
      {
         this.window.height = this.name_983.y + this.name_983.height + 11;
      }
      
      override protected function method_1319() : void
      {
         this.method_1323();
      }
      
      override protected function method_1320() : void
      {
         this.method_1323();
      }
      
      private function method_1323(param1:MouseEvent = null) : void
      {
         this.name_983.removeEventListener(MouseEvent.CLICK,this.method_1323);
         var_864.name_1013(this);
         dispatchEvent(new name_2654(name_2654.name_2655));
      }
   }
}
