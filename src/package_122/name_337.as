package package_122
{
   import projects.tanks.client.battleservice.model.name_370;
   
   public class name_337
   {
       
      
      private var var_959:Boolean;
      
      private var var_956:Boolean;
      
      private var var_950:String;
      
      private var var_951:String;
      
      private var var_957:String;
      
      private var var_931:name_370;
      
      private var var_953:Boolean;
      
      private var var_955:Boolean;
      
      private var var_952:Boolean;
      
      private var var_958:int;
      
      private var var_954:String;
      
      public function name_337(param1:Boolean = false, param2:Boolean = false, param3:String = null, param4:String = null, param5:String = null, param6:name_370 = null, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:int = 0, param11:String = null)
      {
         super();
         this.var_959 = param1;
         this.var_956 = param2;
         this.var_950 = param3;
         this.var_951 = param4;
         this.var_957 = param5;
         this.var_931 = param6;
         this.var_953 = param7;
         this.var_955 = param8;
         this.var_952 = param9;
         this.var_958 = param10;
         this.var_954 = param11;
      }
      
      public function get availableRank() : Boolean
      {
         return this.var_959;
      }
      
      public function set availableRank(param1:Boolean) : void
      {
         this.var_959 = param1;
      }
      
      public function get availableSlot() : Boolean
      {
         return this.var_956;
      }
      
      public function set availableSlot(param1:Boolean) : void
      {
         this.var_956 = param1;
      }
      
      public function get battleId() : String
      {
         return this.var_950;
      }
      
      public function set battleId(param1:String) : void
      {
         this.var_950 = param1;
      }
      
      public function get gameHost() : String
      {
         return this.var_951;
      }
      
      public function set gameHost(param1:String) : void
      {
         this.var_951 = param1;
      }
      
      public function get mapName() : String
      {
         return this.var_957;
      }
      
      public function set mapName(param1:String) : void
      {
         this.var_957 = param1;
      }
      
      public function get mode() : name_370
      {
         return this.var_931;
      }
      
      public function set mode(param1:name_370) : void
      {
         this.var_931 = param1;
      }
      
      public function get noSuppliesBattle() : Boolean
      {
         return this.var_953;
      }
      
      public function set noSuppliesBattle(param1:Boolean) : void
      {
         this.var_953 = param1;
      }
      
      public function get privateBattle() : Boolean
      {
         return this.var_955;
      }
      
      public function set privateBattle(param1:Boolean) : void
      {
         this.var_955 = param1;
      }
      
      public function get remote() : Boolean
      {
         return this.var_952;
      }
      
      public function set remote(param1:Boolean) : void
      {
         this.var_952 = param1;
      }
      
      public function get serverNumber() : int
      {
         return this.var_958;
      }
      
      public function set serverNumber(param1:int) : void
      {
         this.var_958 = param1;
      }
      
      public function get url() : String
      {
         return this.var_954;
      }
      
      public function set url(param1:String) : void
      {
         this.var_954 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BattleInviteMessage [";
         _loc1_ += "availableRank = " + this.availableRank + " ";
         _loc1_ += "availableSlot = " + this.availableSlot + " ";
         _loc1_ += "battleId = " + this.battleId + " ";
         _loc1_ += "gameHost = " + this.gameHost + " ";
         _loc1_ += "mapName = " + this.mapName + " ";
         _loc1_ += "mode = " + this.mode + " ";
         _loc1_ += "noSuppliesBattle = " + this.noSuppliesBattle + " ";
         _loc1_ += "privateBattle = " + this.privateBattle + " ";
         _loc1_ += "remote = " + this.remote + " ";
         _loc1_ += "serverNumber = " + this.serverNumber + " ";
         _loc1_ += "url = " + this.url + " ";
         return _loc1_ + "]";
      }
   }
}
