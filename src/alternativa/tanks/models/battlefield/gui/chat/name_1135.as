package alternativa.tanks.models.battlefield.gui.chat
{
   import package_47.BattleTeamType;
   
   public class name_1135
   {
      
      public static const const_1740:uint = 65280;
      
      public static const const_1738:uint = 16776960;
      
      public static const BLUE:uint = 4691967;
      
      public static const RED:uint = 15741974;
      
      public static const package_313:uint = 65280;
      
      public static const name_1140:uint = 16776960;
      
      public static const const_1739:uint = 16750081;
      
      public static const name_2012:uint = 14540253;
       
      
      public function name_1135()
      {
         super();
      }
      
      public static function method_2076(param1:BattleTeamType, param2:Boolean) : uint
      {
         if(param2)
         {
            return name_1135.name_1140;
         }
         switch(param1)
         {
            case BattleTeamType.BLUE:
               return name_1135.BLUE;
            case BattleTeamType.RED:
               return name_1135.RED;
            default:
               return name_1135.package_313;
         }
      }
      
      public static function method_2075(param1:BattleTeamType, param2:Boolean, param3:Boolean) : uint
      {
         if(!param2)
         {
            return name_1135.name_2012;
         }
         if(param3)
         {
            return 16777071;
         }
         switch(param1)
         {
            case BattleTeamType.BLUE:
               return 10013694;
            case BattleTeamType.RED:
               return 16685208;
            default:
               return name_1135.package_313;
         }
      }
   }
}
