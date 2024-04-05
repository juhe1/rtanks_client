package controls.slider
{
   import assets.slider.slider_TRACK_CENTER;
   import assets.slider.slider_TRACK_LEFT;
   import assets.slider.slider_TRACK_RIGHT;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   
   public class name_3350 extends Sprite
   {
       
      
      protected var var_3664:slider_TRACK_LEFT;
      
      protected var var_3665:slider_TRACK_CENTER;
      
      protected var var_3666:slider_TRACK_RIGHT;
      
      protected var _width:int;
      
      protected var var_3663:Boolean;
      
      protected var var_3393:Number = 0;
      
      protected var var_3394:Number = 100;
      
      protected var var_3396:Number = 10;
      
      public function name_3350(param1:Boolean = true)
      {
         this.var_3664 = new slider_TRACK_LEFT(1,1);
         this.var_3665 = new slider_TRACK_CENTER(1,1);
         this.var_3666 = new slider_TRACK_RIGHT(1,1);
         super();
         this.var_3663 = param1;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = param1;
         this.draw();
      }
      
      protected function draw() : void
      {
         var _loc2_:Matrix = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc1_:Graphics = this.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(this.var_3664);
         _loc1_.drawRect(0,0,5,30);
         _loc1_.endFill();
         _loc2_ = new Matrix();
         _loc2_.translate(5,0);
         _loc1_.beginBitmapFill(this.var_3665,_loc2_);
         _loc1_.drawRect(5,0,this._width - 11,30);
         _loc1_.endFill();
         _loc2_ = new Matrix();
         _loc2_.translate(this._width - 6,0);
         _loc1_.beginBitmapFill(this.var_3666,_loc2_);
         _loc1_.drawRect(this._width - 6,0,6,30);
         _loc1_.endFill();
         if(this.var_3663)
         {
            _loc3_ = width / ((this.var_3394 - this.var_3393) / this.var_3396);
            _loc4_ = _loc3_;
            while(_loc4_ < this._width)
            {
               _loc1_.lineStyle(0,16777215,0.4);
               _loc1_.moveTo(_loc4_,5);
               _loc1_.lineTo(_loc4_,25);
               _loc4_ += _loc3_;
            }
         }
      }
      
      public function set minValue(param1:Number) : void
      {
         this.var_3393 = param1;
         this.draw();
      }
      
      public function set maxValue(param1:Number) : void
      {
         this.var_3394 = param1;
         this.draw();
      }
      
      public function set tickInterval(param1:Number) : void
      {
         this.var_3396 = param1;
         this.draw();
      }
   }
}
