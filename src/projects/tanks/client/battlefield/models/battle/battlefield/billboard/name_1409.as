package projects.tanks.client.battlefield.models.battle.battlefield.billboard
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class name_1409
   {
       
      
      private var var_2244:ImageResource;
      
      public function name_1409(param1:ImageResource = null)
      {
         super();
         this.var_2244 = param1;
      }
      
      public function get defaultBillboardImage() : ImageResource
      {
         return this.var_2244;
      }
      
      public function set defaultBillboardImage(param1:ImageResource) : void
      {
         this.var_2244 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BillboardCC [";
         _loc1_ += "defaultBillboardImage = " + this.defaultBillboardImage + " ";
         return _loc1_ + "]";
      }
   }
}
