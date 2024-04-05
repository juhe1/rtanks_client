package controls.buttons.h30px
{
   import controls.buttons.FixedHeightRectangleSkin;
   import controls.buttons.name_2258;
   
   public class H30ButtonSkin extends name_2258
   {
      
      public static const name_2261:int = 12;
      
      public static const name_2260:int = 22;
      
      public static const name_2262:int = 6;
      
      public static const const_1576:int = 96;
      
      private static const const_2247:Class = H30ButtonSkin_disableLeftClass;
      
      private static const const_2248:Class = H30ButtonSkin_disableMiddleClass;
      
      private static const const_2249:Class = H30ButtonSkin_disableRightClass;
      
      public static const const_2246:FixedHeightRectangleSkin = new FixedHeightRectangleSkin(const_2247,const_2248,const_2249);
       
      
      public function H30ButtonSkin(param1:FixedHeightRectangleSkin, param2:FixedHeightRectangleSkin, param3:FixedHeightRectangleSkin)
      {
         super(param1,param2,param3,const_2246);
      }
   }
}
