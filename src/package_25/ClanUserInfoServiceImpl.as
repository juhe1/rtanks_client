package package_25
{
   import alternativa.osgi.OSGi;
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import package_13.Long;
   import package_228.ClanAction;
   import package_31.PanelModel;
   import package_31.name_115;
   
   public class ClanUserInfoServiceImpl extends EventDispatcher implements name_52
   {
       
      
      private var var_261:Dictionary;
      
      private var var_264:Function;
      
      private var var_266:Vector.<ClanAction>;
      
      private var var_262:int;
      
      private var var_263:Boolean;
      
      private var var_267:Boolean;
      
      private var var_268:int;
      
      private var var_265:Boolean;
      
      public function ClanUserInfoServiceImpl()
      {
         this.var_261 = new Dictionary();
         super();
      }
      
      public function updateUserClanInfo(param1:name_353) : void
      {
         this.var_261[param1.userId] = param1;
      }
      
      public function method_373(param1:String) : name_353
      {
         return param1 in this.var_261 ? this.var_261[param1] : null;
      }
      
      public function get updateFriendsClanButtonFunction() : Function
      {
         return this.var_264;
      }
      
      public function set updateFriendsClanButtonFunction(param1:Function) : void
      {
         this.var_264 = param1;
      }
      
      public function method_375(param1:ClanAction) : Boolean
      {
         var _loc2_:ClanAction = null;
         for each(_loc2_ in this.actions)
         {
            if(_loc2_.value == param1.value)
            {
               return true;
            }
         }
         return false;
      }
      
      public function get actions() : Vector.<ClanAction>
      {
         return this.var_266;
      }
      
      public function set actions(param1:Vector.<ClanAction>) : void
      {
         this.var_266 = param1;
      }
      
      public function method_376(param1:String) : Boolean
      {
         var _loc2_:Long = null;
         var _loc3_:Long = null;
         var _loc4_:name_353 = this.method_373(param1);
         var _loc5_:name_353 = this.method_373(PanelModel(OSGi.osgi.name_6(name_115)).userName);
         if(!_loc5_.name_870)
         {
            return false;
         }
         if(_loc4_ != null && _loc5_ != null)
         {
            _loc2_ = _loc4_.clanId;
            _loc3_ = _loc5_.clanId;
            return _loc2_ == _loc3_;
         }
         return false;
      }
      
      public function get restrictionTime() : int
      {
         return this.var_262 - (getTimer() - this.var_268) / 1000;
      }
      
      public function set restrictionTime(param1:int) : void
      {
         this.var_262 = param1;
         this.var_268 = getTimer();
         if(this.var_262 > 0)
         {
            setTimeout(this.method_377,this.var_262 * 1000);
         }
      }
      
      private function method_377() : void
      {
         dispatchEvent(new RestrictionJoinClanEvent(RestrictionJoinClanEvent.UPDATE));
      }
      
      public function get selfClan() : Boolean
      {
         return this.var_263;
      }
      
      public function set selfClan(param1:Boolean) : void
      {
         this.var_263 = param1;
      }
      
      public function get clanMember() : Boolean
      {
         return this.var_267;
      }
      
      public function set clanMember(param1:Boolean) : void
      {
         this.var_267 = param1;
      }
      
      public function get giveBonusesClan() : Boolean
      {
         return this.var_265;
      }
      
      public function set giveBonusesClan(param1:Boolean) : void
      {
         this.var_265 = param1;
         dispatchEvent(new ClanUserInfoEvent(ClanUserInfoEvent.UPDATE_GIVE_BONUSES_CLAN));
      }
      
      public function method_374() : void
      {
         dispatchEvent(new ClanUserInfoEvent(ClanUserInfoEvent.ON_LEAVE_CLAN));
      }
      
      public function method_345() : void
      {
         dispatchEvent(new ClanUserInfoEvent(ClanUserInfoEvent.ON_JOIN_CLAN));
      }
   }
}
