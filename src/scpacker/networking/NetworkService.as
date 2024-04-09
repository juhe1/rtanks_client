package scpacker.networking
{
   import package_102.Command;
   import package_102.Type;
   
   public class NetworkService
   {
      
      private static var listeners:Vector.<class_6>;
      
      public static const const_26:String = "end~";
      
      public static const const_25:String = ";";
       
      
      private var var_107:String = "";
      
      public function NetworkService()
      {
         super();
         listeners = new Vector.<class_6>();
      }
      
      public static function getType(param1:String) : Type
      {
         var _loc2_:Type = null;
         switch(param1)
         {
            case "auth":
               _loc2_ = Type.AUTH;
               break;
            case "registration":
               _loc2_ = Type.REGISTRATON;
               break;
            case "chat":
               _loc2_ = Type.CHAT;
               break;
            case "lobby":
               _loc2_ = Type.LOBBY;
               break;
            case "garage":
               _loc2_ = Type.GARAGE;
               break;
            case "battle":
               _loc2_ = Type.BATTLE;
               break;
            case "ping":
               _loc2_ = Type.PING;
               break;
            case "lobby_chat":
               _loc2_ = Type.LOBBY_CHAT;
               break;
            case "clan":
               _loc2_ = Type.CLAN;
               break;
            case "system":
               _loc2_ = Type.SYSTEM;
               break;
            default:
               _loc2_ = Type.UNKNOWN;
         }
         return _loc2_;
      }
      
      public function method_135(param1:String, param2:Network) : void
      {
         var _loc5_:Array = null;
         var _loc6_:Type = null;
         var _loc7_:String = null;
         var _loc8_:int = 0;
         var _loc9_:Command = null;
         param1 = this.var_107 + param1;
         var _loc3_:Array = param1.split("end~");
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length - 1)
         {
            _loc5_ = _loc3_[_loc4_].split(";");
            _loc6_ = getType(_loc5_[0]);
            if(_loc6_ == null || _loc6_ == Type.UNKNOWN)
            {
               throw new Error("Что то пошло не так  " + _loc5_[0]);
            }
            _loc7_ = "";
            _loc8_ = 1;
            while(_loc8_ < _loc5_.length)
            {
               _loc7_ += _loc5_[_loc8_] + ";";
               _loc8_++;
            }
            _loc9_ = new Command(_loc6_,_loc7_.split(";"),param1);
            this.method_133(_loc9_);
            _loc4_++;
         }
         this.var_107 = _loc3_[_loc3_.length - 1];
      }
      
      public function method_136(param1:String) : Boolean
      {
         return param1.charAt(param1.length - 1) == "end~";
      }
      
      public function method_133(param1:Command) : void
      {
         var _loc2_:class_6 = null;
         for each(_loc2_ in listeners)
         {
            _loc2_.onData(param1);
         }
      }
      
      public function addListener(param1:class_6) : void
      {
         listeners.push(param1);
      }
      
      public function removeListener(param1:class_6) : void
      {
         var _loc3_:class_6 = null;
         var _loc2_:int = 0;
         for each(_loc3_ in listeners)
         {
            if(_loc3_ == param1)
            {
               break;
            }
            _loc2_++;
         }
         listeners.removeAt(_loc2_);
      }
      
      private function method_134(... rest) : Array
      {
         return new Array(rest);
      }
   }
}
