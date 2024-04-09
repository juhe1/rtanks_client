package package_242
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.console.name_27;
   
   public class name_821
   {
       
      
      protected var var_1416:String;
      
      protected var var_1417:Function;
      
      public function name_821(param1:String, param2:Function = null)
      {
         super();
         this.var_1416 = param1;
         this.var_1417 = param2;
         var _loc3_:name_27 = name_27(OSGi.getInstance().getService(name_27));
         if(_loc3_ != null)
         {
            _loc3_.method_212(this);
         }
      }
      
      public function name_829() : String
      {
         return this.var_1416;
      }
      
      public function destroy() : void
      {
         var _loc1_:name_27 = name_27(OSGi.getInstance().getService(name_27));
         if(_loc1_ != null)
         {
            _loc1_.method_215(this.var_1416);
         }
         this.var_1417 = null;
      }
      
      public function name_828(param1:String) : String
      {
         return "Not implemented";
      }
      
      public function toString() : String
      {
         return "Not implemented";
      }
   }
}
