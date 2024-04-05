package assets.icons
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.icons.BattleInfoIcons")]
   public class BattleInfoIcons extends MovieClip
   {
      
      public static const name_2345:int = 1;
      
      public static const name_2338:int = 2;
      
      public static const const_2089:int = 3;
      
      public static const const_2096:int = 4;
      
      public static const name_2347:int = 5;
      
      public static const const_2309:int = 6;
      
      public static const CTF:int = 7;
      
      public static const const_2308:int = 8;
      
      public static const INVENTORY:int = 9;
       
      
      public function BattleInfoIcons()
      {
         super();
         this.type = 1;
      }
      
      public function set type(param1:int) : void
      {
         gotoAndStop(param1);
      }
   }
}
