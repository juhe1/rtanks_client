package alternativa.tanks.engine3d
{
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.materials.TextureMaterial;
   import flash.display.BitmapData;
   
   public class name_2325
   {
       
      
      public function name_2325()
      {
         super();
      }
      
      public static function name_2326(param1:BitmapData, param2:Boolean) : TextureMaterial
      {
         return new TextureMaterial(param1,false,true,param2 ? MipMapping.PER_PIXEL : 0);
      }
   }
}
