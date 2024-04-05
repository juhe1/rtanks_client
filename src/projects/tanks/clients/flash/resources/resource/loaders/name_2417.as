package projects.tanks.clients.flash.resources.resource.loaders
{
   import alternativa.engine3d.loaders.events.LoaderEvent;
   import alternativa.engine3d.loaders.events.LoaderProgressEvent;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.SafeURLLoader;
   
   public class name_2417 extends EventDispatcher
   {
      
      private static const name_1183:int = 0;
      
      private static const const_2318:int = 1;
      
      private static const const_2317:int = 2;
       
      
      public var diffuseData:ByteArray;
      
      public var opacityData:ByteArray;
      
      private var state:int = 0;
      
      private var var_524:SafeURLLoader;
      
      private var var_3087:String;
      
      private var var_3086:String;
      
      public function name_2417()
      {
         super();
      }
      
      public function load(param1:String, param2:String = null) : void
      {
         this.unload();
         this.var_3087 = param1;
         this.var_3086 = param2;
         this.method_2849(1,param1);
      }
      
      public function reload() : void
      {
         switch(this.state)
         {
            case 1:
               this.method_1194();
               this.method_2849(1,this.var_3087);
               break;
            case 2:
               this.method_1194();
               this.method_2849(2,this.var_3086);
               break;
            default:
               throw new Error("Wrong loader state: " + this.state);
         }
      }
      
      public function close() : void
      {
         if(this.state == 0)
         {
            return;
         }
         this.state = 0;
         this.var_524.close();
         this.method_1160();
      }
      
      public function unload() : void
      {
         this.close();
         this.diffuseData = null;
         this.opacityData = null;
      }
      
      private function method_1160() : void
      {
         this.method_1194();
         this.var_3087 = null;
         this.var_3086 = null;
      }
      
      private function method_2849(param1:int, param2:String) : void
      {
         this.state = param1;
         this.createLoader();
         this.var_524.load(new URLRequest(param2));
      }
      
      private function method_2851(param1:Event) : void
      {
         if(this.diffuseData == null && hasEventListener(Event.OPEN))
         {
            dispatchEvent(new Event(Event.OPEN));
         }
         if(hasEventListener(LoaderEvent.PART_OPEN))
         {
            dispatchEvent(new LoaderEvent(LoaderEvent.PART_OPEN,2,this.state == 1 ? int(0) : int(1)));
         }
      }
      
      private function method_2850(param1:ProgressEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         if(hasEventListener(LoaderProgressEvent.LOADER_PROGRESS))
         {
            _loc2_ = this.state == 1 ? int(0) : int(1);
            _loc3_ = 0.5 * (_loc2_ + param1.bytesLoaded / param1.bytesTotal);
            dispatchEvent(new LoaderProgressEvent(LoaderProgressEvent.LOADER_PROGRESS,2,_loc2_,_loc3_,param1.bytesLoaded,param1.bytesTotal));
         }
      }
      
      private function method_2853(param1:Event) : void
      {
         switch(this.state)
         {
            case 1:
               this.diffuseData = this.var_524.data;
               this.method_1194();
               this.method_2852(0);
               if(Boolean(this.var_3086))
               {
                  this.method_2849(2,this.var_3086);
                  break;
               }
               this.complete();
               break;
            case 2:
               this.opacityData = this.var_524.data;
               this.method_1194();
               this.method_2852(1);
               this.complete();
         }
      }
      
      private function method_2852(param1:int) : void
      {
         if(hasEventListener(LoaderEvent.PART_COMPLETE))
         {
            dispatchEvent(new LoaderEvent(LoaderEvent.PART_COMPLETE,2,param1));
         }
      }
      
      private function onLoadingError(param1:ErrorEvent) : void
      {
         this.state = 0;
         this.method_1160();
         dispatchEvent(param1);
      }
      
      private function complete() : void
      {
         this.state = 0;
         this.method_1160();
         if(hasEventListener(Event.COMPLETE))
         {
            dispatchEvent(new Event(Event.COMPLETE));
         }
      }
      
      private function createLoader() : void
      {
         this.var_524 = new SafeURLLoader();
         this.var_524.dataFormat = URLLoaderDataFormat.BINARY;
         this.var_524.addEventListener(Event.OPEN,this.method_2851);
         this.var_524.addEventListener(ProgressEvent.PROGRESS,this.method_2850);
         this.var_524.addEventListener(Event.COMPLETE,this.method_2853);
         this.var_524.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadingError);
         this.var_524.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadingError);
      }
      
      private function method_1194() : void
      {
         if(this.var_524 != null)
         {
            this.var_524.close();
            this.var_524.removeEventListener(Event.OPEN,this.method_2851);
            this.var_524.removeEventListener(ProgressEvent.PROGRESS,this.method_2850);
            this.var_524.removeEventListener(Event.COMPLETE,this.method_2853);
            this.var_524.removeEventListener(IOErrorEvent.IO_ERROR,this.onLoadingError);
            this.var_524.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadingError);
            this.var_524 = null;
         }
      }
   }
}
