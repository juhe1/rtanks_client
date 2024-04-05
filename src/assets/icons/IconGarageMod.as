package assets.icons
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.icons.IconGarageMod")]
   public class IconGarageMod extends MovieClip
   {
       
      
      public function IconGarageMod(param1:int = 0)
      {
         super();
         gotoAndStop(param1 + 1);
      }
      
      public function set mod(param1:int) : void
      {
         gotoAndStop(param1 + 1);
      }
   }
}
