package controls.base
{
   import base.class_122;
   import controls.name_2777;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.events.MouseEvent;
   import flash.system.Capabilities;
   import flash.text.AntiAliasType;
   import flash.text.GridFitType;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import utils.name_1986;
   import var_5.name_269;
   
   public class TankInput extends class_122
   {
      
      private static const const_2170:Class = name_2844;
      
      private static const const_2172:Class = name_2842;
      
      private static const const_2069:Class = name_2847;
      
      private static const const_2174:Class = name_2845;
      
      private static const const_2064:Class = name_2846;
      
      private static const const_2171:Class = name_2843;
      
      public static const const_2176:int = 5;
      
      public static const const_2177:int = 30;
      
      public static const const_2178:int = 212;
      
      private static const const_2179:int = 3;
      
      private static const const_2175:int = 7;
      
      private static const const_2173:RegExp = /^(\w*) (\d*),(\d*),(\d*),(\d*)$/;
       
      
      private const format:TextFormat = name_269.method_775(12);
      
      private const bg:class_122 = new class_122();
      
      private const const_2169:Shape = new Shape();
      
      private const const_2167:Shape = new Shape();
      
      private const const_2168:Shape = new Shape();
      
      private const name_1933:BitmapData = new const_2069().bitmapData;
      
      private const name_1934:BitmapData = new const_2170().bitmapData;
      
      private const name_1935:BitmapData = new const_2064().bitmapData;
      
      private const const_2085:BitmapData = new const_2174().bitmapData;
      
      private const const_2084:BitmapData = new const_2172().bitmapData;
      
      private const const_2083:BitmapData = new const_2171().bitmapData;
      
      public var textField:TextField;
      
      private var var_2645:Boolean;
      
      private var var_2779:Boolean = true;
      
      private var _width:int;
      
      private var _height:int;
      
      public function TankInput()
      {
         super();
         addChild(this.bg);
         this.bg.addChild(this.const_2169);
         this.bg.addChild(this.const_2167);
         this.bg.addChild(this.const_2168);
         this.method_2617();
         this.height = 30;
         this.width = 212;
      }
      
      private function method_2617() : void
      {
         var _loc1_:String = Capabilities.version;
         var _loc2_:Object = const_2173.exec(_loc1_);
         if(_loc2_ != null && Number(_loc2_[2] + "." + _loc2_[3]) < 10.1)
         {
            this.textField = new name_2777();
         }
         else
         {
            this.textField = new TextField();
         }
         this.textField.defaultTextFormat = new TextFormat("Tahoma",12,16777215,false);
         this.textField.antiAliasType = AntiAliasType.ADVANCED;
         this.textField.gridFitType = GridFitType.PIXEL;
         this.textField.embedFonts = name_269.method_774();
         this.textField.type = TextFieldType.INPUT;
         this.textField.x = 3;
         this.textField.y = 7;
         this.method_2615();
         this.textField.sharpness = name_1986.name_2778;
         this.textField.thickness = name_1986.name_2779;
         this.textField.addEventListener(MouseEvent.MOUSE_OVER,this.method_1530);
         this.textField.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         addChild(this.textField);
      }
      
      private function method_2615() : void
      {
         this.textField.height = this._height - 2 * 5;
      }
      
      private function method_1530(param1:MouseEvent) : void
      {
         Mouse.cursor = MouseCursor.IBEAM;
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         Mouse.cursor = MouseCursor.AUTO;
      }
      
      public function set enable(param1:Boolean) : void
      {
         this.textField.type = param1 ? TextFieldType.INPUT : TextFieldType.DYNAMIC;
         this.textField.selectable = param1;
         this.textField.mouseEnabled = param1;
         this.textField.mouseWheelEnabled = param1;
         this.textField.tabEnabled = param1;
      }
      
      override public function set x(param1:Number) : void
      {
         super.x = int(param1);
      }
      
      override public function set y(param1:Number) : void
      {
         super.y = int(param1);
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = Math.ceil(param1);
         this.textField.width = this._width - 6;
         this.draw();
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = Math.ceil(param1);
         this.method_2615();
         this.draw();
      }
      
      public function set align(param1:String) : void
      {
         this.format.align = param1;
         this.method_2616();
      }
      
      private function method_2616() : void
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
         return this.textField.text;
      }
      
      public function set value(param1:String) : void
      {
         this.textField.text = param1;
      }
      
      public function set hidden(param1:Boolean) : void
      {
         this.var_2645 = param1;
         this.textField.displayAsPassword = this.var_2645;
      }
      
      public function get hidden() : Boolean
      {
         return this.var_2645;
      }
      
      public function set validValue(param1:Boolean) : void
      {
         this.var_2779 = param1;
         this.draw();
      }
      
      public function get validValue() : Boolean
      {
         return this.var_2779;
      }
      
      private function draw() : void
      {
         var _loc1_:Graphics = this.const_2169.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(this.var_2779 ? this.name_1933 : this.const_2085);
         _loc1_.drawRect(0,0,5,this._height);
         _loc1_.endFill();
         this.const_2169.x = 0;
         this.const_2169.y = 0;
         var _loc2_:Graphics = this.const_2167.graphics;
         _loc2_.clear();
         _loc2_.beginBitmapFill(this.var_2779 ? this.name_1934 : this.const_2084);
         _loc2_.drawRect(0,0,this._width - 2 * 5,this._height);
         _loc2_.endFill();
         this.const_2167.x = 5;
         this.const_2167.y = 0;
         var _loc3_:Graphics = this.const_2168.graphics;
         _loc3_.clear();
         _loc3_.beginBitmapFill(this.var_2779 ? this.name_1935 : this.const_2083);
         _loc3_.drawRect(0,0,5,this._height);
         _loc3_.endFill();
         this.const_2168.x = this._width - 5;
         this.const_2168.y = 0;
      }
   }
}
