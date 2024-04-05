package controls.lifeindicator
{
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.geom.Matrix;
   
   public class class_197 extends Shape
   {
      
      private static var var_3031:Matrix = new Matrix();
       
      
      private var left:BitmapData;
      
      private var var_2895:BitmapData;
      
      private var right:BitmapData;
      
      private var _width:int = 0;
      
      public function class_197(param1:BitmapData, param2:BitmapData, param3:BitmapData)
      {
         super();
         this.left = param1;
         this.var_2895 = param2;
         this.right = param3;
      }
      
      public function name_1152(param1:int) : void
      {
         if(param1 == this._width)
         {
            return;
         }
         this._width = param1;
         this.draw(this._width);
      }
      
      private function draw(param1:int) : void
      {
         graphics.clear();
         if(param1 <= 0)
         {
            return;
         }
         var _loc2_:int = this.left.width;
         var _loc3_:int = this.left.height;
         var _loc4_:int = param1 >> 1;
         var _loc5_:int = 2 * _loc2_;
         if(param1 <= _loc5_)
         {
            graphics.beginBitmapFill(this.left);
            _loc4_ = param1 >> 1;
            graphics.drawRect(0,0,_loc4_,_loc3_);
            var_3031.tx = _loc4_;
            graphics.beginBitmapFill(this.right,var_3031);
            graphics.drawRect(_loc4_,0,param1 - _loc4_,_loc3_);
            graphics.endFill();
         }
         else
         {
            graphics.beginBitmapFill(this.left);
            graphics.drawRect(0,0,_loc2_,_loc3_);
            var_3031.tx = _loc2_;
            _loc4_ = param1 - _loc5_;
            graphics.beginBitmapFill(this.var_2895,var_3031);
            graphics.drawRect(_loc2_,0,_loc4_,_loc3_);
            var_3031.tx = _loc2_ + _loc4_;
            graphics.beginBitmapFill(this.right,var_3031);
            graphics.drawRect(var_3031.tx,0,_loc2_,_loc3_);
            graphics.endFill();
         }
      }
   }
}
