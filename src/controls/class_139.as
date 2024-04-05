package controls
{
   import assets.button.button_OFF_CENTER;
   import assets.button.button_OFF_LEFT;
   import assets.button.button_OFF_RIGHT;
   import assets.button.button_blue_DOWN_CENTER;
   import assets.button.button_blue_DOWN_LEFT;
   import assets.button.button_blue_DOWN_RIGHT;
   import assets.button.button_blue_OVER_CENTER;
   import assets.button.button_blue_OVER_LEFT;
   import assets.button.button_blue_OVER_RIGHT;
   import assets.button.button_blue_UP_CENTER;
   import assets.button.button_blue_UP_LEFT;
   import assets.button.button_blue_UP_RIGHT;
   import assets.button.button_def_DOWN_CENTER;
   import assets.button.button_def_DOWN_LEFT;
   import assets.button.button_def_DOWN_RIGHT;
   import assets.button.button_def_OVER_CENTER;
   import assets.button.button_def_OVER_LEFT;
   import assets.button.button_def_OVER_RIGHT;
   import assets.button.button_def_UP_CENTER;
   import assets.button.button_def_UP_LEFT;
   import assets.button.button_def_UP_RIGHT;
   import assets.button.button_red_DOWN_CENTER;
   import assets.button.button_red_DOWN_LEFT;
   import assets.button.button_red_DOWN_RIGHT;
   import assets.button.button_red_OVER_CENTER;
   import assets.button.button_red_OVER_LEFT;
   import assets.button.button_red_OVER_RIGHT;
   import assets.button.button_red_UP_CENTER;
   import assets.button.button_red_UP_LEFT;
   import assets.button.button_red_UP_RIGHT;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class class_139 extends MovieClip
   {
      
      public static const package_313:String = "def";
      
      public static const RED:String = "red";
      
      public static const BLUE:String = "blue";
       
      
      public var var_1237:name_1932;
      
      public var var_1235:name_1932;
      
      public var var_1238:name_1932;
      
      public var var_1239:name_1932;
      
      protected var _label:Label;
      
      protected var var_1236:name_1936;
      
      public var var_1241:uint = 16777215;
      
      private var format:TextFormat;
      
      private var var_1240:Boolean = true;
      
      protected var _width:int;
      
      public function class_139()
      {
         this.var_1237 = new name_1932();
         this.var_1235 = new name_1932();
         this.var_1238 = new name_1932();
         this.var_1239 = new name_1932();
         this._label = new Label();
         this.format = new TextFormat("MyriadPro",12);
         super();
         this.configUI();
         this.enable = true;
         tabEnabled = false;
      }
      
      public function get label() : String
      {
         return this._label.text;
      }
      
      public function set label(param1:String) : void
      {
         this._label.text = param1;
      }
      
      public function set method_1474(param1:String) : void
      {
         if(this.var_1236 != null)
         {
            this.var_1236.text = param1;
            return;
         }
         this.var_1236 = new name_1936();
         this.var_1236.text = param1;
         addChild(this.var_1236);
         this.var_1236.visible = false;
         this.var_1236.y = -this.var_1236.height;
         addEventListener(MouseEvent.MOUSE_OVER,this.method_1473);
         addEventListener(MouseEvent.MOUSE_OUT,this.method_1471);
      }
      
      private function method_1473(param1:Event) : void
      {
         this.var_1236.visible = true;
      }
      
      private function method_1471(param1:Event) : void
      {
         this.var_1236.visible = false;
      }
      
      public function set enable(param1:Boolean) : void
      {
         this.var_1240 = param1;
         if(this.var_1240)
         {
            this.method_1472();
         }
         else
         {
            this.method_91();
         }
      }
      
      public function get enable() : Boolean
      {
         return this.var_1240;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = int(param1);
         this.var_1238.width = this.var_1239.width = this.var_1235.width = this.var_1237.width = this._width;
         this._label.width = this._width - 4;
      }
      
      public function configUI() : void
      {
         addChild(this.var_1239);
         addChild(this.var_1238);
         addChild(this.var_1235);
         addChild(this.var_1237);
         addChild(this._label);
         this.format.align = "center";
         this.format.color = this.var_1241;
         this._label.align = TextFormatAlign.CENTER;
         this._label.autoSize = TextFieldAutoSize.NONE;
         this._label.selectable = false;
         this._label.x = 2;
         this._label.y = 6;
         this._label.width = 92;
         this._label.height = 22;
         this._label.mouseEnabled = false;
         this._label.filters = [new DropShadowFilter(1,45,0,0.7,1,1,1)];
      }
      
      protected function method_1472() : void
      {
         this.setState(1);
         buttonMode = true;
         mouseEnabled = true;
         mouseChildren = true;
         addEventListener(MouseEvent.MOUSE_OVER,this.method_1470);
         addEventListener(MouseEvent.MOUSE_OUT,this.method_1470);
         addEventListener(MouseEvent.MOUSE_DOWN,this.method_1470);
         addEventListener(MouseEvent.MOUSE_UP,this.method_1470);
      }
      
      protected function method_91() : void
      {
         this.setState(0);
         buttonMode = false;
         mouseEnabled = false;
         mouseChildren = false;
         removeEventListener(MouseEvent.MOUSE_OVER,this.method_1470);
         removeEventListener(MouseEvent.MOUSE_OUT,this.method_1470);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.method_1470);
         removeEventListener(MouseEvent.MOUSE_UP,this.method_1470);
      }
      
      protected function method_1470(param1:MouseEvent) : void
      {
         if(this.var_1240)
         {
            switch(param1.type)
            {
               case MouseEvent.MOUSE_OVER:
                  this.setState(2);
                  this._label.y = 6;
                  break;
               case MouseEvent.MOUSE_OUT:
                  this.setState(1);
                  this._label.y = 6;
                  break;
               case MouseEvent.MOUSE_DOWN:
                  this.setState(3);
                  this._label.y = 7;
                  break;
               case MouseEvent.MOUSE_UP:
                  this.setState(1);
                  this._label.y = 6;
            }
         }
      }
      
      protected function setState(param1:int = 0) : void
      {
         switch(param1)
         {
            case 0:
               this.var_1239.alpha = 1;
               this.var_1237.alpha = 0;
               this.var_1235.alpha = 0;
               this.var_1238.alpha = 0;
               break;
            case 1:
               this.var_1239.alpha = 0;
               this.var_1237.alpha = 1;
               this.var_1235.alpha = 0;
               this.var_1238.alpha = 0;
               break;
            case 2:
               this.var_1239.alpha = 0;
               this.var_1237.alpha = 0;
               this.var_1235.alpha = 1;
               this.var_1238.alpha = 0;
               break;
            case 3:
               this.var_1239.alpha = 0;
               this.var_1237.alpha = 0;
               this.var_1235.alpha = 0;
               this.var_1238.alpha = 1;
         }
      }
      
      public function setStyle(param1:String = "def") : void
      {
         var _loc3_:String = null;
         var _loc2_:* = "button_" + param1 + "_";
         _loc3_ = "UP";
         this.var_1237.name_1933 = this.method_1469(_loc2_ + _loc3_ + "_LEFT");
         this.var_1237.name_1934 = this.method_1469(_loc2_ + _loc3_ + "_CENTER");
         this.var_1237.name_1935 = this.method_1469(_loc2_ + _loc3_ + "_RIGHT");
         _loc3_ = "OVER";
         this.var_1235.name_1933 = this.method_1469(_loc2_ + _loc3_ + "_LEFT");
         this.var_1235.name_1934 = this.method_1469(_loc2_ + _loc3_ + "_CENTER");
         this.var_1235.name_1935 = this.method_1469(_loc2_ + _loc3_ + "_RIGHT");
         _loc3_ = "DOWN";
         this.var_1238.name_1933 = this.method_1469(_loc2_ + _loc3_ + "_LEFT");
         this.var_1238.name_1934 = this.method_1469(_loc2_ + _loc3_ + "_CENTER");
         this.var_1238.name_1935 = this.method_1469(_loc2_ + _loc3_ + "_RIGHT");
         _loc3_ = "OFF";
         _loc2_ = "button_";
         this.var_1239.name_1933 = this.method_1469(_loc2_ + _loc3_ + "_LEFT");
         this.var_1239.name_1934 = this.method_1469(_loc2_ + _loc3_ + "_CENTER");
         this.var_1239.name_1935 = this.method_1469(_loc2_ + _loc3_ + "_RIGHT");
         this.width = 96;
      }
      
      private function method_1469(param1:String) : BitmapData
      {
         var _loc2_:BitmapData = new BitmapData(1,1);
         switch(param1)
         {
            case "button_def_UP_LEFT":
               _loc2_ = new button_def_UP_LEFT(1,1);
               break;
            case "button_def_UP_CENTER":
               _loc2_ = new button_def_UP_CENTER(1,1);
               break;
            case "button_def_UP_RIGHT":
               _loc2_ = new button_def_UP_RIGHT(1,1);
               break;
            case "button_def_OVER_LEFT":
               _loc2_ = new button_def_OVER_LEFT(1,1);
               break;
            case "button_def_OVER_CENTER":
               _loc2_ = new button_def_OVER_CENTER(1,1);
               break;
            case "button_def_OVER_RIGHT":
               _loc2_ = new button_def_OVER_RIGHT(1,1);
               break;
            case "button_def_DOWN_LEFT":
               _loc2_ = new button_def_DOWN_LEFT(1,1);
               break;
            case "button_def_DOWN_CENTER":
               _loc2_ = new button_def_DOWN_CENTER(1,1);
               break;
            case "button_def_DOWN_RIGHT":
               _loc2_ = new button_def_DOWN_RIGHT(1,1);
               break;
            case "button_red_UP_LEFT":
               _loc2_ = new button_red_UP_LEFT(1,1);
               break;
            case "button_red_UP_CENTER":
               _loc2_ = new button_red_UP_CENTER(1,1);
               break;
            case "button_red_UP_RIGHT":
               _loc2_ = new button_red_UP_RIGHT(1,1);
               break;
            case "button_red_OVER_LEFT":
               _loc2_ = new button_red_OVER_LEFT(1,1);
               break;
            case "button_red_OVER_CENTER":
               _loc2_ = new button_red_OVER_CENTER(1,1);
               break;
            case "button_red_OVER_RIGHT":
               _loc2_ = new button_red_OVER_RIGHT(1,1);
               break;
            case "button_red_DOWN_LEFT":
               _loc2_ = new button_red_DOWN_LEFT(1,1);
               break;
            case "button_red_DOWN_CENTER":
               _loc2_ = new button_red_DOWN_CENTER(1,1);
               break;
            case "button_red_DOWN_RIGHT":
               _loc2_ = new button_red_DOWN_RIGHT(1,1);
               break;
            case "button_blue_UP_LEFT":
               _loc2_ = new button_blue_UP_LEFT(1,1);
               break;
            case "button_blue_UP_CENTER":
               _loc2_ = new button_blue_UP_CENTER(1,1);
               break;
            case "button_blue_UP_RIGHT":
               _loc2_ = new button_blue_UP_RIGHT(1,1);
               break;
            case "button_blue_OVER_LEFT":
               _loc2_ = new button_blue_OVER_LEFT(1,1);
               break;
            case "button_blue_OVER_CENTER":
               _loc2_ = new button_blue_OVER_CENTER(1,1);
               break;
            case "button_blue_OVER_RIGHT":
               _loc2_ = new button_blue_OVER_RIGHT(1,1);
               break;
            case "button_blue_DOWN_LEFT":
               _loc2_ = new button_blue_DOWN_LEFT(1,1);
               break;
            case "button_blue_DOWN_CENTER":
               _loc2_ = new button_blue_DOWN_CENTER(1,1);
               break;
            case "button_blue_DOWN_RIGHT":
               _loc2_ = new button_blue_DOWN_RIGHT(1,1);
               break;
            case "button_OFF_LEFT":
               _loc2_ = new button_OFF_LEFT(1,1);
               break;
            case "button_OFF_CENTER":
               _loc2_ = new button_OFF_CENTER(1,1);
               break;
            case "button_OFF_RIGHT":
               _loc2_ = new button_OFF_RIGHT(1,1);
         }
         return _loc2_;
      }
   }
}
