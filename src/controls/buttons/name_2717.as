package controls.buttons
{
   import assets.button.button_def_DOWN_CENTER;
   import assets.button.button_def_DOWN_LEFT;
   import assets.button.button_def_DOWN_RIGHT;
   import assets.button.button_def_OVER_CENTER;
   import assets.button.button_def_OVER_LEFT;
   import assets.button.button_def_OVER_RIGHT;
   import assets.button.button_def_UP_CENTER;
   import assets.button.button_def_UP_LEFT;
   import assets.button.button_def_UP_RIGHT;
   import controls.buttons.h30px.H30ButtonSkin;
   import controls.buttons.h30px.name_2259;
   import flash.display.BitmapData;
   
   public class name_2717 extends name_2258
   {
       
      
      public function name_2717()
      {
         super(method_3010(new button_def_UP_LEFT(1,1),new button_def_UP_CENTER(1,1),new button_def_UP_RIGHT(1,1)),method_3010(new button_def_OVER_LEFT(1,1),new button_def_OVER_CENTER(1,1),new button_def_OVER_RIGHT(1,1)),method_3010(new button_def_DOWN_LEFT(1,1),new button_def_DOWN_CENTER(1,1),new button_def_DOWN_RIGHT(1,1)),method_2729(name_2259.const_2255,name_2259.const_2257,name_2259.const_2253));
      }
      
      private static function method_3010(param1:BitmapData, param2:BitmapData, param3:BitmapData) : FixedHeightRectangleSkin
      {
         return FixedHeightRectangleSkin.method_983(param1,param2,param3);
      }
      
      private static function method_2729(param1:Class, param2:Class, param3:Class) : FixedHeightRectangleSkin
      {
         return new FixedHeightRectangleSkin(param1,param2,param3);
      }
      
      public static function name_2718() : H30ButtonSkin
      {
         return new H30ButtonSkin(method_3010(new button_def_UP_LEFT(1,1),new button_def_UP_CENTER(1,1),new button_def_UP_RIGHT(1,1)),method_3010(new button_def_OVER_LEFT(1,1),new button_def_OVER_CENTER(1,1),new button_def_OVER_RIGHT(1,1)),method_3010(new button_def_DOWN_LEFT(1,1),new button_def_DOWN_CENTER(1,1),new button_def_DOWN_RIGHT(1,1)));
      }
   }
}
