package alternativa.osgi.service.console
{
   public class ConsoleService implements name_25
   {
       
      
      private var var_1088:Object;
      
      public function ConsoleService(param1:Object)
      {
         super();
         this.var_1088 = param1;
      }
      
      public function method_7(param1:String, ... rest) : void
      {
         var _loc3_:int = 0;
         if(this.console != null)
         {
            _loc3_ = 0;
            while(_loc3_ < rest.length)
            {
               param1 = param1.replace("%" + (_loc3_ + 1),rest[_loc3_]);
               _loc3_++;
            }
            this.var_1088.write(param1,0);
         }
      }
      
      public function name_848(param1:String, param2:String, ... rest) : void
      {
         var _loc4_:int = 0;
         if(this.console != null)
         {
            _loc4_ = 0;
            while(_loc4_ < rest.length)
            {
               param2 = param2.replace("%" + (_loc4_ + 1),rest[_loc4_]);
               _loc4_++;
            }
         }
      }
      
      public function hideConsole() : void
      {
         if(this.var_1088 != null)
         {
            this.var_1088.hide();
         }
      }
      
      public function showConsole() : void
      {
         if(this.var_1088 != null)
         {
            this.var_1088.show();
         }
      }
      
      public function method_249() : void
      {
         if(this.var_1088 != null)
         {
            this.var_1088.clear();
         }
      }
      
      public function get console() : Object
      {
         return this.var_1088;
      }
   }
}
