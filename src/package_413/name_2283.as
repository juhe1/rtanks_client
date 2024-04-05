package package_413
{
   import forms.battlelist.BattleMode;
   import forms.battlelist.MapTheme;
   import package_412.name_2264;
   
   public class name_2283
   {
       
      
      private var var_2925:Boolean;
      
      private var var_2949:BattleMode;
      
      private var var_2965:Boolean;
      
      private var var_2973:String;
      
      private var var_2931:Boolean;
      
      private var var_2967:Boolean;
      
      private var var_2970:name_2264;
      
      private var var_2971:String;
      
      private var var_957:String;
      
      private var var_2954:int;
      
      private var var_2966:Boolean;
      
      private var var_955:Boolean;
      
      private var var_2972:Boolean;
      
      private var var_2974:name_2265;
      
      private var var_1533:Boolean;
      
      private var var_2905:MapTheme;
      
      private var var_2968:Boolean;
      
      private var var_1539:Boolean;
      
      private var var_1537:Boolean;
      
      private var var_2969:Boolean;
      
      public function name_2283(param1:Boolean = false, param2:BattleMode = null, param3:Boolean = false, param4:Boolean = false, param5:String = null, param6:Boolean = false, param7:Boolean = false, param8:name_2264 = null, param9:String = null, param10:int = 0, param11:Boolean = false, param12:Boolean = false, param13:Boolean = false, param14:name_2265 = null, param15:Boolean = false, param16:MapTheme = null, param17:Boolean = false, param18:Boolean = false, param19:Boolean = false, param20:Boolean = false, param21:Boolean = false, param22:Boolean = false)
      {
         super();
         this.var_2925 = param1;
         this.var_2949 = param2;
         this.var_2965 = param3;
         this.var_2973 = param5;
         this.var_2931 = param6;
         this.var_2967 = param7;
         this.var_2970 = param8;
         this.var_2971 = param9;
         this.var_2954 = param10;
         this.var_2966 = param11;
         this.var_955 = param12;
         this.var_2972 = param13;
         this.var_2974 = param14;
         this.var_1533 = param15;
         this.var_2905 = param16;
         this.var_2968 = param18;
         this.var_1539 = param19;
         this.var_1537 = param21;
         this.var_2969 = param22;
      }
      
      public function get autoBalance() : Boolean
      {
         return this.var_2925;
      }
      
      public function set autoBalance(param1:Boolean) : void
      {
         this.var_2925 = param1;
      }
      
      public function get battleMode() : BattleMode
      {
         return this.var_2949;
      }
      
      public function set battleMode(param1:BattleMode) : void
      {
         this.var_2949 = param1;
      }
      
      public function get clanBattle() : Boolean
      {
         return this.var_2965;
      }
      
      public function set clanBattle(param1:Boolean) : void
      {
         this.var_2965 = param1;
      }
      
      public function get equipmentConstraintsMode() : String
      {
         return this.var_2973;
      }
      
      public function set equipmentConstraintsMode(param1:String) : void
      {
         this.var_2973 = param1;
      }
      
      public function get friendlyFire() : Boolean
      {
         return this.var_2931;
      }
      
      public function set friendlyFire(param1:Boolean) : void
      {
         this.var_2931 = param1;
      }
      
      public function get goldBoxesEnabled() : Boolean
      {
         return this.var_2967;
      }
      
      public function set goldBoxesEnabled(param1:Boolean) : void
      {
         this.var_2967 = param1;
      }
      
      public function get limits() : name_2264
      {
         return this.var_2970;
      }
      
      public function set limits(param1:name_2264) : void
      {
         this.var_2970 = param1;
      }
      
      public function get mapId() : String
      {
         return this.var_2971;
      }
      
      public function set mapId(param1:String) : void
      {
         this.var_2971 = param1;
      }
      
      public function get mapName() : String
      {
         return this.var_957;
      }
      
      public function set mapName(param1:String) : void
      {
         this.var_957 = param1;
      }
      
      public function get maxPeopleCount() : int
      {
         return this.var_2954;
      }
      
      public function set maxPeopleCount(param1:int) : void
      {
         this.var_2954 = param1;
      }
      
      public function get parkourMode() : Boolean
      {
         return this.var_2966;
      }
      
      public function set parkourMode(param1:Boolean) : void
      {
         this.var_2966 = param1;
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
      
      public function get rankRange() : name_2265
      {
         return this.var_2974;
      }
      
      public function set rankRange(param1:name_2265) : void
      {
         this.var_2974 = param1;
      }
      
      public function get reArmorEnabled() : Boolean
      {
         return this.var_1533;
      }
      
      public function set reArmorEnabled(param1:Boolean) : void
      {
         this.var_1533 = param1;
      }
      
      public function get theme() : MapTheme
      {
         return this.var_2905;
      }
      
      public function set theme(param1:MapTheme) : void
      {
         this.var_2905 = param1;
      }
      
      public function get uniqueUsersBattle() : Boolean
      {
         return this.var_2968;
      }
      
      public function set uniqueUsersBattle(param1:Boolean) : void
      {
         this.var_2968 = param1;
      }
      
      public function get withoutBonuses() : Boolean
      {
         return this.var_1539;
      }
      
      public function set withoutBonuses(param1:Boolean) : void
      {
         this.var_1539 = param1;
      }
      
      public function get withoutSupplies() : Boolean
      {
         return this.var_1537;
      }
      
      public function set withoutSupplies(param1:Boolean) : void
      {
         this.var_1537 = param1;
      }
      
      public function get withoutUpgrades() : Boolean
      {
         return this.var_2969;
      }
      
      public function set withoutUpgrades(param1:Boolean) : void
      {
         this.var_2969 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BattleCreateParameters [";
         _loc1_ += "autoBalance = " + this.autoBalance + " ";
         _loc1_ += "battleMode = " + this.battleMode + " ";
         _loc1_ += "clanBattle = " + this.clanBattle + " ";
         _loc1_ += "equipmentConstraintsMode = " + this.equipmentConstraintsMode + " ";
         _loc1_ += "friendlyFire = " + this.friendlyFire + " ";
         _loc1_ += "goldBoxesEnabled = " + this.goldBoxesEnabled + " ";
         _loc1_ += "limits = " + this.limits + " ";
         _loc1_ += "mapId = " + this.mapId + " ";
         _loc1_ += "maxPeopleCount = " + this.maxPeopleCount + " ";
         _loc1_ += "parkourMode = " + this.parkourMode + " ";
         _loc1_ += "privateBattle = " + this.privateBattle + " ";
         _loc1_ += "proBattle = " + this.proBattle + " ";
         _loc1_ += "rankRange = " + this.rankRange + " ";
         _loc1_ += "reArmorEnabled = " + this.reArmorEnabled + " ";
         _loc1_ += "theme = " + this.theme + " ";
         _loc1_ += "uniqueUsersBattle = " + this.uniqueUsersBattle + " ";
         _loc1_ += "withoutBonuses = " + this.withoutBonuses + " ";
         _loc1_ += "withoutSupplies = " + this.withoutSupplies + " ";
         _loc1_ += "withoutUpgrades = " + this.withoutUpgrades + " ";
         return _loc1_ + "]";
      }
   }
}
