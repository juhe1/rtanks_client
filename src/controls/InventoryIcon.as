package controls
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="controls.InventoryIcon")]
   public class InventoryIcon extends MovieClip
   {
      
      public static const const_1902:int = 1;
      
      public static const ARMOR:int = 2;
      
      public static const const_1903:int = 3;
      
      public static const const_1904:int = 4;
      
      public static const MINE:int = 5;
      
      public static const const_1901:int = 6;
      
      public static const EMPTY:int = 7;
       
      
      public function InventoryIcon(param1:int = 1, param2:Boolean = false)
      {
         super();
         gotoAndStop(param1 + (param2 ? 7 : 0));
      }
   }
}
