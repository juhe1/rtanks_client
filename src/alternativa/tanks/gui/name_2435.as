package alternativa.tanks.gui
{
   import controls.BlueButton;
   import controls.RedButton;
   import controls.TankInput;
   import controls.base.name_2016;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import forms.name_1838;
   import package_1.Main;
   import package_54.name_102;
   import package_60.TextConst;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_2435 extends Sprite
   {
       
      
      private var window:name_1838;
      
      private var var_3089:name_2016;
      
      private var var_3088:name_2016;
      
      private var var_1500:name_2016;
      
      private var localeService:name_102;
      
      private var var_1276:BlueButton;
      
      private var name_1573:RedButton;
      
      public function name_2435()
      {
         super();
         this.localeService = name_102(Main.osgi.name_6(name_102));
         this.method_2856();
         this.method_1718();
      }
      
      public function get password() : String
      {
         if(this.var_3088.validValue)
         {
            return this.var_3089.value;
         }
         return null;
      }
      
      public function get name_2462() : String
      {
         if(this.var_3088.validValue)
         {
            return this.var_3088.value;
         }
         return null;
      }
      
      public function get email() : String
      {
         if(this.var_1500.validValue)
         {
            return this.var_1500.value;
         }
         return null;
      }
      
      public function set email(param1:String) : void
      {
         this.var_1500.value = param1;
      }
      
      private function method_2856() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 120;
         this.window = name_1838.name_1844(this.localeService.getText(name_390.const_950));
         this.window.width = 435;
         this.window.height = 169 - 11;
         addChild(this.window);
         this.var_3089 = new name_2016();
         this.var_3089.hidden = true;
         this.var_3089.width = _loc1_;
         this.var_3089.x = 112;
         this.var_3089.y = 20;
         this.var_3089.label = this.localeService.getText(TextConst.SETTINGS_NEW_PASSWORD_LABEL_TEXT);
         addChild(this.var_3089);
         this.var_3088 = new name_2016();
         this.var_3088.width = _loc1_;
         this.var_3088.hidden = true;
         this.var_3088.x = this.var_3089.x + this.var_3089.width - 30;
         this.var_3088.y = 20;
         this.var_3088.label = this.localeService.getText(TextConst.SETTINGS_REENTER_PASSWORD_LABEL_TEXT);
         addChild(this.var_3088);
         this.var_1500 = new name_2016();
         this.var_1500.x = 63;
         this.var_1500.y = this.var_3088.y + this.var_1500.height + 11;
         this.var_1500.width = 352;
         this.var_1500.label = this.localeService.getText(TextConst.SETTINGS_EMAIL_LABEL_TEXT);
         addChild(this.var_1500);
         this.var_1276 = new BlueButton();
         this.var_1276.label = this.localeService.getText(TextConst.SETTINGS_BUTTON_SAVE_TEXT);
         this.var_1276.x = this.window.width - this.var_1276.width - 20;
         this.var_1276.y = this.window.height - this.var_1276.height - 24;
         this.var_1276.enable = false;
         addChild(this.var_1276);
         this.name_1573 = new RedButton();
         this.name_1573.label = this.localeService.getText(TextConst.SETTINGS_BUTTON_CANCEL_TEXT);
         this.name_1573.x = this.window.width - this.name_1573.width * 2 - 34;
         this.name_1573.y = this.window.height - this.name_1573.height - 24;
         addChild(this.name_1573);
      }
      
      private function method_1718() : void
      {
         this.var_3089.addEventListener(FocusEvent.FOCUS_OUT,this.method_2855);
         this.var_3089.addEventListener(FocusEvent.FOCUS_IN,this.method_1694);
         this.var_3088.addEventListener(FocusEvent.FOCUS_OUT,this.method_2855);
         this.var_3088.addEventListener(FocusEvent.FOCUS_IN,this.method_1694);
         this.var_1500.addEventListener(FocusEvent.FOCUS_OUT,this.method_2608);
         this.var_1500.addEventListener(FocusEvent.FOCUS_IN,this.method_1694);
         this.var_1276.addEventListener(MouseEvent.CLICK,this.method_2857);
         this.name_1573.addEventListener(MouseEvent.CLICK,this.method_1552);
      }
      
      private function method_2857(param1:MouseEvent) : void
      {
         dispatchEvent(new name_2422(name_2422.name_2438));
      }
      
      private function method_1552(param1:MouseEvent) : void
      {
         dispatchEvent(new name_2422(name_2422.name_2434));
      }
      
      private function method_2855(param1:Event) : void
      {
         if(this.var_3089.value.length > 0 && this.var_3088.value != this.var_3089.value)
         {
            this.var_3088.validValue = false;
         }
         else
         {
            this.var_3088.validValue = true;
         }
         this.method_2854();
      }
      
      private function method_2608(param1:FocusEvent) : void
      {
         var _loc2_:RegExp = /(\w|[_.\-])+@((\w|-)+\.)+\w{2,4}+/;
         var _loc3_:Object = _loc2_.exec(this.var_1500.value);
         if(this.var_1500.value.length > 0)
         {
            this.var_1500.validValue = _loc3_ != null;
         }
         else
         {
            this.var_1500.validValue = false;
         }
         this.method_2854();
      }
      
      private function method_1694(param1:Event) : void
      {
         var _loc2_:TankInput = param1.currentTarget as TankInput;
         _loc2_.validValue = true;
      }
      
      private function method_2854() : void
      {
         this.var_1276.enable = this.var_3088.validValue && this.var_1500.validValue;
      }
   }
}
