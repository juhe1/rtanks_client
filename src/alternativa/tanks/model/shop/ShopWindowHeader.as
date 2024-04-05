package alternativa.tanks.model.shop
{
   import controls.base.name_1134;
   import controls.base.name_998;
   import controls.dropdownlist.DropDownList;
   import controls.name_1891;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import package_1.Main;
   import package_54.name_102;
   import package_60.TextConst;
   
   public class ShopWindowHeader extends Sprite
   {
      
      public static var localeService:name_102 = Main.osgi.name_6(name_102) as name_102;
      
      private static var var_3439:Class = name_3400;
      
      private static const const_2671:BitmapData = new var_3439().bitmapData;
      
      public static const const_1598:int = 11;
       
      
      private var var_3436:Bitmap;
      
      private var header:name_1134;
      
      private var var_3438:name_1891;
      
      private var var_3437:name_1134;
      
      public var name_2250:DropDownList;
      
      public var name_2905:name_998;
      
      public function ShopWindowHeader()
      {
         this.var_3437 = new name_1134();
         super();
         this.var_3438 = new name_1891(0,0,name_1891.name_2114);
         addChild(this.var_3438);
         this.var_3436 = new Bitmap(const_2671);
         addChild(this.var_3436);
         this.var_3436.x = 11;
         this.var_3436.y = 5;
         this.header = new name_1134();
         addChild(this.header);
         this.header.multiline = true;
         this.header.wordWrap = true;
         this.header.x = this.var_3436.x + this.var_3436.width + 11;
         this.header.htmlText = localeService.getText(TextConst.SHOP_WINDOW_HEADER_TEXT);
         if(name_2246.name_2252)
         {
            this.var_3437.multiline = true;
            this.var_3437.wordWrap = true;
            this.var_3437.x = this.var_3436.x + this.var_3436.width + 11;
            this.var_3437.htmlText = localeService.getText(TextConst.SHOP_WINDOW_HEADER_DOUBLE_CRYSTALL_TEXT);
            this.var_3437.bold = true;
            this.var_3437.color = 16760355;
            addChild(this.var_3437);
         }
         this.name_2250 = new DropDownList();
         this.name_2250.width = 160;
         this.method_3108();
         addChild(this.name_2250);
         this.name_2905 = new name_998();
         this.name_2905.tabEnabled = false;
         this.name_2905.label = localeService.getText(TextConst.FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT);
         this.name_2905.visible = false;
         addChild(this.name_2905);
      }
      
      private function method_3108() : void
      {
         this.name_2250.addItem({
            "rang":0,
            "index":0,
            "id":0,
            "gameName":"Freekassa",
            "code":"freekassa"
         });
         this.name_2250.addItem({
            "rang":0,
            "index":1,
            "id":1,
            "gameName":"Interkassa",
            "code":"interkassa"
         });
         this.name_2250.addItem({
            "rang":0,
            "index":2,
            "id":2,
            "gameName":"PayPal",
            "code":"paypal"
         });
      }
      
      public function resize(param1:int) : void
      {
         this.var_3438.width = param1;
         this.var_3438.height = this.var_3436.height + (name_2246.name_2252 ? 55 : 35);
         this.header.width = param1 - this.header.x - 11;
         this.header.y = this.var_3436.y + (this.var_3436.height - this.header.textHeight >> 1);
         this.var_3437.width = param1 - this.header.x - 11;
         this.var_3437.y = this.header.y + this.header.height;
         this.name_2250.y = this.var_3438.height - 35;
         this.name_2250.x = this.var_3438.width - this.name_2250.width + 5;
         this.name_2905.y = this.var_3438.height - 35;
         this.name_2905.x = 5;
      }
      
      override public function get height() : Number
      {
         return this.var_3438.height;
      }
   }
}
