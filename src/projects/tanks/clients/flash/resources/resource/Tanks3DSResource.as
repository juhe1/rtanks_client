package projects.tanks.clients.flash.resources.resource
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Clipping;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.loaders.Parser3DS;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import flash.display.BitmapData;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flash.utils.setTimeout;
   import package_303.TextureByteData;
   import package_304.name_1209;
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.IResourceSerializationListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.ResourceInfo;
   import platform.client.fp10.core.resource.SafeURLLoader;
   import platform.client.fp10.core.service.localstorage.IResourceLocalStorage;
   import projects.tanks.clients.flash.resources.resource.loaders.BatchTextureLoader;
   import projects.tanks.clients.flash.resources.resource.loaders.name_1211;
   
   public class Tanks3DSResource extends Resource
   {
      
      public static const name_497:int = 17;
      
      public static var resourceLocalStorage:IResourceLocalStorage;
      
      private static const const_384:int = 1;
      
      private static const const_381:int = 2;
      
      private static const const_380:int = 3;
      
      private static const const_383:int = 4;
      
      protected static const const_378:int = 1 << 2;
      
      protected static const const_379:int = 1 << 3;
      
      private static const const_385:String = "images.xml";
      
      private static const const_382:String = "object.3ds";
       
      
      public var textures:Object;
      
      public var objects:Vector.<Object3D>;
      
      public var parents:Vector.<Object3D>;
      
      private var var_524:SafeURLLoader;
      
      private var var_526:BatchTextureLoader;
      
      private var var_525:ResourceData;
      
      private var var_528:ByteArray;
      
      private var var_527:int = -1;
      
      public function Tanks3DSResource(param1:ResourceInfo)
      {
         this.var_525 = new ResourceData();
         super(param1);
      }
      
      override public function get description() : String
      {
         return "3DS";
      }
      
      public function method_765(param1:int) : BitmapData
      {
         var _loc2_:Mesh = this.objects[param1] as Mesh;
         if(_loc2_ == null || _loc2_.alternativa3d::faceList == null)
         {
            return null;
         }
         var _loc3_:TextureMaterial = _loc2_.alternativa3d::faceList.material as TextureMaterial;
         if(_loc3_ == null)
         {
            return null;
         }
         return this.textures[_loc3_.diffuseMapURL];
      }
      
      public function method_766(param1:RegExp) : Vector.<Object3D>
      {
         var _loc2_:Object3D = null;
         var _loc3_:Vector.<Object3D> = null;
         var _loc4_:int = int(this.objects.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.objects[_loc5_];
            if(_loc2_.name != null && _loc2_.name.match(param1) != null)
            {
               if(_loc3_ == null)
               {
                  _loc3_ = new Vector.<Object3D>();
               }
               _loc3_.push(_loc2_);
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      override public function close() : void
      {
         switch(this.var_527)
         {
            case 2:
               this.var_524.close();
               this.method_750();
               break;
            case 3:
               this.var_526.close();
               break;
            case 4:
               this.var_524.close();
         }
         this.textures = null;
         this.var_526 = null;
         this.var_524 = null;
      }
      
      override public function unload() : void
      {
         var _loc1_:BitmapData = null;
         if(this.textures != null)
         {
            for each(_loc1_ in this.textures)
            {
               _loc1_.dispose();
            }
         }
      }
      
      override public function load(param1:String, param2:IResourceLoadingListener) : void
      {
         super.load(param1,param2);
         this.method_755();
      }
      
      override protected function doReload() : void
      {
         switch(this.var_527)
         {
            case 2:
               this.var_524.close();
               this.method_750();
               this.method_755();
               break;
            case 3:
               this.var_526.reload();
               break;
            case 4:
               this.var_524.close();
               this.method_757();
               this.method_749();
         }
      }
      
      override public function loadBytes(param1:ByteArray, param2:IResourceLoadingListener) : Boolean
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:ByteArray = null;
         var _loc6_:int = 0;
         var _loc7_:ByteArray = null;
         this.listener = param2;
         var _loc8_:int = param1.readInt();
         this.var_525.modelData = new ByteArray();
         param1.readBytes(this.var_525.modelData,0,_loc8_);
         this.var_528 = this.var_525.modelData;
         var _loc9_:int = param1.readInt();
         var _loc10_:int = 0;
         while(_loc10_ < _loc9_)
         {
            _loc3_ = param1.readUTF();
            _loc4_ = param1.readInt();
            _loc5_ = new ByteArray();
            param1.readBytes(_loc5_,0,_loc4_);
            _loc6_ = param1.readInt();
            _loc7_ = null;
            if(_loc6_ > 0)
            {
               _loc7_ = new ByteArray();
               param1.readBytes(_loc7_,0,_loc6_);
            }
            this.var_525.imageData.push(new ImageData(_loc3_,new TextureByteData(_loc5_,_loc7_)));
            _loc10_++;
         }
         this.method_753();
         return true;
      }
      
      override public function serialize(param1:IResourceSerializationListener) : void
      {
         var _loc2_:ImageData = null;
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeInt(this.var_525.modelData.length);
         _loc3_.writeBytes(this.var_525.modelData);
         var _loc4_:uint = this.var_525.imageData.length;
         _loc3_.writeInt(_loc4_);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.var_525.imageData[_loc5_];
            _loc3_.writeUTF(_loc2_.name);
            _loc3_.writeInt(_loc2_.data.diffuseData.length);
            _loc3_.writeBytes(_loc2_.data.diffuseData);
            if(_loc2_.data.opacityData == null)
            {
               _loc3_.writeInt(0);
            }
            else
            {
               _loc3_.writeInt(_loc2_.data.opacityData.length);
               _loc3_.writeBytes(_loc2_.data.opacityData);
            }
            _loc5_++;
         }
         this.var_525 = null;
         param1.onSerializationComplete(this,_loc3_);
      }
      
      private function method_755() : void
      {
         this.var_524 = new SafeURLLoader();
         this.var_524.addEventListener(Event.OPEN,this.method_752);
         this.var_524.addEventListener(Event.COMPLETE,this.method_759);
         this.var_524.addEventListener(IOErrorEvent.IO_ERROR,this.method_748);
         this.var_524.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.method_748);
         this.var_524.load(new URLRequest(baseUrl + "images.xml"));
         startTimeoutTracking();
         this.var_527 = 2;
      }
      
      private function method_752(param1:Event) : void
      {
         updateLastActivityTime();
      }
      
      private function method_759(param1:Event) : void
      {
         var _loc2_:XML = null;
         var _loc3_:XML = XML(this.var_524.data);
         this.method_750();
         if(_loc3_.name() != "images")
         {
            throw new Error("Invalid map.xml contents. ResourceId=" + this.id);
         }
         var _loc4_:Object = {};
         var _loc5_:int = 0;
         for each(_loc2_ in _loc3_.image)
         {
            _loc5_++;
            _loc4_[_loc2_.@name] = new name_1211(_loc2_.attribute("new-name"),_loc2_.@alpha);
         }
         if(_loc5_ > 0)
         {
            this.var_526 = new BatchTextureLoader(_loc4_);
            this.var_526.addEventListener(Event.OPEN,this.method_756);
            this.var_526.addEventListener(Event.COMPLETE,this.method_760);
            this.var_526.addEventListener(name_1209.name_1210,this.method_754);
            this.var_526.load(baseUrl);
            this.var_527 = 3;
            startTimeoutTracking();
         }
         else
         {
            this.method_749();
         }
      }
      
      private function method_754(param1:name_1209) : void
      {
         setFlags(const_378);
      }
      
      private function method_756(param1:Event) : void
      {
         updateLastActivityTime();
      }
      
      private function method_760(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:Object = this.var_526.textures.data;
         for(_loc2_ in _loc3_)
         {
            this.var_525.imageData.push(new ImageData(_loc2_,this.var_526.textures.getValue(_loc2_)));
         }
         this.method_762();
         this.method_749();
      }
      
      private function method_749() : void
      {
         this.var_524 = new SafeURLLoader();
         this.var_524.dataFormat = URLLoaderDataFormat.BINARY;
         this.var_524.addEventListener(Event.OPEN,this.method_761);
         this.var_524.addEventListener(Event.COMPLETE,this.method_751);
         this.var_524.addEventListener(IOErrorEvent.IO_ERROR,this.method_748);
         this.var_524.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.method_748);
         this.var_524.load(new URLRequest(baseUrl + "object.3ds"));
         this.var_527 = 4;
         startTimeoutTracking();
      }
      
      private function method_761(param1:Event) : void
      {
         updateLastActivityTime();
      }
      
      private function method_751(param1:Event) : void
      {
         this.var_525.modelData = this.var_524.data;
         this.var_528 = this.var_525.modelData;
         this.method_757();
         this.method_753();
      }
      
      private function method_753() : void
      {
         var _loc1_:Mesh = null;
         var _loc2_:Parser3DS = new Parser3DS();
         _loc2_.parse(this.var_525.modelData);
         this.objects = _loc2_.objects;
         this.parents = _loc2_.parents;
         var _loc3_:int = 0;
         while(_loc3_ < this.objects.length)
         {
            _loc1_ = this.objects[_loc3_] as Mesh;
            if(_loc1_ != null)
            {
               this.method_764(_loc1_);
            }
            _loc3_++;
         }
         if(this.var_525.imageData.length > 0)
         {
            this.var_525.batchConstructor.addEventListener(Event.COMPLETE,this.method_763);
            this.var_525.batchConstructor.run(4,this.var_525.imageData);
         }
         else
         {
            this.method_758(false);
         }
      }
      
      private function method_763(param1:Event) : void
      {
         this.textures = this.var_525.batchConstructor.textures;
         this.method_758(true);
      }
      
      private function method_758(param1:Boolean) : void
      {
         if(hasAnyFlags(const_378 | const_379) || !resourceLocalStorage.enabled)
         {
         }
         if(param1)
         {
            completeLoading();
         }
         else
         {
            setTimeout(completeLoading,0);
         }
      }
      
      private function method_764(param1:Mesh) : void
      {
         param1.weldVertices(0.001,0.0001);
         param1.weldFaces(0.01,0.001,0.01);
         param1.calculateVerticesNormalsByAngle(name_1212.name_1213,0.01);
         param1.clipping = Clipping.FACE_CLIPPING;
         param1.sorting = Sorting.AVERAGE_Z;
         param1.calculateBounds();
      }
      
      private function method_748(param1:ErrorEvent) : void
      {
         listener.onResourceLoadingFatalError(this,param1.text);
      }
      
      private function method_750() : void
      {
         if(this.var_524 != null)
         {
            this.var_524.removeEventListener(Event.OPEN,this.method_752);
            this.var_524.removeEventListener(Event.COMPLETE,this.method_759);
            this.var_524.removeEventListener(IOErrorEvent.IO_ERROR,this.method_748);
            this.var_524.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.method_748);
            this.var_524 = null;
         }
      }
      
      private function method_762() : void
      {
         if(this.var_526 != null)
         {
            this.var_526.removeEventListener(Event.OPEN,this.method_756);
            this.var_526.removeEventListener(Event.COMPLETE,this.method_760);
            this.var_526.removeEventListener(name_1209.name_1210,this.method_754);
            this.var_526 = null;
         }
      }
      
      private function method_757() : void
      {
         if(this.var_524 != null)
         {
            this.var_524.removeEventListener(Event.OPEN,this.method_761);
            this.var_524.removeEventListener(Event.COMPLETE,this.method_751);
            this.var_524.removeEventListener(IOErrorEvent.IO_ERROR,this.method_748);
            this.var_524.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.method_748);
            this.var_524 = null;
         }
      }
   }
}

