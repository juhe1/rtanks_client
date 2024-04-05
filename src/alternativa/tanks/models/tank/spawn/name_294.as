package alternativa.tanks.models.tank.spawn
{
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class name_294 implements name_279
   {
       
      
      private var object:name_70;
      
      private var impl:name_279;
      
      public function name_294(param1:name_70, param2:name_279)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function method_767() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = int(this.impl.method_767());
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function name_1069() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.name_1069();
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_769() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.method_769();
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_768() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.method_768();
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function setReadyToPlace() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.setReadyToPlace();
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
   }
}
