package package_468
{
   import flash.utils.Dictionary;
   
   public class name_3269
   {
       
      
      private var var_226:Dictionary;
      
      public function name_3269(param1:Dictionary = null)
      {
         super();
         this.var_226 = param1;
      }
      
      public function get parameters() : Dictionary
      {
         return this.var_226;
      }
      
      public function set parameters(param1:Dictionary) : void
      {
         this.var_226 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "LoginParameters [";
         _loc1_ += "parameters = " + this.parameters + " ";
         return _loc1_ + "]";
      }
   }
}
