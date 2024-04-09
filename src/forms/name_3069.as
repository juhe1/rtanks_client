package forms
{
   import controls.base.LabelBase;
   import controls.base.name_2016;
   import controls.base.DefaultButtonBase;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.text.TextFormatAlign;
   import package_1.Main;
   import package_459.name_3000;
   import package_54.name_102;
   import package_60.TextConst;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_3069 extends Sprite
   {
      
      private static const const_422:int = 20;
      
      private static const const_2746:int = 10;
       
      
      public var name_1573:DefaultButtonBase;
      
      public var name_2437:DefaultButtonBase;
      
      public var email:name_2016;
      
      public var name_2430:name_3000;
      
      private var label:LabelBase;
      
      private var bg:TankWindowWithHeader;
      
      private var var_2981:int = 280;
      
      private var var_2992:int = 185;
      
      public function name_3069()
      {
         var _loc1_:name_102 = null;
         var _loc2_:int = 0;
         super();
         _loc1_ = Main.osgi.getService(name_102) as name_102;
         this.bg = TankWindowWithHeader.createWindow(_loc1_.getText(name_390.const_1281),this.var_2981,this.var_2992);
         this.label = new LabelBase();
         addChild(this.bg);
         addChild(this.label);
         this.label.multiline = true;
         this.label.align = TextFormatAlign.CENTER;
         this.label.text = _loc1_.getText(name_390.const_951);
         this.label.x = 20 + 5;
         this.label.y = 20;
         _loc2_ = this.label.y + this.label.height - 6;
         this.name_1573 = new DefaultButtonBase();
         this.name_2437 = new DefaultButtonBase();
         this.email = new name_2016();
         addChild(this.name_1573);
         addChild(this.name_2437);
         addChild(this.email);
         this.name_1573.x = 153;
         this.name_1573.y = 115;
         this.name_2437.x = 30;
         this.name_2437.y = 115;
         this.email.width = this.var_2981 - 2 * 20 - 5;
         this.email.x = 20 + 5;
         this.email.y = _loc2_ + 20;
         this.name_1573.label = _loc1_.getText(TextConst.ACCOUNT_RECOVERY_FORM_BUTTON_CANCEL_TEXT);
         this.name_2437.label = _loc1_.getText(TextConst.ACCOUNT_RECOVERY_FORM_BUTTON_RECOVER_TEXT);
         this.x = 61;
         this.email.addEventListener(FocusEvent.FOCUS_IN,this.method_1694);
         this.method_2785(null);
      }
      
      private function method_1694(param1:Event) : void
      {
         this.email.validValue = true;
      }
      
      public function method_2785(param1:Event = null) : void
      {
         this.x = int((Main.stage.stageWidth - this.var_2981) / 2);
         this.y = int((Main.stage.stageHeight - this.var_2992) / 2);
      }
      
      public function method_2792(param1:Boolean) : void
      {
         if(param1 && this.name_2430 == null)
         {
            this.label.size = 12;
            this.name_2430 = new name_3000();
            addChild(this.name_2430);
            this.name_2430.width -= 40;
            this.bg.height += this.name_2430.height - 20;
            this.bg.width += 10;
            this.email.width = this.name_2430.width - 15;
            this.name_2430.x = this.email.x;
            this.name_2430.y = this.email.y + this.email.height + 20;
            this.name_1573.x = 175;
            this.name_1573.y = 235;
            this.name_2437.x = 30;
            this.name_2437.y = 235;
            this.method_2785(null);
         }
      }
   }
}
