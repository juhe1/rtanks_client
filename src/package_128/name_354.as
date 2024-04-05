package package_128
{
   import package_13.Long;
   import package_228.ClanAction;
   
   public class name_354
   {
       
      
      private var var_918:Vector.<ClanAction>;
      
      private var var_921:Long;
      
      private var var_916:Vector.<Long>;
      
      private var var_267:Boolean;
      
      private var var_915:String;
      
      private var var_917:Vector.<Long>;
      
      private var var_914:String;
      
      private var var_919:Boolean;
      
      private var var_912:int;
      
      private var var_920:Long;
      
      private var var_913:String;
      
      public function name_354(param1:Vector.<ClanAction> = null, param2:Long = null, param3:Vector.<Long> = null, param4:Boolean = false, param5:String = null, param6:Vector.<Long> = null, param7:String = null, param8:Boolean = false, param9:int = 0, param10:Long = null, param11:String = null)
      {
         super();
         this.var_918 = param1;
         this.var_921 = param2;
         this.var_916 = param3;
         this.var_267 = param4;
         this.var_915 = param5;
         this.var_917 = param6;
         this.var_914 = param7;
         this.var_919 = param8;
         this.var_912 = param9;
         this.var_920 = param10;
         this.var_913 = param11;
      }
      
      public function get clanAction() : Vector.<ClanAction>
      {
         return this.var_918;
      }
      
      public function set clanAction(param1:Vector.<ClanAction>) : void
      {
         this.var_918 = param1;
      }
      
      public function get clanId() : Long
      {
         return this.var_921;
      }
      
      public function set clanId(param1:Long) : void
      {
         this.var_921 = param1;
      }
      
      public function get clanIncoming() : Vector.<Long>
      {
         return this.var_916;
      }
      
      public function set clanIncoming(param1:Vector.<Long>) : void
      {
         this.var_916 = param1;
      }
      
      public function get clanMember() : Boolean
      {
         return this.var_267;
      }
      
      public function set clanMember(param1:Boolean) : void
      {
         this.var_267 = param1;
      }
      
      public function get clanName() : String
      {
         return this.var_915;
      }
      
      public function set clanName(param1:String) : void
      {
         this.var_915 = param1;
      }
      
      public function get clanOutgoing() : Vector.<Long>
      {
         return this.var_917;
      }
      
      public function set clanOutgoing(param1:Vector.<Long>) : void
      {
         this.var_917 = param1;
      }
      
      public function get clanTag() : String
      {
         return this.var_914;
      }
      
      public function set clanTag(param1:String) : void
      {
         this.var_914 = param1;
      }
      
      public function get incomingRequestEnabled() : Boolean
      {
         return this.var_919;
      }
      
      public function set incomingRequestEnabled(param1:Boolean) : void
      {
         this.var_919 = param1;
      }
      
      public function get minRankForJoinClan() : int
      {
         return this.var_912;
      }
      
      public function set minRankForJoinClan(param1:int) : void
      {
         this.var_912 = param1;
      }
      
      public function get restrictionTimeJoinClan() : Long
      {
         return this.var_920;
      }
      
      public function set restrictionTimeJoinClan(param1:Long) : void
      {
         this.var_920 = param1;
      }
      
      public function get userId() : String
      {
         return this.var_913;
      }
      
      public function set userId(param1:String) : void
      {
         this.var_913 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ClanNotifierData [";
         _loc1_ += "clanAction = " + this.clanAction + " ";
         _loc1_ += "clanId = " + this.clanId + " ";
         _loc1_ += "clanIncoming = " + this.clanIncoming + " ";
         _loc1_ += "clanMember = " + this.clanMember + " ";
         _loc1_ += "clanName = " + this.clanName + " ";
         _loc1_ += "clanOutgoing = " + this.clanOutgoing + " ";
         _loc1_ += "clanTag = " + this.clanTag + " ";
         _loc1_ += "incomingRequestEnabled = " + this.incomingRequestEnabled + " ";
         _loc1_ += "minRankForJoinClan = " + this.minRankForJoinClan + " ";
         _loc1_ += "restrictionTimeJoinClan = " + this.restrictionTimeJoinClan + " ";
         _loc1_ += "userId = " + this.userId + " ";
         return _loc1_ + "]";
      }
   }
}
