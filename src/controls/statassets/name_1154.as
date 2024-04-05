package controls.statassets
{
   import assets.resultwindow.name_2064;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.geom.Matrix;
   
   public class name_1154 extends class_150
   {
       
      
      public function name_1154()
      {
         super();
         var_1390 = new name_2064(1,1);
         var_1391 = new BitmapData(1,1,true,2566914048);
      }
      
      override protected function draw() : void
      {
         var _loc2_:Matrix = null;
         var _loc1_:Graphics = this.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(var_1390);
         _loc1_.drawRect(0,0,8,8);
         _loc1_.endFill();
         _loc2_ = new Matrix();
         _loc2_.rotate(Math.PI * 0.5);
         _loc2_.translate(_width - 8,0);
         _loc1_.beginBitmapFill(var_1390,_loc2_);
         _loc1_.drawRect(_width - 8,0,8,8);
         _loc1_.endFill();
         _loc2_ = new Matrix();
         _loc2_.rotate(Math.PI);
         _loc2_.translate(_width - 8,_height - 8);
         _loc1_.beginBitmapFill(var_1390,_loc2_);
         _loc1_.drawRect(_width - 8,_height - 8,8,8);
         _loc1_.endFill();
         _loc2_ = new Matrix();
         _loc2_.rotate(Math.PI * 1.5);
         _loc2_.translate(0,_height - 8);
         _loc1_.beginBitmapFill(var_1390,_loc2_);
         _loc1_.drawRect(0,_height - 8,8,8);
         _loc1_.endFill();
         _loc1_.beginBitmapFill(var_1391);
         _loc1_.drawRect(8,0,_width - 16,_height);
         _loc1_.drawRect(0,8,8,_height - 16);
         _loc1_.drawRect(_width - 8,8,8,_height - 16);
         _loc1_.endFill();
      }
   }
}
