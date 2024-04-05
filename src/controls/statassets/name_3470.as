package controls.statassets
{
   import controls.Label;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   
   public class name_3470 extends Sprite
   {
       
      
      private var var_2570:name_2741;
      
      private var _label:Label;
      
      public var name_3471:int = 0;
      
      protected var _selected:Boolean = false;
      
      protected var _width:int = 100;
      
      protected var _height:int = 20;
      
      public function name_3470(param1:Boolean = true)
      {
         this.var_2570 = new name_2741();
         this._label = new Label();
         super();
         this.var_2570.width = this._width;
         this.var_2570.height = this._height;
         addChild(this.var_2570);
         addChild(this._label);
         this._label.color = 860685;
         this._label.x = 2;
         this._label.y = 0;
         this._label.mouseEnabled = false;
         this._label.autoSize = TextFieldAutoSize.NONE;
         this._label.align = param1 ? TextFormatAlign.RIGHT : TextFormatAlign.LEFT;
         this._label.height = 19;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
         this.var_2570.selected = this._selected;
      }
      
      public function set label(param1:String) : void
      {
         this._label.text = param1;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = Math.floor(param1);
         this.var_2570.width = param1;
         this._label.width = this._width - 4;
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = Math.floor(param1);
         this.var_2570.height = param1;
      }
   }
}
