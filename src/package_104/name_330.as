package package_104
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class name_330
   {
       
      
      private var var_946:int;
      
      private var var_23:String;
      
      private var var_947:ImageResource;
      
      private var var_945:Boolean;
      
      public function name_330(param1:int = 0, param2:String = null, param3:ImageResource = null, param4:Boolean = false)
      {
         super();
         this.var_946 = param1;
         this.var_23 = param2;
         this.var_947 = param3;
         this.var_945 = param4;
      }
      
      public function get amount() : int
      {
         return this.var_946;
      }
      
      public function set amount(param1:int) : void
      {
         this.var_946 = param1;
      }
      
      public function get name() : String
      {
         return this.var_23;
      }
      
      public function set name(param1:String) : void
      {
         this.var_23 = param1;
      }
      
      public function get preview() : ImageResource
      {
         return this.var_947;
      }
      
      public function set preview(param1:ImageResource) : void
      {
         this.var_947 = param1;
      }
      
      public function get received() : Boolean
      {
         return this.var_945;
      }
      
      public function set received(param1:Boolean) : void
      {
         this.var_945 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "TierItem [";
         _loc1_ += "amount = " + this.amount + " ";
         _loc1_ += "name = " + this.name + " ";
         _loc1_ += "preview = " + this.preview + " ";
         _loc1_ += "received = " + this.received + " ";
         return _loc1_ + "]";
      }
   }
}
