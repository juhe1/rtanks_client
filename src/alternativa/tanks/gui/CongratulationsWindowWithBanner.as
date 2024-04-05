package alternativa.tanks.gui
{
   import alternativa.model.name_66;
   import assets.icons.GarageItemBackground;
   import controls.DefaultButton;
   import controls.Label;
   import controls.name_1891;
   import controls.name_1922;
   import controls.name_2296;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import package_1.Main;
   import package_181.class_130;
   import package_327.name_1586;
   import package_4.ClientObject;
   import package_54.name_102;
   import package_60.TextConst;
   import package_7.name_32;
   
   public class CongratulationsWindowWithBanner extends Sprite
   {
       
      
      private var window:name_1922;
      
      private var var_1182:name_1891;
      
      public var name_983:DefaultButton;
      
      private var messageLabel:Label;
      
      private var name_1029:Point;
      
      private var var_1739:int = 450;
      
      private const const_1692:int = 12;
      
      private const var_1750:int = 9;
      
      private const const_1677:Point = new Point(104,33);
      
      private const space:int = 8;
      
      private var var_2559:ClientObject;
      
      private var var_1819:Sprite;
      
      private var var_2556:Bitmap;
      
      private var var_2558:String;
      
      private var var_2557:Sprite;
      
      public function CongratulationsWindowWithBanner(param1:String, param2:Array, param3:ClientObject)
      {
         var _loc4_:GarageItemBackground = null;
         var _loc7_:int = 0;
         var _loc11_:Bitmap = null;
         var _loc12_:Label = null;
         var _loc13_:name_32 = null;
         var _loc14_:class_130 = null;
         super();
         _loc4_ = new GarageItemBackground(GarageItemBackground.ENGINE_NORMAL);
         var _loc5_:name_102 = name_102(Main.osgi.name_6(name_102));
         var _loc6_:Boolean = (param2.length & 1) == 0;
         if(param2.length == 1)
         {
            _loc7_ = 1;
         }
         else if(param2.length < 5)
         {
            _loc7_ = 2;
         }
         else
         {
            _loc7_ = 3;
         }
         this.var_1819 = new Sprite();
         this.var_2557 = new Sprite();
         this.var_2556 = new Bitmap();
         this.var_1819.addChild(this.var_2556);
         this.var_1739 = _loc4_.width + 12 * 2 + 9 * 2 + (_loc4_.width + 8) * (_loc7_ - 1);
         this.messageLabel = new Label();
         this.messageLabel.wordWrap = true;
         this.messageLabel.multiline = true;
         this.messageLabel.text = param1;
         this.messageLabel.size = 12;
         this.messageLabel.color = 5898034;
         this.messageLabel.x = 12 * 2;
         this.messageLabel.y = 12 * 2;
         this.messageLabel.width = this.var_1739 - 12 * 4;
         var _loc8_:String = String(name_1586(param2[0]).resource) + "_m0_preview";
         var _loc9_:BitmapData = null;
         this.name_1029 = new Point(this.var_1739,this.messageLabel.height + this.const_1677.y + 12 * 3 + 9 * 3);
         this.window = new name_1922(this.name_1029.x,this.name_1029.y);
         addChild(this.window);
         this.window.name_2241 = name_102(Main.osgi.name_6(name_102)).getText(TextConst.GUI_LANG);
         this.window.header = name_2296.CONGRATULATIONS;
         this.var_1182 = new name_1891(0,0,name_1891.name_1428);
         addChild(this.var_1182);
         this.var_1182.x = 12;
         this.var_1182.y = 12;
         this.var_1182.width = this.name_1029.x - 12 * 2;
         this.var_1182.height = this.name_1029.y - 12 - 9 * 2 - this.const_1677.y + 2;
         addChild(this.messageLabel);
         addChild(this.var_2557);
         var _loc10_:int = 0;
         while(_loc10_ < param2.length)
         {
            _loc4_ = new GarageItemBackground(GarageItemBackground.ENGINE_NORMAL);
            this.var_2557.addChild(_loc4_);
            _loc8_ = String(name_1586(param2[_loc10_]).resource) + "_m0_preview";
            _loc9_ = null;
            _loc11_ = new Bitmap(_loc9_);
            this.var_2557.addChild(_loc11_);
            _loc4_.x = (!_loc6_ && _loc10_ > param2.length - _loc7_ ? _loc4_.width + 8 >> 1 : 0) + int(_loc10_ % _loc7_) * (_loc4_.width + 8);
            _loc4_.y = (_loc4_.height + 8) * int(_loc10_ / _loc7_);
            _loc11_.x = _loc4_.x + (_loc4_.width - _loc11_.width >> 1);
            _loc11_.y = _loc4_.y + (_loc4_.height - _loc11_.height >> 1);
            _loc12_ = new Label();
            this.var_2557.addChild(_loc12_);
            _loc12_.size = 16;
            _loc12_.color = 5898034;
            _loc12_.text = "×" + name_1586(param2[_loc10_]).count.toString();
            _loc12_.x = _loc4_.x + _loc4_.width - _loc12_.width - 15;
            _loc12_.y = _loc4_.y + _loc4_.height - _loc12_.height - 10;
            _loc10_++;
         }
         this.name_1029.y += this.var_2557.height;
         this.name_983 = new DefaultButton();
         addChild(this.name_983);
         this.name_983.label = name_102(Main.osgi.name_6(name_102)).getText(TextConst.FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT);
         this.name_983.y = this.name_1029.y - 9 - this.const_1677.y - 2;
         this.method_2533();
         addChild(this.var_1819);
         this.window.height = this.name_1029.y;
         this.window.width = this.name_1029.x;
         if(param3 != null)
         {
            this.var_2559 = param3;
            _loc13_ = Main.osgi.name_6(name_32) as name_32;
            _loc14_ = (_loc13_.getModelsByInterface(class_130) as Vector.<name_66>)[0] as class_130;
            this.method_2534 = _loc14_.method_1366(param3);
            this.var_2558 = _loc14_.method_1365(param3);
            this.var_1819.addEventListener(MouseEvent.CLICK,this.onBannerClick);
            this.var_1819.buttonMode = true;
         }
      }
      
      private function method_2533() : void
      {
         this.messageLabel.width = this.var_1739 - 12 * 4;
         this.var_2557.y = this.messageLabel.y + this.messageLabel.height + 12;
         this.var_2557.x = this.name_1029.x - this.var_2557.width >> 1;
         this.var_1182.width = this.name_1029.x - 12 * 2;
         this.var_1182.height = this.name_1029.y - 12 - 9 * 2 - this.const_1677.y + 2;
         this.name_983.x = this.name_1029.x - this.const_1677.x >> 1;
      }
      
      public function set method_2534(param1:BitmapData) : void
      {
         this.var_2556.bitmapData = param1;
         this.name_1029.y = this.name_1029.y + this.var_2556.height + 9 - 1;
         this.var_1739 = this.name_1029.x = Math.max(this.name_1029.x,this.var_2556.width + 12 * 2 + 9 * 2);
         this.window.height = this.name_1029.y;
         this.window.width = this.name_1029.x;
         this.method_2533();
         this.var_2556.x = this.var_1739 - this.var_2556.width >> 1;
         this.var_2556.y = this.var_1182.y + this.var_1182.height - 9 - this.var_2556.height - 1;
         this.name_983.y = this.name_1029.y - 9 - this.const_1677.y - 2;
      }
      
      public function get var_1817() : Bitmap
      {
         return this.var_2556;
      }
      
      private function method_2536(param1:MouseEvent) : void
      {
         Mouse.cursor = MouseCursor.HAND;
      }
      
      private function method_2535(param1:MouseEvent) : void
      {
         Mouse.cursor = MouseCursor.ARROW;
      }
      
      private function onBannerClick(param1:MouseEvent) : void
      {
         Main.method_8("BannerModel","onBannerClick");
         navigateToURL(new URLRequest(this.var_2558),"_blank");
         var _loc2_:name_32 = Main.osgi.name_6(name_32) as name_32;
         var _loc3_:class_130 = (_loc2_.getModelsByInterface(class_130) as Vector.<name_66>)[0] as class_130;
         _loc3_.method_1367(this.var_2559);
      }
   }
}
