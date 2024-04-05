package package_117
{
   public class name_341
   {
       
      
      private var _count:int;
      
      private var var_23:String;
      
      public function name_341(param1:int = 0, param2:String = null)
      {
         super();
         this._count = param1;
         this.var_23 = param2;
      }
      
      public function get count() : int
      {
         return this._count;
      }
      
      public function set count(param1:int) : void
      {
         this._count = param1;
      }
      
      public function get name() : String
      {
         return this.var_23;
      }
      
      public function set name(param1:String) : void
      {
         this.var_23 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "GoodInfoData [";
         _loc1_ += "count = " + this.count + " ";
         _loc1_ += "name = " + this.name + " ";
         return _loc1_ + "]";
      }
   }
}
