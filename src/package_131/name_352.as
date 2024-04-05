package package_131
{
   public class name_352
   {
       
      
      private var _count:int;
      
      private var var_870:int;
      
      private var var_871:String;
      
      public function name_352(param1:int = 0, param2:int = 0, param3:String = null)
      {
         super();
         this._count = param1;
         this.var_870 = param2;
         this.var_871 = param3;
      }
      
      public function get count() : int
      {
         return this._count;
      }
      
      public function set count(param1:int) : void
      {
         this._count = param1;
      }
      
      public function get crystalPrice() : int
      {
         return this.var_870;
      }
      
      public function set crystalPrice(param1:int) : void
      {
         this.var_870 = param1;
      }
      
      public function get itemName() : String
      {
         return this.var_871;
      }
      
      public function set itemName(param1:String) : void
      {
         this.var_871 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "KitPackageItemInfo [";
         _loc1_ += "count = " + this.count + " ";
         _loc1_ += "crystalPrice = " + this.crystalPrice + " ";
         _loc1_ += "itemName = " + this.itemName + " ";
         return _loc1_ + "]";
      }
   }
}
