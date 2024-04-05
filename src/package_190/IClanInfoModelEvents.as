package package_190
{
   import package_13.Long;
   import package_275.name_865;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.type.name_70;
   
   public class IClanInfoModelEvents implements name_571
   {
       
      
      private var object:name_70;
      
      private var impl:Vector.<name_571>;
      
      public function IClanInfoModelEvents(param1:name_70, param2:Vector.<name_66>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<name_571>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function getClanName() : String
      {
         var result:String = null;
         var i:int = 0;
         var m:name_571 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = String(m.getClanName());
               i++;
            }
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
         var i:int = 0;
         var m:name_571 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = String(m.name_1897());
               i++;
            }
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
         var i:int = 0;
         var m:name_571 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = String(m.method_1449());
               i++;
            }
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
         var i:int = 0;
         var m:name_571 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.name_1893();
               i++;
            }
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
         var i:int = 0;
         var m:name_571 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = int(m.method_1452());
               i++;
            }
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
         var i:int = 0;
         var m:name_571 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = Boolean(m.incomingRequestEnabled());
               i++;
            }
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
         var i:int = 0;
         var m:name_571 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.method_1450();
               i++;
            }
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
         var i:int = 0;
         var m:name_571 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.method_1451();
               i++;
            }
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
         var i:int = 0;
         var m:name_571 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = int(m.name_1896());
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
   }
}
