package package_297
{
   import alternativa.tanks.models.tank.TankData;
   import flash.display.Bitmap;
   import package_47.BattleTeamType;
   
   public class name_1138
   {
      
      private static var var_1930:Class = name_2363;
      
      private static var var_1928:Class = name_2362;
      
      private static var var_1929:Class = name_2361;
       
      
      public function name_1138()
      {
         super();
      }
      
      public static function name_1145(param1:BattleTeamType) : Bitmap
      {
         switch(param1)
         {
            case BattleTeamType.BLUE:
               return new var_1930();
            case BattleTeamType.RED:
               return new var_1929();
            default:
               return new var_1928();
         }
      }
      
      public static function method_2074(param1:TankData) : Bitmap
      {
         return name_1145(param1.teamType);
      }
   }
}
