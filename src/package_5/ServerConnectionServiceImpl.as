package package_5
{
   import flash.net.URLLoader;
   import package_1.Main;
   import platform.client.fp10.core.network.connection.name_12;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class ServerConnectionServiceImpl implements name_21
   {
       
      
      private var loader:URLLoader;
      
      private var networker:Network;
      
      private var var_92:Function;
      
      public function ServerConnectionServiceImpl()
      {
         super();
      }
      
      public function connect(param1:name_12, param2:Function) : void
      {
         this.networker = new Network();
         this.var_92 = param2;
         this.networker.var_92 = param2;
         var _loc3_:String = param1.method_88;
         var _loc4_:int = param1.ports[0];
         this.networker.connect(_loc3_,_loc4_);
         Main.osgi.name_1(name_2,this.networker);
      }
   }
}
