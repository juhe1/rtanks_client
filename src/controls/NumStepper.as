package controls
{
   import assets.icons.BattleInfoIcons;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.text.GridFitType;
   import flash.text.TextFieldType;
   import flash.text.TextFormatAlign;
   import package_280.name_2014;
   
   public class NumStepper extends MovieClip
   {
      
      private static const const_2769:Class = name_3533;
       
      
      private var name_2291:TankInput;
      
      private var button:StepperButton;
      
      private var _value:int = 0;
      
      private var var_3394:int = 10;
      
      private var var_3393:int = 0;
      
      private var var_3602:Label;
      
      private var _icon:DisplayObject;
      
      private var var_3603:int = 1;
      
      private var var_1240:Boolean = true;
      
      public function NumStepper(param1:int = 1)
      {
         this.name_2291 = new TankInput();
         this.button = new StepperButton();
         super();
         addChild(this.name_2291);
         this.name_2291.width = 55;
         this.name_2291.x = 19;
         addChild(this.button);
         this.button.x = 75;
         this.var_3603 = param1;
         this.name_2291.restrict = "0-9";
         this.name_2291.maxChars = 5;
         this.name_2291.align = TextFormatAlign.CENTER;
         this.name_2291.textField.addEventListener(FocusEvent.FOCUS_OUT,this.method_2582);
         this.name_2291.textField.addEventListener(FocusEvent.MOUSE_FOCUS_CHANGE,this.method_2582);
         this.name_2291.addEventListener(name_2014.name_2020,this.method_2582);
         this.name_2291.textField.addEventListener(FocusEvent.FOCUS_IN,this.method_3224);
         this.draw();
         this.enabled = true;
      }
      
      public function set minValue(param1:int) : void
      {
         this.var_3393 = param1;
         this._value = Math.max(this._value,this.var_3393);
         this.draw();
      }
      
      public function set maxValue(param1:int) : void
      {
         this.var_3394 = param1;
         this._value = Math.min(this._value,this.var_3394);
         this.draw();
      }
      
      public function set icon(param1:int) : void
      {
         var _loc2_:Bitmap = null;
         var _loc3_:BattleInfoIcons = null;
         if(param1 == 100)
         {
            _loc2_ = new Bitmap(new const_2769().bitmapData);
            _loc2_.y = 5;
            _loc2_.x = -2;
            addChild(_loc2_);
         }
         else
         {
            _loc3_ = new BattleInfoIcons();
            _loc3_.type = param1;
            _loc3_.y = 8;
            addChild(_loc3_);
         }
      }
      
      public function set icon1(param1:DisplayObject) : void
      {
         if(this._icon != null)
         {
            removeChildAt(0);
         }
         this._icon = param1;
         addChildAt(this._icon,0);
         this._icon.y = 8;
      }
      
      public function set name_3464(param1:int) : void
      {
         this.var_3603 = param1;
      }
      
      public function set label(param1:String) : void
      {
         if(this.var_3602 == null)
         {
            this.var_3602 = new Label();
            this.var_3602.x = 18;
            this.var_3602.y = -18;
            this.var_3602.gridFitType = GridFitType.SUBPIXEL;
            addChild(this.var_3602);
         }
         this.var_3602.text = param1;
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function set value(param1:int) : void
      {
         this._value = param1;
         this.draw();
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         this.var_1240 = param1;
         if(this.var_1240)
         {
            this.button.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            this.button.addEventListener(MouseEvent.MOUSE_UP,this.method_1057);
            this.button.addEventListener(MouseEvent.MOUSE_OUT,this.method_1057);
            this.name_2291.textField.selectable = true;
            this.name_2291.textField.type = TextFieldType.INPUT;
         }
         else
         {
            this.button.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            this.button.removeEventListener(MouseEvent.MOUSE_UP,this.method_1057);
            this.button.removeEventListener(MouseEvent.MOUSE_OUT,this.method_1057);
            this.name_2291.textField.selectable = false;
            this.name_2291.textField.type = TextFieldType.DYNAMIC;
         }
      }
      
      override public function get enabled() : Boolean
      {
         return this.var_1240;
      }
      
      private function method_3224(param1:Event) : void
      {
         if(this.name_2291.value == "—")
         {
            this.name_2291.clear();
         }
      }
      
      private function method_2582(param1:Event) : void
      {
         var _loc2_:int = Number(this.name_2291.value);
         this._value = Math.max(this.var_3393,Math.min(_loc2_,this.var_3394));
         this.draw();
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.button.gotoAndStop(this.button.mouseY < 15 ? 2 : 3);
         this._value = Number(this.name_2291.value);
         this._value = Math.min(this._value,this.var_3394);
         this._value += this.button.mouseY > 15 ? (this._value > this.var_3393 ? -this.var_3603 : 0) : (this._value < this.var_3394 ? this.var_3603 : 0);
         this.draw();
      }
      
      private function method_1057(param1:MouseEvent) : void
      {
         this.button.gotoAndStop(1);
      }
      
      private function draw() : void
      {
         if(stage != null)
         {
            this.name_2291.value = this._value > 0 || stage.focus == this.name_2291.textField ? String(this.value) : "—";
            if(this.enabled)
            {
               dispatchEvent(new Event(Event.CHANGE));
            }
         }
         else
         {
            this.name_2291.value = this._value > 0 ? String(this.value) : "—";
         }
      }
   }
}
