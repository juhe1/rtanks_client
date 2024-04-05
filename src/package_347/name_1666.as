package package_347
{
   public class name_1666
   {
      
      public static const UNKNOWN:name_1666 = new name_1666(0);
      
      public static const name_1669:name_1666 = new name_1666(1);
      
      public static const INCOMING:name_1666 = new name_1666(2);
      
      public static const OUTGOING:name_1666 = new name_1666(3);
       
      
      private var var_710:int;
      
      public function name_1666(param1:int)
      {
         super();
         this.var_710 = param1;
      }
      
      public function get state() : int
      {
         return this.var_710;
      }
      
      public function toString() : String
      {
         return "FriendState{_state=" + String(this.var_710) + "}";
      }
   }
}
