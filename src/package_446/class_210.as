package package_446
{
   import controls.Label;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   
   public class class_210 extends MovieClip
   {
      
      private static const WIDTH:int = 90;
      
      private static const Button:Class = name_3366;
      
      private static const const_2634:Class = name_3365;
      
      private static const const_2636:Class = name_3367;
      
      private static const const_2635:Class = name_3368;
       
      
      public var var_3408:Bitmap;
      
      public var var_1235:Bitmap;
      
      public var var_1238:Bitmap;
      
      public var var_3409:Bitmap;
      
      protected var _label:Label;
      
      private var var_2821:Boolean = false;
      
      public var type:int = 0;
      
      private var var_1240:Boolean = true;
      
      private var var_2822:String;
      
      protected var _icon:Bitmap;
      
      private var _selected:Boolean;
      
      private var var_3411:int;
      
      private var var_3410:int;
      
      public function class_210()
      {
         this.var_3408 = new Bitmap(Bitmap(new Button()).bitmapData);
         this.var_1235 = new Bitmap(Bitmap(new const_2634()).bitmapData);
         this.var_1238 = new Bitmap(Bitmap(new const_2636()).bitmapData);
         this.var_3409 = new Bitmap(Bitmap(new const_2635()).bitmapData);
         this._label = new Label();
         super();
         this.configUI();
         this.enable = true;
         tabEnabled = false;
      }
      
      protected function method_3075(param1:int, param2:int) : void
      {
         this.var_3411 = param1;
         this.var_3410 = param2;
         this._icon.x = this.var_3411;
         this._icon.y = this.var_3410;
      }
      
      protected function configUI() : void
      {
         addChild(this.var_3409);
         addChild(this.var_1238);
         addChild(this.var_1235);
         addChild(this.var_3408);
         addChild(this._icon);
         addChild(this._label);
         this._icon.x = 3;
         this._icon.y = 2;
         this.var_1235.visible = false;
         this.var_3409.visible = false;
         this.var_1238.visible = false;
         this.var_3408.visible = true;
      }
      
      public function set enable(param1:Boolean) : void
      {
         this.var_1240 = param1;
         if(this.var_1240)
         {
            this.method_3074();
         }
         else
         {
            this.method_3073();
         }
      }
      
      public function get enable() : Boolean
      {
         return this.var_1240;
      }
      
      private function method_3074() : void
      {
         this.method_1472();
         this.var_3408.visible = true;
         this.var_3409.visible = false;
         this.var_1235.visible = false;
         this.var_1238.visible = false;
      }
      
      private function method_3073() : void
      {
         this.method_91();
         this.var_3409.visible = true;
         this.var_1235.visible = false;
         this.var_1238.visible = false;
         this.var_3408.visible = false;
      }
      
      public function set method_2645(param1:Boolean) : void
      {
         this.var_2821 = param1;
         this._label.visible = !this.var_2821;
         this._label.width = this.var_2821 ? Number(1) : Number(90 - this._label.x - 3);
         this._label.text = this.var_2821 ? "" : this.var_2822;
         this.enable = this.var_1240;
      }
      
      public function set label(param1:String) : void
      {
         this._label.autoSize = TextFieldAutoSize.NONE;
         this._label.align = TextFormatAlign.CENTER;
         this._label.height = 19;
         this._label.x = this._icon.x + this._icon.width - 3;
         this._label.y = 4;
         this._label.width = 90 - this._label.x - 3;
         this._label.mouseEnabled = false;
         this._label.filters = [new DropShadowFilter(1,45,0,0.7,1,1,1)];
         this._label.text = param1;
         this.var_2822 = param1;
      }
      
      protected function method_1472() : void
      {
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
         this._label.y = 4;
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
         this.var_1235.visible = false;
         this.var_3409.visible = false;
         this.var_1238.visible = false;
         this.var_3408.visible = false;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this._label.y = 4;
               this._icon.y = this.var_3410;
               this.var_1235.visible = true;
               break;
            case MouseEvent.MOUSE_OUT:
               this._label.y = 4;
               this._icon.y = this.var_3410;
               this.var_3408.visible = true;
               break;
            case MouseEvent.MOUSE_DOWN:
               this._label.y = 5;
               this._icon.y = this.var_3410 + 1;
               this.var_1238.visible = true;
               break;
            case MouseEvent.MOUSE_UP:
               this.var_3408.visible = true;
               this._label.y = 4;
               this._icon.y = this.var_3410;
         }
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
         if(this.selected)
         {
            this.var_3409.visible = true;
            this.var_1235.visible = false;
            this.var_1238.visible = false;
            this.var_3408.visible = false;
            buttonMode = true;
            mouseEnabled = true;
            mouseChildren = true;
         }
      }
   }
}
