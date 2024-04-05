package package_257
{
   import alternativa.osgi.OSGi;
   import package_95.name_298;
   
   public class NewbieUserServiceImpl implements name_811
   {
      
      public static var storageService:name_298 = OSGi.getInstance().name_6(name_298) as name_298;
       
      
      public function NewbieUserServiceImpl()
      {
         super();
      }
      
      public function get isNewbieUser() : Boolean
      {
         return storageService.getStorage().data.isNewbieUser;
      }
      
      public function set isNewbieUser(param1:Boolean) : void
      {
         storageService.getStorage().data.isNewbieUser = param1;
      }
   }
}
