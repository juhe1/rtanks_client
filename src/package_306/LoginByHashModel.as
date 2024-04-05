package package_306
{
   import flash.net.SharedObject;
   import mx.utils.StringUtil;
   import package_307.class_174;
   import package_307.name_1224;
   import package_95.name_298;
   
   public class LoginByHashModel extends class_174 implements name_1225, name_1224
   {
      
      public static var storageService:name_298;
       
      
      public function LoginByHashModel()
      {
         super();
      }
      
      public function method_2138(param1:String) : void
      {
         server.method_2138(param1);
      }
      
      public function loginByHash(param1:String) : void
      {
         server.loginByHash(param1);
      }
      
      public function method_2141() : void
      {
         this.method_2179();
      }
      
      public function method_2140() : void
      {
         this.method_2179();
      }
      
      private function method_2179() : void
      {
         var _loc1_:SharedObject = storageService.getStorage();
         var _loc2_:SharedObject = storageService.getAccountsStorage();
         if(Boolean(_loc2_.data[_loc1_.data.userName]))
         {
            delete _loc2_.data[_loc1_.data.userName];
            _loc2_.flush();
         }
         _loc1_.data.userHash = null;
      }
      
      public function method_2139(param1:String) : void
      {
         var _loc2_:SharedObject = storageService.getStorage();
         _loc2_.data.userHash = param1;
         _loc2_.flush();
      }
      
      public function rememberAccount(param1:String) : void
      {
         var _loc2_:* = null;
         this.method_2139(param1);
         var _loc3_:SharedObject = storageService.getStorage();
         if(StringUtil.trim(_loc3_.data.userName).length == 0)
         {
            return;
         }
         var _loc4_:SharedObject = storageService.getAccountsStorage();
         var _loc5_:Object = {};
         for(_loc2_ in _loc3_.data)
         {
            _loc5_[_loc2_] = _loc3_.data[_loc2_];
         }
         _loc4_.data[_loc3_.data.userName] = _loc5_;
         _loc4_.flush();
      }
   }
}
