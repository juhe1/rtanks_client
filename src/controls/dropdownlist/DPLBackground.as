package controls.dropdownlist
{
   import assets.windowinner.bitmaps.name_2752;
   import assets.windowinner.bitmaps.name_2753;
   import assets.windowinner.bitmaps.name_2754;
   import assets.windowinner.bitmaps.name_2755;
   import assets.windowinner.elemets.WindowInnerBottomLeftCorner;
   import assets.windowinner.elemets.WindowInnerBottomRightCorner;
   import assets.windowinner.elemets.WindowInnerTopLeftCorner;
   import assets.windowinner.elemets.WindowInnerTopRightCorner;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   
   public class DPLBackground extends Sprite
   {
      
      private static const const_2099:Class = name_2781;
      
      protected static var var_2686:BitmapData;
       
      
      private var _width:int = 0;
      
      private var _height:int = 0;
      
      private var var_1390:WindowInnerTopLeftCorner;
      
      private var var_2609:WindowInnerTopRightCorner;
      
      private var var_2610:WindowInnerBottomLeftCorner;
      
      private var var_2608:WindowInnerBottomRightCorner;
      
      private var var_2595:name_2753;
      
      private var var_2602:name_2755;
      
      private var var_2601:name_2754;
      
      private var var_2604:name_2752;
      
      private var bg:Sprite;
      
      private var top:Shape;
      
      private var bottom:Shape;
      
      private var left:Shape;
      
      private var right:Shape;
      
      public function DPLBackground(param1:int, param2:int)
      {
         this.var_1390 = new WindowInnerTopLeftCorner();
         this.var_2609 = new WindowInnerTopRightCorner();
         this.var_2610 = new WindowInnerBottomLeftCorner();
         this.var_2608 = new WindowInnerBottomRightCorner();
         this.var_2595 = new name_2753(0,0);
         this.var_2602 = new name_2755(0,0);
         this.var_2601 = new name_2754(0,0);
         this.var_2604 = new name_2752(0,0);
         this.bg = new Sprite();
         this.top = new Shape();
         this.bottom = new Shape();
         this.left = new Shape();
         this.right = new Shape();
         super();
         this._width = param1;
         this._height = param2;
         addChild(this.bg);
         addChild(this.top);
         addChild(this.bottom);
         addChild(this.left);
         addChild(this.right);
         addChild(this.var_1390);
         addChild(this.var_2609);
         addChild(this.var_2610);
         addChild(this.var_2608);
         this.draw();
      }
      
      protected function get bgBMP() : BitmapData
      {
         if(!var_2686)
         {
            var_2686 = new const_2099().bitmapData;
         }
         return var_2686;
      }
      
      protected function draw() : void
      {
         var _loc1_:Graphics = null;
         _loc1_ = this.bg.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(this.bgBMP);
         _loc1_.drawRect(1,1,this._width - 2,this._height - 2);
         _loc1_.endFill();
         _loc1_ = this.top.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(this.var_2595);
         _loc1_.drawRect(0,0,this._width - 12,6);
         _loc1_.endFill();
         this.top.x = 6;
         _loc1_ = this.bottom.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(this.var_2602);
         _loc1_.drawRect(0,0,this._width - 12,6);
         _loc1_.endFill();
         this.bottom.x = 6;
         this.bottom.y = this._height - 6;
         _loc1_ = this.left.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(this.var_2601);
         _loc1_.drawRect(0,0,6,this._height - 12);
         _loc1_.endFill();
         this.left.x = 0;
         this.left.y = 6;
         _loc1_ = this.right.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(this.var_2604);
         _loc1_.drawRect(0,0,6,this._height - 12);
         _loc1_.endFill();
         this.right.x = this._width - 6;
         this.right.y = 6;
         this.var_1390.x = 0;
         this.var_1390.y = 0;
         this.var_2609.x = this._width - this.var_2609.width;
         this.var_2609.y = 0;
         this.var_2610.x = 0;
         this.var_2610.y = this._height - this.var_2610.height;
         this.var_2608.x = this._width - this.var_2608.width;
         this.var_2608.y = this._height - this.var_2608.height;
      }
      
      override public function set width(param1:Number) : void
      {
         if(this._width == int(param1))
         {
            return;
         }
         this._width = param1;
         this.draw();
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set height(param1:Number) : void
      {
         if(this._height == int(param1))
         {
            return;
         }
         this._height = param1;
         this.draw();
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      public function setSize(param1:int, param2:int) : void
      {
         this._width = param1;
         this._height = param2;
         this.draw();
      }
   }
}
