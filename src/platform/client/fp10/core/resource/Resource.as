package platform.client.fp10.core.resource
{
   import flash.utils.ByteArray;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getTimer;
   import package_13.Long;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.service.IResourceTimer;
   
   public class Resource
   {
      
      public static const DEFAULT_CLASSIFIER:String = "default";
      
      public static var resourceRegistry:ResourceRegistry;
      
      public static var resourceTimer:IResourceTimer;
       
      
      public var status:String;
      
      protected var resourceInfo:ResourceInfo;
      
      protected var baseUrl:String;
      
      protected var listener:IResourceLoadingListener;
      
      protected var flags:int;
      
      internal var lastActivityTime:int;
      
      private var numReloadAttempts:int;
      
      private var dependents:Vector.<Resource>;
      
      private var numDependencies:int = 0;
      
      private var batchLoader:BatchResourceLoader;
      
      public function Resource(param1:ResourceInfo)
      {
         super();
         if(param1 == null)
         {
            throw new ArgumentError("Parameter resourceInfo is null");
         }
         this.resourceInfo = param1;
      }
      
      private static function getClassName(param1:Object) : String
      {
         var _loc2_:String = getQualifiedClassName(param1);
         var _loc3_:int = _loc2_.indexOf("::");
         if(_loc3_ >= 0)
         {
            return _loc2_.substr(_loc3_ + 2);
         }
         return _loc2_;
      }
      
      public function addDependent(param1:Resource) : void
      {
         if(this.dependents == null)
         {
            this.dependents = new Vector.<Resource>();
         }
         this.dependents.push(param1);
      }
      
      public function isHasDependencies() : Boolean
      {
         return this.numDependencies > 0;
      }
      
      public function setBatchLoader(param1:BatchResourceLoader) : void
      {
         this.batchLoader = param1;
      }
      
      public function addDependence(param1:Resource) : void
      {
         param1.addDependent(this);
         ++this.numDependencies;
      }
      
      public function handleDependenceLoaded() : void
      {
         if(--this.numDependencies == 0)
         {
            if(this.batchLoader != null)
            {
               this.batchLoader.loadResource(this);
            }
         }
      }
      
      public function toString() : String
      {
         return "resource id: " + this.id + ", version: " + this.version + ", lazy: " + this.isLazy + ", class: " + getClassName(this) + ", status: " + this.status;
      }
      
      final public function get id() : Long
      {
         return this.resourceInfo.id;
      }
      
      final public function get version() : Long
      {
         return this.resourceInfo.version;
      }
      
      final public function get isLazy() : Boolean
      {
         return this.resourceInfo.isLazy;
      }
      
      final public function get isLoaded() : Boolean
      {
         return (this.flags & ResourceFlags.LOADED) != 0;
      }
      
      final public function get isLoading() : Boolean
      {
         return (this.flags & ResourceFlags.IS_LOADING) != 0;
      }
      
      public function getReloadURLPostfix() : String
      {
         if(this.numReloadAttempts > 0)
         {
            return "?reloadRand=" + Math.random() + "&numReload=" + this.numReloadAttempts;
         }
         return "";
      }
      
      final public function loadLazyResource(param1:IResourceLoadingListener) : void
      {
         if(this.isLoaded)
         {
            throw new Error("Resource is already loaded. Resource id: " + this.id);
         }
         resourceRegistry.loadLazyResource(this,param1);
      }
      
      final public function removeLazyListener(param1:IResourceLoadingListener) : void
      {
         if(this.isLazy && !this.isLoaded)
         {
            resourceRegistry.removeLazyListener(this,param1);
         }
      }
      
      final public function addLazyListener(param1:IResourceLoadingListener) : void
      {
         if(!this.isLazy)
         {
            throw new Error("Resource is not lazy. Resource id: " + this.id);
         }
         if(this.isLoaded)
         {
            throw new Error("Resource is already loaded. Resource id: " + this.id);
         }
         resourceRegistry.addLazyListener(this,param1);
      }
      
      public function load(param1:String, param2:IResourceLoadingListener) : void
      {
         if(param2 == null)
         {
            throw new ArgumentError("Parameter listener is null");
         }
         this.baseUrl = param1;
         this.listener = param2;
      }
      
      public function close() : void
      {
      }
      
      public function get classifier() : String
      {
         return "default";
      }
      
      public function loadBytes(param1:ByteArray, param2:IResourceLoadingListener) : Boolean
      {
         return false;
      }
      
      public function serialize(param1:IResourceSerializationListener) : void
      {
      }
      
      public function get description() : String
      {
         return null;
      }
      
      public function unload() : void
      {
      }
      
      final public function setFlags(param1:int) : void
      {
         this.flags |= param1;
      }
      
      final public function clearFlags(param1:int) : void
      {
         this.flags &= ~param1;
      }
      
      final public function hasAllFlags(param1:int) : Boolean
      {
         return (this.flags & param1) == param1;
      }
      
      final public function hasAnyFlags(param1:int) : Boolean
      {
         return (this.flags & param1) != 0;
      }
      
      final public function reload() : void
      {
         if(this.numReloadAttempts >= resourceTimer.getMaxReloadAttemts())
         {
            if(this.createDummyData())
            {
               this.markLoaded();
               this.listener.onResourceLoadingError(this,"No reload attempts left");
               this.status = "Dummy data is used";
            }
            else
            {
               this.listener.onResourceLoadingFatalError(this,"No reload attempts left and no default data available.");
            }
         }
         else
         {
            ++this.numReloadAttempts;
            this.doReload();
         }
      }
      
      protected function doReload() : void
      {
         this.listener.onResourceLoadingFatalError(this,"Cannot reload resource (not implemented)");
      }
      
      final protected function markLoaded() : void
      {
         this.flags |= ResourceFlags.LOADED;
      }
      
      protected function updateLastActivityTime() : void
      {
         this.lastActivityTime = getTimer();
      }
      
      protected function startTimeoutTracking() : void
      {
         this.updateLastActivityTime();
         resourceTimer.addResource(this);
      }
      
      protected function stopTimeoutTracking() : void
      {
         resourceTimer.removeResource(this);
      }
      
      protected function createDummyData() : Boolean
      {
         return false;
      }
      
      protected function completeLoading() : void
      {
         var _loc1_:Resource = null;
         if(this.dependents != null)
         {
            for each(_loc1_ in this.dependents)
            {
               _loc1_.handleDependenceLoaded();
            }
            this.dependents = null;
         }
         this.stopTimeoutTracking();
         this.setFlags(ResourceFlags.LOADED);
         this.status = ResourceStatus.LOADED;
         this.listener.onResourceLoadingComplete(this);
      }
   }
}
