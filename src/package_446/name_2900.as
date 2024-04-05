package package_446
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   
   public class name_2900 extends class_211
   {
      
      private static const const_2645:Class = name_3375;
      
      private static const const_2642:BitmapData = Bitmap(new const_2645()).bitmapData;
      
      private static const const_2643:Class = name_3376;
      
      private static const const_2644:BitmapData = Bitmap(new const_2643()).bitmapData;
       
      
      public function name_2900()
      {
         super(const_2642,3,4);
      }
      
      public function set name_1066(param1:Boolean) : void
      {
         _icon.bitmapData = param1 ? const_2642 : const_2644;
      }
      
      public function hide() : void
      {
         width = 0;
         enable = false;
      }
   }
}
