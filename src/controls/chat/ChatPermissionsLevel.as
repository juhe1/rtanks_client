package controls.chat
{
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   
   public class ChatPermissionsLevel extends MovieClip
   {
      
      private static const admin:Class = name_3660;
      
      private static const const_2874:Class = name_3664;
      
      private static const const_2875:Class = name_3669;
      
      private static const const_2876:Class = name_3662;
      
      private static const const_2872:Class = name_3666;
      
      private static const const_2870:Class = name_3667;
      
      private static const const_2871:Class = name_3665;
      
      private static const const_2873:Class = name_3668;
      
      private static const const_2868:Class = name_3661;
      
      private static const const_2869:Class = name_3663;
       
      
      public function ChatPermissionsLevel()
      {
         super();
      }
      
      public static function name_3488(param1:int) : BitmapData
      {
         switch(param1)
         {
            case 1:
               return new admin().bitmapData;
            case 2:
               return new const_2874().bitmapData;
            case 3:
               return new const_2875().bitmapData;
            case 4:
               return new const_2876().bitmapData;
            case 5:
               return new const_2872().bitmapData;
            case 6:
               return new const_2870().bitmapData;
            case 7:
               return new const_2871().bitmapData;
            case 8:
               return new const_2873().bitmapData;
            case 9:
               return new const_2868().bitmapData;
            case 10:
               return new const_2869().bitmapData;
            default:
               return new admin().bitmapData;
         }
      }
   }
}
