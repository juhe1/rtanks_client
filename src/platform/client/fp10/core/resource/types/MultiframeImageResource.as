package platform.client.fp10.core.resource.types
{
   import flash.display.BitmapData;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import platform.client.core.general.resource.types.imageframe.ResourceImageFrameParams;
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.IResourceSerializationListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.ResourceFlags;
   import platform.client.fp10.core.resource.ResourceInfo;
   import platform.client.fp10.core.resource.ResourceStatus;
   import platform.client.fp10.core.resource.SafeURLLoader;
   import platform.client.fp10.core.resource.tara.TARAParser;
   import platform.client.fp10.core.service.localstorage.IResourceLocalStorage;
   
   public class MultiframeImageResource extends Resource
   {
      
      public static var resourceLocalStorage:IResourceLocalStorage;
      
      private static const TARA_FILE:String = "image.tara";
      
      private static const DIFFUSE_FILE:String = "i";
      
      private static const ALPHA_FILE:String = "a";
      
      private static const CHAR_F:int = 70;
      
      private static const CHAR_R:int = 82;
      
      private static const CHAR_M:int = 77;
      
      private static const BINARY_VERSION:int = 1;
       
      
      private var multiframeResourceInfo:ResourceImageFrameParams;
      
      private var framesConstructor:FramesConstructor;
      
      private var loader:SafeURLLoader;
      
      private var taraData:ByteArray;
      
      private var _data:BitmapData;
      
      public function MultiframeImageResource(param1:ResourceInfo, param2:ResourceImageFrameParams)
      {
         super(param1);
         if(param2 == null)
         {
            throw new Error("Parameter multiframeResourceInfo is null");
         }
         this.multiframeResourceInfo = param2;
      }
      
      public function get frameWidth() : int
      {
         return this.multiframeResourceInfo.frameWidth;
      }
      
      public function get frameHeight() : int
      {
         return this.multiframeResourceInfo.frameHeight;
      }
      
      public function get numFrames() : int
      {
         return this.multiframeResourceInfo.numFrames;
      }
      
      public function get fps() : Number
      {
         return this.multiframeResourceInfo.fps;
      }
      
      public function get data() : BitmapData
      {
         return this._data;
      }
      
      override public function toString() : String
      {
         return "[MultiframeImageResource id=" + id + "]";
      }
      
      override public function get description() : String
      {
         return "Multiframe image";
      }
      
      override public function loadBytes(param1:ByteArray, param2:IResourceLoadingListener) : Boolean
      {
         if(param1.bytesAvailable < 4 || param1.readByte() != 70 || param1.readByte() != 82 || param1.readByte() != 77 || param1.readByte() != 1)
         {
            return false;
         }
         this.listener = param2;
         var _loc3_:int = param1.readInt();
         var _loc4_:ByteArray = new ByteArray();
         param1.readBytes(_loc4_,0,_loc3_);
         this.buildFrames(_loc4_);
         return true;
      }
      
      override public function serialize(param1:IResourceSerializationListener) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(70);
         _loc2_.writeByte(82);
         _loc2_.writeByte(77);
         _loc2_.writeByte(1);
         _loc2_.writeInt(this.taraData.length);
         _loc2_.writeBytes(this.taraData);
         this.taraData = null;
         param1.onSerializationComplete(this,_loc2_);
      }
      
      override public function load(param1:String, param2:IResourceLoadingListener) : void
      {
         super.load(param1,param2);
         this.doLoad();
      }
      
      override protected function doReload() : void
      {
         this.loader.close();
         this.doLoad();
      }
      
      override protected function completeLoading() : void
      {
         super.completeLoading();
         if(hasAllFlags(ResourceFlags.LOCAL) || !resourceLocalStorage.enabled)
         {
            this.taraData = null;
         }
      }
      
      private function doLoad() : void
      {
         this.loader = new SafeURLLoader();
         this.loader.dataFormat = URLLoaderDataFormat.BINARY;
         this.loader.addEventListener(Event.OPEN,this.onLoadingOpen);
         this.loader.addEventListener(Event.COMPLETE,this.onLoadingComplete);
         this.loader.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadingError);
         this.loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadingError);
         this.loader.addEventListener(ProgressEvent.PROGRESS,this.onLoadingProgress);
         this.loader.load(new URLRequest(baseUrl + "image.tara"));
         startTimeoutTracking();
         status = ResourceStatus.REQUESTED;
      }
      
      private function onLoadingOpen(param1:Event) : void
      {
         updateLastActivityTime();
         listener.onResourceLoadingStart(this);
      }
      
      private function onLoadingError(param1:ErrorEvent) : void
      {
         this._data = new StubBitmapData(16711935,this.frameWidth,this.frameHeight);
         listener.onResourceLoadingError(this,param1.text);
      }
      
      private function onLoadingProgress(param1:ProgressEvent) : void
      {
         updateLastActivityTime();
      }
      
      private function onLoadingComplete(param1:Event) : void
      {
         stopTimeoutTracking();
         this.taraData = this.loader.data;
         this.loader = null;
         this.buildFrames(this.taraData);
      }
      
      private function buildFrames(param1:ByteArray) : void
      {
         var _loc2_:TARAParser = new TARAParser(param1);
         this.framesConstructor = new FramesConstructor();
         this.framesConstructor.addEventListener(Event.COMPLETE,this.onFramesComplete);
         this.framesConstructor.buildFrames(_loc2_.getFileData("i"),_loc2_.getFileData("a"));
      }
      
      private function onFramesComplete(param1:Event) : void
      {
         this._data = this.framesConstructor.image;
         this.framesConstructor = null;
         this.completeLoading();
      }
   }
}

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.utils.ByteArray;
import platform.client.fp10.core.resource.ResourceUtils;

class FramesConstructor extends EventDispatcher
{
    
   
   private var alphaData:ByteArray;
   
   private var loader:Loader;
   
   private var _image:BitmapData;
   
   public function FramesConstructor()
   {
      super();
   }
   
   public function get image() : BitmapData
   {
      return this._image;
   }
   
   public function buildFrames(param1:ByteArray, param2:ByteArray) : void
   {
      this.alphaData = param2;
      this.load(param1,this.onDiffuseImageComplete);
   }
   
   private function load(param1:ByteArray, param2:Function) : void
   {
      this.loader = new Loader();
      this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,param2);
      this.loader.loadBytes(param1);
   }
   
   private function onDiffuseImageComplete(param1:Event) : void
   {
      this._image = Bitmap(this.loader.content).bitmapData;
      if(this.alphaData != null)
      {
         this.load(this.alphaData,this.onAlphaImageComplete);
      }
      else
      {
         this.complete();
      }
   }
   
   private function onAlphaImageComplete(param1:Event) : void
   {
      var _loc2_:BitmapData = Bitmap(this.loader.content).bitmapData;
      this._image = ResourceUtils.mergeBitmapAlpha(this._image,_loc2_,true);
      this.complete();
   }
   
   private function complete() : void
   {
      this.loader = null;
      this.alphaData = null;
      dispatchEvent(new Event(Event.COMPLETE));
   }
}
