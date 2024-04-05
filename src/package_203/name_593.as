package package_203
{
   import alternativa.tanks.models.user.name_65;
   import package_224.LicenseClanUserModelBase;
   import package_224.name_615;
   import platform.client.fp10.core.model.name_170;
   
   public class name_593 extends LicenseClanUserModelBase implements name_615, name_170
   {
      
      public static var clanUserService:name_65;
       
      
      public function name_593()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         if(method_771() == null)
         {
            return;
         }
         clanUserService.hasClanLicense = method_771().clanLicense;
         clanUserService.licenseGarageObject = method_771().licenseGarageObject;
      }
      
      public function method_1443() : void
      {
         clanUserService.hasClanLicense = true;
      }
      
      public function method_1444() : void
      {
         clanUserService.hasClanLicense = false;
      }
   }
}
