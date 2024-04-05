package platform.client.fp10.core.resource
{
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.service.errormessage.IErrorMessageService;
   import platform.client.fp10.core.service.errormessage.errors.ResourceError;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class BatchResourceLoader implements IResourceLoadingListener, AutoClosable
   {
      
      public static var messageBoxService:IErrorMessageService;
      
      public static var resourceLoader:IResourceLoader;
      
      public static var resourceRegistry:ResourceRegistry;
       
      
      private var callback:Function;
      
      private var numLoadedResources:int;
      
      private var numResources:int;
      
      public function BatchResourceLoader(param1:Function)
      {
         super();
         if(param1 == null)
         {
            throw new ArgumentError("Parameter listener is null");
         }
         this.callback = param1;
      }
      
      public function load(param1:Vector.<Resource>) : void
      {
         var _loc2_:Resource = null;
         if(param1 == null)
         {
            throw new ArgumentError("Parameter resources is null");
         }
         if(param1.length == 0)
         {
            throw new ArgumentError("Number of resources is zero");
         }
         ++this.numResources;
         for each(_loc2_ in param1)
         {
            if(_loc2_.isHasDependencies())
            {
               _loc2_.setBatchLoader(this);
            }
            else
            {
               this.loadResource(_loc2_);
            }
         }
         this.onResourceLoadingComplete(null);
      }
      
      public function loadResource(param1:Resource) : void
      {
         ++this.numResources;
         resourceLoader.loadResource(param1,this,ResourcePriority.NORMAL);
      }
      
      public function onResourceLoadingStart(param1:Resource) : void
      {
      }
      
      public function onResourceLoadingComplete(param1:Resource) : void
      {
         ++this.numLoadedResources;
         if(this.numLoadedResources == this.numResources)
         {
            this.completeBatchLoading();
         }
      }
      
      public function onResourceLoadingError(param1:Resource, param2:String) : void
      {
         this.onResourceLoadingComplete(param1);
      }
      
      public function onResourceLoadingFatalError(param1:Resource, param2:String) : void
      {
         var _loc3_:ResourceError = new ResourceError(param1,param2);
         messageBoxService.showMessage(_loc3_);
      }
      
      public function close() : void
      {
         this.numResources = -1;
         this.callback = null;
      }
      
      private function completeBatchLoading() : void
      {
         this.numResources = 0;
         this.callback.call();
      }
   }
}
