package package_121
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class name_343
   {
       
      
      private var _count:int;
      
      private var var_875:ImageResource;
      
      public function name_343(param1:int = 0, param2:ImageResource = null)
      {
         super();
         this._count = param1;
         this.var_875 = param2;
      }
      
      public function get count() : int
      {
         return this._count;
      }
      
      public function set count(param1:int) : void
      {
         this._count = param1;
      }
      
      public function get itemImage() : ImageResource
      {
         return this.var_875;
      }
      
      public function set itemImage(param1:ImageResource) : void
      {
         this.var_875 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "RewardItemToShow [";
         _loc1_ += "count = " + this.count + " ";
         _loc1_ += "itemImage = " + this.itemImage + " ";
         return _loc1_ + "]";
      }
   }
}
