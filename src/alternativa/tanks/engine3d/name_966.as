package alternativa.tanks.engine3d
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.tanks.vehicles.tanks.TankSkinPart;
   import flash.display.BitmapData;
   import package_302.AnimatedPaintMaterial;
   import package_302.PaintMaterial;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public interface name_966
   {
       
      
      function name_1193(param1:MultiframeImageResource, param2:TankSkinPart) : AnimatedPaintMaterial;
      
      function name_1191(param1:ImageResource, param2:TankSkinPart) : PaintMaterial;
      
      function set resoluion(param1:Number) : void;
      
      function get useMipMapping() : Boolean;
      
      function set useMipMapping(param1:Boolean) : void;
      
      function getMaterial(param1:name_1076, param2:BitmapData, param3:Number, param4:Boolean = true) : TextureMaterial;
      
      function clear() : void;
      
      function name_2166() : String;
      
      function disposeMaterial(param1:TextureMaterial) : void;
   }
}
