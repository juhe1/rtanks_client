package alternativa.tanks.gui
{
   import controls.DefaultButton;
   import controls.Label;
   import controls.name_1891;
   import controls.name_1922;
   import controls.name_2296;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.text.TextFormatAlign;
   import package_1.Main;
   import package_54.name_102;
   import package_60.TextConst;
   
   public class AchievementCongratulationsWindow extends Sprite
   {
      
      private static const const_1819:Class = name_2670;
      
      private static var bitmapData:BitmapData = new const_1819().bitmapData;
       
      
      private var window:name_1922;
      
      private var var_1182:name_1891;
      
      private var message:Label;
      
      private var present:Bitmap;
      
      public var name_1021:DefaultButton;
      
      public function AchievementCongratulationsWindow()
      {
         super();
      }
      
      public function init(param1:String) : void
      {
         this.present = new Bitmap(bitmapData);
         this.window = new name_1922(Math.max(this.present.width + 12 * 2 + 9 * 2,300));
         this.window.name_2241 = name_102(Main.osgi.name_6(name_102)).getText(TextConst.GUI_LANG);
         this.window.header = name_2296.CONGRATULATIONS;
         addChild(this.window);
         this.var_1182 = new name_1891(0,0,name_1891.name_1428);
         addChild(this.var_1182);
         this.var_1182.x = 12;
         this.var_1182.y = 12;
         this.message = new Label();
         this.message.align = TextFormatAlign.CENTER;
         this.message.wordWrap = true;
         this.message.multiline = true;
         this.message.size = 12;
         this.message.htmlText = param1;
         this.message.color = 5898034;
         this.message.x = 12 * 2;
         this.message.y = 12 * 2;
         this.message.width = this.window.width - 12 * 4;
         addChild(this.message);
         if(this.message.numLines > 2)
         {
            this.message.align = TextFormatAlign.LEFT;
            this.message.htmlText = param1;
            this.message.width = this.window.width - 12 * 4;
         }
         this.present.x = this.window.width - this.present.width >> 1;
         this.present.y = this.message.y + this.message.height + 9;
         addChild(this.present);
         this.name_1021 = new DefaultButton();
         this.name_1021.label = name_102(Main.osgi.name_6(name_102)).getText(TextConst.FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT);
         addChild(this.name_1021);
         var _loc2_:int = this.present.height + this.name_1021.height + 9 * 2 + 12 * 3;
         _loc2_ += this.message.height + 9;
         this.window.height = _loc2_;
         this.name_1021.y = this.window.height - 9 - 35;
         this.name_1021.x = this.window.width - this.name_1021.width >> 1;
         this.var_1182.width = this.window.width - 12 * 2;
         this.var_1182.height = this.window.height - 12 - 9 * 2 - 33 + 2;
      }
   }
}
