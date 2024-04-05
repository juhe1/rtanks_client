package alternativa.tanks.gui
{
   import assets.icons.IconGarageMod;
   import assets.icons.InputCheckIcon;
   import assets.name_2295;
   import controls.DefaultButton;
   import controls.Label;
   import controls.name_1891;
   import controls.name_1922;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.geom.Point;
   import forms.RegisterForm;
   import package_1.Main;
   import package_54.name_102;
   import package_60.TextConst;
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class name_1545 extends Sprite
   {
       
      
      private var localeService:name_102;
      
      private var window:name_1922;
      
      private var var_2360:IconGarageMod;
      
      private var preview:Bitmap;
      
      private var var_2356:name_1891;
      
      private var var_2358:Label;
      
      private var var_2359:Label;
      
      private var var_1325:Label;
      
      private var var_1841:name_2295;
      
      public var name_1568:DefaultButton;
      
      public var name_1573:DefaultButton;
      
      private var var_1739:int;
      
      private var var_1738:int;
      
      private const const_1692:int = 11;
      
      private const const_1944:int = 7;
      
      private const const_1943:Point = new Point(164,106);
      
      private const const_1677:Point = new Point(104,33);
      
      private var var_2357:InputCheckIcon;
      
      public function name_1545(param1:String, param2:int, param3:ImageResource, param4:Boolean, param5:int, param6:String, param7:int = -1)
      {
         this.var_2357 = new InputCheckIcon();
         super();
         this.localeService = name_102(Main.osgi.name_6(name_102));
         this.var_1739 = Math.max(this.const_1677.x * 2 + 11 * 2 + 7,this.const_1943.x + 11 * 4);
         this.window = new name_1922(this.var_1739,0);
         addChild(this.window);
         this.var_2356 = new name_1891(0,0,name_1891.name_1428);
         this.var_2356.x = 11;
         this.var_2356.y = 11;
         this.var_2356.width = this.var_1739 - 11 * 2;
         this.var_2356.height = this.const_1943.y + 11 * 2;
         addChild(this.var_2356);
         if(param3 == null)
         {
            this.var_2357.gotoAndStop(RegisterForm.name_2443);
            this.var_2357.x = this.var_2356.width / 2;
            this.var_2357.y = this.var_2356.height / 2;
            addChild(this.var_2357);
         }
         else if(param3.data == null)
         {
            this.var_2357.gotoAndStop(RegisterForm.name_2297);
            this.var_2357.x = this.var_2356.width / 2;
            this.var_2357.y = this.var_2356.height / 2;
            addChild(this.var_2357);
         }
         else
         {
            this.preview = new Bitmap(param3.data);
            addChild(this.preview);
            this.preview.x = this.var_2356.x + (this.var_2356.width - param3.data.width >> 1);
            this.preview.y = this.var_2356.y + (this.var_2356.height - param3.data.height >> 1);
         }
         if(param5 != -1)
         {
            this.var_2360 = new IconGarageMod();
            addChild(this.var_2360);
            this.var_2360.x = this.var_1739 - 11 - 7 - this.var_2360.width + 2;
            this.var_2360.y = 11 + 7 - 1;
            this.var_2360.mod = param5;
         }
         this.var_2358 = new Label();
         addChild(this.var_2358);
         this.var_2358.text = param6;
         this.var_2358.x = this.var_1739 - this.var_2358.width >> 1;
         this.var_2358.width = this.var_1739 - 11 * 2;
         this.var_2358.y = this.var_2356.y + this.const_1943.y + 11 * 2 + 7;
         this.var_1325 = new Label();
         addChild(this.var_1325);
         if(param5 > 0)
         {
            this.var_1325.text = "\"" + param1 + "\" M" + param5 + " " + this.localeService.getText(TextConst.GARAGE_CONFIRM_ALERT_COST_PREFIX);
         }
         else
         {
            this.var_1325.text = "\"" + param1 + "\" " + (param7 > 1 ? "(" + param7 + ") " : "") + this.localeService.getText(TextConst.GARAGE_CONFIRM_ALERT_COST_PREFIX);
         }
         this.var_1841 = new name_2295();
         addChild(this.var_1841);
         this.var_2359 = new Label();
         addChild(this.var_2359);
         this.var_2359.text = param2.toString();
         var _loc8_:int = this.var_1325.width + this.var_2359.width + this.var_1841.width + 2;
         var _loc9_:int = this.var_1739 - _loc8_ >> 1;
         this.var_1325.x = _loc9_;
         this.var_1325.y = this.var_2358.y + this.var_2358.height + 11;
         this.var_1841.x = this.var_1325.x + this.var_1325.width + 2;
         this.var_1841.y = this.var_1325.y + 5;
         this.var_2359.x = this.var_1841.x + this.var_1841.width;
         this.var_2359.y = this.var_1325.y;
         this.var_1738 = this.var_1325.y + this.var_1325.height + 11 * 2 + this.const_1677.y;
         this.name_1573 = new DefaultButton();
         addChild(this.name_1573);
         this.name_1573.label = this.localeService.getText(TextConst.GARAGE_CONFIRM_ALERT_CANCEL_BUTTON_TEXT);
         this.name_1573.x = this.var_1739 - this.const_1677.x - 3;
         this.name_1573.y = this.var_1738 - 11 - this.const_1677.y + 2;
         this.name_1568 = new DefaultButton();
         addChild(this.name_1568);
         this.name_1568.label = this.localeService.getText(TextConst.GARAGE_CONFIRM_ALERT_CONFIRM_BUTTON_TEXT);
         this.name_1568.x = 11;
         this.name_1568.y = this.var_1738 - 11 - this.const_1677.y + 2;
         this.window.height = this.var_1738;
      }
      
      public function name_1550(param1:BitmapData) : void
      {
         if(contains(this.var_2357))
         {
            removeChild(this.var_2357);
         }
         this.preview = new Bitmap(param1);
         addChild(this.preview);
         this.preview.x = this.var_2356.x + (this.var_2356.width - param1.width >> 1);
         this.preview.y = this.var_2356.y + (this.var_2356.height - param1.height >> 1);
      }
   }
}
