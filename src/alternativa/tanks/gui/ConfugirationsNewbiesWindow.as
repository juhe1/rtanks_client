package alternativa.tanks.gui
{
   import controls.DefaultButton;
   import controls.Label;
   import controls.TankWindowInner;
   import controls.name_1922;
   import controls.name_2296;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.text.TextFormatAlign;
   import package_1.Main;
   import package_54.name_102;
   import package_60.TextConst;
   
   public class ConfugirationsNewbiesWindow extends Sprite
   {
      
      private static const b:Class = name_2738;
      
      private static var bitmap:BitmapData = new b().bitmapData;
       
      
      private var window:name_1922;
      
      private var var_1182:TankWindowInner;
      
      private var message:Label;
      
      private var var_2560:Bitmap;
      
      public var name_983:DefaultButton;
      
      public function ConfugirationsNewbiesWindow(param1:String)
      {
         super();
         this.window = new name_1922(290,315);
         addChild(this.window);
         this.window.name_2241 = name_102(Main.osgi.getService(name_102)).getText(TextConst.GUI_LANG);
         this.window.header = name_2296.CONGRATULATIONS;
         this.var_1182 = new TankWindowInner(290 - 12 * 2,315 - 12 - 50,TankWindowInner.GREEN);
         addChild(this.var_1182);
         this.var_1182.x = 12;
         this.var_1182.y = 12;
         this.message = new Label();
         this.message.align = TextFormatAlign.LEFT;
         this.message.wordWrap = true;
         this.message.multiline = true;
         this.message.size = 12;
         this.message.text = name_102(Main.osgi.getService(name_102)).getText(param1);
         this.message.color = 5898034;
         this.message.x = 12 * 2;
         this.message.y = 12 * 2;
         this.message.width = 290 - 12 * 4;
         addChild(this.message);
         this.name_983 = new DefaultButton();
         addChild(this.name_983);
         this.name_983.label = name_102(Main.osgi.getService(name_102)).getText(TextConst.FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT);
         this.name_983.y = this.window.height - 35 - 8;
         this.name_983.x = this.window.width - this.name_983.width >> 1;
         var _loc2_:Bitmap = new Bitmap(bitmap);
         _loc2_.x = this.window.width - _loc2_.width >> 1;
         _loc2_.y = this.window.height - 160;
         addChild(_loc2_);
      }
   }
}
