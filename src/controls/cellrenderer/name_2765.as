package controls.cellrenderer
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   
   public class name_2765 extends class_208
   {
      
      private static const const_2611:Class = name_3338;
      
      private static const const_2614:BitmapData = Bitmap(new const_2611()).bitmapData;
      
      private static const const_2613:Class = name_3336;
      
      private static const const_2612:BitmapData = Bitmap(new const_2613()).bitmapData;
      
      private static const const_2610:Class = name_3337;
      
      private static const const_2615:BitmapData = Bitmap(new const_2610()).bitmapData;
       
      
      public function name_2765()
      {
         super();
         name_1933 = const_2614;
         name_1934 = const_2612;
         name_1935 = const_2615;
      }
      
      override public function draw() : void
      {
         var _loc1_:Graphics = null;
         _loc1_ = l.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(name_1933);
         _loc1_.drawRect(0,0,5,20);
         _loc1_.endFill();
         l.x = 0;
         l.y = 1;
         _loc1_ = c.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(name_1934);
         _loc1_.drawRect(0,0,_width - 10,20);
         _loc1_.endFill();
         c.x = 5;
         c.y = 1;
         _loc1_ = const_1653.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(name_1935);
         _loc1_.drawRect(0,0,5,20);
         _loc1_.endFill();
         const_1653.x = _width - 5;
         const_1653.y = 1;
      }
   }
}
