package scpacker.networking
{
   import alternativa.osgi.OSGi;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.Socket;
   import flash.utils.ByteArray;
   import package_1.Main;
   import package_188.name_560;
   import package_19.name_42;
   
   public class Network extends NetworkService
   {
       
      
      private var var_108:Socket;
      
      private var var_109:Array;
      
      private var var_110:int = 1;
      
      public var var_111:*;
      
      public var var_112:String = "F54BF833E76C15A12B7977CF5858FB96";
      
      public var var_113:int = 1;
      
      public var var_92:Function;
      
      public function Network()
      {
         this.var_109 = new Array(1,2,3,4,5,6,7,8,9);
         super();
         this.var_108 = new Socket();
      }
      
      public function connect(param1:String, param2:int) : void
      {
         this.var_108.connect(param1,param2);
         this.var_108.addEventListener(ProgressEvent.SOCKET_DATA,this.method_125);
         this.var_108.addEventListener(Event.CONNECT,this.method_1);
         this.var_108.addEventListener(Event.CLOSE,this.method_128);
         this.var_108.addEventListener(IOErrorEvent.IO_ERROR,this.method_126);
         this.var_108.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.method_127);
      }
      
      public function destroy() : void
      {
         this.var_108.removeEventListener(ProgressEvent.SOCKET_DATA,this.method_125);
         this.var_108.removeEventListener(Event.CONNECT,this.method_1);
         this.var_108.removeEventListener(Event.CLOSE,this.method_128);
         this.var_108.removeEventListener(IOErrorEvent.IO_ERROR,this.method_126);
         this.var_108.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.method_127);
      }
      
      public function addEventListener(param1:class_6) : void
      {
         addListener(param1);
      }
      
      public function removeEventListener(param1:class_6) : void
      {
         removeListener(param1);
      }
      
      public function send(param1:String) : void
      {
         trace("sended: ", param1);
         var str:String = param1;
         try
         {
            str = this.var_111 == null ? this.method_137(str) : String(this.var_111.encrypt(str,this.var_112));
            str += "end~";
            this.var_108.writeUTFBytes(str);
            this.var_108.flush();
         }
         catch(e:Error)
         {
            OSGi.clientLog.log("NETWORK_SERVICE",e.message + "\n" + e.getStackTrace());
         }
      }
      
      private function method_137(param1:String) : String
      {
         var _loc2_:int = (this.var_110 + 1) % this.var_109.length;
         if(_loc2_ <= 0)
         {
            _loc2_ = 1;
         }
         this.var_110 = _loc2_;
         var _loc3_:Array = param1.split("");
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_[_loc4_] = String.fromCharCode(param1.charCodeAt(_loc4_) + (_loc2_ + 1));
            _loc4_++;
         }
         return _loc2_ + _loc3_.join("");
      }
      
      private function method_1(param1:Event) : void
      {
         if(this.var_92 != null)
         {
            this.var_92.call();
         }
      }
      
      private function method_125(param1:Event) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         var _loc3_:int = int(this.var_108.bytesAvailable);
         this.var_108.readBytes(_loc2_,0,_loc3_);
         var _loc4_:String = _loc2_.readUTFBytes(_loc3_);
         method_135(_loc4_,this);
         _loc2_.clear();
         this.var_108.flush();
      }
      
      private function method_128(param1:Event) : void
      {
         this.var_108.close();
         var _loc2_:name_42 = Main.osgi.getService(name_42) as name_42;
         _loc2_.showAlert("Connection closed by server!");
         var _loc3_:int = 0;
         while(_loc3_ < Main.mainContainer.numChildren)
         {
            Main.mainContainer.removeChildAt(1);
            _loc3_++;
         }
         name_560(Main.osgi.getService(name_560)).drawBg();
         name_560(Main.osgi.getService(name_560)).showBg();
      }
      
      private function method_126(param1:Event) : void
      {
         this.var_108.close();
         var _loc2_:name_42 = Main.osgi.getService(name_42) as name_42;
         _loc2_.showAlert("Connection to server " + "failed");
         var _loc3_:int = 0;
         while(_loc3_ < Main.mainContainer.numChildren)
         {
            Main.mainContainer.removeChildAt(1);
            _loc3_++;
         }
         name_560(Main.osgi.getService(name_560)).drawBg();
         name_560(Main.osgi.getService(name_560)).showBg();
      }
      
      private function method_127(param1:Event) : void
      {
         this.var_108.close();
         var _loc2_:name_42 = Main.osgi.getService(name_42) as name_42;
         _loc2_.showAlert("Connection to server " + "failed");
         var _loc3_:int = 0;
         while(_loc3_ < Main.mainContainer.numChildren)
         {
            Main.mainContainer.removeChildAt(1);
            _loc3_++;
         }
         name_560(Main.osgi.getService(name_560)).drawBg();
         name_560(Main.osgi.getService(name_560)).showBg();
      }
      
      public function method_138() : Boolean
      {
         return this.var_108.connected;
      }
   }
}
