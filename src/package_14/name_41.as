package package_14
{
   import alternativa.osgi.service.logging.name_26;
   
   public class name_41 implements name_533
   {
       
      
      private var logService:name_26;
      
      public function name_41(param1:name_26)
      {
         super();
         this.logService = param1;
      }
      
      public function log(param1:String, param2:String, ... rest) : void
      {
         this.logService.getLogger(param1).info(param2,rest);
      }
   }
}
