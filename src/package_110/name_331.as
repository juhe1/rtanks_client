package package_110
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class name_331
   {
       
      
      private var var_922:LootBoxCategory;
      
      private var _count:int;
      
      private var _image:ImageResource;
      
      private var var_23:String;
      
      public function name_331(param1:LootBoxCategory = null, param2:int = 0, param3:ImageResource = null, param4:String = null)
      {
         super();
         this.var_922 = param1;
         this._count = param2;
         this._image = param3;
         this.var_23 = param4;
      }
      
      public function get category() : LootBoxCategory
      {
         return this.var_922;
      }
      
      public function set category(param1:LootBoxCategory) : void
      {
         this.var_922 = param1;
      }
      
      public function get count() : int
      {
         return this._count;
      }
      
      public function set count(param1:int) : void
      {
         this._count = param1;
      }
      
      public function get image() : ImageResource
      {
         return this._image;
      }
      
      public function set image(param1:ImageResource) : void
      {
         this._image = param1;
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
         var _loc1_:String = "LootBoxReward [";
         _loc1_ += "category = " + this.category + " ";
         _loc1_ += "count = " + this.count + " ";
         _loc1_ += "image = " + this.image + " ";
         _loc1_ += "name = " + this.name + " ";
         return _loc1_ + "]";
      }
   }
}
