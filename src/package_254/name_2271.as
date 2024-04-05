package package_254
{
   import package_1.Main;
   import package_54.name_102;
   import package_60.TextConst;
   
   public class name_2271 extends name_2100
   {
       
      
      public function name_2271()
      {
         super();
         var _loc1_:name_102 = name_102(Main.osgi.name_6(name_102));
         text = _loc1_.getText(TextConst.HELP_BATTLE_SELECT_LOCKED_MAP_HELPER_TEXT);
         arrowLehgth = int(_loc1_.getText(TextConst.HELP_BATTLE_SELECT_LOCKED_MAP_HELPER_ARROW_LENGTH));
         arrowAlign = name_2221.MIDDLE_LEFT;
         var_601 = 5;
      }
   }
}
