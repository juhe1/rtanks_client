package controls.panel
{
   import controls.Label;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   
   public class BaseButton extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public var b:MovieClip;
      
      protected var bg:MovieClip;
      
      protected var _label:Label;
      
      private var var_2821:Boolean = false;
      
      public var type:int = 0;
      
      private var var_1240:Boolean = true;
      
      private var var_2822:String;
      
      private var _selected:Boolean;
      
      public function BaseButton()
      {
         this._label = new Label();
         super();
         this.configUI();
         this.enable = true;
         tabEnabled = false;
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
      
      public function set method_2645(param1:Boolean) : void
      {
         this.var_2821 = param1;
         this._label.visible = !this.var_2821;
         this._label.width = this.var_2821 ? 1 : this.bg.width - this._label.x - 3;
         this._label.text = this.var_2821 ? "" : this.var_2822;
         this.enable = this.var_1240;
      }
      
      public function set label(param1:String) : void
      {
         this._label.autoSize = TextFieldAutoSize.NONE;
         this._label.align = TextFormatAlign.CENTER;
         this._label.height = 19;
         this._label.x = this.icon.x + this.icon.width - 3;
         this._label.y = 4;
         this._label.width = this.bg.width - this._label.x - 3;
         this._label.mouseEnabled = false;
         this._label.filters = [new DropShadowFilter(1,45,0,0.7,1,1,1)];
         this._label.text = param1;
         this.var_2822 = param1;
      }
      
      protected function configUI() : void
      {
         this.bg = getChildByName("b") as MovieClip;
         addChild(this._label);
      }
      
      protected function method_1472() : void
      {
         gotoAndStop(2);
         this.bg.gotoAndStop(2 + (this.var_2821 ? 4 : 0));
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
         gotoAndStop(1);
         this.bg.gotoAndStop(1 + (this.var_2821 ? 4 : 0));
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
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this._label.y = 4;
               gotoAndStop(3);
               this.bg.gotoAndStop(3 + (this.var_2821 ? 4 : 0));
               return;
            case MouseEvent.MOUSE_OUT:
               this._label.y = 4;
               gotoAndStop(2);
               this.bg.gotoAndStop(2 + (this.var_2821 ? 4 : 0));
               return;
            case MouseEvent.MOUSE_DOWN:
               this._label.y = 5;
               gotoAndStop(4);
               this.bg.gotoAndStop(4 + (this.var_2821 ? 4 : 0));
               return;
            case MouseEvent.MOUSE_UP:
               this._label.y = 4;
               gotoAndStop(2);
               this.bg.gotoAndStop(2 + (this.var_2821 ? 4 : 0));
               return;
            default:
               return;
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
            buttonMode = true;
            mouseEnabled = true;
            mouseChildren = true;
         }
      }
   }
}
