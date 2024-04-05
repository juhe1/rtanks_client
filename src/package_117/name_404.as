package package_117
{
   import package_13.Long;
   
   public class name_404
   {
       
      
      private var var_859:Vector.<name_341>;
      
      private var const_367:Long;
      
      public function name_404(param1:Vector.<name_341> = null, param2:Long = null)
      {
         super();
         this.var_859 = param1;
         this.const_367 = param2;
      }
      
      public function get goods() : Vector.<name_341>
      {
         return this.var_859;
      }
      
      public function set goods(param1:Vector.<name_341>) : void
      {
         this.var_859 = param1;
      }
      
      public function get time() : Long
      {
         return this.const_367;
      }
      
      public function set time(param1:Long) : void
      {
         this.const_367 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "DonationData [";
         _loc1_ += "goods = " + this.goods + " ";
         _loc1_ += "time = " + this.time + " ";
         return _loc1_ + "]";
      }
   }
}
