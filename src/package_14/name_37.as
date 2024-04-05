package package_14
{
   import alternativa.osgi.service.logging.name_11;
   import alternativa.osgi.service.logging.name_26;
   
   public class name_37 implements name_36
   {
       
      
      private var logService:name_26;
      
      public function name_37(param1:name_26)
      {
         super();
         this.logService = param1;
      }
      
      public function method_333(param1:String, param2:String, param3:Array = null) : void
      {
         this.getLogger(param1).info(param2,param3);
      }
      
      public function log(param1:String, param2:String, ... rest) : void
      {
         this.getLogger(param1).debug(param2,rest);
      }
      
      public function method_309(param1:String, param2:String, ... rest) : void
      {
         this.getLogger(param1).error(param2,rest);
      }
      
      private function getLogger(param1:String) : name_11
      {
         return this.logService.getLogger(param1);
      }
      
      public function method_311(param1:String) : Vector.<String>
      {
         return null;
      }
      
      public function method_314(param1:name_855) : void
      {
      }
      
      public function method_312(param1:name_855) : void
      {
      }
      
      public function method_315(param1:String, param2:name_855) : void
      {
      }
      
      public function method_313(param1:String, param2:name_855) : void
      {
      }
      
      public function method_310() : Vector.<String>
      {
         return null;
      }
   }
}
