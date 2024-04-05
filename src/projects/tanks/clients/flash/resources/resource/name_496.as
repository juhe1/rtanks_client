package projects.tanks.clients.flash.resources.resource
{
   import alternativa.engine3d.objects.Mesh;
   import alternativa.proplib.PropLibrary;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flash.utils.setTimeout;
   import package_351.PropData;
   import package_351.PropGroup;
   import package_352.name_1682;
   import package_353.ByteArrayMap;
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.IResourceSerializationListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.ResourceInfo;
   import platform.client.fp10.core.resource.ResourceStatus;
   import platform.client.fp10.core.resource.SafeURLLoader;
   import platform.client.fp10.core.resource.tara.TARAParser;
   import platform.client.fp10.core.service.localstorage.IResourceLocalStorage;
   
   public class name_496 extends Resource
   {
      
      private static const const_1464:String = "library.tara";
      
      public static const name_497:int = 8;
      
      public static var resourceLocalStorage:IResourceLocalStorage;
       
      
      private var loader:SafeURLLoader;
      
      public var taraData:ByteArray;
      
      public var name_1678:PropLibrary;
      
      public function name_496(param1:ResourceInfo)
      {
         super(param1);
      }
      
      private static function method_1204(param1:PropGroup) : void
      {
         var _loc2_:PropGroup = null;
         var _loc3_:PropData = null;
         var _loc4_:name_1682 = null;
         if(param1.name_1681 != null)
         {
            for each(_loc2_ in param1.name_1681)
            {
               method_1204(_loc2_);
            }
         }
         if(param1.props != null)
         {
            for each(_loc3_ in param1.props)
            {
               _loc4_ = _loc3_.name_1684().name_1685();
               if(_loc4_.object is Mesh)
               {
                  Mesh(_loc4_.object).calculateVerticesNormalsByAngle(name_1212.name_1213,0.01);
               }
            }
         }
      }
      
      override public function get description() : String
      {
         return "Props library";
      }
      
      override public function load(param1:String, param2:IResourceLoadingListener) : void
      {
         super.load(param1,param2);
         this.doLoad();
      }
      
      private function doLoad() : void
      {
         this.loader = new SafeURLLoader();
         this.loader.dataFormat = URLLoaderDataFormat.BINARY;
         this.loader.addEventListener(Event.OPEN,this.onLoadingOpen);
         this.loader.addEventListener(ProgressEvent.PROGRESS,this.onLoadingProgress);
         this.loader.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadingError);
         this.loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadingError);
         this.loader.addEventListener(Event.COMPLETE,this.onLoadingComplete);
         this.loader.load(new URLRequest(baseUrl + "library.tara"));
         status = ResourceStatus.REQUESTED;
         startTimeoutTracking();
      }
      
      override public function loadBytes(param1:ByteArray, param2:IResourceLoadingListener) : Boolean
      {
         this.listener = param2;
         this.method_1205(param1);
         setTimeout(completeLoading,0);
         return true;
      }
      
      override public function close() : void
      {
         this.loader.close();
         this.method_1194();
      }
      
      override public function serialize(param1:IResourceSerializationListener) : void
      {
         var _loc2_:ByteArray = null;
         if(this.taraData != null)
         {
            _loc2_ = new ByteArray();
            _loc2_.writeBytes(this.taraData);
            param1.onSerializationComplete(this,_loc2_);
            this.taraData = null;
         }
      }
      
      override protected function doReload() : void
      {
         this.loader.close();
         this.method_1194();
         this.doLoad();
      }
      
      private function method_1194() : void
      {
         this.loader.removeEventListener(Event.OPEN,this.onLoadingOpen);
         this.loader.removeEventListener(ProgressEvent.PROGRESS,this.onLoadingProgress);
         this.loader.removeEventListener(Event.COMPLETE,this.onLoadingComplete);
         this.loader.removeEventListener(IOErrorEvent.IO_ERROR,this.onLoadingError);
         this.loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadingError);
         this.loader = null;
      }
      
      private function onLoadingOpen(param1:Event) : void
      {
         updateLastActivityTime();
         listener.onResourceLoadingStart(this);
      }
      
      private function onLoadingComplete(param1:Event) : void
      {
         stopTimeoutTracking();
         this.taraData = this.loader.data;
         this.method_1194();
         this.method_1205(this.taraData);
         completeLoading();
      }
      
      private function onLoadingProgress(param1:ProgressEvent) : void
      {
         updateLastActivityTime();
      }
      
      private function onLoadingError(param1:ErrorEvent) : void
      {
         stopTimeoutTracking();
         listener.onResourceLoadingFatalError(this,param1.toString());
      }
      
      private function method_1205(param1:ByteArray) : void
      {
         var data:ByteArray = param1;
         try
         {
            var taraObject:Object = new TARAParser(data).data;
            this.name_1678 = new PropLibrary(new ByteArrayMap(taraObject));
            method_1204(this.name_1678.name_1683);
         }
         catch(e:Error)
         {
            throw new Error("PropLibResource: not parsed" + " id:" + id + " baseUrl:" + baseUrl + " error: " + e.getStackTrace());
         }
      }
   }
}
