package package_334
{
   public class name_1610
   {
      
      public static var OFF:name_1610 = new name_1610();
      
      public static var HEAL:name_1610 = new name_1610();
      
      public static var name_474:name_1610 = new name_1610();
      
      public static var name_1183:name_1610 = new name_1610();
       
      
      public function name_1610()
      {
         super();
      }
      
      public static function getType(param1:String) : name_1610
      {
         var _loc2_:name_1610 = null;
         switch(param1)
         {
            case "idle":
               _loc2_ = name_1183;
               break;
            case "damage":
               _loc2_ = name_474;
               break;
            case "heal":
               _loc2_ = HEAL;
         }
         return _loc2_;
      }
   }
}
