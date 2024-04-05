package package_75
{
   import flash.events.EventDispatcher;
   import package_13.Long;
   import package_207.name_561;
   
   public class name_817 extends EventDispatcher implements name_274
   {
      
      public static var userPropertiesService:name_561;
       
      
      private var var_1532:Long;
      
      private var var_1531:Long;
      
      private var var_1536:int;
      
      private var var_1538:int;
      
      private var var_1534:Boolean;
      
      private var var_1533:Boolean;
      
      private var var_1537:Boolean;
      
      private var var_1539:Boolean;
      
      private var var_1535:Boolean;
      
      private var var_1540:Boolean;
      
      public function name_817()
      {
         super();
      }
      
      public function get currentSelectionBattleId() : Long
      {
         return this.var_1531;
      }
      
      public function method_1035(param1:Long, param2:int, param3:int) : void
      {
         this.method_1741(param1,param2,param3);
         dispatchEvent(new BattleInfoServiceEvent(BattleInfoServiceEvent.SELECTION_BATTLE));
      }
      
      private function method_1741(param1:Long, param2:int, param3:int) : void
      {
         this.var_1531 = param1;
         this.var_1536 = param2;
         this.var_1538 = param3;
      }
      
      public function method_1034(param1:Long, param2:int, param3:int) : void
      {
         this.method_1741(param1,param2,param3);
      }
      
      public function get currentBattleId() : Long
      {
         return this.var_1532;
      }
      
      public function set currentBattleId(param1:Long) : void
      {
         this.var_1532 = param1;
      }
      
      public function name_732() : void
      {
         this.var_1534 = false;
         this.var_1532 = null;
         if(this.var_1531 != null)
         {
         }
         dispatchEvent(new BattleInfoServiceEvent(BattleInfoServiceEvent.BATTLE_UNLOAD));
      }
      
      public function method_1032() : void
      {
         if(this.var_1532 == this.var_1531)
         {
            this.var_1531 = null;
            dispatchEvent(new BattleInfoServiceEvent(BattleInfoServiceEvent.RESET_SELECTION_BATTLE));
         }
      }
      
      public function method_1029() : Boolean
      {
         return this.var_1531 != null;
      }
      
      public function method_1031() : Boolean
      {
         return this.var_1532 != null;
      }
      
      public function name_1016() : Boolean
      {
         return this.var_1534;
      }
      
      public function set spectatorMode(param1:Boolean) : void
      {
         this.var_1534 = param1;
      }
      
      public function get reArmorEnabled() : Boolean
      {
         return this.var_1533;
      }
      
      public function set reArmorEnabled(param1:Boolean) : void
      {
         this.var_1533 = param1;
      }
      
      public function availableRank(param1:int) : Boolean
      {
         if(this.method_1029())
         {
            return param1 >= this.var_1536 && param1 <= this.var_1538;
         }
         return false;
      }
      
      public function method_1030() : Boolean
      {
         return this.availableRank(userPropertiesService.rank);
      }
      
      public function method_1028() : void
      {
         if(this.method_1031())
         {
         }
      }
      
      public function battleRestart() : void
      {
         dispatchEvent(new BattleInfoServiceEvent(BattleInfoServiceEvent.BATTLE_RESTART));
      }
      
      public function name_752() : void
      {
         dispatchEvent(new BattleInfoServiceEvent(BattleInfoServiceEvent.BATTLE_LOAD));
      }
      
      public function get withoutSupplies() : Boolean
      {
         return this.var_1537;
      }
      
      public function set withoutSupplies(param1:Boolean) : void
      {
         this.var_1537 = param1;
      }
      
      public function get withoutBonuses() : Boolean
      {
         return this.var_1539;
      }
      
      public function set withoutBonuses(param1:Boolean) : void
      {
         this.var_1539 = param1;
      }
      
      public function method_195() : void
      {
         this.var_1533 = false;
         dispatchEvent(new BattleInfoServiceEvent(BattleInfoServiceEvent.BATTLE_START));
      }
      
      public function method_1033() : void
      {
         this.var_1531 = null;
      }
      
      public function get running() : Boolean
      {
         return this.var_1535;
      }
      
      public function set running(param1:Boolean) : void
      {
         this.var_1535 = param1;
      }
      
      public function isInBattle() : Boolean
      {
         return this.var_1540;
      }
      
      public function name_720(param1:Boolean) : void
      {
         this.var_1540 = param1;
      }
   }
}
