package alternativa.tanks.gui.tables.kits.description
{
   import flash.utils.Dictionary;
   import package_131.name_352;
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class KitsInfoData
   {
      
      private static var data:Dictionary = new Dictionary();
      
      private static var imageData:Dictionary = new Dictionary();
       
      
      public function KitsInfoData()
      {
         super();
      }
      
      public static function name_452(param1:String, param2:Vector.<name_352>, param3:int) : void
      {
         data[param1] = new name_1591(param2,param3);
      }
      
      public static function getData(param1:String) : name_1591
      {
         return data[param1];
      }
      
      public static function name_461(param1:String, param2:ImageResource) : void
      {
         imageData[param1] = param2;
      }
      
      public static function getImage(param1:String) : ImageResource
      {
         return imageData[param1];
      }
   }
}
