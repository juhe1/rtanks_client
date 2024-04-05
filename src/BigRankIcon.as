package
{
   import flash.display.Bitmap;
   
   public class BigRankIcon extends name_2193
   {
       
      
      public function BigRankIcon()
      {
         super();
      }
      
      override protected function method_2045(param1:int) : Bitmap
      {
         return new Bitmap(DefaultRanksBitmaps.name_2327[param1 - 1]);
      }
      
      override protected function method_2046(param1:int) : Bitmap
      {
         return new Bitmap(PremiumRankBitmaps.name_2327[param1 - 1]);
      }
   }
}
