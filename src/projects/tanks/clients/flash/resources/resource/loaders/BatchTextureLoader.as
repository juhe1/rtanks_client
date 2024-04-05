package projects.tanks.clients.flash.resources.resource.loaders
{
   import alternativa.engine3d.loaders.events.LoaderEvent;
   import alternativa.engine3d.loaders.events.LoaderProgressEvent;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.utils.ByteArray;
   import package_303.TextureByteData;
   import package_304.name_1209;
   import package_353.TextureByteDataMap;
   
   public class BatchTextureLoader extends EventDispatcher
   {
      
      private static var var_2039:Class = name_2420;
      
      private static var var_2038:ByteArray = new var_2039();
      
      private static const name_1183:int = 0;
      
      private static const const_1790:int = 1;
       
      
      private var state:int = 0;
      
      private var var_2034:name_2417;
      
      private var var_2041:String;
      
      private var var_2042:Object;
      
      private var var_2036:Vector.<String>;
      
      private var var_2035:int;
      
      private var var_2037:int;
      
      private var var_619:TextureByteDataMap;
      
      private var var_2040:Boolean;
      
      public function BatchTextureLoader(param1:Object)
      {
         var _loc2_:* = null;
         super();
         if(param1 == null)
         {
            throw ArgumentError("Parameter batch cannot be null");
         }
         this.var_2042 = param1;
         this.var_2036 = new Vector.<String>();
         for(_loc2_ in param1)
         {
            this.var_2036.push(_loc2_);
         }
         this.var_2037 = this.var_2036.length;
      }
      
      public function get textures() : TextureByteDataMap
      {
         return this.var_619;
      }
      
      public function close() : void
      {
         if(this.state == 1)
         {
            this.var_2034.close();
            this.method_1160();
            this.var_619 = null;
            this.state = 0;
         }
      }
      
      public function unload() : void
      {
         this.var_619 = null;
      }
      
      public function load(param1:String) : void
      {
         if(param1 == null)
         {
            throw ArgumentError("Parameter baseURL cannot be null");
         }
         this.var_2041 = param1;
         if(this.var_2034 == null)
         {
            this.var_2034 = new name_2417();
            this.var_2034.addEventListener(Event.OPEN,this.method_2127);
            this.var_2034.addEventListener(LoaderProgressEvent.LOADER_PROGRESS,this.method_2129);
            this.var_2034.addEventListener(Event.COMPLETE,this.method_2128);
            this.var_2034.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadingError);
            this.var_2034.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadingError);
         }
         else
         {
            this.close();
         }
         this.var_619 = new TextureByteDataMap();
         this.var_2040 = false;
         this.state = 1;
         this.var_2035 = 0;
         this.method_2126();
      }
      
      public function reload() : void
      {
         if(this.state == 0)
         {
            throw new Error("Wrong method invocation");
         }
         this.var_2034.reload();
      }
      
      private function method_2126() : void
      {
         var _loc1_:name_1211 = this.var_2042[this.var_2036[this.var_2035]];
         var _loc2_:String = Boolean(_loc1_.name_2419) ? this.var_2041 + _loc1_.name_2419 : null;
         this.var_2034.load(this.var_2041 + _loc1_.name_2421,_loc2_);
      }
      
      private function method_2127(param1:Event) : void
      {
         if(!this.var_2040)
         {
            this.var_2040 = true;
            if(hasEventListener(Event.OPEN))
            {
               dispatchEvent(new Event(Event.OPEN));
            }
         }
         if(hasEventListener(LoaderEvent.PART_OPEN))
         {
            dispatchEvent(new LoaderEvent(LoaderEvent.PART_OPEN,this.var_2037,this.var_2035));
         }
      }
      
      private function method_2129(param1:LoaderProgressEvent) : void
      {
         var _loc2_:Number = NaN;
         if(hasEventListener(LoaderProgressEvent.LOADER_PROGRESS))
         {
            _loc2_ = (this.var_2035 + param1.totalProgress) / this.var_2037;
            dispatchEvent(new LoaderProgressEvent(LoaderProgressEvent.LOADER_PROGRESS,this.var_2037,this.var_2035,_loc2_,param1.bytesLoaded,param1.bytesTotal));
         }
      }
      
      private function method_2128(param1:Event) : void
      {
         this.var_619.putValue(this.var_2036[this.var_2035],new TextureByteData(this.var_2034.diffuseData,this.var_2034.opacityData));
         this.method_2125();
      }
      
      private function onLoadingError(param1:ErrorEvent) : void
      {
         var _loc2_:String = this.var_2036[this.var_2035];
         this.var_619.putValue(_loc2_,new TextureByteData(this.var_2034.diffuseData || var_2038));
         dispatchEvent(new name_1209(name_1209.name_1210,_loc2_,param1.text));
         this.method_2125();
      }
      
      private function method_2125() : void
      {
         if(this.state == 0)
         {
            return;
         }
         if(hasEventListener(LoaderEvent.PART_COMPLETE))
         {
            dispatchEvent(new LoaderEvent(LoaderEvent.PART_COMPLETE,this.var_2037,this.var_2035));
         }
         if(++this.var_2035 == this.var_2037)
         {
            this.method_1160();
            this.state = 0;
            if(hasEventListener(Event.COMPLETE))
            {
               dispatchEvent(new Event(Event.COMPLETE));
            }
         }
         else
         {
            this.method_2126();
         }
      }
      
      private function method_1160() : void
      {
         this.var_2036 = null;
      }
   }
}
