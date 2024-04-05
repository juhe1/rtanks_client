package controls.base
{
   import controls.name_2777;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   
   public class name_2536 extends name_2777
   {
       
      
      public function name_2536()
      {
         super();
      }
      
      override public function set selectable(param1:Boolean) : void
      {
         super.selectable = param1;
         if(param1)
         {
            addEventListener(MouseEvent.MOUSE_OVER,this.method_1530);
            addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         }
         else
         {
            removeEventListener(MouseEvent.MOUSE_OVER,this.method_1530);
            removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         }
      }
      
      private function method_1530(param1:MouseEvent) : void
      {
         Mouse.cursor = MouseCursor.IBEAM;
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         Mouse.cursor = MouseCursor.AUTO;
      }
   }
}
