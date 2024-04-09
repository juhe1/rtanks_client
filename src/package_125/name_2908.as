package package_125
{
   import alternativa.tanks.model.shop.ShopWindow;
   import controls.base.TankInput;
   import controls.base.LabelBase;
   import controls.base.DefaultButtonBase;
   import controls.TankWindowInner;
   import controls.name_2015;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import flash.ui.Keyboard;
   import package_1.Main;
   import package_396.name_3381;
   import package_444.name_2795;
   import package_447.name_2906;
   import package_54.name_102;
   import package_60.TextConst;
   import utils.tweener.TweenLite;
   
   public class name_2908 extends name_2906
   {
      
      public static const const_1527:String = "[a-z0-9A-Z]";
      
      public static const const_2655:int = 82;
      
      public static const const_422:int = 8;
      
      public static var localeService:name_102 = Main.osgi.getService(name_102) as name_102;
      
      public static var display:DisplayObjectContainer = Main.dialogsLayer;
      
      protected static const const_2652:int = 50;
      
      protected static const const_2653:int = 5;
      
      protected static const const_2654:int = 100;
       
      
      private var var_3416:TankInput;
      
      private var var_1844:DefaultButtonBase;
      
      private var var_3417:name_2015;
      
      private var var_3419:name_2795;
      
      private var code:String = "";
      
      private var var_1225:TankWindowInner;
      
      private var var_1278:LabelBase;
      
      private var var_3418:LabelBase;
      
      public function name_2908()
      {
         super();
         this.var_1225 = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.var_1225.showBlink = true;
         addChild(this.var_1225);
         this.var_1278 = this.method_3084();
         this.var_1225.addChild(this.var_1278);
         this.var_3416 = this.method_3082();
         addChild(this.var_3416);
         this.var_1844 = this.method_3081();
         addChild(this.var_1844);
         this.var_3417 = this.method_3083();
         addChild(this.var_3417);
         this.var_3418 = this.method_3080();
         addChild(this.var_3418);
      }
      
      private function method_3084() : LabelBase
      {
         var _loc1_:LabelBase = new LabelBase();
         _loc1_.autoSize = TextFieldAutoSize.NONE;
         _loc1_.multiline = true;
         _loc1_.wordWrap = true;
         _loc1_.htmlText = localeService.getText(TextConst.SHOP_WINDOW_PROMOCODE_FROM_DESCRIPTION);
         return _loc1_;
      }
      
      protected function method_3082() : TankInput
      {
         var _loc1_:TankInput = new TankInput();
         _loc1_.align = TextFormatAlign.CENTER;
         _loc1_.restrict = "[a-z0-9A-Z]";
         return _loc1_;
      }
      
      protected function method_3081() : DefaultButtonBase
      {
         var _loc1_:DefaultButtonBase = new DefaultButtonBase();
         _loc1_.tabEnabled = false;
         _loc1_.enable = false;
         _loc1_.label = localeService.getText(TextConst.REFERAL_WINDOW_BUTTON_SEND_TEXT);
         return _loc1_;
      }
      
      protected function method_3083() : name_2015
      {
         var _loc1_:name_2015 = null;
         _loc1_ = new name_2015();
         _loc1_.var_1411 = 0.2;
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         return _loc1_;
      }
      
      protected function method_3080() : LabelBase
      {
         var _loc1_:LabelBase = new LabelBase();
         _loc1_.visible = false;
         _loc1_.text = localeService.getText(TextConst.SHOP_WINDOW_PROMOCODE_INVALID_TEXT);
         return _loc1_;
      }
      
      private function method_3085(param1:Event) : void
      {
         display.stage.focus = null;
      }
      
      private function method_3078() : name_2795
      {
         if(!this.var_3419)
         {
            this.var_3419 = new name_2795();
            this.var_3419.name_2796(TweenLite.name_2095(this.var_3416.textField,0.2,{
               "x":100,
               "ease":name_3381.method_2594
            }));
            this.var_3419.name_2796(TweenLite.name_2095(this.var_3416.textField,0.2,{
               "x":0,
               "ease":name_3381.method_2594
            }));
         }
         return this.var_3419;
      }
      
      private function method_2905(param1:TextEvent = null) : void
      {
         this.method_3078().restart(true);
      }
      
      private function method_3079(param1:Event) : void
      {
         var _loc2_:String = null;
         this.var_3416.validValue = true;
         this.var_3417.name_2024();
         this.var_3418.visible = false;
         var _loc3_:String = "";
         var _loc4_:int = this.var_3416.textField.length;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = _loc4_ - this.var_3416.textField.selectionBeginIndex;
         this.code = "";
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.var_3416.textField.text.charAt(_loc5_).toUpperCase();
            if(_loc2_ != "-")
            {
               this.code = this.code.concat(_loc2_);
               if(_loc4_ - _loc5_ > 1 && _loc3_.length - 5 + 1 >= 0 && (_loc3_.length - _loc6_ + 1) % 5 == 0)
               {
                  _loc2_ = _loc2_.concat("-");
                  _loc6_++;
               }
               _loc3_ = _loc3_.concat(_loc2_);
            }
            _loc5_++;
         }
         if(_loc3_.charAt(_loc3_.length - 1) == "-")
         {
            _loc3_ = _loc3_.substr(0,_loc3_.length - 1);
         }
         this.var_3416.maxChars = 50 + _loc6_;
         this.var_3416.textField.text = _loc3_;
         this.var_3416.textField.setSelection(_loc3_.length - _loc7_,_loc3_.length - _loc7_);
         this.var_1844.enable = this.method_1346(this.code);
      }
      
      private function method_3077(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER)
         {
            this.method_3076();
         }
      }
      
      protected function method_3076(param1:MouseEvent = null) : void
      {
         if(this.method_1346(this.code))
         {
            this.var_3417.method_285();
            this.var_1844.enable = false;
            this.var_3416.enable = false;
            dispatchEvent(new SendPromoCodeEvent(this.name_2912()));
         }
         else
         {
            this.method_2905();
         }
      }
      
      override public function render(param1:int, param2:int) : void
      {
         super.render(param1,param2);
         this.method_3078().restart(true);
         this.var_1844.enable = this.method_1346(this.code);
         this.var_1225.width = param1;
         this.var_1225.height = 82;
         this.var_1278.width = param1 - 2 * ShopWindow.const_2244;
         this.var_1278.height = 82 - 2 * ShopWindow.const_2244;
         this.var_1278.x = this.var_1278.y = ShopWindow.const_2244;
         var _loc3_:int = param2 - 82;
         this.var_3416.width = Math.max(this.var_3416.textField.textWidth,int(param1 * 0.66));
         this.var_3416.x = param1 - this.var_3416.width - this.var_1844.width - 8 >> 1;
         this.var_3416.y = (_loc3_ - this.var_3416.height >> 1) + 82;
         this.var_1844.x = this.var_3416.x + this.var_3416.width + 8;
         this.var_1844.y = this.var_3416.y;
         this.var_3418.x = int(this.var_3416.x + this.var_3416.width / 2) - int(this.var_3418.width / 2);
         this.var_3418.y = int(this.var_3416.y + this.var_3416.height + 8);
         var _loc4_:int = this.var_3416.height - this.var_3417.height >> 1;
         this.var_3417.x = this.var_3416.x + this.var_3416.width - _loc4_ - this.var_3417.height;
         this.var_3417.y = this.var_3416.y + _loc4_ + 2;
      }
      
      override public function name_2909() : void
      {
         super.name_2909();
         this.var_3416.addEventListener(TextEvent.TEXT_INPUT,this.method_2905);
         this.var_3416.addEventListener(Event.CHANGE,this.method_3079);
         this.var_3416.addEventListener(KeyboardEvent.KEY_DOWN,this.method_3077);
         this.var_1844.addEventListener(MouseEvent.CLICK,this.method_3076);
      }
      
      override public function destroy() : void
      {
         this.var_3416.removeEventListener(TextEvent.TEXT_INPUT,this.method_2905);
         this.var_3416.removeEventListener(Event.CHANGE,this.method_3079);
         this.var_3416.removeEventListener(KeyboardEvent.KEY_DOWN,this.method_3077);
         this.var_1844.removeEventListener(MouseEvent.CLICK,this.method_3076);
      }
      
      private function name_2912() : String
      {
         return this.code;
      }
      
      public function name_2913() : void
      {
         this.var_3416.validValue = false;
         this.var_3416.enable = true;
         this.var_3417.name_2017();
         this.var_3418.visible = true;
      }
      
      public function name_2911() : void
      {
         this.var_3416.enable = true;
         this.var_3417.name_2027();
      }
      
      public function method_1346(param1:String) : Boolean
      {
         return param1.search("[a-z0-9A-Z]") == 0;
      }
   }
}
