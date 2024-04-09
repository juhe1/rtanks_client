package package_254
{
   import package_1.Main;
   import package_54.name_102;
   import package_60.TextConst;
   
   public class name_1004 extends name_2100
   {
       
      
      public function name_1004()
      {
         super();
         var _loc1_:name_102 = name_102(Main.osgi.getService(name_102));
         text = _loc1_.getText(TextConst.HELP_PANEL_SCORE_HELPER_TEXT);
         arrowLehgth = int(_loc1_.getText(TextConst.HELP_PANEL_SCORE_HELPER_ARROW_LENGTH));
         arrowAlign = name_2221.TOP_LEFT;
         var_601 = 3;
         var_597.x = 79;
         var_597.y = 25;
      }
   }
}
