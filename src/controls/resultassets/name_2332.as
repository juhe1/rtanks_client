package controls.resultassets
{
   import assets.resultwindow.items_mini_CENTER;
   import assets.resultwindow.items_mini_LEFT;
   import assets.resultwindow.items_mini_RIGHT;
   import controls.name_1932;
   import flash.display.Graphics;
   
   public class name_2332 extends name_1932
   {
       
      
      public function name_2332()
      {
         super();
         name_1933 = new items_mini_LEFT(1,1);
         name_1934 = new items_mini_CENTER(1,1);
         name_1935 = new items_mini_RIGHT(1,1);
      }
      
      override public function draw() : void
      {
         var _loc1_:Graphics = null;
         _loc1_ = l.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(name_1933);
         _loc1_.drawRect(0,0,20,40);
         _loc1_.endFill();
         l.x = 0;
         l.y = 0;
         _loc1_ = c.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(name_1934);
         _loc1_.drawRect(0,0,_width - 40,40);
         _loc1_.endFill();
         c.x = 20;
         c.y = 0;
         _loc1_ = const_1653.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(name_1935);
         _loc1_.drawRect(0,0,20,40);
         _loc1_.endFill();
         const_1653.x = _width - 20;
         const_1653.y = 0;
      }
   }
}
