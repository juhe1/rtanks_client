package package_351
{
   public class PropData
   {
       
      
      private var var_23:String;
      
      private var var_2426:Object;
      
      public function PropData(param1:String)
      {
         this.var_2426 = {};
         super();
         this.var_23 = param1;
      }
      
      public function get name() : String
      {
         return this.var_23;
      }
      
      public function name_2679(param1:String, param2:PropState) : void
      {
         this.var_2426[param1] = param2;
      }
      
      public function method_2462(param1:String) : PropState
      {
         return this.var_2426[param1];
      }
      
      public function name_1684() : PropState
      {
         return this.var_2426[PropState.name_2682];
      }
      
      public function toString() : String
      {
         return "[Prop name=" + this.var_23 + "]";
      }
      
      public function method_2461() : void
      {
         var _loc1_:String = null;
         var _loc2_:PropState = null;
         for(_loc1_ in this.var_2426)
         {
            _loc2_ = this.var_2426[_loc1_];
            _loc2_.name_2685();
         }
      }
   }
}
