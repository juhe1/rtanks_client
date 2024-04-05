package package_2
{
   import alternativa.osgi.OSGi;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import package_102.Command;
   import package_102.name_346;
   import package_189.CacheURLLoader;
   import scpacker.networking.Network;
   import scpacker.networking.class_6;
   
   public class AESEncrypterModel implements class_6
   {
       
      
      private var var_116:Network;
      
      private var loader:Loader;
      
      public function AESEncrypterModel()
      {
         super();
      }
      
      public function onData(param1:Command) : void
      {
         var aesBytes:ByteArray = null;
         var array:Array = null;
         var byte:String = null;
         var loaderContext:LoaderContext = null;
         var data:Command = param1;
         if(data.type == name_346.SYSTEM)
         {
            if(data.name_319[0] == "set_aes_data")
            {
               try
               {
                  aesBytes = new ByteArray();
                  array = data.name_319[1].split(",");
                  for each(byte in array)
                  {
                     aesBytes.writeByte(parseInt(byte));
                  }
                  loaderContext = new LoaderContext(false,ApplicationDomain.currentDomain);
                  if(CacheURLLoader.method_129)
                  {
                     loaderContext.allowLoadBytesCodeExecution = true;
                  }
                  this.loader = new Loader();
                  this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.method_142);
                  this.loader.loadBytes(aesBytes,loaderContext);
               }
               catch(e:Error)
               {
                  OSGi.clientLog.log("AES_MODEL","set_aes_data error: %1",e.getStackTrace());
               }
            }
         }
      }
      
      private function method_142(param1:Event) : void
      {
         this.var_116.var_111 = new (Class(this.loader.contentLoaderInfo.applicationDomain.getDefinition("Main")))();
      }
      
      public function name_16(param1:Network) : void
      {
         this.var_116 = param1;
         param1.send("system;get_aes_data;" + Game.var_1);
      }
   }
}
