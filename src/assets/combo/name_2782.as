package assets.combo
{
   import controls.name_1932;
   import flash.display.Graphics;
   
   public class name_2782 extends name_1932
   {
       
      
      public function name_2782()
      {
         super();
      }
      
      override public function draw() : void
      {
         var _loc1_:Graphics = null;
         _loc1_ = l.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(name_1933);
         _loc1_.drawRect(0,0,7,30);
         _loc1_.endFill();
         l.x = 0;
         l.y = 0;
         _loc1_ = c.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(name_1934);
         _loc1_.drawRect(0,0,_width - 40,30);
         _loc1_.endFill();
         c.x = 7;
         c.y = 0;
         _loc1_ = const_1653.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(name_1935);
         _loc1_.drawRect(0,0,33,30);
         _loc1_.endFill();
         const_1653.x = _width - 33;
         const_1653.y = 0;
      }
   }
}
