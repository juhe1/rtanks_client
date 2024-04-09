package package_111
{
   import controls.DefaultButton;
   import controls.TankWindowInner;
   import controls.name_1922;
   import controls.name_2296;
   import flash.display.Sprite;
   import package_1.Main;
   import package_54.name_102;
   import package_60.TextConst;
   
   public class NewsWindow extends Sprite
   {
      
      public static const MAX_HEIGHT:int = 400;
       
      
      private var window:name_1922;
      
      private var inner:TankWindowInner;
      
      private var items:NewsOutput;
      
      public var closeBtn:DefaultButton;
      
      private var itemsSpriteHeight:int;
      
      public function NewsWindow()
      {
         this.window = new name_1922();
         this.inner = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.items = new NewsOutput();
         this.closeBtn = new DefaultButton();
         super();
         this.x = 100;
         this.y = 100;
         this.window.width = 500;
         this.window.height = 250;
         this.window.name_2241 = name_102(Main.osgi.getService(name_102)).language;
         this.window.header = name_2296.name_2672;
         addChild(this.window);
         this.inner.x = 10;
         this.inner.y = 10;
         this.inner.width = this.window.width - 20;
         this.inner.height = this.window.height - 60;
         this.window.addChild(this.inner);
         addChild(this.items);
         this.items.move(15,30);
         addChild(this.closeBtn);
         this.closeBtn.label = name_102(Main.osgi.getService(name_102)).getText(TextConst.FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT);
         this.closeBtn.y = this.window.height + 106;
         this.closeBtn.x = this.window.width - this.closeBtn.width >> 1;
      }
      
      public function method_2418(param1:Array) : void
      {
         var _loc2_:NewsItem = null;
         var _loc3_:NewsItem = null;
         for each(_loc3_ in param1)
         {
            if(_loc2_ == null)
            {
               this.items.addItem(_loc3_);
               _loc2_ = _loc3_;
            }
            else
            {
               _loc3_.y = _loc2_.y + _loc2_.height + 10;
               this.items.addItem(_loc3_);
               _loc2_ = _loc3_;
            }
            this.itemsSpriteHeight += _loc3_.method_2416;
         }
         this.method_1791();
      }
      
      public function method_2417() : Number
      {
         return this.window.height;
      }
      
      private function method_1791() : void
      {
         this.window.height = Math.min(this.itemsSpriteHeight + 130,400);
         this.inner.height = Math.min(this.window.height - 60,400);
         this.items.height = Math.min(this.window.height - 100,400);
         this.closeBtn.y = this.window.height - 44;
      }
   }
}
