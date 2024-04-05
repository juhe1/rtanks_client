package projects.tanks.clients.flash.resources.resource
{
   import alternativa.proplib.PropLibRegistry;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flash.utils.setTimeout;
   import package_13.Long;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.IResourceSerializationListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.ResourceInfo;
   import platform.client.fp10.core.resource.ResourceStatus;
   import platform.client.fp10.core.resource.SafeURLLoader;
   
   public class MapResource extends Resource
   {
      
      public static const name_497:int = 7;
      
      public static var resourceRegistry:ResourceRegistry;
      
      private static const const_1458:Vector.<int> = Vector.<int>([77,65,80,1]);
      
      private static const const_1463:int = 0;
      
      private static const const_384:int = 1;
      
      private static const const_1459:int = 2;
      
      private static const const_1462:int = 3;
      
      private static const const_1461:String = "proplibs.xml";
      
      private static const const_1460:String = "map.xml";
       
      
      public var var_976:PropLibRegistry;
      
      public var var_974:ByteArray;
      
      public var var_975:ByteArray;
      
      public var var_977:Vector.<Long>;
      
      private var loader:SafeURLLoader;
      
      private var var_527:int = -1;
      
      public function MapResource(param1:ResourceInfo)
      {
         super(param1);
      }
      
      override public function get description() : String
      {
         return "Map";
      }
      
      override public function load(param1:String, param2:IResourceLoadingListener) : void
      {
         super.load(param1,param2);
         this.method_1197();
      }
      
      private function method_1197() : void
      {
         this.method_1196(this.method_1200,this.method_1199);
         this.loader.load(new URLRequest(baseUrl + "proplibs.xml"));
         this.var_527 = 2;
         status = ResourceStatus.REQUESTED;
         startTimeoutTracking();
      }
      
      override public function close() : void
      {
         if(this.var_527 != 0)
         {
            this.loader.close();
         }
         this.method_1194();
         this.var_974 = null;
         this.var_975 = null;
      }
      
      override protected function doReload() : void
      {
         switch(this.var_527)
         {
            case 2:
               this.loader.close();
               this.method_1194();
               this.method_1197();
               break;
            case 3:
               this.loader.close();
               this.method_1194();
               this.method_1198();
         }
      }
      
      override public function loadBytes(param1:ByteArray, param2:IResourceLoadingListener) : Boolean
      {
         this.listener = param2;
         if(param1 == null || param1.length < const_1458.length)
         {
            return false;
         }
         var _loc3_:int = 0;
         while(_loc3_ < const_1458.length)
         {
            if(param1.readUnsignedByte() != const_1458[_loc3_])
            {
               return false;
            }
            _loc3_++;
         }
         var _loc4_:int = param1.readInt();
         this.var_974 = new ByteArray();
         param1.readBytes(this.var_974,0,_loc4_);
         _loc4_ = param1.readInt();
         this.var_975 = new ByteArray();
         param1.readBytes(this.var_975,0,_loc4_);
         this.method_1195();
         setTimeout(completeLoading,0);
         return true;
      }
      
      override public function serialize(param1:IResourceSerializationListener) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         var _loc3_:int = 0;
         while(_loc3_ < const_1458.length)
         {
            _loc2_.writeByte(const_1458[_loc3_]);
            _loc3_++;
         }
         _loc2_.writeInt(this.var_974.length);
         _loc2_.writeBytes(this.var_974);
         _loc2_.writeInt(this.var_975.length);
         _loc2_.writeBytes(this.var_975);
         param1.onSerializationComplete(this,_loc2_);
      }
      
      private function method_1200(param1:Event) : void
      {
         updateLastActivityTime();
      }
      
      private function method_1199(param1:Event) : void
      {
         this.var_974 = this.loader.data;
         this.method_1194();
         this.method_1198();
      }
      
      private function method_1203(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:int = 0;
         var _loc4_:Long = null;
         var _loc5_:name_496 = null;
         this.var_976 = new PropLibRegistry();
         this.var_977 = new Vector.<Long>();
         for each(_loc2_ in param1.library)
         {
            _loc3_ = int("0x" + _loc2_.attribute("resource-id").toString());
            _loc4_ = Long.getLong(0,_loc3_);
            this.var_977.push(_loc4_);
            _loc5_ = name_496(resourceRegistry.getResource(_loc4_));
            if(_loc5_ == null)
            {
               throw new Error("Prop library resource [id=" + _loc4_ + "] not found");
            }
            this.var_976.name_1677(_loc5_.name_1678);
         }
      }
      
      private function method_1198() : void
      {
         this.method_1196(this.method_1201,this.method_1202);
         this.loader.load(new URLRequest(baseUrl + "map.xml"));
         this.var_527 = 3;
         startTimeoutTracking();
      }
      
      private function method_1201(param1:Event) : void
      {
         updateLastActivityTime();
      }
      
      private function method_1202(param1:Event) : void
      {
         this.var_975 = this.loader.data;
         this.method_1194();
         this.method_1195();
         completeLoading();
      }
      
      private function method_1195() : void
      {
         try
         {
            this.method_1203(XML(this.var_974.toString()));
         }
         catch(e:Error)
         {
            listener.onResourceLoadingFatalError(this,e.message + " " + e.getStackTrace());
         }
      }
      
      private function onLoadingError(param1:ErrorEvent) : void
      {
         listener.onResourceLoadingFatalError(this,param1.text);
      }
      
      private function method_1196(param1:Function, param2:Function) : void
      {
         this.loader = new SafeURLLoader();
         this.loader.dataFormat = URLLoaderDataFormat.BINARY;
         this.loader.addEventListener(Event.OPEN,param1);
         this.loader.addEventListener(Event.COMPLETE,param2);
         this.loader.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadingError);
         this.loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadingError);
      }
      
      private function method_1194() : void
      {
         if(this.loader == null)
         {
            return;
         }
         this.loader.removeEventListener(Event.OPEN,this.method_1200);
         this.loader.removeEventListener(Event.COMPLETE,this.method_1199);
         this.loader.removeEventListener(IOErrorEvent.IO_ERROR,this.onLoadingError);
         this.loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadingError);
         this.loader = null;
      }
   }
}
