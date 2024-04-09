package package_257
{
   import alternativa.osgi.OSGi;
   import package_95.IStorageService;
   
   public class NewbieUserServiceImpl implements name_811
   {
      
      public static var storageService:IStorageService = OSGi.getInstance().getService(IStorageService) as IStorageService;
       
      
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
