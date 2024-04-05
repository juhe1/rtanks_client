package package_340
{
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class name_1641 implements name_1634
   {
       
      
      private var object:name_70;
      
      private var impl:name_1634;
      
      public function name_1641(param1:name_70, param2:name_1634)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getSkins() : Vector.<name_70>
      {
         var result:Vector.<name_70> = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getSkins();
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
   }
}
