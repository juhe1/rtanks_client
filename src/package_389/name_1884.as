package package_389
{
   import package_13.Long;
   
   public class name_1884
   {
       
      
      private var var_199:Vector.<Long>;
      
      public function name_1884(param1:Vector.<Long> = null)
      {
         super();
         this.var_199 = param1;
      }
      
      public function get objects() : Vector.<Long>
      {
         return this.var_199;
      }
      
      public function set objects(param1:Vector.<Long>) : void
      {
         this.var_199 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ContainerCC [";
         _loc1_ += "objects = " + this.objects + " ";
         return _loc1_ + "]";
      }
   }
}
