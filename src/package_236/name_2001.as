package package_236
{
   import package_13.Long;
   
   public class name_2001
   {
       
      
      private var var_1646:Boolean;
      
      private var var_1643:Long;
      
      private var var_250:Long;
      
      private var var_933:String;
      
      private var var_1645:Long;
      
      private var var_919:Boolean;
      
      private var var_248:int;
      
      private var var_1637:int;
      
      private var var_1641:int;
      
      private var var_23:String;
      
      private var var_1640:String;
      
      private var _self:Boolean;
      
      private var var_251:String;
      
      private var var_1642:Long;
      
      private var var_1219:Vector.<Long>;
      
      public function name_2001(param1:Boolean = false, param2:Long = null, param3:Long = null, param4:String = null, param5:Long = null, param6:Boolean = false, param7:int = 0, param8:int = 0, param9:int = 0, param10:String = null, param11:String = null, param12:Boolean = false, param13:String = null, param14:Long = null, param15:Vector.<Long> = null)
      {
         super();
         this.var_1646 = param1;
         this.var_1643 = param2;
         this.var_250 = param3;
         this.var_933 = param4;
         this.var_1645 = param5;
         this.var_919 = param6;
         this.var_248 = param7;
         this.var_1637 = param8;
         this.var_1641 = param9;
         this.var_23 = param10;
         this.var_1640 = param11;
         this._self = param12;
         this.var_251 = param13;
         this.var_1642 = param14;
         this.var_1219 = param15;
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
      
      public function get maxCharactersDescription() : int
      {
         return this.var_248;
      }
      
      public function set maxCharactersDescription(param1:int) : void
      {
         this.var_248 = param1;
      }
      
      public function get maxMembers() : int
      {
         return this.var_1637;
      }
      
      public function set maxMembers(param1:int) : void
      {
         this.var_1637 = param1;
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
      
      public function get self() : Boolean
      {
         return this._self;
      }
      
      public function set self(param1:Boolean) : void
      {
         this._self = param1;
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
      
      public function get users() : Vector.<Long>
      {
         return this.var_1219;
      }
      
      public function set users(param1:Vector.<Long>) : void
      {
         this.var_1219 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ClanInfoCC [";
         _loc1_ += "blocked = " + this.blocked + " ";
         _loc1_ += "createTime = " + this.createTime + " ";
         _loc1_ += "creatorId = " + this.creatorId + " ";
         _loc1_ += "description = " + this.description + " ";
         _loc1_ += "flagId = " + this.flagId + " ";
         _loc1_ += "incomingRequestEnabled = " + this.incomingRequestEnabled + " ";
         _loc1_ += "maxCharactersDescription = " + this.maxCharactersDescription + " ";
         _loc1_ += "maxMembers = " + this.maxMembers + " ";
         _loc1_ += "minRankForAddClan = " + this.minRankForAddClan + " ";
         _loc1_ += "name = " + this.name + " ";
         _loc1_ += "reasonForBlocking = " + this.reasonForBlocking + " ";
         _loc1_ += "self = " + this.self + " ";
         _loc1_ += "tag = " + this.tag + " ";
         _loc1_ += "timeBlocking = " + this.timeBlocking + " ";
         _loc1_ += "users = " + this.users + " ";
         return _loc1_ + "]";
      }
   }
}
