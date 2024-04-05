package
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   
   public class SmallRankIcon extends name_2193
   {
      
      private static const const_1727:Bitmap = new Bitmap(new BitmapData(1,1));
       
      
      public function SmallRankIcon(param1:int = 1)
      {
         super();
         name_2152(param1);
      }
      
      override protected function method_2045(param1:int) : Bitmap
      {
         if(param1 <= 0 || param1 > DefaultRanksBitmaps.name_2364.length)
         {
            return const_1727;
         }
         return new Bitmap(DefaultRanksBitmaps.name_2364[param1 - 1]);
      }
      
      override protected function method_2046(param1:int) : Bitmap
      {
         if(param1 <= 0 || param1 > PremiumRankBitmaps.name_2364.length)
         {
            return const_1727;
         }
         return new Bitmap(PremiumRankBitmaps.name_2364[param1 - 1]);
      }
   }
}
