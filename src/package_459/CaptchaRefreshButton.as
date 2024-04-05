package package_459
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class CaptchaRefreshButton extends Sprite
   {
      
      private static const _bitmapData:Class = name_3653;
      
      private static const bitmapData:BitmapData = new _bitmapData().bitmapData;
       
      
      private var bitmap:Bitmap;
      
      public function CaptchaRefreshButton()
      {
         super();
         this.bitmap = new Bitmap(bitmapData);
         addChild(this.bitmap);
         addEventListener(MouseEvent.MOUSE_DOWN,this.method_3296);
         addEventListener(MouseEvent.MOUSE_UP,this.method_3296);
      }
      
      private function method_3296(param1:MouseEvent) : void
      {
         this.bitmap.y = param1.type == MouseEvent.MOUSE_DOWN ? 1 : 0;
      }
   }
}