import flash.utils.ByteArray;

class ResourceData
{
    
   
   public var modelData:ByteArray;
   
   public var imageData:Vector.<ImageData>;
   
   public var batchConstructor:BatchTextureConstructor;
   
   public function ResourceData()
   {
      this.imageData = new Vector.<ImageData>();
      this.batchConstructor = new BatchTextureConstructor();
      super();
   }
}

import package_303.TextureByteData;

class ImageData
{
    
   
   public var name:String;
   
   public var data:TextureByteData;
   
   public function ImageData(param1:String, param2:TextureByteData)
   {
      this.data = new TextureByteData();
      super();
      this.name = param1;
      this.data = param2;
   }
}

import flash.events.Event;
import flash.events.EventDispatcher;
import package_303.class_35;
import package_303.name_1206;

class BatchTextureConstructor extends EventDispatcher implements class_35
{
    
   
   public var textures:Object;
   
   private var entries:Vector.<ImageData>;
   
   private var maxBatchSize:int;
   
   private var batchSize:int;
   
   private var firstBatchIndex:int;
   
   private var batchCouner:int;
   
   private var totalCounter:int;
   
   private var constructors:Vector.<IndexedTextureConstructor>;
   
   public function BatchTextureConstructor()
   {
      super();
   }
   
   public function run(param1:int, param2:Vector.<ImageData>) : void
   {
      this.maxBatchSize = param1;
      this.entries = param2;
      this.textures = {};
      this.constructors = new Vector.<IndexedTextureConstructor>(param1);
      var _loc3_:int = 0;
      while(_loc3_ < param1)
      {
         this.constructors[_loc3_] = new IndexedTextureConstructor();
         _loc3_++;
      }
      this.totalCounter = 0;
      this.firstBatchIndex = 0;
      this.createBatch();
   }
   
