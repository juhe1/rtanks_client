package package_20
{
   import package_13.Long;
   import platform.client.fp10.core.type.name_178;
   import platform.client.fp10.core.type.name_202;
   import platform.client.fp10.core.type.name_70;
   
   public class name_1415 implements name_70
   {
       
      
      private var var_21:Long;
      
      private var var_218:name_202;
      
      public function name_1415(param1:Long, param2:name_202)
      {
         super();
         this.var_21 = param1;
         this.var_218 = param2;
      }
      
      public function get id() : Long
      {
         return this.var_21;
      }
      
      public function get name() : String
      {
         throw new Error("Object not loaded, id = " + this.var_21);
      }
      
      public function get gameClass() : name_178
      {
         throw new Error("Object not loaded, id = " + this.var_21);
      }
      
      public function get space() : name_202
      {
         return this.var_218;
      }
      
      public function method_316(param1:Class) : Boolean
      {
         return false;
      }
      
      public function name_176(param1:Class) : Object
      {
         throw new Error("Object not loaded, id = " + this.var_21);
      }
      
      public function event(param1:Class) : Object
      {
         throw new Error("Object not loaded, id = " + this.var_21);
      }
   }
}
