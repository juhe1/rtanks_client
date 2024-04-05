package package_25
{
   import package_128.name_354;
   import package_13.Long;
   import package_228.ClanAction;
   
   public class name_353
   {
       
      
      public var userId:String;
      
      public var name_870:Boolean;
      
      public var clanId:Long;
      
      public var clanName:String;
      
      public var clanTag:String;
      
      public var var_874:Vector.<ClanAction>;
      
      public var var_873:Vector.<Long>;
      
      public var var_872:Vector.<Long>;
      
      public var minRankForJoinClan:int;
      
      public function name_353(param1:name_354)
      {
         super();
         this.userId = param1.userId;
         this.name_870 = param1.clanMember;
         this.clanId = param1.clanId;
         this.clanName = param1.clanName;
         this.clanTag = param1.clanTag;
         this.var_874 = param1.clanAction;
         this.var_873 = param1.clanIncoming;
         this.var_872 = param1.clanOutgoing;
         this.minRankForJoinClan = param1.minRankForJoinClan;
      }
   }
}
