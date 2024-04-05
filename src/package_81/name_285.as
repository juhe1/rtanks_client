package package_81
{
   import alternativa.tanks.models.battlefield.name_83;
   import package_94.BillboardImageModelBase;
   import package_94.name_293;
   import platform.client.fp10.core.model.name_170;
   
   public class name_285 extends BillboardImageModelBase implements name_293, name_170
   {
      
      public static var battleService:name_83;
       
      
      public function name_285()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         battleService.getBattlefieldData().viewport.method_786(method_771().image.data);
      }
   }
}
