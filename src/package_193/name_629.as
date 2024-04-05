package package_193
{
   import package_13.Long;
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class name_629 implements name_583
   {
       
      
      private var object:name_70;
      
      private var impl:name_583;
      
      public function name_629(param1:name_70, param2:name_583)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getOutgoingClans() : Vector.<Long>
      {
         var result:Vector.<Long> = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getOutgoingClans();
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
   }
}
