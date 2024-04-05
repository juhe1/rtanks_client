package package_190
{
   import package_13.Long;
   import package_275.name_865;
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class name_631 implements name_571
   {
       
      
      private var object:name_70;
      
      private var impl:name_571;
      
      public function name_631(param1:name_70, param2:name_571)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getClanName() : String
      {
         var result:String = null;
         try
         {
            Model.object = this.object;
            result = String(this.impl.getClanName());
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function name_1897() : String
      {
         var result:String = null;
         try
         {
            Model.object = this.object;
            result = String(this.impl.name_1897());
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function method_1449() : String
      {
         var result:String = null;
         try
         {
            Model.object = this.object;
            result = String(this.impl.method_1449());
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function name_1893() : name_865
      {
         var result:name_865 = null;
         try
         {
            Model.object = this.object;
            result = this.impl.name_1893();
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function method_1452() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = int(this.impl.method_1452());
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function incomingRequestEnabled() : Boolean
      {
         var result:Boolean = false;
         try
         {
            Model.object = this.object;
            result = Boolean(this.impl.incomingRequestEnabled());
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function method_1450() : Long
      {
         var result:Long = null;
         try
         {
            Model.object = this.object;
            result = this.impl.method_1450();
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function method_1451() : Long
      {
         var result:Long = null;
         try
         {
            Model.object = this.object;
            result = this.impl.method_1451();
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function name_1896() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = int(this.impl.name_1896());
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
   }
}
