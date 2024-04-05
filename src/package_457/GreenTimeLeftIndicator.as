package package_457
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.PixelSnapping;
   
   public class GreenTimeLeftIndicator extends name_2935
   {
      
      private static const const_2675:Class = name_3421;
      
      private static const const_2678:BitmapData = new const_2675().bitmapData;
      
      private static const const_2677:Class = name_3420;
      
      private static const const_2676:BitmapData = new const_2677().bitmapData;
       
      
      public function GreenTimeLeftIndicator()
      {
         var_3476 = new Bitmap(const_2676,PixelSnapping.AUTO,true);
         addChild(new Bitmap(const_2678,PixelSnapping.AUTO,true));
         super();
      }
   }
}
