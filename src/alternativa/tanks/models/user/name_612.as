package alternativa.tanks.models.user
{
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class name_612 implements name_580
   {
       
      
      private var object:name_70;
      
      private var impl:name_580;
      
      public function name_612(param1:name_70, param2:name_580)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function loadingInServiceSpace() : Boolean
      {
         var result:Boolean = false;
         try
         {
            Model.object = this.object;
            result = Boolean(this.impl.loadingInServiceSpace());
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function method_1412(param1:name_70) : void
      {
         var clan:name_70 = param1;
         try
         {
            Model.object = this.object;
            this.impl.method_1412(clan);
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_1411() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.method_1411();
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_1413(param1:name_70) : void
      {
         var clan:name_70 = param1;
         try
         {
            Model.object = this.object;
            this.impl.method_1413(clan);
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_1410(param1:name_70) : void
      {
         var clan:name_70 = param1;
         try
         {
            Model.object = this.object;
            this.impl.method_1410(clan);
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_346(param1:name_70) : void
      {
         var clan:name_70 = param1;
         try
         {
            Model.object = this.object;
            this.impl.method_346(clan);
         }
         finally
         {
            Model.method_38();
         }
      }
   }
}
