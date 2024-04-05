package package_189
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.media.Sound;
   import flash.media.SoundLoaderContext;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   
   public class SoundCacheLoader extends Sound
   {
       
      
      private var var_1151:String;
      
      private var var_1150:Object;
      
      private var context:SoundLoaderContext;
      
      private var var_1152:Class;
      
      private var var_1154:Class;
      
      private var var_1153:Class;
      
      public function SoundCacheLoader()
      {
         super();
         if(CacheURLLoader.method_129)
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
      
      override public function load(param1:URLRequest, param2:SoundLoaderContext = null) : void
      {
         if(!CacheURLLoader.method_129 || param1 == null)
         {
            super.load(param1,param2);
            return;
         }
         this.context = param2;
         this.var_1151 = name_1870.encode(param1.url);
         var _loc3_:Object = this.var_1150.resolvePath(param1.url.indexOf("http") > -1 ? this.var_1151 : param1.url);
         if(Boolean(_loc3_.exists))
         {
            super.load(new URLRequest(_loc3_.url),param2);
            return;
         }
         var _loc4_:URLLoader = new URLLoader();
         _loc4_.dataFormat = URLLoaderDataFormat.BINARY;
         _loc4_.addEventListener(Event.COMPLETE,this.method_2122,false,0,true);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.method_2120,false,0,true);
         _loc4_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.method_2121,false,0,true);
         _loc4_.load(param1);
      }
      
      private function method_2120(param1:Event) : void
      {
         dispatchEvent(new IOErrorEvent("SoundCacheLoader: IOError!"));
      }
      
      private function method_2121(param1:Event) : void
      {
         dispatchEvent(new SecurityErrorEvent("SoundCacheLoader: Security error!"));
      }
      
      private function method_2122(param1:Event) : void
      {
         var e:Event = param1;
         var bytes:ByteArray = URLLoader(e.target).data as ByteArray;
         var file:Object = new this.var_1152(this.var_1150.resolvePath(this.var_1151).nativePath);
         var fileStream:Object = new this.var_1154();
         try
         {
            fileStream.open(file,this.var_1153.WRITE);
            fileStream.writeBytes(bytes);
            fileStream.close();
         }
         catch(e:Error)
         {
            dispatchEvent(new IOErrorEvent("SoundCacheLoader error! " + e.message + "url: " + var_1151));
         }
         super.load(new URLRequest(file.url),this.context);
      }
   }
}
