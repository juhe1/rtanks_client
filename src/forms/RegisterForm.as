package forms
{
   import assets.icons.InputCheckIcon;
   import controls.DefaultButton;
   import controls.Label;
   import controls.TankInput;
   import controls.base.name_1134;
   import controls.base.name_2016;
   import controls.name_1891;
   import controls.name_1922;
   import controls.name_2021;
   import controls.name_2296;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import package_1.Main;
   import package_280.name_2014;
   import package_458.FreeUidsForm;
   import package_458.FreeUidsFormEvent;
   import package_459.name_3000;
   import package_54.name_102;
   import package_60.TextConst;
   
   public class RegisterForm extends Sprite
   {
      
      private static const background:Class = name_3001;
      
      public static const name_2298:int = 0;
      
      public static const name_2297:int = 1;
      
      public static const name_2449:int = 2;
      
      public static const name_2443:int = 3;
       
      
      public var callSign:name_2016;
      
      public var var_2985:InputCheckIcon;
      
      public var pass1:name_2016;
      
      public var pass2:name_2016;
      
      public var email:TankInput;
      
      public var var_2980:name_2021;
      
      public var var_2982:name_1134;
      
      public var name_2429:DefaultButton;
      
      public var var_2993:Label;
      
      public var var_2990:DefaultButton;
      
      private var var_2986:Sprite;
      
      private var var_883:Bitmap;
      
      public var method_1720:TankInput;
      
      public var method_1712:TankInput;
      
      public var method_2609:Label;
      
      public var name_2430:name_3000;
      
      private var bg:name_1922;
      
      private var label:Label;
      
      private var p:Number = 0.5;
      
      private var var_2991:int = 20;
      
      private var var_2989:int = 12;
      
      private var var_2988:int = 25;
      
      private var var_2981:int = 380;
      
      private const const_422:int = 20;
      
      private const name_2602:int = 25;
      
      private var var_2992:int = 250;
      
      private var var_2984:int = 80;
      
      public var var_2983:name_1134;
      
      private var var_2979:FreeUidsForm;
      
      private var var_2987:Boolean;
      
      public function RegisterForm(param1:Boolean)
      {
         var _loc2_:name_102 = null;
         var _loc3_:int = 0;
         super();
         _loc2_ = Main.osgi.name_6(name_102) as name_102;
         _loc3_ = this.var_2988;
         this.var_2986 = new Sprite();
         addChild(this.var_2986);
         this.var_2983 = new name_1134();
         this.var_2983.x = this.var_2988;
         this.var_2983.multiline = true;
         this.var_2983.wordWrap = true;
         this.var_2983.htmlText = _loc2_.getText(TextConst.const_225);
         this.var_2983.width = 330;
         this.var_2983.y = _loc3_;
         _loc3_ += this.var_2983.height - 3;
         _loc3_ += this.var_2988;
         this.bg = new name_1922(this.var_2981,param1 ? 585 : 300);
         var _loc4_:name_1891 = new name_1891(350,38);
         this.callSign = new name_2016();
         this.var_2985 = new InputCheckIcon();
         this.pass1 = new name_2016();
         this.pass2 = new name_2016();
         this.email = new TankInput();
         this.var_2980 = new name_2021();
         this.var_2982 = new name_1134();
         this.name_2429 = new DefaultButton();
         this.method_2609 = new Label();
         this.var_2979 = new FreeUidsForm();
         this.bg.addChild(this.var_2983);
         this.var_2980.checked = false;
         this.var_2982.wordWrap = true;
         this.var_2982.multiline = true;
         this.var_2982.width = 240;
         this.var_2982.htmlText = _loc2_.getText(TextConst.REGISTER_FORM_AGREEMENT_NOTE_TEXT);
         addChild(this.bg);
         this.bg.name_2241 = _loc2_.getText(TextConst.GUI_LANG);
         this.bg.header = name_2296.REGISTER;
         this.bg.addChild(this.callSign);
         this.bg.addChild(this.var_2985);
         this.bg.addChild(this.pass1);
         this.bg.addChild(this.pass2);
         this.bg.addChild(this.var_2980);
         this.bg.addChild(this.var_2982);
         this.bg.addChild(this.name_2429);
         this.bg.addChild(this.var_2979);
         this.callSign.label = _loc2_.getText(TextConst.REGISTER_FORM_CALLSIGN_INPUT_LABEL_TEXT);
         this.pass1.label = _loc2_.getText(TextConst.REGISTER_FORM_PASSWORD_INPUT_LABEL_TEXT);
         this.pass2.label = _loc2_.getText(TextConst.REGISTER_FORM_REPEAT_PASSWORD_INPUT_LABEL_TEXT);
         this.var_2984 = 25 + 5 + Math.max(this.callSign._label.width,this.pass1._label.width,this.pass2._label.width);
         this.callSign.x = this.var_2984;
         this.callSign.y = 20 + 40;
         this.callSign.width = this.var_2981 - this.var_2984 - 25;
         this.callSign.maxChars = 20;
         this.callSign.tabIndex = 0;
         this.callSign.restrict = ".0-9a-zA-z_\\-";
         this.callSign.validValue = true;
         this.var_2979.x = this.callSign.x;
         this.var_2979.y = this.callSign.y + this.callSign.height;
         this.var_2979.width = this.var_2981 - this.var_2984 - 25;
         this.var_2985.x = this.var_2981 - 20 - this.var_2985.width - 10;
         this.var_2985.y = this.callSign.y + 7;
         this.name_2432 = 0;
         this.pass1.x = this.var_2984;
         this.pass1.y = this.callSign.y + this.callSign.height + 20 - 10;
         this.pass1.width = this.var_2981 - this.var_2984 - 25;
         this.pass1.maxChars = 46;
         this.pass1.hidden = true;
         this.pass1.validValue = true;
         this.pass1.tabIndex = 1;
         this.pass2.x = this.var_2984;
         this.pass2.y = this.pass1.y + this.pass1.height + 20 - 10;
         this.pass2.width = this.var_2981 - this.var_2984 - 25;
         this.pass2.maxChars = 46;
         this.pass2.hidden = true;
         this.pass2.validValue = true;
         this.pass2.tabIndex = 2;
         this.var_2980.x = this.pass2.x;
         this.var_2980.y = this.pass2.y + this.pass2.height + 20 - 10;
         this.var_2982.x = this.var_2980.x + this.var_2980.width;
         this.var_2982.y = this.var_2980.y;
         this.name_2429.x = this.var_2981 - this.name_2429.width - 25;
         this.name_2429.y = param1 ? 535 : 315 - 60;
         this.name_2429.label = _loc2_.getText(TextConst.const_343);
         this.name_2429.enable = false;
         this.callSign.addEventListener(FocusEvent.FOCUS_OUT,this.method_2789);
         this.callSign.addEventListener(FocusEvent.FOCUS_IN,this.method_1694);
         this.callSign.textField.addEventListener(FocusEvent.FOCUS_IN,this.method_2786);
         this.var_2979.addEventListener(FreeUidsFormEvent.CLICK_ITEM,this.method_2790);
         this.var_2979.addEventListener(FreeUidsFormEvent.FOCUS_OUT,this.method_2787);
         this.email.addEventListener(FocusEvent.FOCUS_OUT,this.method_2608);
         this.email.addEventListener(FocusEvent.FOCUS_IN,this.method_1694);
         this.pass1.addEventListener(FocusEvent.FOCUS_OUT,this.method_2783);
         this.pass1.addEventListener(FocusEvent.FOCUS_IN,this.method_1694);
         this.pass2.addEventListener(FocusEvent.FOCUS_OUT,this.method_2783);
         this.pass2.addEventListener(FocusEvent.FOCUS_IN,this.method_1694);
         this.var_2980.addEventListener(MouseEvent.CLICK,this.method_2784);
         this.method_2791(new Bitmap(new background().bitmapData));
      }
      
      public function method_2791(param1:Bitmap) : void
      {
         if(this.var_2986.numChildren == 0)
         {
            this.var_883 = param1;
            this.var_2986.addChild(param1);
            this.method_2785(null);
         }
      }
      
      public function method_2785(param1:Event) : void
      {
         this.x = int((Main.stage.stageWidth - this.var_2981) / 2);
         this.y = int((Main.stage.stageHeight - this.bg.height) / 2);
         if(Boolean(this.var_883))
         {
            graphics.clear();
            graphics.beginFill(0);
            graphics.drawRect(-this.x,-this.y,Main.stage.stageWidth,Main.stage.stageHeight);
            graphics.endFill();
            this.var_883.x = int(this.var_2981 - this.var_883.width >> 1);
            this.var_883.y = -int(Main.stage.stageHeight - this.bg.height >> 1);
         }
      }
      
      public function set name_2432(param1:int) : void
      {
         if(param1 == 0)
         {
            this.var_2985.visible = false;
         }
         else
         {
            this.var_2985.visible = true;
            this.var_2985.gotoAndStop(param1);
         }
      }
      
      public function name_2456(param1:Vector.<String>) : void
      {
         if(param1.length != 0)
         {
            this.var_2987 = true;
            this.pass1._label.visible = false;
            this.pass2._label.visible = false;
            this.var_2979.create(param1);
         }
      }
      
      private function method_2784(param1:Event) : void
      {
         this.name_2429.enable = this.var_2980.checked && this.pass1.validValue && this.pass2.validValue && this.callSign.validValue;
      }
      
      private function method_2783(param1:FocusEvent) : void
      {
         var _loc2_:Boolean = this.pass1.value == this.callSign.value || this.pass1.value == "123" || this.pass1.value == "1234" || this.pass1.value == "12345" || this.pass1.value == "qwerty";
         if(this.pass1.value != this.pass2.value || this.pass1.value == "")
         {
            this.pass2.validValue = false;
         }
         else
         {
            this.pass1.validValue = !_loc2_;
            this.pass2.validValue = true;
         }
         this.method_2784(param1);
      }
      
      private function method_1710(param1:FocusEvent) : void
      {
         var _loc2_:int = 0;
         if(this.method_1712 != null)
         {
            _loc2_ = this.method_1712.value.length;
            this.method_1712.validValue = _loc2_ == 18;
         }
      }
      
      private function method_2789(param1:FocusEvent) : void
      {
         var _loc2_:RegExp = /^[a-z0-9](([\.\-\w](?!(-|_|\.){2,}))*[a-z0-9])?$/i;
         var _loc3_:Array = this.callSign.value.match(_loc2_);
         this.callSign.validValue = _loc3_ != null;
         this.method_2784(null);
      }
      
      private function method_2608(param1:FocusEvent) : void
      {
         var _loc2_:RegExp = /(\w|[_.\-])+@((\w|-)+\.)+\w{2,4}+/;
         var _loc3_:Object = _loc2_.exec(this.email.value);
         if(this.email.value.length <= 0)
         {
            this.email.validValue = true;
            this.method_2609.visible = false;
         }
      }
      
      public function method_2793() : void
      {
         this.name_2429.enable = true;
      }
      
      public function hide() : void
      {
         this.callSign.removeEventListener(FocusEvent.FOCUS_OUT,this.method_2789);
         this.callSign.removeEventListener(FocusEvent.FOCUS_IN,this.method_1694);
         this.callSign.textField.removeEventListener(FocusEvent.FOCUS_IN,this.method_2786);
         this.var_2979.removeEventListener(FreeUidsFormEvent.FOCUS_OUT,this.method_2787);
         this.var_2979.removeEventListener(FreeUidsFormEvent.CLICK_ITEM,this.method_2790);
         this.email.removeEventListener(FocusEvent.FOCUS_OUT,this.method_2608);
         this.email.removeEventListener(FocusEvent.FOCUS_IN,this.method_1694);
         this.pass1.removeEventListener(FocusEvent.FOCUS_OUT,this.method_2783);
         this.pass1.removeEventListener(FocusEvent.FOCUS_IN,this.method_1694);
         this.pass2.removeEventListener(FocusEvent.FOCUS_OUT,this.method_2783);
         this.pass2.removeEventListener(FocusEvent.FOCUS_IN,this.method_1694);
      }
      
      private function method_1694(param1:Event) : void
      {
         var _loc2_:TankInput = param1.currentTarget as TankInput;
         _loc2_.validValue = true;
      }
      
      private function onResize(param1:Event) : void
      {
         this.method_2785(param1);
      }
      
      private function method_2786(param1:FocusEvent) : void
      {
         if(this.var_2987)
         {
            this.pass1._label.visible = false;
            this.pass2._label.visible = false;
            this.var_2979.show();
         }
      }
      
      private function method_2790(param1:FreeUidsFormEvent) : void
      {
         this.callSign.value = param1.uid;
         this.callSign.textField.dispatchEvent(new name_2014(name_2014.name_2020));
         this.method_2788();
      }
      
      private function method_2787(param1:FreeUidsFormEvent) : void
      {
         this.method_2788();
      }
      
      private function method_2788() : void
      {
         this.var_2987 = false;
         this.var_2979.hide();
         this.pass1._label.visible = true;
         this.pass2._label.visible = true;
      }
      
      public function method_2792(param1:Boolean) : void
      {
         if(param1 && this.name_2430 == null)
         {
            this.name_2430 = new name_3000();
            addChild(this.name_2430);
            this.name_2430.y = this.var_2980.y + this.var_2982.height + 15;
            this.name_2430.x = this.callSign.x;
            this.name_2430.width += 1;
            this.bg.height += this.name_2430.height + 20;
            this.name_2429.y += 125;
            this.method_2785(null);
         }
      }
   }
}
