package alternativa.tanks.gui
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   
   public class UpgradeIndicator extends Sprite
   {
      
      private static const m0Class:Class = UpgradeIndicator_m0Class;
      
      private static const m1Class:Class = UpgradeIndicator_m1Class;
      
      private static const m2Class:Class = UpgradeIndicator_m2Class;
      
      private static const m3Class:Class = UpgradeIndicator_m3Class;
      
      private static const const_2884:Vector.<Bitmap> = new Vector.<Bitmap>(4);
      
      {
         const_2884[0] = new Bitmap(new m0Class().bitmapData);
         const_2884[1] = new Bitmap(new m1Class().bitmapData);
         const_2884[2] = new Bitmap(new m2Class().bitmapData);
         const_2884[3] = new Bitmap(new m3Class().bitmapData);
      }
      
      public function UpgradeIndicator()
      {
         super();
      }
      
      public function set value(param1:int) : void
      {
         if(numChildren > 0)
         {
            removeChildAt(0);
         }
         addChildAt(const_2884[param1],0);
      }
   }
}
