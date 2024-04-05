package package_115
{
   import package_13.Long;
   
   public class name_329
   {
       
      
      private var _count:int;
      
      private var var_23:String;
      
      private var var_860:Long;
      
      public function name_329(param1:int = 0, param2:String = null, param3:Long = null)
      {
         super();
         this._count = param1;
         this.var_23 = param2;
         this.var_860 = param3;
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
      
      public function get prizeObject() : Long
      {
         return this.var_860;
      }
      
      public function set prizeObject(param1:Long) : void
      {
         this.var_860 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "QuestPrizeInfo [";
         _loc1_ += "count = " + this.count + " ";
         _loc1_ += "name = " + this.name + " ";
         _loc1_ += "prizeObject = " + this.prizeObject + " ";
         return _loc1_ + "]";
      }
   }
}
