package assets.cellrenderer.battlelist
{
   import flash.filters.GlowFilter;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.cellrenderer.battlelist.CellRenderer_disabledDownSkin")]
   public class CellRenderer_disabledDownSkin extends class_207
   {
       
      
      public function CellRenderer_disabledDownSkin()
      {
         super();
         filters = [new GlowFilter(16777215,0.1,20,20,2,1,true)];
      }
   }
}
