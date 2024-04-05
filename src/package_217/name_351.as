package package_217
{
   import package_13.Long;
   import package_228.ClanPermission;
   
   public class name_351
   {
       
      
      private var var_1652:int;
      
      private var var_1649:int;
      
      private var var_1650:int;
      
      private var var_1648:Long;
      
      private var var_1651:ClanPermission;
      
      private var var_275:int;
      
      private var var_913:Long;
      
      public function name_351(param1:int = 0, param2:int = 0, param3:int = 0, param4:Long = null, param5:ClanPermission = null, param6:int = 0, param7:Long = null)
      {
         super();
         this.var_1652 = param1;
         this.var_1649 = param2;
         this.var_1650 = param3;
         this.var_1648 = param4;
         this.var_1651 = param5;
         this.var_275 = param6;
         this.var_913 = param7;
      }
      
      public function get dateInClanInSec() : int
      {
         return this.var_1652;
      }
      
      public function set dateInClanInSec(param1:int) : void
      {
         this.var_1652 = param1;
      }
      
      public function get deaths() : int
      {
         return this.var_1649;
      }
      
      public function set deaths(param1:int) : void
      {
         this.var_1649 = param1;
      }
      
      public function get kills() : int
      {
         return this.var_1650;
      }
      
      public function set kills(param1:int) : void
      {
         this.var_1650 = param1;
      }
      
      public function get lastVisitTime() : Long
      {
         return this.var_1648;
      }
      
      public function set lastVisitTime(param1:Long) : void
      {
         this.var_1648 = param1;
      }
      
      public function get permission() : ClanPermission
      {
         return this.var_1651;
      }
      
      public function set permission(param1:ClanPermission) : void
      {
         this.var_1651 = param1;
      }
      
      public function get score() : int
      {
         return this.var_275;
      }
      
      public function set score(param1:int) : void
      {
         this.var_275 = param1;
      }
      
      public function get userId() : Long
      {
         return this.var_913;
      }
      
      public function set userId(param1:Long) : void
      {
         this.var_913 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "UserData [";
         _loc1_ += "dateInClanInSec = " + this.dateInClanInSec + " ";
         _loc1_ += "deaths = " + this.deaths + " ";
         _loc1_ += "kills = " + this.kills + " ";
         _loc1_ += "lastVisitTime = " + this.lastVisitTime + " ";
         _loc1_ += "permission = " + this.permission + " ";
         _loc1_ += "score = " + this.score + " ";
         _loc1_ += "userId = " + this.userId + " ";
         return _loc1_ + "]";
      }
   }
}
