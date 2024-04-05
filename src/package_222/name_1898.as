package package_222
{
   public class name_1898
   {
       
      
      private var var_2611:int;
      
      private var var_237:int;
      
      public function name_1898(param1:int = 0, param2:int = 0)
      {
         super();
         this.var_2611 = param1;
         this.var_237 = param2;
      }
      
      public function get numberNotifications() : int
      {
         return this.var_2611;
      }
      
      public function set numberNotifications(param1:int) : void
      {
         this.var_2611 = param1;
      }
      
      public function get restrictionTimeJoinClanInSec() : int
      {
         return this.var_237;
      }
      
      public function set restrictionTimeJoinClanInSec(param1:int) : void
      {
         this.var_237 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ClanPanelNotificationCC [";
         _loc1_ += "numberNotifications = " + this.numberNotifications + " ";
         _loc1_ += "restrictionTimeJoinClanInSec = " + this.restrictionTimeJoinClanInSec + " ";
         return _loc1_ + "]";
      }
   }
}
