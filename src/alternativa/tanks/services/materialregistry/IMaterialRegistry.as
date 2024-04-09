package alternativa.tanks.services.materialregistry
{
   import alternativa.tanks.engine3d.IndexedTextureConstructor;
   import alternativa.tanks.engine3d.name_966;
   import alternativa.tanks.engine3d.name_968;
   import alternativa.tanks.vehicles.tanks.name_967;
   
   public interface IMaterialRegistry
   {
       
      
      function get useMipMapping() : Boolean;
      
      function set useMipMapping(param1:Boolean) : void;
      
      function get textureMaterialRegistry() : name_966;
      
      function get method_499() : name_968;
      
      function get method_497() : name_967;
      
      function get method_500() : name_966;
      
      function clear() : void;
      
      function method_498() : IndexedTextureConstructor;
   }
}
