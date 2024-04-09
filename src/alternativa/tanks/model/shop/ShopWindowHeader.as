package alternativa.tanks.model.shop
{
   import controls.base.LabelBase;
   import controls.base.DefaultButtonBase;
   import controls.dropdownlist.DropDownList;
   import controls.TankWindowInner;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import package_1.Main;
   import package_54.name_102;
   import package_60.TextConst;
   
   public class ShopWindowHeader extends Sprite
   {
      
      public static var localeService:name_102 = Main.osgi.getService(name_102) as name_102;
      
      private static var var_3439:Class = name_3400;
      
      private static const const_2671:BitmapData = new var_3439().bitmapData;
      
      public static const const_1598:int = 11;
       
      
      private var var_3436:Bitmap;
      
      private var header:LabelBase;
      
      private var var_3438:TankWindowInner;
      
      private var var_3437:LabelBase;
      
      public var name_2250:DropDownList;
      
      public var name_2905:DefaultButtonBase;
      
      public function ShopWindowHeader()
      {
         this.var_3437 = new LabelBase();
         super();
         this.var_3438 = new TankWindowInner(0,0,TankWindowInner.name_2114);
         addChild(this.var_3438);
         this.var_3436 = new Bitmap(const_2671);
         addChild(this.var_3436);
         this.var_3436.x = 11;
         this.var_3436.y = 5;
         this.header = new LabelBase();
         addChild(this.header);
         this.header.multiline = true;
         this.header.wordWrap = true;
         this.header.x = this.var_3436.x + this.var_3436.width + 11;
         this.header.htmlText = localeService.getText(TextConst.SHOP_WINDOW_HEADER_TEXT);
         if(ShopWindow.name_2252)
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
         this.name_2905 = new DefaultButtonBase();
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
         this.var_3438.height = this.var_3436.height + (ShopWindow.name_2252 ? 55 : 35);
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
