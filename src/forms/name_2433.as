package forms
{
   import controls.DefaultButton;
   import flash.display.InteractiveObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.ui.Keyboard;
   import package_1.Main;
   import package_280.name_2014;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   import scpacker.utils.CaptchaParser;
   
   public class name_2433 extends Sprite
   {
       
      
      private var var_710:Boolean = false;
      
      public var name_2424:CheckPassword;
      
      public var name_2423:RegisterForm;
      
      public var name_2431:name_3069;
      
      private var var_2062:Boolean = false;
      
      public function name_2433(param1:Boolean)
      {
         this.name_2424 = new CheckPassword();
         this.name_2431 = new name_3069();
         super();
         this.var_2062 = param1;
         this.name_2423 = new RegisterForm(param1);
         if(param1)
         {
            this.name_2423.y = -110;
         }
         addChild(this.name_2423);
         addChild(this.name_2424);
         addChild(this.name_2431);
         this.name_2424.visible = false;
         this.name_2423.visible = true;
         this.name_2431.visible = false;
         this.name_2424.name_2429.addEventListener(MouseEvent.CLICK,this.method_2861);
         this.name_2423.name_2429.addEventListener(MouseEvent.CLICK,this.method_2861);
         this.name_2424.name_3068.addEventListener(KeyboardEvent.KEY_DOWN,this.method_2862);
         this.name_2424.name_3071.addEventListener(MouseEvent.CLICK,this.method_2859);
         this.name_2423.var_2983.addEventListener(MouseEvent.CLICK,this.method_2859);
         addEventListener(Event.ADDED_TO_STAGE,this.name_2274);
      }
      
      public function get loginState() : Boolean
      {
         return this.var_710;
      }
      
      public function set loginState(param1:Boolean) : void
      {
         this.var_710 = !param1;
         this.method_2859(null);
      }
      
      public function get callSign() : String
      {
         return this.var_710 ? this.name_2424.callSign.value : this.name_2423.callSign.value;
      }
      
      public function set callSign(param1:String) : void
      {
         this.name_2424.callSign.value = param1;
         if(stage != null)
         {
         }
      }
      
      public function get name_2447() : String
      {
         return this.name_2424.name_3068.value;
      }
      
      public function get pass1() : String
      {
         return this.name_2423.pass1.value;
      }
      
      public function get pass2() : String
      {
         return this.name_2423.pass2.value;
      }
      
      public function get hash() : String
      {
         return this.name_2424.hash;
      }
      
      public function get method_1720() : String
      {
         if(this.name_2423.method_1720 != null)
         {
            return this.name_2423.method_1720.value;
         }
         return null;
      }
      
      public function get method_1712() : String
      {
         if(this.name_2423.method_1712 != null)
         {
            return this.name_2423.method_1712.value;
         }
         return null;
      }
      
      public function get remember() : Boolean
      {
         return this.var_710 ? this.name_2424.name_3070.checked : true;
      }
      
      public function set remember(param1:Boolean) : void
      {
         this.name_2424.name_3070.checked = param1;
      }
      
      public function get email() : String
      {
         return this.name_2423.method_2609.visible ? this.name_2423.email.value : null;
      }
      
      public function get name_2442() : String
      {
         return this.name_2431.email.value;
      }
      
      public function name_2455() : void
      {
         this.name_2424.name_3068.clear();
      }
      
      private function name_2274(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.name_2274);
         stage.addEventListener(Event.RESIZE,this.method_1940);
         this.method_1940(null);
         this.loginState = !this.var_710;
      }
      
      public function name_2461(param1:String, param2:String) : void
      {
         if(param1 == "AUTH")
         {
            this.name_2424.method_2792(true);
            this.name_2424.name_2430.name_3067.addEventListener(MouseEvent.CLICK,this.method_2858);
            CaptchaParser.parse(param2,this.name_2424.name_2430.method_2792);
         }
         else if(param1 == "REGISTER")
         {
            this.name_2423.method_2792(true);
            this.name_2423.name_2430.name_3067.addEventListener(MouseEvent.CLICK,this.method_2858);
            CaptchaParser.parse(param2,this.name_2423.name_2430.method_2792);
         }
         else if(param1 == "RESTORE")
         {
            this.name_2431.method_2792(true);
            this.name_2431.name_2430.name_3067.addEventListener(MouseEvent.CLICK,this.method_2858);
            CaptchaParser.parse(param2,this.name_2431.name_2430.method_2792);
         }
      }
      
      private function method_2858(param1:Event) : void
      {
         Network(Main.osgi.name_6(name_2)).send("auth;refresh_captcha");
      }
      
      public function name_2448(param1:String, param2:String) : void
      {
         if(param1 == "AUTH" && this.name_2424.name_2430 != null)
         {
            CaptchaParser.parse(param2,this.name_2424.name_2430.method_2792);
         }
         if(param1 == "REGISTER" && this.name_2423.name_2430 != null)
         {
            CaptchaParser.parse(param2,this.name_2423.name_2430.method_2792);
         }
         if(param1 == "RESTORE" && this.name_2431.name_2430 != null)
         {
            CaptchaParser.parse(param2,this.name_2431.name_2430.method_2792);
         }
      }
      
      private function method_2859(param1:MouseEvent) : void
      {
         this.var_710 = !this.var_710;
         this.name_2424.visible = this.var_710;
         this.name_2423.visible = !this.var_710;
         if(this.name_2424.visible)
         {
            this.name_2424.method_2785(null);
         }
         if(this.name_2423.visible)
         {
            this.name_2423.method_2785(null);
         }
         if(stage != null)
         {
            if(this.var_710)
            {
               stage.focus = this.name_2424.callSign.textField.length == 0 ? this.name_2424.callSign.textField : this.name_2424.name_3068.textField;
            }
            else
            {
               stage.focus = this.name_2423.callSign.textField;
            }
         }
         dispatchEvent(new name_2014(name_2014.CHANGE_STATE));
      }
      
      private function method_2863(param1:TextEvent) : void
      {
         if(param1.text == "rules")
         {
            dispatchEvent(new name_2014(name_2014.name_2439));
         }
         else
         {
            dispatchEvent(new name_2014(name_2014.name_2440));
         }
      }
      
      private function method_1940(param1:Event) : void
      {
         if(this.name_2424.visible)
         {
            this.name_2424.method_2785(null);
         }
         if(this.name_2423.visible)
         {
            this.name_2423.method_2785(null);
         }
         if(this.name_2431.visible)
         {
            this.name_2431.method_2785(null);
         }
      }
      
      private function method_2861(param1:MouseEvent) : void
      {
         var _loc2_:DefaultButton = param1.currentTarget as DefaultButton;
         _loc2_.enable = false;
         dispatchEvent(new name_2014(name_2014.name_2444));
      }
      
      private function method_2862(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER)
         {
            dispatchEvent(new name_2014(name_2014.name_2444));
         }
      }
      
      public function name_2459() : void
      {
         this.name_2424.visible = false;
         this.name_2431.visible = true;
         this.name_2431.email.validValue = true;
         this.name_2431.name_2437.enable = true;
         this.name_2431.name_1573.addEventListener(MouseEvent.CLICK,this.method_2860);
         this.name_2431.name_2437.addEventListener(MouseEvent.CLICK,this.method_2860);
         this.name_2431.method_2785(null);
      }
      
      public function name_2453() : void
      {
         this.name_2431.email.validValue = false;
      }
      
      public function method_2860(param1:MouseEvent) : void
      {
         if(param1.currentTarget == this.name_2431.name_2437)
         {
            this.name_2431.name_2437.enable = false;
            dispatchEvent(new name_2014(name_2014.name_2446));
         }
         else
         {
            this.name_2441();
         }
      }
      
      public function name_2441() : void
      {
         this.name_2424.visible = true;
         this.name_2431.visible = false;
         this.loginState = true;
         this.name_2431.name_1573.removeEventListener(MouseEvent.CLICK,this.method_2860);
         this.name_2431.name_2437.removeEventListener(MouseEvent.CLICK,this.method_2860);
      }
      
      public function hide() : void
      {
         stage.removeEventListener(Event.RESIZE,this.method_1940);
         this.name_2424.name_2429.removeEventListener(MouseEvent.CLICK,this.method_2861);
         this.name_2423.name_2429.removeEventListener(MouseEvent.CLICK,this.method_2861);
         this.name_2424.name_3071.removeEventListener(MouseEvent.CLICK,this.method_2859);
         this.name_2423.var_2983.removeEventListener(MouseEvent.CLICK,this.method_2859);
         this.name_2424.name_3068.removeEventListener(KeyboardEvent.KEY_DOWN,this.method_2862);
         this.name_2423.hide();
         if(this.name_2424.name_2430 != null)
         {
            this.name_2424.name_2430.name_3067.removeEventListener(MouseEvent.CLICK,this.method_2858);
         }
         if(this.name_2423.name_2430 != null)
         {
            this.name_2423.name_2430.name_3067.removeEventListener(MouseEvent.CLICK,this.method_2858);
         }
         if(this.name_2431.name_2430 != null)
         {
            this.name_2431.name_2430.name_3067.removeEventListener(MouseEvent.CLICK,this.method_2858);
         }
      }
   }
}
