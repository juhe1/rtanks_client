package forms.battlelist
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   
   public class name_2936
   {
      
      private static const const_2683:Class = name_3429;
      
      private static const const_2679:BitmapData = Bitmap(new const_2683()).bitmapData;
      
      private static const const_2694:Class = name_3423;
      
      private static const const_2688:BitmapData = Bitmap(new const_2694()).bitmapData;
      
      private static const const_2689:Class = name_3425;
      
      private static const const_2684:BitmapData = Bitmap(new const_2689()).bitmapData;
      
      private static const const_2685:Class = name_3427;
      
      private static const const_2692:BitmapData = Bitmap(new const_2685()).bitmapData;
      
      private static const const_2681:Class = name_3424;
      
      private static const const_2680:BitmapData = Bitmap(new const_2681()).bitmapData;
      
      private static const const_2682:Class = name_3422;
      
      private static const const_2686:BitmapData = Bitmap(new const_2682()).bitmapData;
      
      private static const const_2687:Class = name_3428;
      
      private static const const_2690:BitmapData = Bitmap(new const_2687()).bitmapData;
      
      private static const const_2691:Class = name_3426;
      
      private static const const_2693:BitmapData = Bitmap(new const_2691()).bitmapData;
       
      
      public function name_2936()
      {
         super();
      }
      
      private static function method_3123(param1:BattleMode) : Bitmap
      {
         switch(param1)
         {
            case BattleMode.DM:
               return new Bitmap(const_2679);
            case BattleMode.TDM:
               return new Bitmap(const_2688);
            case BattleMode.CTF:
               return new Bitmap(const_2684);
            case BattleMode.CP:
               return new Bitmap(const_2692);
            default:
               return new Bitmap(const_2679);
         }
      }
      
      private static function method_3122(param1:BattleMode) : Bitmap
      {
         switch(param1)
         {
            case BattleMode.DM:
               return new Bitmap(const_2680);
            case BattleMode.TDM:
               return new Bitmap(const_2686);
            case BattleMode.CTF:
               return new Bitmap(const_2690);
            case BattleMode.CP:
               return new Bitmap(const_2693);
            default:
               return new Bitmap(const_2680);
         }
      }
      
      public static function name_2938(param1:BattleMode) : Bitmap
      {
         if(param1 == BattleMode.TDM)
         {
            return new Bitmap(const_2679);
         }
         return method_3123(param1);
      }
      
      public static function name_2942(param1:BattleMode) : Bitmap
      {
         if(param1 == BattleMode.TDM)
         {
            return new Bitmap(const_2680);
         }
         return method_3122(param1);
      }
   }
}
