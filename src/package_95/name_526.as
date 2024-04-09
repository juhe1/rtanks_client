package package_95
{
   import flash.net.SharedObject;
   
   public class name_526 implements IStorageService
   {
       
      
      private var storage:SharedObject;
      
      private var var_1104:SharedObject;
      
      public function name_526(param1:SharedObject, param2:SharedObject)
      {
         super();
         this.storage = param1;
         this.var_1104 = param2;
      }
      
      public function getStorage() : SharedObject
      {
         return this.storage;
      }
      
      public function getAccountsStorage() : SharedObject
      {
         return this.var_1104;
      }
   }
}
