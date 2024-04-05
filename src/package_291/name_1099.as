package package_291
{
   import package_47.BattleTeamType;
   
   public class name_1099
   {
       
      
      public var name:String;
      
      public var rank:int;
      
      public var suspicious:Boolean;
      
      public var teamType:BattleTeamType;
      
      public var userId:String;
      
      public var kills:int;
      
      public var deaths:int;
      
      public var score:int;
      
      public var reward:int;
      
      public var premiumBonusReward:int;
      
      public var newbiesAbonementBonusReward:int;
      
      public var stars:int;
      
      public function name_1099(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int, param7:BattleTeamType, param8:String, param9:Boolean, param10:int, param11:int, param12:int)
      {
         super();
         this.name = param3;
         this.rank = param4;
         this.teamType = param7;
         this.userId = param8;
         this.kills = param1;
         this.deaths = param2;
         this.score = param5;
         this.reward = param6;
         this.suspicious = param9;
         this.premiumBonusReward = param10;
         this.newbiesAbonementBonusReward = param11;
         this.stars = param12;
      }
   }
}
