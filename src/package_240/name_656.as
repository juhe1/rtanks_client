package package_240
{
   public class name_656
   {
      
      public static const const_1553:name_656 = new name_656("without_rotation");
      
      public static const name_1234:name_656 = new name_656("use_random_rotation");
       
      
      private var var_710:String;
      
      public function name_656(param1:String)
      {
         super();
         this.var_710 = param1;
      }
      
      public function get state() : String
      {
         return this.var_710;
      }
      
      public function toString() : String
      {
         return "RotationState{_state=" + String(this.var_710) + "}";
      }
   }
}
