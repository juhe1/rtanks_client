package package_111
{
   import controls.DefaultButton;
   import controls.name_1891;
   import controls.name_1922;
   import controls.name_2296;
   import flash.display.Sprite;
   import package_1.Main;
   import package_54.name_102;
   import package_60.TextConst;
   
   public class name_1662 extends Sprite
   {
      
      public static const const_1994:int = 400;
       
      
      private var window:name_1922;
      
      private var var_1182:name_1891;
      
      private var items:name_2671;
      
      public var name_1021:DefaultButton;
      
      private var var_2416:int;
      
      public function name_1662()
      {
         this.window = new name_1922();
         this.var_1182 = new name_1891(0,0,name_1891.name_1428);
         this.items = new name_2671();
         this.name_1021 = new DefaultButton();
         super();
         this.x = 100;
         this.y = 100;
         this.window.width = 500;
         this.window.height = 250;
         this.window.name_2241 = name_102(Main.osgi.name_6(name_102)).language;
         this.window.header = name_2296.name_2672;
         addChild(this.window);
         this.var_1182.x = 10;
         this.var_1182.y = 10;
         this.var_1182.width = this.window.width - 20;
         this.var_1182.height = this.window.height - 60;
         this.window.addChild(this.var_1182);
         addChild(this.items);
         this.items.move(15,30);
         addChild(this.name_1021);
         this.name_1021.label = name_102(Main.osgi.name_6(name_102)).getText(TextConst.FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT);
         this.name_1021.y = this.window.height + 106;
         this.name_1021.x = this.window.width - this.name_1021.width >> 1;
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
            this.var_2416 += _loc3_.method_2416;
         }
         this.method_1791();
      }
      
      public function method_2417() : Number
      {
         return this.window.height;
      }
      
      private function method_1791() : void
      {
         this.window.height = Math.min(this.var_2416 + 130,400);
         this.var_1182.height = Math.min(this.window.height - 60,400);
         this.items.height = Math.min(this.window.height - 100,400);
         this.name_1021.y = this.window.height - 44;
      }
   }
}
