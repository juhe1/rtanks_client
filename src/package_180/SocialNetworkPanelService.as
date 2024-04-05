package package_180
{
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   
   public class SocialNetworkPanelService extends EventDispatcher implements name_544
   {
       
      
      private var var_944:Boolean;
      
      private var var_1116:Dictionary;
      
      private var var_1115:Dictionary;
      
      public function SocialNetworkPanelService()
      {
         this.var_1116 = new Dictionary();
         this.var_1115 = new Dictionary();
         super();
      }
      
      public function get passwordCreated() : Boolean
      {
         return this.var_944;
      }
      
      public function set passwordCreated(param1:Boolean) : void
      {
         this.var_944 = param1;
      }
      
      public function method_1312(param1:String, param2:Boolean) : void
      {
         this.var_1116[param1] = param2;
      }
      
      public function method_1316(param1:String) : Boolean
      {
         if(Boolean(this.var_1116[param1]))
         {
            return this.var_1116[param1];
         }
         return false;
      }
      
      public function method_1313(param1:String, param2:Boolean) : void
      {
         this.var_1115[param1] = param2;
      }
      
      public function method_1310(param1:String) : Boolean
      {
         if(Boolean(this.var_1115[param1]))
         {
            return this.var_1115[param1];
         }
         return false;
      }
      
      public function method_1314(param1:String) : void
      {
         dispatchEvent(new SocialNetworkServiceEvent(SocialNetworkServiceEvent.CREATE_LINK,param1));
      }
      
      public function method_1311(param1:String) : void
      {
         dispatchEvent(new SocialNetworkServiceEvent(SocialNetworkServiceEvent.UNLINK,param1));
      }
      
      public function method_1309(param1:String) : void
      {
         this.var_1115[param1] = true;
         dispatchEvent(new SocialNetworkServiceEvent(SocialNetworkServiceEvent.LINK_SUCCESS,param1));
      }
      
      public function method_1315(param1:String) : void
      {
         this.var_1115[param1] = false;
         dispatchEvent(new SocialNetworkServiceEvent(SocialNetworkServiceEvent.UNLINK_SUCCESS,param1));
      }
   }
}
