package package_305
{
   import platform.client.fp10.core.type.AutoClosable;
   import platform.client.fp10.core.type.name_70;
   
   public class name_1220 implements name_1216, AutoClosable
   {
       
      
      private var var_2052:name_70;
      
      public function name_1220(param1:name_70)
      {
         super();
         this.var_2052 = param1;
      }
      
      public function name_1222() : void
      {
      }
      
      public function close() : void
      {
         this.var_2052 = null;
      }
   }
}
