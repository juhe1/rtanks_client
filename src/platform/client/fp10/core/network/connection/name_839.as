package platform.client.fp10.core.network.connection
{
   public class name_839
   {
      
      public static const CLOSED_BY_SERVER:name_839 = new name_839("CLOSED_BY_SERVER","Connection closed by server");
      
      public static const CONNECTION_ERROR:name_839 = new name_839("CONNECTION_ERROR","Connection error");
      
      public static const DATA_PROCESSING_ERROR:name_839 = new name_839("DATA_PROCESSING_ERROR","Data processing error");
      
      public static const SPACE_CLOSED:name_839 = new name_839("SPACE_CLOSED","Space closed");
      
      public static const CLOSED_BY_CLIENT:name_839 = new name_839("CLOSED_BY_CLIENT","Connection closed by client");
       
      
      private var _value:String;
      
      private var var_1624:String;
      
      public function name_839(param1:String, param2:String)
      {
         super();
         this._value = param1;
         this.var_1624 = param2;
      }
      
      public function toString() : String
      {
         return this._value;
      }
      
      public function get method_1797() : String
      {
         return this.var_1624;
      }
   }
}
