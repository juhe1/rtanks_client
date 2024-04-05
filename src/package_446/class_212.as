package package_446
{
   import controls.base.name_1134;
   import controls.panel.BaseButton;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class class_212 extends BaseButton
   {
      
      private static const const_2637:int = 4;
       
      
      private var _icon:Bitmap;
      
      private var var_3414:Bitmap;
      
      private var var_3415:Bitmap;
      
      private var var_3412:name_1134;
      
      private var _x:int;
      
      private var _y:int;
      
      protected var var_3163:int;
      
      public function class_212(param1:Bitmap, param2:int, param3:int, param4:Bitmap, param5:Bitmap)
      {
         this._icon = param1;
         this.var_3415 = param5;
         this.var_3414 = param4;
         this._x = param2;
         this._y = param3;
         super();
         this.method_582();
      }
      
      private function method_582() : void
      {
         this.var_3412 = new name_1134();
         this.var_3412.x = 18;
         this.var_3412.y = 4;
         this.var_3412.width = this.width - 18;
         this.var_3412.autoSize = TextFieldAutoSize.CENTER;
         this.var_3412.mouseEnabled = false;
         addChild(this.var_3412);
      }
      
      override protected function configUI() : void
      {
         addChild(this.var_3415);
         addChild(this.var_3414);
         this.var_3414.visible = false;
         this._icon.x = this._x;
         this._icon.y = this._y;
         addChild(this._icon);
      }
      
      override protected function method_1472() : void
      {
         buttonMode = true;
         mouseEnabled = true;
         mouseChildren = true;
         addEventListener(MouseEvent.MOUSE_OVER,this.method_1470);
         addEventListener(MouseEvent.MOUSE_OUT,this.method_1470);
         addEventListener(MouseEvent.MOUSE_DOWN,this.method_1470);
         addEventListener(MouseEvent.MOUSE_UP,this.method_1470);
      }
      
      override protected function method_91() : void
      {
         buttonMode = false;
         mouseEnabled = false;
         mouseChildren = false;
         removeEventListener(MouseEvent.MOUSE_OVER,this.method_1470);
         removeEventListener(MouseEvent.MOUSE_OUT,this.method_1470);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.method_1470);
         removeEventListener(MouseEvent.MOUSE_UP,this.method_1470);
      }
      
      override protected function method_1470(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.var_3163 = y;
               this.var_3414.visible = true;
               break;
            case MouseEvent.MOUSE_OUT:
               y = this.var_3163;
               this.var_3414.visible = false;
               break;
            case MouseEvent.MOUSE_DOWN:
               y = this.var_3163 + 1;
               this.var_3414.visible = false;
               break;
            case MouseEvent.MOUSE_UP:
               y = this.var_3163;
               this.var_3414.visible = false;
         }
      }
      
      override public function set label(param1:String) : void
      {
         this.var_3412.htmlText = param1;
      }
   }
}
