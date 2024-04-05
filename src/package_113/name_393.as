package package_113
{
   public class name_393
   {
       
      
      private var var_944:Boolean;
      
      private var var_943:Vector.<name_344>;
      
      public function name_393(param1:Boolean = false, param2:Vector.<name_344> = null)
      {
         super();
         this.var_944 = param1;
         this.var_943 = param2;
      }
      
      public function get passwordCreated() : Boolean
      {
         return this.var_944;
      }
      
      public function set passwordCreated(param1:Boolean) : void
      {
         this.var_944 = param1;
      }
      
      public function get socialNetworkParams() : Vector.<name_344>
      {
         return this.var_943;
      }
      
      public function set socialNetworkParams(param1:Vector.<name_344>) : void
      {
         this.var_943 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "SocialNetworkPanelCC [";
         _loc1_ += "passwordCreated = " + this.passwordCreated + " ";
         _loc1_ += "socialNetworkParams = " + this.socialNetworkParams + " ";
         return _loc1_ + "]";
      }
   }
}
