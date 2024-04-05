package platform.client.fp10.core.resource.types
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.IResourceSerializationListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.ResourceFlags;
   import platform.client.fp10.core.resource.ResourceInfo;
   import platform.client.fp10.core.resource.SafeURLLoader;
   import platform.client.fp10.core.service.localstorage.IResourceLocalStorage;
   
   public class TextureResource extends Resource
   {
      
      public static var resourceLocalStorage:IResourceLocalStorage;
      
      private static const IMAGE_FILE:String = "image.tnk";
      
      private static const BINARY_VERSION:int = 1;
       
      
      private var loader:SafeURLLoader;
      
      private var _data:BitmapData;
      
      public function TextureResource(param1:ResourceInfo)
      {
         super(param1);
      }
      
      public function get data() : BitmapData
      {
         return this._data;
      }
      
      override public function get description() : String
      {
         return "Image";
      }
      
      override public function loadBytes(param1:ByteArray, param2:IResourceLoadingListener) : Boolean
      {
         if(param1.bytesAvailable < 2 || param1.readByte() != 1)
         {
            return false;
         }
         this.listener = param2;
         var _loc3_:int = param1.readInt();
         var _loc4_:ByteArray = new ByteArray();
         param1.readBytes(_loc4_,param1.position,_loc3_);
         this.loadImage(param1);
         return true;
      }
      
      override public function serialize(param1:IResourceSerializationListener) : void
      {
      }
      
      override public function load(param1:String, param2:IResourceLoadingListener) : void
      {
         super.load(param1,param2);
         this.loadImageBytes();
      }
      
      override protected function doReload() : void
      {
         this.loader.close();
         this.loadImageBytes();
      }
      
      override protected function createDummyData() : Boolean
      {
         this._data = new StubBitmapData(16711680);
         return true;
      }
      
      protected function getImageFileName() : String
      {
         return "image.tnk";
      }
      
      private function loadImageBytes() : void
      {
         this.loader = this.createLoader();
         this.loader.load(new URLRequest(baseUrl + this.getImageFileName()));
         startTimeoutTracking();
         status = "Image requested";
      }
      
      private function onLoadingComplete(param1:Event) : void
      {
         stopTimeoutTracking();
         this.loadImage(param1.target.data);
      }
      
      private function loadImage(param1:ByteArray) : void
      {
         var _loc2_:Loader = new Loader();
         _loc2_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.completeLoadImage);
         _loc2_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadingError);
         _loc2_.loadBytes(param1);
      }
      
      private function completeLoadImage(param1:Event) : void
      {
         this._data = Bitmap(param1.target.content).bitmapData;
         this.completeLoading();
      }
      
      override protected function completeLoading() : void
      {
         super.completeLoading();
         this.loader = null;
         baseUrl = null;
      }
      
      private function onLoadingOpen(param1:Event) : void
      {
         updateLastActivityTime();
         listener.onResourceLoadingStart(this);
      }
      
      private function onLoadingError(param1:ErrorEvent) : void
      {
         stopTimeoutTracking();
         this._data = new StubBitmapData(16711680);
         setFlags(ResourceFlags.LOADED);
         baseUrl = null;
         listener.onResourceLoadingError(this,param1.toString());
      }
      
      private function onLoadingProgress(param1:ProgressEvent) : void
      {
         updateLastActivityTime();
      }
      
      private function createLoader() : SafeURLLoader
      {
         var _loc1_:SafeURLLoader = new SafeURLLoader();
         _loc1_.dataFormat = URLLoaderDataFormat.BINARY;
         _loc1_.addEventListener(Event.OPEN,this.onLoadingOpen);
         _loc1_.addEventListener(ProgressEvent.PROGRESS,this.onLoadingProgress);
         _loc1_.addEventListener(Event.COMPLETE,this.onLoadingComplete);
         _loc1_.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadingError);
         _loc1_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadingError);
         return _loc1_;
      }
   }
}
