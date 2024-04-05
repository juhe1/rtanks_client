package package_340
{
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class name_1649 implements name_1635
   {
       
      
      private var object:name_70;
      
      private var impl:name_1635;
      
      public function name_1649(param1:name_70, param2:name_1635)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getMountedSkin() : name_70
      {
         var result:name_70 = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getMountedSkin();
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function mount(param1:name_70) : void
      {
         var skin:name_70 = param1;
         try
         {
            Model.object = this.object;
            this.impl.mount(skin);
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
   }
}
