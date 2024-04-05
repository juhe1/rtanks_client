package assets.cellrenderer.battlelist
{
   import flash.filters.GlowFilter;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.cellrenderer.battlelist.CellRenderer_disabledSelectedDownSkin")]
   public class CellRenderer_disabledSelectedDownSkin extends class_206
   {
       
      
      public function CellRenderer_disabledSelectedDownSkin()
      {
         super();
         filters = [new GlowFilter(16777215,0.1,20,20,2,1,true)];
      }
   }
}
