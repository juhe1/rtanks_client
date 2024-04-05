package assets.cellrenderer.battlelist
{
   import controls.name_1932;
   import flash.display.Graphics;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.cellrenderer.battlelist.class_205")]
   public class class_205 extends name_1932
   {
       
      
      public function class_205()
      {
         super();
         name_1933 = new cell_normal_UP_LEFT(1,1);
         name_1934 = new cell_normal_UP_CENTER(1,1);
         name_1935 = new cell_normal_UP_RIGHT(1,1);
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
