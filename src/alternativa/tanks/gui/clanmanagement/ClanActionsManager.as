package alternativa.tanks.gui.clanmanagement
{
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.class_138;
   
   public class ClanActionsManager
   {
      
      private static var var_2571:Vector.<class_138> = new Vector.<class_138>();
       
      
      public function ClanActionsManager()
      {
         super();
      }
      
      public static function name_1931(param1:class_138) : void
      {
         var _loc2_:int = var_2571.indexOf(param1);
         if(_loc2_ < 0)
         {
            var_2571.push(param1);
         }
      }
      
      public static function name_1937(param1:class_138) : void
      {
         var _loc2_:int = var_2571.indexOf(param1);
         if(_loc2_ >= 0)
         {
            var_2571.splice(_loc2_,1);
         }
      }
      
      public static function method_1459() : void
      {
         var _loc1_:class_138 = null;
         for each(_loc1_ in var_2571)
         {
            _loc1_.method_1459();
         }
      }
      
      public static function method_91() : void
      {
         var_2571 = new Vector.<class_138>();
      }
   }
}
