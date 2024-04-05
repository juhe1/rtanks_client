package platform.client.fp10.core.network.connection
{
   public class name_12
   {
       
      
      private var var_66:String;
      
      private var var_67:Vector.<int>;
      
      public function name_12(param1:String, param2:Vector.<int>)
      {
         super();
         this.var_66 = param1;
         this.var_67 = param2;
      }
      
      public function get method_88() : String
      {
         return this.var_66;
      }
      
      public function get ports() : Vector.<int>
      {
         return this.var_67;
      }
      
      public function toString() : String
      {
         return "[host=" + String(this.var_66) + " ports=" + String(this.var_67) + "]";
      }
   }
}
