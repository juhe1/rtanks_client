package utils
{
   import controls.scroller.blue.ScrollThumbSkinBlue;
   import controls.scroller.blue.name_2760;
   import controls.scroller.gray.ScrollThumbSkinGray;
   import controls.scroller.gray.name_2761;
   import controls.scroller.green.ScrollThumbSkinGreen;
   import controls.scroller.green.name_2758;
   import controls.scroller.red.ScrollThumbSkinRed;
   import controls.scroller.red.name_2759;
   import fl.core.UIComponent;
   
   public class name_1915
   {
       
      
      public function name_1915()
      {
         super();
      }
      
      public static function setStyle(param1:UIComponent, param2:Class, param3:Class, param4:Class, param5:Class) : void
      {
         param1.setStyle("downArrowUpSkin",param2);
         param1.setStyle("downArrowDownSkin",param2);
         param1.setStyle("downArrowOverSkin",param2);
         param1.setStyle("downArrowDisabledSkin",param2);
         param1.setStyle("upArrowUpSkin",param3);
         param1.setStyle("upArrowDownSkin",param3);
         param1.setStyle("upArrowOverSkin",param3);
         param1.setStyle("upArrowDisabledSkin",param3);
         param1.setStyle("trackUpSkin",param4);
         param1.setStyle("trackDownSkin",param4);
         param1.setStyle("trackOverSkin",param4);
         param1.setStyle("trackDisabledSkin",param4);
         param1.setStyle("thumbUpSkin",param5);
         param1.setStyle("thumbDownSkin",param5);
         param1.setStyle("thumbOverSkin",param5);
         param1.setStyle("thumbDisabledSkin",param5);
      }
      
      public static function name_1918(param1:UIComponent) : void
      {
         setStyle(param1,name_2758.name_2762,name_2758.name_2763,name_2758.track,ScrollThumbSkinGreen);
      }
      
      public static function name_2035(param1:UIComponent) : void
      {
         setStyle(param1,name_2761.name_2762,name_2761.name_2763,name_2761.track,ScrollThumbSkinGray);
      }
      
      public static function method_2572(param1:UIComponent) : void
      {
         setStyle(param1,name_2760.name_2762,name_2760.name_2763,name_2760.track,ScrollThumbSkinBlue);
      }
      
      public static function method_2571(param1:UIComponent) : void
      {
         setStyle(param1,name_2759.name_2762,name_2759.name_2763,name_2759.track,ScrollThumbSkinRed);
      }
   }
}
