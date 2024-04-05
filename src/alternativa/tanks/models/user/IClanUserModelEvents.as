package alternativa.tanks.models.user
{
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.type.name_70;
   
   public class IClanUserModelEvents implements name_580
   {
       
      
      private var object:name_70;
      
      private var impl:Vector.<name_580>;
      
      public function IClanUserModelEvents(param1:name_70, param2:Vector.<name_66>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<name_580>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function loadingInServiceSpace() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:name_580 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = Boolean(m.loadingInServiceSpace());
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function method_1412(param1:name_70) : void
      {
         var i:int = 0;
         var m:name_580 = null;
         var clan:name_70 = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.method_1412(clan);
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_1411() : void
      {
         var i:int = 0;
         var m:name_580 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.method_1411();
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_1413(param1:name_70) : void
      {
         var i:int = 0;
         var m:name_580 = null;
         var clan:name_70 = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.method_1413(clan);
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_1410(param1:name_70) : void
      {
         var i:int = 0;
         var m:name_580 = null;
         var clan:name_70 = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.method_1410(clan);
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_346(param1:name_70) : void
      {
         var i:int = 0;
         var m:name_580 = null;
         var clan:name_70 = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.method_346(clan);
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
   }
}
