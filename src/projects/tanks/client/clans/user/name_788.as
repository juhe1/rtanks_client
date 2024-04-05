package projects.tanks.client.clans.user
{
   public class name_788
   {
       
      
      private var var_1464:Boolean;
      
      private var var_265:Boolean;
      
      private var var_1463:Boolean;
      
      private var var_237:int;
      
      private var var_259:Boolean;
      
      private var var_1462:Boolean;
      
      public function name_788(param1:Boolean = false, param2:Boolean = false, param3:Boolean = false, param4:int = 0, param5:Boolean = false, param6:Boolean = false)
      {
         super();
         this.var_1464 = param1;
         this.var_265 = param2;
         this.var_1463 = param3;
         this.var_237 = param4;
         this.var_259 = param5;
         this.var_1462 = param6;
      }
      
      public function get clan() : Boolean
      {
         return this.var_1464;
      }
      
      public function set clan(param1:Boolean) : void
      {
         this.var_1464 = param1;
      }
      
      public function get giveBonusesClan() : Boolean
      {
         return this.var_265;
      }
      
      public function set giveBonusesClan(param1:Boolean) : void
      {
         this.var_265 = param1;
      }
      
      public function get loadingInServiceSpace() : Boolean
      {
         return this.var_1463;
      }
      
      public function set loadingInServiceSpace(param1:Boolean) : void
      {
         this.var_1463 = param1;
      }
      
      public function get restrictionTimeJoinClanInSec() : int
      {
         return this.var_237;
      }
      
      public function set restrictionTimeJoinClanInSec(param1:int) : void
      {
         this.var_237 = param1;
      }
      
      public function get showBuyLicenseButton() : Boolean
      {
         return this.var_259;
      }
      
      public function set showBuyLicenseButton(param1:Boolean) : void
      {
         this.var_259 = param1;
      }
      
      public function get showOtherClan() : Boolean
      {
         return this.var_1462;
      }
      
      public function set showOtherClan(param1:Boolean) : void
      {
         this.var_1462 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ClanUserCC [";
         _loc1_ += "clan = " + this.clan + " ";
         _loc1_ += "giveBonusesClan = " + this.giveBonusesClan + " ";
         _loc1_ += "loadingInServiceSpace = " + this.loadingInServiceSpace + " ";
         _loc1_ += "restrictionTimeJoinClanInSec = " + this.restrictionTimeJoinClanInSec + " ";
         _loc1_ += "showBuyLicenseButton = " + this.showBuyLicenseButton + " ";
         _loc1_ += "showOtherClan = " + this.showOtherClan + " ";
         return _loc1_ + "]";
      }
   }
}
