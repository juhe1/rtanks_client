package package_192
{
   import package_13.Long;
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class name_639 implements name_574
   {
       
      
      private var object:name_70;
      
      private var impl:name_574;
      
      public function name_639(param1:name_70, param2:name_574)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getIncomingClans() : Vector.<Long>
      {
         var result:Vector.<Long> = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getIncomingClans();
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
   }
}
