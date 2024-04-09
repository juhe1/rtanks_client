package package_344
{
   import package_1.Main;
   import package_254.name_2100;
   import package_254.name_2221;
   import package_54.name_102;
   import package_60.TextConst;
   
   public class name_1656 extends name_2100
   {
       
      
      public function name_1656()
      {
         super();
         var _loc1_:name_102 = name_102(Main.osgi.getService(name_102));
         text = _loc1_.getText(TextConst.const_352);
         arrowLehgth = int(_loc1_.getText(TextConst.const_241));
         arrowAlign = name_2221.TOP_LEFT;
         var_601 = 100;
      }
   }
}
