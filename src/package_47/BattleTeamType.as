package package_47
{
   public class BattleTeamType
   {
      
      public static var NONE:BattleTeamType = new BattleTeamType("NONE");
      
      public static var RED:BattleTeamType = new BattleTeamType("RED");
      
      public static var BLUE:BattleTeamType = new BattleTeamType("BLUE");
       
      
      private var var_436:String;
      
      public function BattleTeamType(param1:String)
      {
         super();
         this.var_436 = param1;
      }
      
      public static function getType(param1:String) : BattleTeamType
      {
         if(param1 == "NONE")
         {
            return NONE;
         }
         if(param1 == "RED")
         {
            return RED;
         }
         if(param1 == "BLUE")
         {
            return BLUE;
         }
         return null;
      }
      
      public function toString() : String
      {
         return "{BATTLETEAMTYPE} " + this.var_436;
      }
      
      public function getValue() : String
      {
         return this.var_436;
      }
   }
}
