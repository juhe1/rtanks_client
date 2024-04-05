package package_127
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.PixelSnapping;
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   
   public class Stars extends Sprite
   {
       
      
      private var stars:Array;
      
      private var count:int;
      
      private var radius:Number;
      
      public function Stars(param1:BitmapData, param2:BitmapData, param3:int, param4:Number)
      {
         var _loc5_:Sprite = null;
         var _loc6_:Number = NaN;
         _loc5_ = null;
         _loc6_ = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         this.stars = new Array();
         super();
         this.count = param3;
         this.radius = param4;
         var _loc9_:int = 0;
         while(_loc9_ < param3)
         {
            _loc5_ = new Sprite();
            _loc5_.addChild(new Bitmap(param1,PixelSnapping.NEVER,true));
            _loc5_.addChild(new Bitmap(param2,PixelSnapping.NEVER,true));
            _loc6_ = 0.4 + Math.random();
            _loc5_.getChildAt(0).scaleX = _loc6_;
            _loc5_.getChildAt(0).scaleY = _loc6_;
            _loc5_.getChildAt(0).x = -_loc5_.getChildAt(0).width / 2;
            _loc5_.getChildAt(0).y = -_loc5_.getChildAt(0).height / 2;
            _loc5_.getChildAt(0).blendMode = BlendMode.ADD;
            _loc5_.getChildAt(1).scaleX = _loc6_;
            _loc5_.getChildAt(1).scaleY = _loc6_;
            _loc5_.getChildAt(1).x = -_loc5_.getChildAt(1).width / 2;
            _loc5_.getChildAt(1).y = -_loc5_.getChildAt(1).height / 2;
            addChild(_loc5_);
            this.stars.push(_loc5_);
            _loc7_ = Math.random() * Math.PI * 2;
            _loc8_ = param4 / 3 + Math.random() * param4 * 2 / 3;
            _loc5_.x = Math.cos(_loc7_) * _loc8_;
            _loc5_.y = Math.sin(_loc7_) * _loc8_;
            if(_loc9_ == 0)
            {
               _loc5_.x = 0;
               _loc5_.y = 0;
            }
            _loc5_.rotation = Math.random() * 180;
            _loc9_++;
         }
      }
      
      public function update() : void
      {
         var _loc3_:Sprite = null;
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         _loc3_ = null;
         var _loc4_:int = 0;
         while(_loc4_ < this.count)
         {
            _loc3_ = this.stars[_loc4_];
            _loc3_.rotation += 2;
            if(_loc3_.rotation > 180)
            {
               _loc3_.rotation = 0;
            }
            if(_loc3_.rotation < 90)
            {
               _loc1_ = _loc3_.rotation / 90;
            }
            else
            {
               _loc1_ = 1 - (_loc3_.rotation - 90) / 90;
            }
            _loc2_ = 0.2 + 0.8 * _loc1_;
            _loc3_.alpha = _loc1_;
            _loc3_.scaleX = _loc2_;
            _loc3_.scaleY = _loc2_;
            _loc4_++;
         }
      }
      
      public function name_1332(param1:ColorTransform) : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.count)
         {
            _loc2_ = this.stars[_loc3_];
            _loc2_.getChildAt(0).transform.colorTransform = param1;
            _loc3_++;
         }
      }
   }
}
