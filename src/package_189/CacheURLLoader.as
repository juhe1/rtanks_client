package package_189
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.system.Capabilities;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   
   public class CacheURLLoader extends URLLoader
   {
       
      
      private var url:String;
      
      private var var_1151:String;
      
      private var var_1150:Object;
      
      private var var_1152:Class;
      
      private var var_1154:Class;
      
      private var var_1153:Class;
      
      public function CacheURLLoader()
      {
         super();
         if(method_129)
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
      
      public static function get method_129() : Boolean
      {
         return Capabilities.playerType == "Desktop" || Capabilities.playerType == "External";
      }
      
      override public function load(param1:URLRequest) : void
      {
         if(!method_129)
         {
            super.load(param1);
            return;
         }
         this.url = param1.url;
         this.var_1151 = name_1870.encode(this.url);
         var _loc2_:Object = this.var_1150.resolvePath(param1.url.indexOf("http") > -1 ? this.var_1151 : param1.url);
         if(Boolean(_loc2_.exists))
         {
            super.addEventListener(IOErrorEvent.IO_ERROR,this.method_1406,false,0,true);
            super.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.method_1406,false,0,true);
            super.load(new URLRequest(_loc2_.url));
            return;
         }
         this.method_1407(param1);
      }
      
      private function method_1407(param1:URLRequest) : void
      {
         this.dataFormat = URLLoaderDataFormat.BINARY;
         this.addEventListener(Event.COMPLETE,this.onComplete,false,0,true);
         super.load(param1);
      }
      
      private function method_1406(param1:Event) : void
      {
         this.method_1407(new URLRequest(this.url));
      }
      
      private function onComplete(param1:Event) : void
      {
         var e:Event = param1;
         var file:Object = new this.var_1152(this.var_1150.resolvePath(this.var_1151).nativePath);
         var fileStream:Object = new this.var_1154();
         try
         {
            fileStream.open(file,this.var_1153.WRITE);
            fileStream.writeBytes(URLLoader(e.target).data as ByteArray);
            fileStream.close();
         }
         catch(e:Error)
         {
            throw new IOErrorEvent("CacheURLLoader error! " + e.message);
         }
      }
   }
}
