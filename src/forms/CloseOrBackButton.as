package forms
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class CloseOrBackButton extends Sprite
   {
      
      private static const const_2632:Class = name_3363;
      
      private static const const_2631:Class = name_3364;
      
      private static const const_2633:int = 7;
       
      
      private var var_3407:Bitmap;
      
      private var var_3406:Bitmap;
      
      public function CloseOrBackButton()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         graphics.clear();
         graphics.beginFill(16711680,0);
         graphics.drawRect(0,0,25,25);
         graphics.endFill();
         this.var_3406 = new Bitmap(new const_2631().bitmapData);
         addChild(this.var_3406);
         this.var_3407 = new Bitmap(new const_2632().bitmapData);
         addChild(this.var_3407);
         buttonMode = true;
         this.method_1579();
      }
      
      private function method_1579() : void
      {
         addEventListener(MouseEvent.MOUSE_OVER,this.method_1470);
         addEventListener(MouseEvent.MOUSE_OUT,this.method_1470);
         addEventListener(MouseEvent.MOUSE_DOWN,this.method_1470);
         addEventListener(MouseEvent.MOUSE_UP,this.method_1470);
      }
      
      protected function method_1470(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
            case MouseEvent.MOUSE_OUT:
            case MouseEvent.MOUSE_UP:
               this.y = 0;
               break;
            case MouseEvent.MOUSE_DOWN:
               this.y = 1;
         }
      }
      
      public function get type() : int
      {
         return 7;
      }
      
      public function get enable() : Boolean
      {
         return true;
      }
      
      public function name_1045() : void
      {
         this.var_3407.visible = false;
         this.var_3406.visible = true;
      }
      
      public function name_1025() : void
      {
         this.var_3407.visible = true;
         this.var_3406.visible = false;
      }
      
      public function show() : void
      {
         this.visible = true;
      }
      
      public function hide() : void
      {
         this.visible = false;
      }
   }
}
