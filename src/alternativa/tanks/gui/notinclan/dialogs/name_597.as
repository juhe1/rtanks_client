package alternativa.tanks.gui.notinclan.dialogs
{
   import alternativa.tanks.models.user.name_65;
   import controls.base.LabelBase;
   import controls.base.name_1890;
   import controls.windowinner.WindowInner;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.text.TextFormatAlign;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_597 extends name_573
   {
      
      public static var clanUserService:name_65;
      
      public static var localeService:name_102;
      
      public static const WIDTH:Number = 550;
      
      public static const const_1532:Number = 320;
       
      
      private var var_1323:Class;
      
      private var var_1321:Bitmap;
      
      private var var_643:name_1890;
      
      private var var_1251:WindowInner;
      
      private var var_1327:LabelBase;
      
      public function name_597()
      {
         this.var_1323 = name_2028;
         this.var_1321 = new this.var_1323() as Bitmap;
         super();
         this.var_643 = new name_1890();
         this.var_643.name_1342(localeService.getText(name_390.const_733));
         this.var_1327 = new LabelBase();
         this.var_1327.wordWrap = true;
         this.var_1327.align = TextFormatAlign.CENTER;
         this.var_1327.text = localeService.getText(name_390.const_1425);
         this.var_643.x = 550 - this.var_643.width >> 1;
         this.var_643.y = 320 - this.var_643.height - 11;
         this.var_1251 = new WindowInner(0,0,WindowInner.name_1428);
         this.var_1251.x = 11;
         this.var_1251.y = 11;
         this.var_1251.width = 550 - 2 * 11;
         this.var_1251.height = 320 - this.var_643.height - 7 - 2 * 11;
         this.var_1321.x = 7;
         this.var_1321.y = 7;
         this.var_1321.width = this.var_1251.width - 2 * 7;
         this.var_1321.height = this.var_1321.bitmapData.height * this.var_1321.width / this.var_1321.bitmapData.width;
         this.var_1327.x = 7;
         this.var_1327.y = this.var_1321.y + this.var_1321.height + 7;
         this.var_1327.width = 550 - 2 * 11;
         this.var_1327.height = this.var_1251.height - this.var_1321.height - 3 * 7;
         window.addChild(this.var_643);
         window.addChild(this.var_1251);
         this.var_1251.addChild(this.var_1321);
         this.var_1251.addChild(this.var_1327);
         this.var_643.addEventListener(MouseEvent.CLICK,this.method_1553);
         this.var_643.enabled = clanUserService.showBuyLicenseButton;
      }
      
      protected function method_1553(param1:MouseEvent) : void
      {
         method_1475(param1);
         trace("openPaymentForGarageItem(clanUserService.licenseGarageObject)");
      }
      
      override public function get height() : Number
      {
         return 320;
      }
      
      override public function get width() : Number
      {
         return 550;
      }
      
      override protected function method_1477() : String
      {
         return localeService.getText(name_390.const_701);
      }
   }
}
