package package_191
{
   import package_13.Long;
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class name_628 implements name_579
   {
       
      
      private var object:name_70;
      
      private var impl:name_579;
      
      public function name_628(param1:name_70, param2:name_579)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function name_1930() : Vector.<Long>
      {
         var result:Vector.<Long> = null;
         try
         {
            Model.object = this.object;
            result = this.impl.name_1930();
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
   }
}
