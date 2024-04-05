package package_36
{
   public class NetworkService implements name_105
   {
       
      
      private var var_1090:String;
      
      private var var_67:Array;
      
      private var var_1093:String;
      
      private var var_1091:int;
      
      private var var_1092:String;
      
      private var listeners:Array;
      
      public function NetworkService(param1:String, param2:Array, param3:String, param4:String, param5:int)
      {
         super();
         this.listeners = new Array();
         this.var_1090 = param1;
         this.var_67 = param2;
         this.var_1092 = param3;
         this.var_1093 = param4;
         this.var_1091 = param5;
      }
      
      public function addEventListener(param1:class_6) : void
      {
         var _loc2_:int = this.listeners.indexOf(param1);
         if(_loc2_ == -1)
         {
            this.listeners.push(param1);
         }
      }
      
      public function removeEventListener(param1:class_6) : void
      {
         var _loc2_:int = this.listeners.indexOf(param1);
         if(_loc2_ != -1)
         {
            this.listeners.splice(_loc2_,1);
         }
      }
      
      public function get server() : String
      {
         return this.var_1090;
      }
      
      public function get ports() : Array
      {
         return this.var_67;
      }
      
      public function get resourcesPath() : String
      {
         return this.var_1092;
      }
      
      public function get proxyHost() : String
      {
         return this.var_1093;
      }
      
      public function get proxyPort() : int
      {
         return this.var_1091;
      }
   }
}
