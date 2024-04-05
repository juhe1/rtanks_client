package package_275
{
   import package_13.Long;
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class name_865
   {
       
      
      private var var_1647:ImageResource;
      
      private var var_21:Long;
      
      private var var_23:String;
      
      public function name_865(param1:ImageResource = null, param2:Long = null, param3:String = null)
      {
         super();
         this.var_1647 = param1;
         this.var_21 = param2;
         this.var_23 = param3;
      }
      
      public function get flagImage() : ImageResource
      {
         return this.var_1647;
      }
      
      public function set flagImage(param1:ImageResource) : void
      {
         this.var_1647 = param1;
      }
      
      public function get id() : Long
      {
         return this.var_21;
      }
      
      public function set id(param1:Long) : void
      {
         this.var_21 = param1;
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
         var _loc1_:String = "ClanFlag [";
         _loc1_ += "flagImage = " + this.flagImage + " ";
         _loc1_ += "id = " + this.id + " ";
         _loc1_ += "name = " + this.name + " ";
         return _loc1_ + "]";
      }
   }
}
