package package_21
{
   public class name_832 extends Error
   {
       
      
      public function name_832(param1:String, param2:String)
      {
         super(this.method_1629(param1,param2));
      }
      
      private function method_1629(param1:String, param2:String) : String
      {
         var _loc3_:String = "Command not found: " + param1;
         if(param2 != null)
         {
            _loc3_ += "\n" + param2;
         }
         return _loc3_;
      }
   }
}
