package package_120
{
   import alternativa.osgi.OSGi;
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import package_1.Main;
   import package_31.name_115;
   import package_346.UserInfoUpdateEvent;
   import scpacker.networking.Network;
   import scpacker.networking.INetworker;
   
   public class UserInfoService extends EventDispatcher implements name_408
   {
       
      
      private var users:Dictionary;
      
      private var var_949:Dictionary;
      
      public function UserInfoService()
      {
         super();
         this.users = new Dictionary();
         this.var_949 = new Dictionary();
      }
      
      public function hasData(param1:String) : Boolean
      {
         var _loc2_:Boolean = this.users[param1] != null;
         if(!_loc2_ && !this.method_1167(param1))
         {
            Network(Main.osgi.getService(INetworker)).send("lobby;get_user_info;" + param1);
            this.method_1165(param1);
         }
         return _loc2_;
      }
      
      public function getData(param1:String) : name_350
      {
         return this.users[param1];
      }
      
      public function updateUserInfo(param1:String, param2:name_350) : void
      {
         this.users[param1] = param2;
         this.method_1166(param1);
         dispatchEvent(new UserInfoUpdateEvent(UserInfoUpdateEvent.INFO_UPDATED,param2.nickname,param2.rank,param2.premium,param2.online));
      }
      
      private function method_1167(param1:String) : Boolean
      {
         return this.var_949[param1] != null;
      }
      
      private function method_1165(param1:String) : void
      {
         this.var_949[param1] = true;
      }
      
      private function method_1166(param1:String) : void
      {
         delete this.var_949[param1];
      }
      
      public function method_1104() : Boolean
      {
         return this.localUserInfo == null ? false : this.localUserInfo.rank >= 2;
      }
      
      public function get localUserInfo() : name_350
      {
         return this.users[name_115(OSGi.getInstance().getService(name_115)).userName];
      }
   }
}
