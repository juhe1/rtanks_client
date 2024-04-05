package package_10
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   import package_189.name_1870;
   
   public class CacheLoader extends Loader
   {
       
      
      private var var_1151:String;
      
      private var var_1150:Object;
      
      private var context:LoaderContext;
      
      private var var_3710:Boolean;
      
      private var var_1152:Class;
      
      private var var_1154:Class;
      
      private var var_1153:Class;
      
      public function CacheLoader()
      {
         super();
         if(StartupSettings.method_129)
         {
            this.var_1152 = getDefinitionByName("flash.filesystem.File") as Class;
            this.var_1154 = getDefinitionByName("flash.filesystem.FileStream") as Class;
            this.var_1153 = getDefinitionByName("flash.filesystem.FileMode") as Class;
            this.var_1150 = this.var_1152.applicationStorageDirectory.resolvePath("cache");
            if(!this.var_1150.exists)
            {
               this.var_1150.createDirectory();
            }
            else if(!this.var_1150.isDirectory)
            {
               throw new Error("Cannot create directory." + this.var_1150.nativePath + " is already exists.");
            }
         }
      }
      
      override public function load(param1:URLRequest, param2:LoaderContext = null) : void
      {
         var _loc4_:Object = null;
         var _loc5_:URLLoader = null;
         if(!StartupSettings.method_129)
         {
            super.load(param1,param2);
            return;
         }
         var _loc3_:URLRequest = param1;
         this.context = param2;
         this.var_1151 = name_1870.encode(param1.url);
         if(Boolean((_loc4_ = this.var_1150.resolvePath(this.var_1151)).exists))
         {
            _loc3_ = new URLRequest(_loc4_.url);
            this.var_3710 = true;
         }
         (_loc5_ = new URLLoader()).dataFormat = URLLoaderDataFormat.BINARY;
         _loc5_.addEventListener(Event.COMPLETE,this.method_2122,false,0,true);
         _loc5_.addEventListener(IOErrorEvent.IO_ERROR,this.method_2120,false,0,true);
         _loc5_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.method_2121,false,0,true);
         _loc5_.load(_loc3_);
      }
      
      private function method_2120(param1:Event) : void
      {
         dispatchEvent(new IOErrorEvent("CacheLoader: IOError!"));
      }
      
      private function method_2121(param1:Event) : void
      {
         dispatchEvent(new SecurityErrorEvent("CacheLoader: Security error!"));
      }
      
      private function method_2122(param1:Event) : void
      {
         var file:Object = null;
         var fileStream:Object = null;
         var e:Event = param1;
         var bytes:ByteArray = URLLoader(e.target).data as ByteArray;
         if(!this.var_3710)
         {
            file = new this.var_1152(this.var_1150.resolvePath(this.var_1151).nativePath);
            fileStream = new this.var_1154();
            try
            {
               fileStream.open(file,this.var_1153.WRITE);
               fileStream.writeBytes(URLLoader(e.target).data as ByteArray);
               fileStream.close();
            }
            catch(e:Error)
            {
               dispatchEvent(new IOErrorEvent("CacheLoader error! " + e.message + "url: " + var_1151));
            }
         }
         super.loadBytes(bytes,this.context);
      }
   }
}
