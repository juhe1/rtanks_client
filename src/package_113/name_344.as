package package_113
{
   public class name_344
   {
       
      
      private var var_807:String;
      
      private var _enabled:Boolean;
      
      private var var_809:Boolean;
      
      private var var_808:String;
      
      public function name_344(param1:String = null, param2:Boolean = false, param3:Boolean = false, param4:String = null)
      {
         super();
         this.var_807 = param1;
         this._enabled = param2;
         this.var_809 = param3;
         this.var_808 = param4;
      }
      
      public function get authorizationUrl() : String
      {
         return this.var_807;
      }
      
      public function set authorizationUrl(param1:String) : void
      {
         this.var_807 = param1;
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this._enabled = param1;
      }
      
      public function get linkExists() : Boolean
      {
         return this.var_809;
      }
      
      public function set linkExists(param1:Boolean) : void
      {
         this.var_809 = param1;
      }
      
      public function get snId() : String
      {
         return this.var_808;
      }
      
      public function set snId(param1:String) : void
      {
         this.var_808 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "SocialNetworkPanelParams [";
         _loc1_ += "authorizationUrl = " + this.authorizationUrl + " ";
         _loc1_ += "enabled = " + this.enabled + " ";
         _loc1_ += "linkExists = " + this.linkExists + " ";
         _loc1_ += "snId = " + this.snId + " ";
         return _loc1_ + "]";
      }
   }
}
