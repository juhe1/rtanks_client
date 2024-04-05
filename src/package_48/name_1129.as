package package_48
{
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public class name_1129
   {
      
      private static var matrix:Matrix = new Matrix();
       
      
      private var maxValue:int;
      
      private var var_1923:int;
      
      private var var_1924:int;
      
      private var var_1925:int;
      
      private var var_1920:int;
      
      private var var_1921:int;
      
      private var skin:name_1128;
      
      private var var_1919:int;
      
      private var var_1922:int;
      
      private var var_274:int;
      
      private var canvas:Shape;
      
      private var x:int;
      
      private var y:int;
      
      private var rect:Rectangle;
      
      public function name_1129(param1:int, param2:int, param3:int, param4:int, param5:name_1128)
      {
         this.canvas = new Shape();
         super();
         this.x = param1;
         this.y = param2;
         this.maxValue = param3;
         this.var_1923 = param4;
         this.name_1146(param5);
         this.rect = new Rectangle(param1,param2,2 * this.var_1924 + param4,this.var_1925);
      }
      
      public function name_1146(param1:name_1128) : void
      {
         this.skin = param1;
         this.var_1919 = param1.name_2353.width;
         this.var_1922 = param1.name_2353.height;
         this.var_1924 = param1.name_2355.width;
         this.var_1925 = param1.var_503.height;
         this.var_1920 = this.var_1924 - this.var_1919;
         this.var_1921 = this.var_1925 - this.var_1922 >> 1;
      }
      
      public function get progress() : int
      {
         return this.var_274;
      }
      
      public function set progress(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         else if(param1 > this.maxValue)
         {
            param1 = this.maxValue;
         }
         this.var_274 = param1;
      }
      
      public function draw(param1:BitmapData) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Graphics = this.canvas.graphics;
         _loc3_.clear();
         _loc3_.beginBitmapFill(this.skin.name_2355);
         _loc3_.drawRect(0,0,this.var_1924,this.var_1925);
         _loc3_.beginBitmapFill(this.skin.var_503);
         _loc3_.drawRect(this.var_1924,0,this.var_1923 - 2 * this.var_1919,this.var_1925);
         _loc3_.beginBitmapFill(this.skin.name_2358);
         _loc3_.drawRect(this.var_1924 + this.var_1923 - 2 * this.var_1919,0,this.var_1924,this.var_1925);
         _loc3_.endFill();
         var _loc4_:int = this.var_1923 * this.var_274 / this.maxValue;
         var _loc5_:int = this.var_1923 - this.var_1919;
         if(_loc4_ >= this.var_1919)
         {
            if(_loc4_ == this.var_1923)
            {
               this.method_2070(_loc3_,this.skin.color,this.skin.name_2354,this.skin.name_2359);
               _loc2_ = _loc4_;
            }
            else
            {
               matrix.tx = this.var_1920;
               matrix.ty = this.var_1921;
               _loc3_.beginBitmapFill(this.skin.name_2354,matrix,false);
               _loc3_.drawRect(this.var_1920,this.var_1921,this.var_1919,this.var_1922);
               if(_loc4_ > this.var_1919)
               {
                  if(_loc4_ > _loc5_)
                  {
                     _loc4_ = _loc5_;
                  }
                  _loc2_ = _loc4_;
                  _loc3_.beginFill(this.skin.color);
                  _loc3_.drawRect(this.var_1920 + this.var_1919,this.var_1921,_loc4_ - this.var_1919,this.var_1922);
               }
               else
               {
                  _loc2_ = this.var_1919;
               }
            }
         }
         if(_loc2_ == 0)
         {
            this.method_2070(_loc3_,this.skin.name_2357,this.skin.name_2353,this.skin.name_2356);
         }
         else if(_loc2_ < this.var_1923)
         {
            _loc3_.beginFill(this.skin.name_2357);
            _loc3_.drawRect(this.var_1920 + _loc2_,this.var_1921,_loc5_ - _loc2_,this.var_1922);
            matrix.tx = this.var_1920 + _loc5_;
            matrix.ty = this.var_1921;
            _loc3_.beginBitmapFill(this.skin.name_2356,matrix,false);
            _loc3_.drawRect(this.var_1920 + _loc5_,this.var_1921,this.var_1919,this.var_1922);
         }
         _loc3_.endFill();
         param1.fillRect(this.rect,0);
         matrix.tx = this.x;
         matrix.ty = this.y;
         param1.draw(this.canvas,matrix);
      }
      
      private function method_2070(param1:Graphics, param2:uint, param3:BitmapData, param4:BitmapData) : void
      {
         var _loc5_:int = this.var_1923 - this.var_1919;
         matrix.tx = this.var_1920;
         matrix.ty = this.var_1921;
         param1.beginBitmapFill(param3,matrix,false);
         param1.drawRect(this.var_1920,this.var_1921,this.var_1919,this.var_1922);
         param1.beginFill(param2);
         param1.drawRect(this.var_1920 + this.var_1919,this.var_1921,_loc5_ - this.var_1919,this.var_1922);
         matrix.tx = this.var_1920 + _loc5_;
         param1.beginBitmapFill(param4,matrix,false);
         param1.drawRect(this.var_1920 + _loc5_,this.var_1921,this.var_1919,this.var_1922);
      }
   }
}
