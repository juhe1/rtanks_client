package controls.base
{
   import controls.TankInput;
   import flash.events.MouseEvent;
   import flash.text.TextFieldType;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   
   public class name_2016 extends controls.TankInput
   {
       
      
      public function name_2016()
      {
         super();
         _label.sharpness = 40;
         _label.thickness = 70;
         textField.sharpness = -210;
         textField.thickness = 50;
         textField.addEventListener(MouseEvent.MOUSE_OVER,this.method_1530);
         textField.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
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
         textField.type = param1 ? TextFieldType.INPUT : TextFieldType.DYNAMIC;
         textField.selectable = param1;
         textField.mouseEnabled = param1;
         textField.mouseWheelEnabled = param1;
         textField.tabEnabled = param1;
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
         super.width = Math.ceil(param1);
      }
      
      override public function set height(param1:Number) : void
      {
         super.height = Math.ceil(param1);
      }
   }
}
