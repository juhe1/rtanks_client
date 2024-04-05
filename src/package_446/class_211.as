package package_446
{
   import controls.panel.BaseButton;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class class_211 extends BaseButton
   {
      
      public static const const_423:int = 28;
       
      
      protected var _icon:Bitmap;
      
      private var _x:int;
      
      private var _y:int;
      
      private var _bitmapData:BitmapData;
      
      public function class_211(param1:BitmapData, param2:int, param3:int)
      {
         this._bitmapData = param1;
         this._x = param2;
         this._y = param3;
         super();
      }
      
      override protected function configUI() : void
      {
         bg = new MainPanelHelpButton().getChildByName("b") as MovieClip;
         addChild(bg);
         this._icon = new Bitmap(this._bitmapData);
         this._icon.x = this._x;
         this._icon.y = this._y;
         addChild(this._icon);
      }
      
      override protected function method_1472() : void
      {
         bg.gotoAndStop(2);
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
         bg.gotoAndStop(1);
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
               this._icon.y = this._y;
               bg.gotoAndStop(3);
               return;
            case MouseEvent.MOUSE_OUT:
               this._icon.y = this._y;
               bg.gotoAndStop(2);
               return;
            case MouseEvent.MOUSE_DOWN:
               this._icon.y = this._y + 1;
               bg.gotoAndStop(4);
               return;
            case MouseEvent.MOUSE_UP:
               this._icon.y = this._y;
               bg.gotoAndStop(2);
               return;
            default:
               return;
         }
      }
      
      override public function get width() : Number
      {
         return 28;
      }
   }
}
