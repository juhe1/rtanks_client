package controls.dropdownlist
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class DeleteIndicator extends Sprite
   {
      
      private static var var_3758:Class = name_3745;
      
      private static var var_3757:BitmapData = new var_3758().bitmapData;
       
      
      public var data:Object;
      
      public function DeleteIndicator(param1:Object)
      {
         super();
         this.data = param1;
         buttonMode = true;
         tabEnabled = false;
         addEventListener(MouseEvent.CLICK,this.method_2555);
         addChild(new Bitmap(var_3757));
      }
      
      private function method_2555(param1:MouseEvent) : void
      {
         visible = false;
         param1.stopPropagation();
         removeEventListener(MouseEvent.CLICK,this.method_2555);
         dispatchEvent(new DeleteEvent(this.data));
      }
   }
}
