package controls.statassets
{
   import controls.resultassets.class_149;
   import flash.display.Graphics;
   
   public class class_150 extends class_149
   {
       
      
      protected var var_1392:uint = 0;
      
      public function class_150()
      {
         super();
      }
      
      override protected function draw() : void
      {
         var _loc1_:Graphics = null;
         super.draw();
         if(this.var_1392 != 0)
         {
            _loc1_ = this.graphics;
            _loc1_.beginFill(this.var_1392);
            _loc1_.drawRect(4,0,_width - 8,1);
            _loc1_.drawRect(4,_height - 1,_width - 8,1);
            _loc1_.drawRect(0,4,1,_height - 8);
            _loc1_.drawRect(_width - 1,4,1,_height - 8);
            _loc1_.endFill();
         }
      }
   }
}
