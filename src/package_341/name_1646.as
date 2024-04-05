package package_341
{
   import package_103.name_323;
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class name_1646 implements name_1633
   {
       
      
      private var object:name_70;
      
      private var impl:name_1633;
      
      public function name_1646(param1:name_70, param2:name_1633)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getProperties() : Vector.<name_323>
      {
         var result:Vector.<name_323> = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getProperties();
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function method_2414() : Vector.<name_323>
      {
         var result:Vector.<name_323> = null;
         try
         {
            Model.object = this.object;
            result = this.impl.method_2414();
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
   }
}
