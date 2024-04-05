package package_480
{
   import forms.battlelist.BattleMode;
   import package_413.name_2265;
   
   public class name_3474
   {
       
      
      private var var_950:String;
      
      private var var_957:String;
      
      private var var_931:BattleMode;
      
      private var var_955:Boolean;
      
      private var var_2972:Boolean;
      
      private var var_2450:name_2265;
      
      public function name_3474(param1:String = null, param2:String = null, param3:BattleMode = null, param4:Boolean = false, param5:Boolean = false, param6:name_2265 = null)
      {
         super();
         this.var_950 = param1;
         this.var_957 = param2;
         this.var_931 = param3;
         this.var_955 = param4;
         this.var_2972 = param5;
         this.var_2450 = param6;
      }
      
      public function get battleId() : String
      {
         return this.var_950;
      }
      
      public function set battleId(param1:String) : void
      {
         this.var_950 = param1;
      }
      
      public function get mapName() : String
      {
         return this.var_957;
      }
      
      public function set mapName(param1:String) : void
      {
         this.var_957 = param1;
      }
      
      public function get mode() : BattleMode
      {
         return this.var_931;
      }
      
      public function set mode(param1:BattleMode) : void
      {
         this.var_931 = param1;
      }
      
      public function get privateBattle() : Boolean
      {
         return this.var_955;
      }
      
      public function set privateBattle(param1:Boolean) : void
      {
         this.var_955 = param1;
      }
      
      public function get proBattle() : Boolean
      {
         return this.var_2972;
      }
      
      public function set proBattle(param1:Boolean) : void
      {
         this.var_2972 = param1;
      }
      
      public function get range() : name_2265
      {
         return this.var_2450;
      }
      
      public function set range(param1:name_2265) : void
      {
         this.var_2450 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BattleInfoData [";
         _loc1_ += "battleId = " + this.battleId + " ";
         _loc1_ += "mapName = " + this.mapName + " ";
         _loc1_ += "mode = " + this.mode + " ";
         _loc1_ += "privateBattle = " + this.privateBattle + " ";
         _loc1_ += "proBattle = " + this.proBattle + " ";
         _loc1_ += "range = " + this.range + " ";
         return _loc1_ + "]";
      }
   }
}
