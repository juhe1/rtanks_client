package package_423
{
   public class MessageType
   {
      
      public static const USER:MessageType = new MessageType(0,"USER");
      
      public static const SYSTEM:MessageType = new MessageType(1,"SYSTEM");
      
      public static const WARNING:MessageType = new MessageType(2,"WARNING");
       
      
      private var _value:int;
      
      private var var_23:String;
      
      public function MessageType(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this.var_23 = param2;
      }
      
      public static function get method_393() : Vector.<MessageType>
      {
         var _loc1_:Vector.<MessageType> = new Vector.<MessageType>();
         _loc1_.push(USER);
         _loc1_.push(SYSTEM);
         _loc1_.push(WARNING);
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "MessageType [" + this.var_23 + "]";
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function get name() : String
      {
         return this.var_23;
      }
   }
}
