package package_281
{
   import controls.BlueButton;
   import controls.RedButton;
   import controls.base.name_2016;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.filters.BitmapFilter;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.BlurFilter;
   import forms.TankWindowWithHeader;
   import package_1.Main;
   import package_54.name_102;
   import package_60.TextConst;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_1017 extends Sprite
   {
       
      
      private var window:TankWindowWithHeader;
      
      private var var_1779:name_2016;
      
      private var var_1778:name_2016;
      
      private var var_1500:name_2016;
      
      private var var_1781:BlueButton;
      
      private var var_1780:RedButton;
      
      private var bg:Sprite;
      
      private var var_1747:Bitmap;
      
      private var callback:Function;
      
      private var email:String;
      
      private var localeService:name_102;
      
      public function name_1017(param1:Function, param2:String)
      {
         this.var_1779 = new name_2016();
         this.var_1778 = new name_2016();
         this.var_1500 = new name_2016();
         this.var_1781 = new BlueButton();
         this.var_1780 = new RedButton();
         this.bg = new Sprite();
         this.var_1747 = new Bitmap();
         super();
         this.callback = param1;
         this.email = param2;
         this.localeService = Main.osgi.getService(name_102) as name_102;
         this.window = TankWindowWithHeader.createWindow(this.localeService.getText(name_390.const_950));
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function draw() : void
      {
         addChild(this.bg);
         this.drawBg();
         addChild(this.window);
         this.window.width = 435;
         this.window.height = 169 - 11;
         this.window.addChild(this.var_1779);
         this.var_1779.x = 35 + 77;
         this.var_1779.y = 20;
         this.var_1779.width = 120;
         this.var_1779.label = this.localeService.getText(TextConst.const_176);
         this.window.addChild(this.var_1778);
         this.var_1778.x = this.var_1779.x + this.var_1779.width - 30;
         this.var_1778.y = 20;
         this.var_1778.width = 120;
         this.var_1778.label = this.localeService.getText(TextConst.REGISTER_FORM_REPEAT_PASSWORD_INPUT_LABEL_TEXT);
         this.window.addChild(this.var_1500);
         this.var_1500.x = 63;
         this.var_1500.y = this.var_1778.y + this.var_1500.height + 11;
         this.var_1500.width = 352;
         this.var_1500.label = this.localeService.getText(TextConst.const_358);
         this.var_1500.value = this.email;
         this.window.addChild(this.var_1781);
         this.var_1781.x = this.window.width - this.var_1781.width - 20;
         this.var_1781.y = this.window.height - this.var_1781.height - 24;
         this.var_1781.label = this.localeService.getText(TextConst.const_254);
         this.window.addChild(this.var_1780);
         this.var_1780.x = this.window.width - this.var_1780.width * 2 - 34;
         this.var_1780.y = this.window.height - this.var_1780.height - 24;
         this.var_1780.label = this.localeService.getText(TextConst.const_277);
         this.var_1780.addEventListener(MouseEvent.CLICK,this.close);
         this.var_1781.addEventListener(MouseEvent.CLICK,this.method_1959);
         this.var_1778.addEventListener(FocusEvent.FOCUS_OUT,this.method_1958);
      }
      
      private function method_1959(param1:Event) : void
      {
         this.callback.call(null,this.var_1778.value,this.var_1500.value);
         this.close(null);
      }
      
      private function method_1958(param1:FocusEvent) : void
      {
         if(this.var_1778.value == null || this.var_1778.value == "")
         {
            return;
         }
         if(this.var_1778.value != this.var_1779.value)
         {
            this.var_1778.validValue = false;
         }
         else
         {
            this.var_1778.validValue = true;
         }
      }
      
      private function close(param1:Event) : void
      {
         this.var_1780.removeEventListener(MouseEvent.CLICK,this.close);
         this.var_1778.removeEventListener(FocusEvent.FOCUS_OUT,this.method_1958);
         stage.removeEventListener(Event.RESIZE,this.resize);
         removeChildren(0,numChildren - 1);
      }
      
      private function drawBg() : void
      {
         var _loc1_:BitmapData = null;
         var _loc2_:BitmapFilter = new BlurFilter(5,5,BitmapFilterQuality.HIGH);
         var _loc3_:Array = new Array();
         _loc3_.push(_loc2_);
         _loc1_ = new BitmapData(stage.stageWidth,stage.stageHeight,true,0);
         this.var_1747.visible = false;
         _loc1_.draw(stage);
         this.var_1747.visible = true;
         this.var_1747.filters = _loc3_;
         this.var_1747.bitmapData = _loc1_;
         this.bg.addChild(this.var_1747);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         this.draw();
         stage.addEventListener(Event.RESIZE,this.resize);
         this.resize(null);
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function resize(param1:Event) : void
      {
         this.window.x = stage.stageWidth / 2 - this.window.width / 2;
         this.window.y = stage.stageHeight / 2 - this.window.height / 2;
         this.drawBg();
      }
   }
}
