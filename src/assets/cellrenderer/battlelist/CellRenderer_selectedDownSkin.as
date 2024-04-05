package assets.cellrenderer.battlelist
{
   import flash.filters.GlowFilter;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.cellrenderer.battlelist.CellRenderer_selectedDownSkin")]
   public class CellRenderer_selectedDownSkin extends name_2765
   {
       
      
      public function CellRenderer_selectedDownSkin()
      {
         super();
         filters = [new GlowFilter(0,0.1,20,20,2,1,true)];
      }
   }
}
