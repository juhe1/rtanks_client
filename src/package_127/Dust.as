package package_127
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.PixelSnapping;
   import flash.display.Sprite;
   
   public class Dust extends Sprite
   {
       
      
      private var var_3273:Array;
      
      private var count:int;
      
      private var bottom:Number;
      
      public function Dust(param1:BitmapData, param2:int, param3:Number, param4:Number)
      {
         var _loc5_:Bitmap = null;
         var _loc6_:Number = NaN;
         this.var_3273 = new Array();
         super();
         this.count = param2;
         this.bottom = param4;
         var _loc7_:Number = param3 / param2;
         var _loc8_:int = 0;
         while(_loc8_ < param2)
         {
            _loc5_ = new Bitmap(param1,PixelSnapping.NEVER,true);
            _loc5_.x = _loc8_ * _loc7_;
            _loc5_.y = Math.random() * param3;
            _loc6_ = 0.2 + Math.random();
            _loc5_.scaleX = _loc6_;
            _loc5_.scaleY = _loc6_;
            _loc5_.blendMode = BlendMode.ADD;
            addChild(_loc5_);
            this.var_3273.push(_loc5_);
            _loc8_++;
         }
      }
      
      public function update() : void
      {
         var _loc1_:Bitmap = null;
         var _loc2_:Number = this.bottom / 3;
         var _loc3_:Number = _loc2_ + _loc2_;
         var _loc4_:int = 0;
         while(_loc4_ < this.count)
         {
            _loc1_ = this.var_3273[_loc4_];
            _loc1_.y += 2;
            if(_loc1_.y > this.bottom)
            {
               _loc1_.y = 0;
            }
            if(_loc1_.y < _loc2_)
            {
               _loc1_.alpha = _loc1_.y / _loc2_;
            }
            else if(_loc1_.y < _loc3_)
            {
               _loc1_.alpha = 1;
            }
            else
            {
               _loc1_.alpha = 1 - (_loc1_.y - _loc3_) / _loc2_;
            }
            _loc4_++;
         }
      }
   }
}
