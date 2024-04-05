package package_471
{
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class name_3346 implements IResourceLoadingListener
   {
       
      
      private var var_3655:class_209;
      
      public function name_3346(param1:class_209)
      {
         super();
         this.var_3655 = param1;
      }
      
      public function onResourceLoadingStart(param1:Resource) : void
      {
      }
      
      public function method_3213(param1:Resource, param2:int) : void
      {
      }
      
      public function onResourceLoadingComplete(param1:Resource) : void
      {
         this.var_3655.method_3046(ImageResource(param1));
      }
      
      public function onResourceLoadingError(param1:Resource, param2:String) : void
      {
         throw new Error("Ошибка загрузки ресурса (id: " + param1.id + ")");
      }
      
      public function onResourceLoadingFatalError(param1:Resource, param2:String) : void
      {
         throw new Error("Ошибка загрузки ресурса (id: " + param1.id + ")");
      }
   }
}
