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
   import package_54.name_102;
   import package_60.TextConst;
   
   public class EntranceAlertWindow extends Sprite
   {
      
      private static const const_2045:Class = name_2737;
      
      private static const const_2047:Class = name_2736;
      
      private static const const_2048:BitmapData = new const_2045().bitmapData;
      
      private static const const_2046:BitmapData = new const_2047().bitmapData;
      
      public static const CRYSTALS:int = 0;
      
      public static const name_1849:int = 1;
       
      
      private var window:name_1922;
      
      private var var_1182:name_1891;
      
      private var var_2553:Label;
      
      private var var_2554:Label;
      
      private var var_2555:Bitmap;
      
      public var name_983:DefaultButton;
      
      private var var_1739:int = 430;
      
      private const const_1692:int = 12;
      
      private const var_1750:int = 9;
      
      private const const_1677:Point = new Point(104,33);
      
      private const space:int = 8;
      
      public function EntranceAlertWindow()
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         super();
         var _loc1_:name_102 = name_102(Main.osgi.name_6(name_102));
         this.var_2555 = name_102(Main.osgi.name_6(name_102)).language == "RU" ? new Bitmap(const_2046) : new Bitmap(const_2048);
         _loc2_ = name_102(Main.osgi.name_6(name_102)).language == "RU" ? "Поздравляем с Днём Танкиста!" : "Dear tankmen!";
         _loc3_ = name_102(Main.osgi.name_6(name_102)).language == "RU" ? "12 сентября в России и странах СНГ отмечается профессиональный праздник танкистов и танкостроителей. Администрация «Танков Онлайн» желает вам удачи в виртуальных боях и дарит скидку 25% на все товары в «Гараже». Внимание, скидка действует только до 05:00 понедельника, 13 сентября (время московское)." : "On the 12th of September a professional holiday of tankmen and tank constructors is celebrated in Russia. Administration of Tanki Online wishes you good luck in virtual fights and presents 25% discount on all goods in the Garage. Attention, discount lasts only till 05:00 of Monday, September 13th (UTC +4).";
         this.window = new name_1922(this.var_1739,this.var_2555.height);
         addChild(this.window);
         this.window.header = name_2296.ACCOUNT;
         this.var_1182 = new name_1891(0,0,name_1891.name_1428);
         addChild(this.var_1182);
         this.var_1182.x = 12;
         this.var_1182.y = 12;
         this.var_2555.x = (this.var_1739 - this.var_2555.width) / 2;
         this.var_2555.y = 12 * 2;
         addChild(this.var_2555);
         this.var_2553 = new Label();
         this.var_2553.align = TextFormatAlign.CENTER;
         this.var_2553.wordWrap = true;
         this.var_2553.multiline = true;
         this.var_2553.size = 18;
         this.var_2553.bold = true;
         this.var_2553.text = _loc2_;
         this.var_2553.color = 5898034;
         this.var_2553.x = 12 * 2;
         this.var_2553.y = this.var_2555.y + this.var_2555.height - 10;
         this.var_2553.width = this.var_1739 - 12 * 4;
         addChild(this.var_2553);
         this.var_2554 = new Label();
         this.var_2554.align = TextFormatAlign.LEFT;
         this.var_2554.wordWrap = true;
         this.var_2554.multiline = true;
         this.var_2554.size = 12;
         this.var_2554.color = 5898034;
         this.var_2554.htmlText = _loc3_;
         this.var_2554.x = 12 * 2;
         this.var_2554.y = this.var_2553.y + this.var_2553.height;
         this.var_2554.width = this.var_1739 - 12 * 4;
         addChild(this.var_2554);
         this.name_983 = new DefaultButton();
         addChild(this.name_983);
         this.name_983.label = name_102(Main.osgi.name_6(name_102)).getText(TextConst.FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT);
         this.window.height = this.var_2554.y + this.var_2554.height + this.name_983.height + 9 * 3 + 10;
         this.name_983.y = this.window.height - 9 - 35;
         this.name_983.x = this.window.width - this.name_983.width >> 1;
         this.var_1182.width = this.window.width - 12 * 2;
         this.var_1182.height = this.window.height - 12 - 9 * 2 - this.const_1677.y + 2;
      }
   }
}
