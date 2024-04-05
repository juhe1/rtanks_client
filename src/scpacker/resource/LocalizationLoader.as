package scpacker.resource
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.logging.name_11;
   import alternativa.osgi.service.logging.name_26;
   import package_54.name_102;
   
   public class LocalizationLoader
   {
       
      
      private var localeService:name_102;
      
      private var var_1147:name_11;
      
      public function LocalizationLoader()
      {
         super();
         var _loc1_:OSGi = OSGi.getInstance();
         this.localeService = _loc1_.name_6(name_102) as name_102;
         this.var_1147 = _loc1_.name_6(name_26).getLogger("localization");
      }
      
      public function name_556(param1:String) : void
      {
         var parser:Object = null;
         var _loc1_:* = undefined;
         var json:String = param1;
         try
         {
            parser = JSON.parse(json);
            _loc1_ = undefined;
            for each(_loc1_ in parser)
            {
               this.localeService.method_617(_loc1_.key,_loc1_.value);
            }
            this.var_1147.info("Localization loaded");
         }
         catch(e:Error)
         {
            this.var_1147.error("Localization not loaded: " + e.errorID + ", " + e.getStackTrace());
         }
      }
   }
}
