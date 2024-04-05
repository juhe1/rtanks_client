package controls.base
{
   import controls.Label;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import utils.name_1986;
   
   public class name_1134 extends Label
   {
       
      
      private var _autoSize:String;
      
      private var var_1969:Boolean;
      
      private var var_1970:Boolean = false;
      
      public function name_1134()
      {
         super();
         sharpness = name_1986.name_1988;
         thickness = name_1986.name_1987;
         this._autoSize = super.autoSize;
         this.var_1969 = true;
      }
      
      override public function set autoSize(param1:String) : void
      {
         super.autoSize = param1;
         this._autoSize = super.autoSize;
      }
      
      override public function set htmlText(param1:String) : void
      {
         var _loc2_:Number = NaN;
         super.autoSize = this._autoSize;
         super.htmlText = param1;
         if(super.autoSize == TextFieldAutoSize.CENTER)
         {
            _loc2_ = super.width;
            super.autoSize = TextFieldAutoSize.NONE;
            super.width = Math.ceil(_loc2_) + 1;
         }
      }
      
      public function set buttonMode(param1:Boolean) : void
      {
         this.var_1970 = param1;
         this.selectable = param1;
      }
      
      override public function set selectable(param1:Boolean) : void
      {
         super.selectable = param1;
         this.method_2077();
      }
      
      public function get correctCursorBehaviour() : Boolean
      {
         return this.var_1969;
      }
      
      public function set correctCursorBehaviour(param1:Boolean) : void
      {
         this.var_1969 = param1;
         this.method_2077();
      }
      
      private function method_2077() : void
      {
         if(super.selectable && this.var_1969)
         {
            addEventListener(MouseEvent.ROLL_OVER,this.method_1530);
            addEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
         }
         else
         {
            removeEventListener(MouseEvent.ROLL_OVER,this.method_1530);
            removeEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
         }
      }
      
      private function method_1530(param1:MouseEvent) : void
      {
         Mouse.cursor = this.var_1970 ? MouseCursor.BUTTON : MouseCursor.IBEAM;
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         Mouse.cursor = MouseCursor.AUTO;
      }
   }
}
