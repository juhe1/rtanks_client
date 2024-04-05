package package_455
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import forms.battlelist.BattleMode;
   
   public class name_3448
   {
      
      private static const const_2859:Class = name_3635;
      
      private static const const_2860:BitmapData = Bitmap(new const_2859()).bitmapData;
      
      private static const const_2858:Class = name_3633;
      
      private static const const_2863:BitmapData = Bitmap(new const_2858()).bitmapData;
      
      private static const const_2864:Class = name_3632;
      
      private static const const_2857:BitmapData = Bitmap(new const_2864()).bitmapData;
      
      private static const const_2862:Class = name_3634;
      
      private static const const_2861:BitmapData = Bitmap(new const_2862()).bitmapData;
       
      
      public function name_3448()
      {
         super();
      }
      
      public static function method_2322(param1:BattleMode) : BitmapData
      {
         switch(param1)
         {
            case BattleMode.DM:
               return const_2860;
            case BattleMode.TDM:
               return const_2863;
            case BattleMode.CTF:
               return const_2857;
            case BattleMode.CP:
               return const_2861;
            default:
               return null;
         }
      }
   }
}
