package package_83
{
   import alternativa.tanks.models.battlefield.IBattleField;
   import platform.client.fp10.core.model.name_141;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.battlefield.models.battle.battlefield.billboard.BillboardsModelBase;
   import projects.tanks.client.battlefield.models.battle.battlefield.billboard.name_307;
   
   public class name_283 extends BillboardsModelBase implements name_307, name_141
   {
      
      public static var battleService:IBattleField;
       
      
      public function name_283()
      {
         super();
      }
      
      public function objectLoadedPost() : void
      {
         var _loc1_:ImageResource = method_771().defaultBillboardImage;
         battleService.getBattlefieldData().viewport.method_786(_loc1_.data);
      }
   }
}
