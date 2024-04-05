package package_472
{
   import alternativa.tanks.model.shop.class_214;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   
   public class class_215 extends class_214
   {
      
      private static const const_2462:int = 1;
       
      
      protected var var_3164:Bitmap;
      
      protected var var_1786:Bitmap;
      
      protected var var_3163:int;
      
      public function class_215(param1:name_3187)
      {
         super();
         this.method_2927(param1);
         this.init();
      }
      
      private function method_2927(param1:name_3187) : void
      {
         this.var_3164 = new Bitmap(param1.var_3164);
         this.var_1786 = new Bitmap(param1.var_1786);
         addChildAt(this.var_1786,0);
         addChildAt(this.var_3164,0);
         this.var_1786.visible = false;
      }
      
      protected function init() : void
      {
         buttonMode = true;
         addEventListener(MouseEvent.MOUSE_OVER,this.method_1470);
         addEventListener(MouseEvent.MOUSE_OUT,this.method_1470);
         addEventListener(MouseEvent.MOUSE_DOWN,this.method_1470);
         addEventListener(MouseEvent.MOUSE_UP,this.method_1470);
      }
      
      public function name_1146(param1:name_3187) : void
      {
         removeChild(this.var_3164);
         removeChild(this.var_1786);
         this.method_2927(param1);
      }
      
      private function method_1470(param1:MouseEvent) : void
      {
         this.var_1786.visible = param1.type == MouseEvent.MOUSE_OVER;
         this.var_3164.visible = !this.var_1786.visible;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.var_3163 = y;
               break;
            case MouseEvent.MOUSE_OUT:
               y = this.var_3163;
               break;
            case MouseEvent.MOUSE_UP:
               y = this.var_3163;
               break;
            case MouseEvent.MOUSE_DOWN:
               y = this.var_3163 + 1;
         }
      }
      
      override public function destroy() : void
      {
         removeEventListener(MouseEvent.MOUSE_OVER,this.method_1470);
         removeEventListener(MouseEvent.MOUSE_OUT,this.method_1470);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.method_1470);
         removeEventListener(MouseEvent.MOUSE_UP,this.method_1470);
      }
   }
}
