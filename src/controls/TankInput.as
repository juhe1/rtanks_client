package controls
{
   import assets.input.*;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.TextEvent;
   import flash.events.TimerEvent;
   import flash.system.Capabilities;
   import flash.text.AntiAliasType;
   import flash.text.GridFitType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import package_280.name_2014;
   
   [Embed(source="/_assets/assets.swf", symbol="controls.TankInput")]
   public class TankInput extends Sprite
   {
       
      
      private var var_2643:int = 0;
      
      private var var_2641:Boolean = true;
      
      private var _value:String = "";
      
      public var _label:Label;
      
      private const format:TextFormat = new TextFormat("MyriadPro",12);
      
      private const bg:Sprite = new Sprite();
      
      private const l:Shape = new Shape();
      
      private const c:Shape = new Shape();
      
      private const const_1653:Shape = new Shape();
      
      private const name_1933:name_2774 = new name_2774(0,0);
      
      private const name_1934:name_2775 = new name_2775(0,0);
      
      private const name_1935:name_2776 = new name_2776(0,0);
      
      private const const_2085:InputLeftWrong = new InputLeftWrong(0,0);
      
      private const const_2084:InputCenterWrong = new InputCenterWrong(0,0);
      
      private const const_2083:InputRightWrong = new InputRightWrong(0,0);
      
      private var _width:int;
      
      private var _height:int;
      
      public var textField:TextField;
      
      private var var_2642:int = 0;
      
      private var var_2644:String = "";
      
      private var timer:Timer;
      
      private var var_2645:Boolean;
      
      public function TankInput()
      {
         super();
         removeChildAt(0);
         addChild(this.bg);
         this.bg.addChild(this.l);
         this.bg.addChild(this.c);
         this.bg.addChild(this.const_1653);
         this._label = new Label();
         this._label.x = -10;
         this._label.y = 7;
         this._label.gridFitType = GridFitType.SUBPIXEL;
         addChild(this._label);
         this.var_2642 = getTimer();
         var _loc1_:String = Capabilities.version;
         var _loc2_:RegExp = /^(\w*) (\d*),(\d*),(\d*),(\d*)$/;
         var _loc3_:Object = _loc2_.exec(_loc1_);
         if(_loc3_ != null && Number(_loc3_[2] + "." + _loc3_[3]) < 10.1)
         {
            this.textField = new name_2777();
         }
         else
         {
            this.textField = new TextField();
         }
         addChild(this.textField);
         this.format.color = 16777215;
         this.textField.defaultTextFormat = this.format;
         this.textField.antiAliasType = AntiAliasType.ADVANCED;
         this.textField.gridFitType = GridFitType.PIXEL;
         this.textField.embedFonts = true;
         this.textField.sharpness = -250;
         this.textField.thickness = -200;
         this.textField.type = TextFieldType.INPUT;
         this.textField.x = 3;
         this.textField.y = 7;
         this.textField.height = 20;
         this.textField.addEventListener(Event.CHANGE,this.method_2576);
         this.width = 212;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = int(param1);
         this.textField.width = this._width - 6;
         this.draw();
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = int(param1);
         this.draw();
      }
      
      public function set label(param1:String) : void
      {
         this._label.text = param1;
         this._label.autoSize = TextFieldAutoSize.RIGHT;
      }
      
      public function set align(param1:String) : void
      {
         this.format.align = param1;
         this.method_1838();
      }
      
      private function method_1838() : void
      {
         this.textField.defaultTextFormat = this.format;
         this.textField.setTextFormat(this.format);
      }
      
      public function clear() : void
      {
         this.textField.text = "";
         this.validValue = true;
      }
      
      override public function set tabIndex(param1:int) : void
      {
         this.textField.tabIndex = param1;
      }
      
      public function set timeout(param1:int) : void
      {
         this.var_2643 = param1;
         this.textField.addEventListener(KeyboardEvent.KEY_UP,this.listener);
         this.timer = new Timer(this.var_2643);
         this.timer.addEventListener(TimerEvent.TIMER,this.method_2577);
         this.textField.removeEventListener(TextEvent.TEXT_INPUT,this.method_2576);
         this.timer.start();
      }
      
      public function set restrict(param1:String) : void
      {
         this.textField.restrict = param1;
      }
      
      public function set maxChars(param1:int) : void
      {
         this.textField.maxChars = param1;
      }
      
      public function get value() : String
      {
         return this._value;
      }
      
      public function set value(param1:String) : void
      {
         this.textField.text = this._value = param1;
      }
      
      public function set hidden(param1:Boolean) : void
      {
         this.var_2645 = param1;
         this.textField.displayAsPassword = this.var_2645;
         this.textField.defaultTextFormat = this.format;
         this.textField.setTextFormat(this.format);
      }
      
      public function set validValue(param1:Boolean) : void
      {
         this.var_2641 = param1;
         this.draw();
      }
      
      public function get validValue() : Boolean
      {
         return this.var_2641;
      }
      
      private function listener(param1:KeyboardEvent) : void
      {
         var _loc2_:int = getTimer();
         this.var_2642 = _loc2_;
      }
      
      private function method_2576(param1:Event) : void
      {
         this._value = this.textField.text;
         dispatchEvent(new name_2014(name_2014.name_2020));
      }
      
      private function method_2577(param1:TimerEvent) : void
      {
         var _loc2_:int = getTimer();
         if(_loc2_ - this.var_2642 > this.var_2643 && this.var_2644 != this.value)
         {
            this.var_2644 = this.value;
            dispatchEvent(new name_2014(name_2014.name_2020));
         }
         this.var_2642 = _loc2_;
      }
      
      public function hide(param1:Event) : void
      {
         removeEventListener(Event.REMOVED_FROM_STAGE,this.hide);
         this.textField.removeEventListener(TextEvent.TEXT_INPUT,this.method_2576);
         this.textField.removeEventListener(KeyboardEvent.KEY_UP,this.listener);
      }
      
      private function draw() : void
      {
         var _loc1_:Graphics = null;
         _loc1_ = this.l.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(this.var_2641 ? this.name_1933 : this.const_2085);
         _loc1_.drawRect(0,0,5,30);
         _loc1_.endFill();
         this.l.x = 0;
         this.l.y = 0;
         _loc1_ = this.c.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(this.var_2641 ? this.name_1934 : this.const_2084);
         _loc1_.drawRect(0,0,this._width - 10,30);
         _loc1_.endFill();
         this.c.x = 5;
         this.c.y = 0;
         _loc1_ = this.const_1653.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(this.var_2641 ? this.name_1935 : this.const_2083);
         _loc1_.drawRect(0,0,5,30);
         _loc1_.endFill();
         this.const_1653.x = this._width - 5;
         this.const_1653.y = 0;
      }
   }
}
