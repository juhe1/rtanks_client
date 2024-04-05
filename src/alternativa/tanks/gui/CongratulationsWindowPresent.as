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
   import flash.geom.Point;
   import flash.text.TextFormatAlign;
   import package_1.Main;
   import package_4.ClientObject;
   import package_54.name_102;
   import package_60.TextConst;
   import package_60.name_1822;
   
   public class CongratulationsWindowPresent extends Sprite
   {
      
      private static var var_2561:BitmapData;
      
      private static const const_2050:Class = name_2739;
      
      private static const const_2049:BitmapData = new const_2050().bitmapData;
      
      private static const const_2051:Class = name_2740;
      
      private static const const_2052:BitmapData = new const_2051().bitmapData;
      
      public static const CRYSTALS:int = 0;
      
      public static const name_1849:int = 1;
      
      public static const name_1850:int = 2;
       
      
      private var window:name_1922;
      
      private var var_1182:name_1891;
      
      private var var_2553:Label;
      
      private var var_2554:Label;
      
      private var var_2560:Bitmap;
      
      public var name_983:DefaultButton;
      
      private var var_2559:ClientObject;
      
      private var var_1819:Sprite;
      
      private var var_2556:Bitmap;
      
      private var var_2558:String;
      
      private var var_1739:int = 450;
      
      private const const_1692:int = 12;
      
      private const var_1750:int = 9;
      
      private const const_1677:Point = new Point(104,33);
      
      private const space:int = 8;
      
      public function CongratulationsWindowPresent(param1:int, param2:ClientObject, param3:int = 0)
      {
         var _loc5_:String = null;
         var _loc6_:String = null;
         super();
         var _loc4_:name_102 = name_102(Main.osgi.name_6(name_102));
         this.var_1819 = new Sprite();
         this.var_2556 = new Bitmap();
         this.var_1819.addChild(this.var_2556);
         if(param1 == 0)
         {
            this.var_2560 = new Bitmap(const_2049);
            _loc5_ = String(name_102(Main.osgi.name_6(name_102)).getText(TextConst.const_278));
            _loc6_ = TextConst.method_687(name_102(Main.osgi.name_6(name_102)).getText(TextConst.const_168),param3);
         }
         else if(param1 == 1)
         {
            this.var_2560 = new Bitmap(name_102(Main.osgi.name_6(name_102)).getImage(name_1822.const_1512));
            _loc5_ = String(name_102(Main.osgi.name_6(name_102)).getText(TextConst.const_278));
            _loc6_ = String(name_102(Main.osgi.name_6(name_102)).getText(TextConst.const_273));
         }
         else
         {
            this.var_2560 = new Bitmap(const_2052);
            _loc5_ = "";
            _loc6_ = String(name_102(Main.osgi.name_6(name_102)).getText(TextConst.const_206));
         }
         if(param1 == 0 || param1 == 1)
         {
            this.var_1739 = this.var_2560.width + 12 * 2 + 9 * 2;
            this.window = new name_1922(this.var_1739,this.var_2560.height);
            addChild(this.window);
            this.window.name_2241 = name_102(Main.osgi.name_6(name_102)).getText(TextConst.GUI_LANG);
            this.window.header = name_2296.CONGRATULATIONS;
            this.var_1182 = new name_1891(0,0,name_1891.name_1428);
            addChild(this.var_1182);
            this.var_1182.x = 12;
            this.var_1182.y = 12;
            this.var_2553 = new Label();
            this.var_2553.align = TextFormatAlign.CENTER;
            this.var_2553.wordWrap = true;
            this.var_2553.multiline = true;
            this.var_2553.size = 12;
            this.var_2553.text = _loc5_;
            this.var_2553.color = 5898034;
            this.var_2553.x = 12 * 2;
            this.var_2553.y = 12 * 2;
            this.var_2553.width = this.var_1739 - 12 * 4;
            addChild(this.var_2553);
            this.var_2560.x = 9 + 12;
            this.var_2560.y = this.var_2553.y + this.var_2553.height - 20;
            addChild(this.var_2560);
            this.var_2554 = new Label();
            this.var_2554.align = TextFormatAlign.CENTER;
            this.var_2554.wordWrap = true;
            this.var_2554.multiline = true;
            this.var_2554.size = 12;
            this.var_2554.color = 5898034;
            this.var_2554.htmlText = _loc6_;
            this.var_2554.x = 12 * 2;
            this.var_2554.y = this.var_2560.y + this.var_2560.height - 20;
            this.var_2554.width = this.var_1739 - 12 * 4;
            addChild(this.var_2554);
            this.name_983 = new DefaultButton();
            addChild(this.name_983);
            this.name_983.label = name_102(Main.osgi.name_6(name_102)).getText(TextConst.FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT);
            this.window.height = this.var_2554.y + this.var_2554.height + this.name_983.height + 9 * 3;
            this.name_983.y = this.window.height - 9 - 35;
            this.name_983.x = this.window.width - this.name_983.width >> 1;
            this.var_1182.width = this.window.width - 12 * 2;
            this.var_1182.height = this.window.height - 12 - 9 * 2 - this.const_1677.y + 2;
         }
         else
         {
            this.var_1739 = this.var_2560.width * 2 - 12 * 2 + 5;
            this.window = new name_1922(this.var_1739,this.var_2560.height);
            addChild(this.window);
            this.window.name_2241 = name_102(Main.osgi.name_6(name_102)).getText(TextConst.GUI_LANG);
            this.window.header = name_2296.CONGRATULATIONS;
            this.var_1182 = new name_1891(0,0,name_1891.name_1428);
            addChild(this.var_1182);
            this.var_1182.x = 12;
            this.var_1182.y = 12;
            this.var_2553 = new Label();
            this.var_2553.align = TextFormatAlign.LEFT;
            this.var_2553.wordWrap = true;
            this.var_2553.multiline = true;
            this.var_2553.size = 12;
            this.var_2553.text = _loc5_;
            this.var_2553.color = 5898034;
            this.var_2553.x = 12 * 2;
            this.var_2553.y = 12 * 2;
            this.var_2553.width = this.var_1739 - 12 * 4;
            addChild(this.var_2553);
            this.var_2554 = new Label();
            this.var_2554.align = TextFormatAlign.LEFT;
            this.var_2554.wordWrap = true;
            this.var_2554.multiline = true;
            this.var_2554.size = 12;
            this.var_2554.color = 5898034;
            this.var_2554.htmlText = _loc6_;
            this.var_2554.x = 12 * 2;
            this.var_2554.y = this.var_2553.y + this.var_2553.height - 7;
            this.var_2554.width = this.var_1739 - 12 * 4;
            addChild(this.var_2554);
            this.var_2560.x = this.var_2560.width / 2 + this.var_1182.width / 2 - 25;
            this.var_2560.y = this.var_2554.y + this.var_2554.height + 10;
            addChild(this.var_2560);
            this.name_983 = new DefaultButton();
            addChild(this.name_983);
            this.name_983.label = name_102(Main.osgi.name_6(name_102)).getText(TextConst.FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT);
            this.window.height = this.var_2560.y + this.var_2554.height + this.name_983.height + 9 * 3;
            this.name_983.y = this.window.height - 9 - 35;
            this.name_983.x = this.window.width - this.name_983.width >> 1;
            this.var_1182.width = this.window.width - 12 * 2;
            this.var_1182.height = this.window.height - 12 - 9 * 2 - this.const_1677.y + 2;
         }
      }
   }
}
