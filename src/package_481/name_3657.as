package package_481
{
   import controls.cellrenderer.name_1932;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   
   public class name_3657 extends name_1932
   {
      
      private static var var_3371:Class = name_3723;
      
      private static var var_3378:BitmapData = Bitmap(new var_3371()).bitmapData;
      
      private static var var_3372:Class = name_3724;
      
      private static var var_3374:BitmapData = Bitmap(new var_3372()).bitmapData;
      
      private static var var_3377:Class = name_3725;
      
      private static var var_3373:BitmapData = Bitmap(new var_3377()).bitmapData;
       
      
      public function name_3657()
      {
         super();
         name_1933 = var_3378;
         name_1934 = var_3374;
         name_1935 = var_3373;
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
         l.y = 0;
         _loc1_ = c.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(name_1934);
         _loc1_.drawRect(0,0,_width - 10,20);
         _loc1_.endFill();
         c.x = 5;
         c.y = 0;
         _loc1_ = const_1653.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(name_1935);
         _loc1_.drawRect(0,0,5,20);
         _loc1_.endFill();
         const_1653.x = _width - 5;
         const_1653.y = 0;
      }
   }
}
