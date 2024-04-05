package package_459
{
   import controls.Label;
   import controls.TankInput;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.filters.BlurFilter;
   import flash.filters.DropShadowFilter;
   import package_1.Main;
   import package_54.name_102;
   import package_60.TextConst;
   
   public class name_3000 extends Sprite
   {
       
      
      private var var_3517:Bitmap;
      
      private var var_3516:Bitmap;
      
      public var name_3067:CaptchaRefreshButton;
      
      private var label:Label;
      
      public var input:TankInput;
      
      private var var_218:int = 10;
      
      private var localeService:name_102;
      
      public function name_3000()
      {
         super();
         this.localeService = name_102(Main.osgi.name_6(name_102));
         this.input = new TankInput();
         this.input.tabIndex = 5;
         this.input.restrict = ".0-9a-zA-z_\\-";
         addChild(this.input);
         this.label = new Label();
         this.label.multiline = true;
         this.label.wordWrap = true;
         this.label.text = this.localeService.getText(TextConst.CHECK_PASSWORD_FORM_CAPTCHA);
         this.label.y = -8;
         addChild(this.label);
         this.var_3516 = new Bitmap(new BitmapData(285,50,true,0));
         this.var_3516.filters = [new BlurFilter(2,2),new DropShadowFilter(0,45,0,1,4,4,2)];
         addChild(this.var_3516);
         this.name_3067 = new CaptchaRefreshButton();
         this.name_3067.useHandCursor = true;
         this.name_3067.buttonMode = true;
         addChild(this.name_3067);
         if(stage != null)
         {
            stage.focus = this.input.textField;
         }
         this.width = 275;
      }
      
      override public function get height() : Number
      {
         return this.input.y + this.input.height;
      }
      
      override public function set width(param1:Number) : void
      {
         this.label.width = param1 - this.label.x;
         this.var_3516.width = param1;
         this.input.width = param1 - 4;
         this.name_3067.x = this.var_3516.x + this.var_3516.width - this.name_3067.width - 11;
         this.var_3516.y = this.label.y + this.label.height + this.var_218;
         this.input.y = this.var_3516.y + this.var_3516.height + this.var_218;
         this.name_3067.y = this.var_3516.y + this.var_218 + 5;
      }
      
      public function method_3158(param1:Number) : void
      {
         this.label.y += param1;
         this.input.y += param1;
         this.name_3067.y += param1;
         this.var_3516.y += param1;
      }
      
      public function method_2792(param1:Bitmap) : void
      {
         this.var_3517 = param1;
         this.var_3516.bitmapData = this.var_3517.bitmapData;
         this.input.value = "";
      }
      
      public function setEnabled(param1:Boolean) : void
      {
         this.input.visible = param1;
         this.name_3067.doubleClickEnabled = param1;
         this.name_3067.mouseEnabled = param1;
      }
   }
}
