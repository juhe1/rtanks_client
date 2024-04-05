package package_29
{
   import alternativa.tanks.gui.clanmanagement.ClanPermissionsManager;
   import flash.utils.Dictionary;
   import package_13.Long;
   import package_217.name_351;
   import package_228.ClanPermission;
   import package_26.ClanNotificationsManager;
   
   public class ClanMembersDataServiceImpl implements name_64
   {
       
      
      private var var_260:Dictionary;
      
      public function ClanMembersDataServiceImpl()
      {
         this.var_260 = new Dictionary();
         super();
      }
      
      public function name_452(param1:name_351) : void
      {
         this.var_260[param1.userId] = param1;
         ClanPermissionsManager.name_868(param1);
      }
      
      public function method_361(param1:Long) : int
      {
         return this.var_260[param1].kills;
      }
      
      public function method_366(param1:Long) : int
      {
         return this.var_260[param1].score;
      }
      
      public function method_367(param1:Long) : int
      {
         return this.var_260[param1].deaths;
      }
      
      public function method_362(param1:Long) : Number
      {
         var _loc2_:Number = Number(this.var_260[param1].deaths);
         var _loc3_:Number = Number(this.var_260[param1].kills);
         if(_loc2_ == 0)
         {
            return _loc3_;
         }
         return _loc3_ / _loc2_;
      }
      
      public function method_365(param1:Long) : int
      {
         return this.var_260[param1].dateInClanInSec;
      }
      
      public function method_363(param1:Long) : ClanPermission
      {
         if(param1 in this.var_260)
         {
            return this.var_260[param1].permission;
         }
         return ClanPermission.NOVICE;
      }
      
      public function method_364(param1:Long) : Long
      {
         return this.var_260[param1].lastVisitTime;
      }
      
      public function method_360(param1:Long) : Object
      {
         var _loc2_:Object = {};
         _loc2_.score = this.method_366(param1).toString();
         _loc2_.permission = this.method_363(param1);
         _loc2_.kills = this.method_361(param1).toString();
         _loc2_.deaths = this.method_367(param1).toString();
         _loc2_.score = this.method_366(param1).toString();
         _loc2_.kd = this.method_362(param1).toFixed(2).toString();
         _loc2_.date = this.method_365(param1);
         _loc2_.lastOnlineDate = this.method_364(param1);
         _loc2_.id = param1;
         var _loc3_:Long = Long.getLong(0,0);
         _loc2_.currentUserId = _loc3_;
         _loc2_.currentUserPermission = this.method_363(_loc3_);
         _loc2_.isNew = ClanNotificationsManager.name_869(param1);
         return _loc2_;
      }
   }
}
