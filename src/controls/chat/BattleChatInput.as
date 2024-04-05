package controls.chat
{
   import controls.Label;
   import controls.base.name_2536;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TextEvent;
   import flash.system.Capabilities;
   import flash.text.AntiAliasType;
   import flash.text.GridFitType;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import forms.name_1139;
   import package_280.name_2014;
   import var_5.name_269;
   
   public class BattleChatInput extends Sprite
   {
      
      private static const const_1877:Class = name_2532;
      
      private static const const_1860:BitmapData = new const_1877().bitmapData;
      
      private static const const_1870:Class = name_2535;
      
      private static const const_1861:BitmapData = new const_1870().bitmapData;
      
      private static const const_1880:Class = name_2531;
      
      private static const const_1862:BitmapData = new const_1880().bitmapData;
      
      private static const const_1871:Class = name_2526;
      
      private static const const_1878:BitmapData = new const_1871().bitmapData;
      
      private static const const_1867:Class = name_2533;
      
      private static const const_1868:BitmapData = new const_1867().bitmapData;
      
      private static const const_1876:Class = name_2530;
      
      private static const const_1882:BitmapData = new const_1876().bitmapData;
      
      private static const const_1881:Class = name_2525;
      
      private static const const_1864:BitmapData = new const_1881().bitmapData;
      
      private static const const_1865:Class = name_2534;
      
      private static const const_1869:BitmapData = new const_1865().bitmapData;
      
      private static const const_1866:Class = name_2524;
      
      private static const const_1874:BitmapData = new const_1866().bitmapData;
      
      private static const const_1879:Class = name_2528;
      
      private static const const_1872:BitmapData = new const_1879().bitmapData;
      
      private static const const_1875:Class = name_2527;
      
      private static const const_1873:BitmapData = new const_1875().bitmapData;
      
      private static const const_1883:Class = name_2529;
      
      private static const const_1863:BitmapData = new const_1883().bitmapData;
       
      
      private const format:TextFormat = name_269.method_775(11);
      
      private var bg:Sprite;
      
      private var l:Shape;
      
      private var c:Shape;
      
      private var const_1653:Shape;
      
      private var name_1933:BitmapData;
      
      private var name_1934:BitmapData;
      
      private var name_1935:BitmapData;
      
      public var var_2216:Label;
      
      public var textField:TextField;
      
      private var _width:int;
      
      private var _height:int;
      
      public function BattleChatInput()
      {
         this.bg = new Sprite();
         this.l = new Shape();
         this.c = new Shape();
         this.const_1653 = new Shape();
         super();
         this.name_1933 = const_1861;
         this.name_1935 = const_1862;
         this.name_1934 = const_1860;
         addChild(this.bg);
         this.bg.addChild(this.l);
         this.bg.addChild(this.c);
         this.bg.addChild(this.const_1653);
         this.var_2216 = new Label();
         this.var_2216.text = "Команде:";
         this.var_2216.x = 3;
         this.var_2216.y = 7;
         this.var_2216.tabEnabled = false;
         this.var_2216.antiAliasType = AntiAliasType.ADVANCED;
         this.var_2216.thickness = 150;
         this.var_2216.sharpness = 200;
         addChild(this.var_2216);
         var _loc1_:String = Capabilities.version;
         var _loc2_:RegExp = /^(\w*) (\d*),(\d*),(\d*),(\d*)$/;
         var _loc3_:Object = _loc2_.exec(_loc1_);
         if(_loc3_ != null && Number(_loc3_[2] + "." + _loc3_[3]) < 10.1)
         {
            this.textField = new name_2536();
         }
         else
         {
            this.textField = new TextField();
         }
         addChild(this.textField);
         this.format.color = 14540253;
         this.textField.tabEnabled = false;
         this.textField.defaultTextFormat = this.format;
         this.textField.antiAliasType = AntiAliasType.ADVANCED;
         this.textField.thickness = 150;
         this.textField.sharpness = 200;
         this.textField.gridFitType = GridFitType.PIXEL;
         this.textField.embedFonts = name_269.method_774();
         this.textField.type = TextFieldType.INPUT;
         this.textField.x = this.var_2216.width + 6;
         this.textField.y = 7;
         this.textField.height = 20;
         this.textField.addEventListener(Event.CHANGE,this.method_2282);
         this.width = 212;
         tabEnabled = false;
         tabChildren = false;
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
      }
      
      public function get value() : String
      {
         return this.textField.text;
      }
      
      public function set value(param1:String) : void
      {
         this.textField.text = param1;
      }
      
      private function method_2282(param1:Event) : void
      {
         dispatchEvent(new name_2014(name_2014.name_2020));
      }
      
      public function hide(param1:Event) : void
      {
         removeEventListener(Event.REMOVED_FROM_STAGE,this.hide);
         this.textField.removeEventListener(TextEvent.TEXT_INPUT,this.method_2282);
      }
      
      private function draw() : void
      {
         var _loc1_:Graphics = null;
         _loc1_ = this.l.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(this.name_1933);
         _loc1_.drawRect(0,0,5,30);
         _loc1_.endFill();
         this.l.x = 0;
         this.l.y = 0;
         _loc1_ = this.c.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(this.name_1934);
         _loc1_.drawRect(0,0,this._width - 10,30);
         _loc1_.endFill();
         this.c.x = 5;
         this.c.y = 0;
         _loc1_ = this.const_1653.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(this.name_1935);
         _loc1_.drawRect(0,0,5,30);
         _loc1_.endFill();
         this.const_1653.x = this._width - 5;
         this.const_1653.y = 0;
      }
      
      public function name_1340(param1:name_1338) : void
      {
         switch(param1)
         {
            case name_1338.BLUE:
               this.name_1933 = const_1861;
               this.name_1935 = const_1862;
               this.name_1934 = const_1860;
               this.var_2216.textColor = name_1139.const_1760;
               this.textField.textColor = name_1135.BLUE;
               break;
            case name_1338.RED:
               this.name_1933 = const_1868;
               this.name_1935 = const_1882;
               this.name_1934 = const_1878;
               this.var_2216.textColor = name_1139.const_1754;
               this.textField.textColor = name_1135.RED;
               break;
            case name_1338.name_1346:
               this.name_1933 = const_1874;
               this.name_1935 = const_1864;
               this.name_1934 = const_1869;
               this.var_2216.textColor = name_1135.name_2012;
               this.textField.textColor = name_1135.name_2012;
               break;
            case name_1338.name_1140:
               this.name_1933 = const_1872;
               this.name_1935 = const_1863;
               this.name_1934 = const_1873;
               this.var_2216.textColor = 16776960;
               this.textField.textColor = name_1135.name_1140;
         }
         this.draw();
      }
      
      public function name_1341(param1:String) : void
      {
         this.var_2216.text = param1 + ":";
         this.textField.x = this.var_2216.width + 6;
         this.textField.width = this._width - this.var_2216.width - 9;
      }
   }
}
