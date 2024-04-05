package assets.combo
{
   import controls.name_1932;
   import flash.display.Graphics;
   
   public class name_2780 extends name_1932
   {
       
      
      public function name_2780()
      {
         super();
         name_1933 = new combolist_OVER_LEFT(1,1);
         name_1934 = new combolist_OVER_CENTER(1,1);
         name_1935 = new combolist_OVER_RIGHT(1,1);
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
