package package_292
{
   import alternativa.tanks.models.dom.Point;
   import controls.Label;
   import controls.resultassets.name_2332;
   import flash.display.Shape;
   import flash.display.Sprite;
   
   public class KeyPointsHUDPanel extends Sprite
   {
      
      private static const const_1706:int = 1;
       
      
      private var var_81:Shape;
      
      private var var_270:Vector.<name_2331>;
      
      private var _width:int;
      
      private var _height:int;
      
      public function KeyPointsHUDPanel(param1:Vector.<Point>)
      {
         this.var_81 = new Shape();
         super();
         this.method_2057(param1);
         this.method_2060(param1.length);
         addChild(this.var_81);
         this.method_2058();
      }
      
      public function removeFromParent() : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function method_2058() : void
      {
         var _loc1_:name_2331 = null;
         for each(_loc1_ in this.var_270)
         {
            addChild(_loc1_.name_2075());
         }
      }
      
      public function render(param1:int, param2:int) : void
      {
         this.update();
      }
      
      public function update() : void
      {
         var _loc1_:name_2331 = null;
         for each(_loc1_ in this.var_270)
         {
            _loc1_.update();
         }
      }
      
      private function method_2057(param1:Vector.<Point>) : void
      {
         var _loc5_:Vector.<Point> = null;
         var _loc7_:int = 0;
         var _loc2_:Point = null;
         var _loc3_:name_2331 = null;
         var _loc4_:Label = null;
         _loc5_ = this.method_2059(param1);
         var _loc6_:int = 2;
         this.var_270 = new Vector.<name_2331>(param1.length);
         _loc7_ = 0;
         while(_loc7_ < _loc5_.length)
         {
            _loc2_ = _loc5_[_loc7_];
            _loc3_ = new name_2331(_loc2_);
            _loc3_.x = _loc6_;
            _loc3_.y = 2;
            addChild(_loc3_);
            _loc4_ = _loc3_.name_2075();
            _loc4_.y = 8;
            _loc4_.x = int(_loc3_.x + (_loc3_.width - _loc4_.width) / 2);
            if(_loc7_ < _loc5_.length - 1)
            {
               this.var_81.graphics.lineStyle(0,16777215);
               this.var_81.graphics.moveTo(_loc3_.x + 36,2);
               this.var_81.graphics.lineTo(_loc3_.x + 36,38);
            }
            this.var_270[_loc7_] = _loc3_;
            _loc6_ += _loc3_.width + 1;
            _loc7_++;
         }
      }
      
      private function method_2059(param1:Vector.<Point>) : Vector.<Point>
      {
         var points:Vector.<Point> = param1;
         return points.concat().sort(function(param1:Point, param2:Point):Number
         {
            if(param1.id < param2.id)
            {
               return -1;
            }
            if(param1.id > param2.id)
            {
               return 1;
            }
            return 0;
         });
      }
      
      private function method_2060(param1:int) : void
      {
         var _loc2_:name_2332 = new name_2332();
         _loc2_.width = param1 * (36 + 1) - 1 + 4;
         addChild(_loc2_);
         this._width = _loc2_.width;
         this._height = _loc2_.height;
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
   }
}
