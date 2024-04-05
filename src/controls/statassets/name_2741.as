package controls.statassets
{
   import assets.stat.hall_ARROW;
   import assets.stat.hall_HEADER;
   import flash.display.BitmapData;
   
   public class name_2741 extends class_150
   {
       
      
      protected var _selected:Boolean = false;
      
      protected var var_3368:BitmapData;
      
      public function name_2741()
      {
         super();
         var_1390 = new hall_HEADER(1,1);
         var_1391 = new BitmapData(1,1,false,5898034);
         this.var_3368 = new hall_ARROW(1,1);
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
         this.draw();
      }
      
      override protected function draw() : void
      {
         super.draw();
      }
   }
}
