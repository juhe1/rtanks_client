package forms
{
   import flash.text.TextFormatAlign;
   import package_1.Main;
   import package_54.name_102;
   import package_60.TextConst;
   
   public class name_1010 extends ServerStopAlert
   {
       
      
      public function name_1010(param1:int)
      {
         super(param1);
      }
      
      override protected function init() : void
      {
         var _loc1_:name_102 = Main.osgi.name_6(name_102) as name_102;
         var_1740.align = TextFormatAlign.CENTER;
         str = _loc1_.getText(TextConst.REDIRECT_ALERT_TEXT);
         var_1740.text = getText(str,"88");
         addChild(bg);
         addChild(var_1740);
         var_1740.x = 15;
         var_1740.y = 15;
         bg.width = var_1740.width + 15 * 2;
         bg.height = var_1740.height + 15 * 2;
         method_686();
      }
   }
}
