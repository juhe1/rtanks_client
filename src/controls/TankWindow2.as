package controls
{
   import assets.window.bitmaps.name_2767;
   import assets.window.bitmaps.name_2768;
   import assets.window.bitmaps.name_2769;
   import assets.window.bitmaps.name_2770;
   import assets.window.bitmaps.name_2771;
   import assets.window.elemets.WindowBottomLeftCorner;
   import assets.window.elemets.WindowBottomRightCorner;
   import assets.window.elemets.WindowTopLeftCorner;
   import assets.window.elemets.WindowTopRightCorner;
   import flash.display.Bitmap;
   import flash.display.Shape;
   import flash.display.Sprite;
   import package_443.BackgroundHeader;
   
   public class TankWindow2 extends Sprite
   {
       
      
      private var _width:int;
      
      private var _height:int;
      
      private var var_1390:WindowTopLeftCorner;
      
      private var var_2609:WindowTopRightCorner;
      
      private var var_2610:WindowBottomLeftCorner;
      
      private var var_2608:WindowBottomRightCorner;
      
      private var bgBMP:name_2771;
      
      private var var_2595:name_2768;
      
      private var var_2602:name_2767;
      
      private var var_2601:name_2770;
      
      private var var_2604:name_2769;
      
      public var bg:Sprite;
      
      public var bg1:Sprite;
      
      public var bg2:Sprite;
      
      public var bg3:Sprite;
      
      private var top:Shape;
      
      private var bottom:Shape;
      
      private var left:Shape;
      
      private var right:Shape;
      
      private var var_2635:Bitmap;
      
      private var label:Label;
      
      private var var_936:int = 0;
      
      public function TankWindow2(param1:int = -1, param2:int = -1)
      {
         this.var_1390 = new WindowTopLeftCorner();
         this.var_2609 = new WindowTopRightCorner();
         this.var_2610 = new WindowBottomLeftCorner();
         this.var_2608 = new WindowBottomRightCorner();
         this.bgBMP = new name_2771(0,0);
         this.var_2595 = new name_2768(0,0);
         this.var_2602 = new name_2767(0,0);
         this.var_2601 = new name_2770(0,0);
         this.var_2604 = new name_2769(0,0);
         this.bg = new Sprite();
         this.bg1 = new Sprite();
         this.bg2 = new Sprite();
         this.bg3 = new Sprite();
         this.top = new Shape();
         this.bottom = new Shape();
         this.left = new Shape();
         this.right = new Shape();
         super();
         this._width = param1;
         this._height = param2;
         this.method_2068();
         this.draw();
         this.label = new Label();
         this.label.size = 16;
         this.label.color = 12632256;
         this.label.sharpness = 40;
         this.label.thickness = 70;
         this.label.bold = true;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = int(param1);
         this.draw();
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = int(param1);
         this.draw();
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      private function method_2068() : void
      {
         this._width = this._width == -1 ? int(scaleX * 100) : this._width;
         this._height = this._height == -1 ? int(scaleY * 100) : this._height;
         scaleX = 1;
         scaleY = 1;
         addChild(this.bg);
         addChild(this.bg1);
         addChild(this.bg3);
         addChild(this.bg2);
         addChild(this.top);
         addChild(this.bottom);
         addChild(this.left);
         addChild(this.right);
         addChild(this.var_1390);
         addChild(this.var_2609);
         addChild(this.var_2610);
         addChild(this.var_2608);
      }
      
      public function set header(param1:String) : void
      {
         this.label.text = param1;
         if(this.label.width > this.label.height)
         {
            if(this.label.width + 2 * 11 < BackgroundHeader.name_2719.width)
            {
               this.var_2635 = new Bitmap(BackgroundHeader.name_2719);
            }
            else
            {
               this.var_2635 = new Bitmap(BackgroundHeader.name_2721);
            }
         }
         else
         {
            this.var_2635 = new Bitmap(BackgroundHeader.name_2720);
         }
         addChild(this.var_2635);
         addChild(this.label);
         this.draw();
      }
      
      private function draw() : void
      {
         this.bg.graphics.clear();
         this.bg.graphics.beginBitmapFill(this.bgBMP);
         this.bg.graphics.drawRect(7,7,this._width - 14,7);
         this.bg.graphics.endFill();
         this.bg1.graphics.clear();
         this.bg1.graphics.beginBitmapFill(this.bgBMP);
         this.bg1.graphics.drawRect(7,7,7,this._height - 14);
         this.bg1.graphics.endFill();
         this.bg2.graphics.clear();
         this.bg2.graphics.beginBitmapFill(this.bgBMP);
         this.bg2.graphics.drawRect(this._width - 14,7,7,this._height - 14);
         this.bg2.graphics.endFill();
         this.bg3.graphics.clear();
         this.bg3.graphics.beginBitmapFill(this.bgBMP);
         this.bg3.graphics.drawRect(7,this._height - 14,this._width - 14,7);
         this.bg3.graphics.endFill();
         this.top.graphics.clear();
         this.top.graphics.beginBitmapFill(this.var_2595);
         this.top.graphics.drawRect(0,0,this._width - 22,11);
         this.top.graphics.endFill();
         this.top.x = 11;
         this.bottom.graphics.clear();
         this.bottom.graphics.beginBitmapFill(this.var_2602);
         this.bottom.graphics.drawRect(0,0,this._width - 22,11);
         this.bottom.graphics.endFill();
         this.bottom.x = 11;
         this.bottom.y = this._height - 11;
         this.left.graphics.clear();
         this.left.graphics.beginBitmapFill(this.var_2601);
         this.left.graphics.drawRect(0,0,11,this._height - 22);
         this.left.graphics.endFill();
         this.left.x = 0;
         this.left.y = 11;
         this.right.graphics.clear();
         this.right.graphics.beginBitmapFill(this.var_2604);
         this.right.graphics.drawRect(0,0,11,this._height - 22);
         this.right.graphics.endFill();
         this.right.x = this._width - 11;
         this.right.y = 11;
         this.var_1390.x = 0;
         this.var_1390.y = 0;
         this.var_2609.x = this._width - this.var_2609.width;
         this.var_2609.y = 0;
         this.var_2610.x = 0;
         this.var_2610.y = this._height - this.var_2610.height;
         this.var_2608.x = this._width - this.var_2608.width;
         this.var_2608.y = this._height - this.var_2608.height;
         if(this.var_2635 != null)
         {
            if(this.label.width > this.label.height)
            {
               this.var_2635.x = this._width - this.var_2635.width >> 1;
               this.var_2635.y = -25;
               this.label.x = this._width - this.label.width >> 1;
               this.label.y = 5 - (22 + this.label.height >> 1);
            }
            else
            {
               this.var_2635.x = -25;
               this.var_2635.y = this._height - this.var_2635.height >> 1;
               this.label.x = 5 - (22 + this.label.width >> 1);
               this.label.y = this._height - this.label.height >> 1;
            }
         }
      }
   }
}
