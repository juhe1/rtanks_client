package controls
{
   import assets.button.bigbutton_DOWN_CENTER;
   import assets.button.bigbutton_DOWN_LEFT;
   import assets.button.bigbutton_DOWN_RIGHT;
   import assets.button.bigbutton_OFF_CENTER;
   import assets.button.bigbutton_OFF_LEFT;
   import assets.button.bigbutton_OFF_RIGHT;
   import assets.button.bigbutton_OVER_CENTER;
   import assets.button.bigbutton_OVER_LEFT;
   import assets.button.bigbutton_OVER_RIGHT;
   import assets.button.bigbutton_UP_CENTER;
   import assets.button.bigbutton_UP_LEFT;
   import assets.button.bigbutton_UP_RIGHT;
   import assets.icons.name_3003;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   
   [Embed(source="/_assets/assets.swf", symbol="controls.BigButton")]
   public class BigButton extends MovieClip
   {
      
      public static const const_2286:BitmapData = new name_3003(35,35);
       
      
      protected var var_1237:name_3002;
      
      protected var var_1235:name_3002;
      
      protected var var_1238:name_3002;
      
      protected var var_1239:name_3002;
      
      protected var _label:Label;
      
      protected var var_2222:Label;
      
      protected var _icon:Bitmap;
      
      protected var _width:int = 100;
      
      protected var var_1240:Boolean = true;
      
      public function BigButton()
      {
         this.var_1237 = new name_3002();
         this.var_1235 = new name_3002();
         this.var_1238 = new name_3002();
         this.var_1239 = new name_3002();
         this._label = new Label();
         this.var_2222 = new Label();
         this._icon = new Bitmap();
         super();
         this.configUI();
         this.enable = true;
         tabEnabled = false;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = int(param1);
         this.var_1238.width = this.var_1239.width = this.var_1235.width = this.var_1237.width = this._width;
         this.var_2222.width = this._label.width = this._width - 4;
         if(this._icon.bitmapData != null)
         {
            this._icon.x = this._width - this._icon.width - 6;
            this._icon.y = int(25 - this._icon.height / 2);
            this._label.width = this._width - 4 - this._icon.width;
         }
      }
      
      public function set label(param1:String) : void
      {
         this._label.text = param1;
      }
      
      public function set info(param1:String) : void
      {
         this.var_2222.htmlText = param1;
      }
      
      public function set icon(param1:BitmapData) : void
      {
         if(param1 != null)
         {
            this._icon.visible = true;
            this._label.width = this._width - 4 - this._icon.width;
         }
         else
         {
            this._label.width = this._width - 4;
            this._icon.visible = false;
         }
         this._icon.bitmapData = param1;
         this.width = this._width;
      }
      
      private function configUI() : void
      {
         addChild(this.var_1239);
         addChild(this.var_1238);
         addChild(this.var_1235);
         addChild(this.var_1237);
         addChild(this._label);
         addChild(this._icon);
         this.var_2222.align = this._label.align = TextFormatAlign.CENTER;
         this.var_2222.autoSize = this._label.autoSize = TextFieldAutoSize.NONE;
         this.var_2222.selectable = this._label.selectable = false;
         this.var_2222.x = this._label.x = 2;
         this._label.y = 15;
         this.var_2222.y = 24;
         this._label.height = 24;
         this.var_2222.height = 20;
         this._label.size = 14;
         this.var_2222.mouseEnabled = this._label.mouseEnabled = false;
         this.var_2222.filters = this._label.filters = [new DropShadowFilter(1,45,0,0.7,1,1,1)];
         this.var_1237.name_1933 = new bigbutton_UP_LEFT(1,1);
         this.var_1237.name_1934 = new bigbutton_UP_CENTER(1,1);
         this.var_1237.name_1935 = new bigbutton_UP_RIGHT(1,1);
         this.var_1235.name_1933 = new bigbutton_OVER_LEFT(1,1);
         this.var_1235.name_1934 = new bigbutton_OVER_CENTER(1,1);
         this.var_1235.name_1935 = new bigbutton_OVER_RIGHT(1,1);
         this.var_1238.name_1933 = new bigbutton_DOWN_LEFT(1,1);
         this.var_1238.name_1934 = new bigbutton_DOWN_CENTER(1,1);
         this.var_1238.name_1935 = new bigbutton_DOWN_RIGHT(1,1);
         this.var_1239.name_1933 = new bigbutton_OFF_LEFT(1,1);
         this.var_1239.name_1934 = new bigbutton_OFF_CENTER(1,1);
         this.var_1239.name_1935 = new bigbutton_OFF_RIGHT(1,1);
         this.width = 120;
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
                  this._label.y = 15;
                  this.var_2222.y = 24;
                  break;
               case MouseEvent.MOUSE_OUT:
                  this.setState(1);
                  this._label.y = 15;
                  this.var_2222.y = 24;
                  break;
               case MouseEvent.MOUSE_DOWN:
                  this.setState(3);
                  this._label.y = 16;
                  this.var_2222.y = 25;
                  break;
               case MouseEvent.MOUSE_UP:
                  this.setState(1);
                  this._label.y = 15;
                  this.var_2222.y = 24;
            }
            if(this._icon != null)
            {
               this._icon.y = int(25 - this._icon.height / 2) + (param1.type == MouseEvent.MOUSE_DOWN ? 1 : 0);
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
   }
}
