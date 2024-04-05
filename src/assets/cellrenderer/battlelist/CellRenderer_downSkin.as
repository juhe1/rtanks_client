package assets.cellrenderer.battlelist
{
   import flash.filters.GlowFilter;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.cellrenderer.battlelist.CellRenderer_downSkin")]
   public class CellRenderer_downSkin extends class_205
   {
       
      
      public function CellRenderer_downSkin()
      {
         super();
         filters = [new GlowFilter(16777215,0.1,20,20,2,1,true)];
      }
   }
}
