package controls.statassets
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   
   public class name_3010 extends Sprite
   {
      
      public static var bg:Bitmap = new Bitmap();
       
      
      public function name_3010()
      {
         super();
         addChild(new Bitmap(bg.bitmapData));
      }
   }
}
