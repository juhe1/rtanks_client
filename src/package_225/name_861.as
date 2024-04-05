package package_225
{
   import package_13.Long;
   import package_217.name_351;
   
   public class name_861
   {
       
      
      private var var_1646:Boolean;
      
      private var var_1643:Long;
      
      private var var_250:Long;
      
      private var var_933:String;
      
      private var var_1645:Long;
      
      private var var_919:Boolean;
      
      private var var_1637:int;
      
      private var var_1644:Boolean;
      
      private var var_1641:int;
      
      private var var_23:String;
      
      private var var_1640:String;
      
      private var var_1638:Boolean;
      
      private var var_1639:Boolean;
      
      private var var_251:String;
      
      private var var_1642:Long;
      
      private var var_1219:Vector.<name_351>;
      
      public function name_861(param1:Boolean = false, param2:Long = null, param3:Long = null, param4:String = null, param5:Long = null, param6:Boolean = false, param7:int = 0, param8:Boolean = false, param9:int = 0, param10:String = null, param11:String = null, param12:Boolean = false, param13:Boolean = false, param14:String = null, param15:Long = null, param16:Vector.<name_351> = null)
      {
         super();
         this.var_1646 = param1;
         this.var_1643 = param2;
         this.var_250 = param3;
         this.var_933 = param4;
         this.var_1645 = param5;
         this.var_919 = param6;
         this.var_1637 = param7;
         this.var_1644 = param8;
         this.var_1641 = param9;
         this.var_23 = param10;
         this.var_1640 = param11;
         this.var_1638 = param12;
         this.var_1639 = param13;
         this.var_251 = param14;
         this.var_1642 = param15;
         this.var_1219 = param16;
      }
      
      public function get blocked() : Boolean
      {
         return this.var_1646;
      }
      
      public function set blocked(param1:Boolean) : void
      {
         this.var_1646 = param1;
      }
      
      public function get createTime() : Long
      {
         return this.var_1643;
      }
      
      public function set createTime(param1:Long) : void
      {
         this.var_1643 = param1;
      }
      
      public function get creatorId() : Long
      {
         return this.var_250;
      }
      
      public function set creatorId(param1:Long) : void
      {
         this.var_250 = param1;
      }
      
      public function get description() : String
      {
         return this.var_933;
      }
      
      public function set description(param1:String) : void
      {
         this.var_933 = param1;
      }
      
      public function get flagId() : Long
      {
         return this.var_1645;
      }
      
      public function set flagId(param1:Long) : void
      {
         this.var_1645 = param1;
      }
      
      public function get incomingRequestEnabled() : Boolean
      {
         return this.var_919;
      }
      
      public function set incomingRequestEnabled(param1:Boolean) : void
      {
         this.var_919 = param1;
      }
      
      public function get maxMembers() : int
      {
         return this.var_1637;
      }
      
      public function set maxMembers(param1:int) : void
      {
         this.var_1637 = param1;
      }
      
      public function get memberClan() : Boolean
      {
         return this.var_1644;
      }
      
      public function set memberClan(param1:Boolean) : void
      {
         this.var_1644 = param1;
      }
      
      public function get minRankForAddClan() : int
      {
         return this.var_1641;
      }
      
      public function set minRankForAddClan(param1:int) : void
      {
         this.var_1641 = param1;
      }
      
      public function get name() : String
      {
         return this.var_23;
      }
      
      public function set name(param1:String) : void
      {
         this.var_23 = param1;
      }
      
      public function get reasonForBlocking() : String
      {
         return this.var_1640;
      }
      
      public function set reasonForBlocking(param1:String) : void
      {
         this.var_1640 = param1;
      }
      
      public function get requestInIncoming() : Boolean
      {
         return this.var_1638;
      }
      
      public function set requestInIncoming(param1:Boolean) : void
      {
         this.var_1638 = param1;
      }
      
      public function get requestInOutgoing() : Boolean
      {
         return this.var_1639;
      }
      
      public function set requestInOutgoing(param1:Boolean) : void
      {
         this.var_1639 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_251;
      }
      
      public function set tag(param1:String) : void
      {
         this.var_251 = param1;
      }
      
      public function get timeBlocking() : Long
      {
         return this.var_1642;
      }
      
      public function set timeBlocking(param1:Long) : void
      {
         this.var_1642 = param1;
      }
      
      public function get users() : Vector.<name_351>
      {
         return this.var_1219;
      }
      
      public function set users(param1:Vector.<name_351>) : void
      {
         this.var_1219 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ForeignClanData [";
         _loc1_ += "blocked = " + this.blocked + " ";
         _loc1_ += "createTime = " + this.createTime + " ";
         _loc1_ += "creatorId = " + this.creatorId + " ";
         _loc1_ += "description = " + this.description + " ";
         _loc1_ += "flagId = " + this.flagId + " ";
         _loc1_ += "incomingRequestEnabled = " + this.incomingRequestEnabled + " ";
         _loc1_ += "maxMembers = " + this.maxMembers + " ";
         _loc1_ += "memberClan = " + this.memberClan + " ";
         _loc1_ += "minRankForAddClan = " + this.minRankForAddClan + " ";
         _loc1_ += "name = " + this.name + " ";
         _loc1_ += "reasonForBlocking = " + this.reasonForBlocking + " ";
         _loc1_ += "requestInIncoming = " + this.requestInIncoming + " ";
         _loc1_ += "requestInOutgoing = " + this.requestInOutgoing + " ";
         _loc1_ += "tag = " + this.tag + " ";
         _loc1_ += "timeBlocking = " + this.timeBlocking + " ";
         _loc1_ += "users = " + this.users + " ";
         return _loc1_ + "]";
      }
   }
}