   private function createBatch() : void
   {
      var _loc1_:IndexedTextureConstructor = null;
      this.batchCouner = 0;
      var _loc2_:int = this.firstBatchIndex + this.maxBatchSize;
      if(_loc2_ > this.entries.length)
      {
         _loc2_ = int(this.entries.length);
      }
      this.batchSize = _loc2_ - this.firstBatchIndex;
      var _loc3_:int = 0;
      while(_loc3_ < this.batchSize)
      {
         _loc1_ = this.constructors[_loc3_];
         _loc1_.index = this.firstBatchIndex + _loc3_;
         _loc1_.createTexture(this.entries[_loc1_.index].data,this);
         _loc3_++;
      }
      this.firstBatchIndex = _loc2_;
   }
   
   private function complete() : void
   {
      this.constructors = null;
      this.entries = null;
      dispatchEvent(new Event(Event.COMPLETE));
   }
   
   public function onTextureReady(param1:name_1206) : void
   {
      var _loc2_:IndexedTextureConstructor = IndexedTextureConstructor(param1);
      this.textures[this.entries[_loc2_.index].name] = _loc2_.texture;
      ++this.totalCounter;
      ++this.batchCouner;
      if(this.totalCounter == this.entries.length)
      {
         this.complete();
      }
      else if(this.batchCouner == this.batchSize)
      {
         this.createBatch();
      }
   }
}

import package_303.name_1206;

class IndexedTextureConstructor extends name_1206
{
    
   
   public var index:int;
   
   public function IndexedTextureConstructor()
   {
      super();
   }
}
