package package_423
{
   public class ChatAddressMode
   {
      
      public static const PUBLIC_TO_ALL:ChatAddressMode = new ChatAddressMode(0,"PUBLIC_TO_ALL");
      
      public static const PUBLIC_ADDRESSED:ChatAddressMode = new ChatAddressMode(1,"PUBLIC_ADDRESSED");
      
      public static const PRIVATE:ChatAddressMode = new ChatAddressMode(2,"PRIVATE");
       
      
      private var _value:int;
      
      private var var_23:String;
      
      public function ChatAddressMode(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this.var_23 = param2;
      }
      
      public static function get method_393() : Vector.<ChatAddressMode>
      {
         var _loc1_:Vector.<ChatAddressMode> = new Vector.<ChatAddressMode>();
         _loc1_.push(PUBLIC_TO_ALL);
         _loc1_.push(PUBLIC_ADDRESSED);
         _loc1_.push(PRIVATE);
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "ChatAddressMode [" + this.var_23 + "]";
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
