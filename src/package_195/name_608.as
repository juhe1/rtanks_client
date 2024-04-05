package package_195
{
   import package_13.Long;
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class name_608 implements name_582
   {
       
      
      private var object:name_70;
      
      private var impl:name_582;
      
      public function name_608(param1:name_70, param2:name_582)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function sendInviteToClan(param1:Long) : void
      {
         var userId:Long = param1;
         try
         {
            Model.object = this.object;
            this.impl.sendInviteToClan(userId);
         }
         finally
         {
            Model.method_38();
         }
      }
   }
}
