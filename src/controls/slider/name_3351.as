package controls.slider
{
   import assets.slider.slider_THUMB_CENTER;
   import assets.slider.slider_THUMB_LEFT;
   import assets.slider.slider_THUMB_RIGHT;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   
   public class name_3351 extends Sprite
   {
       
      
      protected var var_3667:slider_THUMB_LEFT;
      
      protected var var_3669:slider_THUMB_CENTER;
      
      protected var var_3668:slider_THUMB_RIGHT;
      
      protected var _width:int;
      
      public function name_3351()
      {
         this.var_3667 = new slider_THUMB_LEFT(1,1);
         this.var_3669 = new slider_THUMB_CENTER(1,1);
         this.var_3668 = new slider_THUMB_RIGHT(1,1);
         super();
         buttonMode = true;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = param1;
         this.draw();
      }
      
      protected function draw() : void
      {
         var _loc2_:Matrix = null;
         var _loc1_:Graphics = this.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(this.var_3667);
         _loc1_.drawRect(0,0,10,30);
         _loc1_.endFill();
         _loc2_ = new Matrix();
         _loc2_.translate(10,0);
         _loc1_.beginBitmapFill(this.var_3669,_loc2_);
         _loc1_.drawRect(10,0,this._width - 20,30);
         _loc1_.endFill();
         _loc2_ = new Matrix();
         _loc2_.translate(this._width - 10,0);
         _loc1_.beginBitmapFill(this.var_3668,_loc2_);
         _loc1_.drawRect(this._width - 10,0,10,30);
         _loc1_.endFill();
      }
   }
}
