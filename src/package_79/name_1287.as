package package_79
{
   public class name_1287
   {
      
      public static const AT_BASE:name_1287 = new name_1287(0,"AT_BASE");
      
      public static const DROPPED:name_1287 = new name_1287(1,"DROPPED");
      
      public static const CARRIED:name_1287 = new name_1287(2,"CARRIED");
       
      
      private var _value:int;
      
      private var var_2136:String;
      
      public function name_1287(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this.var_2136 = param2;
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function toString() : String
      {
         return "CTFFlagState [" + this.var_2136 + "]";
      }
   }
}
