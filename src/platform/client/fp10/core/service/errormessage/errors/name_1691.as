package platform.client.fp10.core.service.errormessage.errors
{
   public class name_1691 implements ErrorType
   {
       
      
      private var message:String;
      
      public function name_1691(param1:String)
      {
         super();
         this.message = param1;
      }
      
      public function getMessage() : String
      {
         return this.message;
      }
   }
}
