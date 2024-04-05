package controls
{
   import assets.combo.name_2782;
   import assets.combo.name_2783;
   import assets.combo.name_2784;
   import assets.combo.name_2785;
   import assets.combo.name_2786;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   
   [Embed(source="/_assets/assets.swf", symbol="controls.ComboButton")]
   public class ComboButton extends MovieClip
   {
       
      
      public var var_1237:name_2782;
      
      public var var_1235:name_2782;
      
      public var var_1238:name_2782;
      
      public var var_1239:name_2782;
      
      private var _label:Label;
      
      public var var_1241:uint = 16777215;
      
      private var var_1240:Boolean = true;
      
      private var _width:int;
      
      public function ComboButton()
      {
         this.var_1237 = new name_2784();
         this.var_1235 = new name_2786();
         this.var_1238 = new name_2785();
         this.var_1239 = new name_2783();
         this._label = new Label();
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
      
      override public function set width(param1:Number) : void
      {
         this._width = int(param1);
         this.var_1238.width = this.var_1239.width = this.var_1235.width = this.var_1237.width = this._width;
         this._label.width = this._width - 37;
      }
      
      public function configUI() : void
      {
         addChild(this.var_1239);
         addChild(this.var_1238);
         addChild(this.var_1235);
         addChild(this.var_1237);
         addChild(this._label);
         this._label.color = this.var_1241;
         this._label.align = TextFormatAlign.LEFT;
         this._label.autoSize = TextFieldAutoSize.NONE;
         this._label.selectable = false;
         this._label.x = 5;
         this._label.y = 6;
         this._label.width = 92;
         this._label.height = 22;
         this._label.mouseEnabled = false;
         this._label.filters = [new DropShadowFilter(1,45,0,0.7,1,1,1)];
      }
      
      private function method_1472() : void
      {
         this.setState(1);
         buttonMode = true;
         mouseEnabled = true;
         addEventListener(MouseEvent.MOUSE_OVER,this.method_1470);
         addEventListener(MouseEvent.MOUSE_OUT,this.method_1470);
         addEventListener(MouseEvent.MOUSE_DOWN,this.method_1470);
         addEventListener(MouseEvent.MOUSE_UP,this.method_1470);
      }
      
      private function method_91() : void
      {
         this.setState(0);
         buttonMode = false;
         mouseEnabled = false;
         removeEventListener(MouseEvent.MOUSE_OVER,this.method_1470);
         removeEventListener(MouseEvent.MOUSE_OUT,this.method_1470);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.method_1470);
         removeEventListener(MouseEvent.MOUSE_UP,this.method_1470);
      }
      
      private function method_1470(param1:MouseEvent) : void
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
      
      private function setState(param1:int = 0) : void
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
