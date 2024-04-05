package alternativa.tanks.models.clan
{
   import package_13.Long;
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class name_647 implements name_572
   {
       
      
      private var object:name_70;
      
      private var impl:name_572;
      
      public function name_647(param1:name_70, param2:name_572)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function name_882() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.name_882();
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_1446(param1:Long) : void
      {
         var userId:Long = param1;
         try
         {
            Model.object = this.object;
            this.impl.method_1446(userId);
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function name_883(param1:Long) : void
      {
         var userId:Long = param1;
         try
         {
            Model.object = this.object;
            this.impl.name_883(userId);
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_371(param1:Long) : void
      {
         var userId:Long = param1;
         try
         {
            Model.object = this.object;
            this.impl.method_371(userId);
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_346(param1:Long) : void
      {
         var userId:Long = param1;
         try
         {
            Model.object = this.object;
            this.impl.method_346(userId);
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_370() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.method_370();
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_1445(param1:String) : void
      {
         var uid:String = param1;
         try
         {
            Model.object = this.object;
            this.impl.method_1445(uid);
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_340(param1:Long) : void
      {
         var userId:Long = param1;
         try
         {
            Model.object = this.object;
            this.impl.method_340(userId);
         }
         finally
         {
            Model.method_38();
         }
      }
   }
}
