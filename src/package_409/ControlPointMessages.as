package package_409
{
   import alternativa.tanks.models.battlefield.gui.chat.name_1135;
   import flash.utils.Dictionary;
   import package_47.BattleTeamType;
   import package_60.TextConst;
   
   public class ControlPointMessages
   {
      
      public static const name_2232:name_2229 = new name_2229(name_1135.const_1740,TextConst.DOM_WE_CAPTURED_POINT);
      
      public static const name_2235:name_2229 = new name_2229(name_1135.const_1738,TextConst.DOM_ENEMIES_CAPTURED_POINT);
      
      public static const name_2234:name_2229 = new name_2229(name_1135.const_1738,TextConst.DOM_WE_LOST_POINT);
      
      public static const name_2233:name_2229 = new name_2229(name_1135.const_1740,TextConst.DOM_ENEMIES_LOST_POINT);
      
      private static const const_2234:name_2229 = new name_2229(name_1135.BLUE,TextConst.DOM_BLUE_CAPTURED_POINT);
      
      private static const const_2236:name_2229 = new name_2229(name_1135.RED,TextConst.DOM_RED_CAPTURED_POINT);
      
      private static const const_2232:Dictionary = new Dictionary();
      
      private static const const_2233:name_2229 = new name_2229(name_1135.BLUE,TextConst.DOM_BLUE_LOST_POINT);
      
      private static const const_2235:name_2229 = new name_2229(name_1135.RED,TextConst.DOM_RED_LOST_POINT);
      
      private static const const_2231:Dictionary = new Dictionary();
      
      {
         const_2232[BattleTeamType.BLUE] = const_2234;
         const_2232[BattleTeamType.RED] = const_2236;
         const_2231[BattleTeamType.BLUE] = const_2233;
         const_2231[BattleTeamType.RED] = const_2235;
      }
      
      public function ControlPointMessages()
      {
         super();
      }
      
      public static function method_1937(param1:BattleTeamType) : name_2229
      {
         return const_2232[param1];
      }
      
      public static function name_2236(param1:BattleTeamType) : name_2229
      {
         return const_2231[param1];
      }
   }
}
