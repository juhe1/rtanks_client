package package_73
{
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class name_302 implements name_282
   {
       
      
      private var object:name_70;
      
      private var impl:name_282;
      
      public function name_302(param1:name_70, param2:name_282)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getEffects() : name_1244
      {
         var result:name_1244 = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getEffects();
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
   }
}
