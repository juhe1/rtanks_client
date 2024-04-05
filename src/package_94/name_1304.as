package package_94
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class name_1304
   {
       
      
      private var _image:ImageResource;
      
      public function name_1304(param1:ImageResource = null)
      {
         super();
         this._image = param1;
      }
      
      public function get image() : ImageResource
      {
         return this._image;
      }
      
      public function set image(param1:ImageResource) : void
      {
         this._image = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BillboardImageCC [";
         _loc1_ += "image = " + this.image + " ";
         return _loc1_ + "]";
      }
   }
}
