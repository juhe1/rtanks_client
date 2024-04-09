package utils
{
   import controls.scroller.blue.ScrollThumbSkinBlue;
   import controls.scroller.blue.ScrollSkinBlue;
   import controls.scroller.gray.ScrollThumbSkinGray;
   import controls.scroller.gray.ScrollSkinGray;
   import controls.scroller.green.ScrollThumbSkinGreen;
   import controls.scroller.green.ScrollSkinGreen;
   import controls.scroller.red.ScrollThumbSkinRed;
   import controls.scroller.red.ScrollSkinRed;
   import fl.core.UIComponent;
   
   public class ScrollStyleUtils
   {
       
      
      public function ScrollStyleUtils()
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
      
      public static function setGreenStyle(param1:UIComponent) : void
      {
         setStyle(param1,ScrollSkinGreen.name_2762,ScrollSkinGreen.name_2763,ScrollSkinGreen.track,ScrollThumbSkinGreen);
      }
      
      public static function setGrayStyle(param1:UIComponent) : void
      {
         setStyle(param1,ScrollSkinGray.name_2762,ScrollSkinGray.name_2763,ScrollSkinGray.track,ScrollThumbSkinGray);
      }
      
      public static function setBlueStyle(param1:UIComponent) : void
      {
         setStyle(param1,ScrollSkinBlue.name_2762,ScrollSkinBlue.name_2763,ScrollSkinBlue.track,ScrollThumbSkinBlue);
      }
      
      public static function setRedStyle(param1:UIComponent) : void
      {
         setStyle(param1,ScrollSkinRed.name_2762,ScrollSkinRed.name_2763,ScrollSkinRed.track,ScrollThumbSkinRed);
      }
   }
}
