package alternativa.tanks
{
   public class class_18
   {
       
      
      private var _value:int;
      
      private var var_23:String;
      
      public function class_18(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this.var_23 = param2;
      }
      
      public function toString() : String
      {
         return this.var_23;
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
