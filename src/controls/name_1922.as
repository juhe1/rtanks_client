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
   import base.class_122;
   import flash.display.Shape;
   
   public class name_1922 extends class_122
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
      
      private var bg:Shape;
      
      private var top:Shape;
      
      private var bottom:Shape;
      
      private var left:Shape;
      
      private var right:Shape;
      
      private var var_2635:name_2296;
      
      public var name_2241:String = "en";
      
      private var var_936:int = 0;
      
      public function name_1922(param1:int = -1, param2:int = -1)
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
         this.bg = new Shape();
         this.top = new Shape();
         this.bottom = new Shape();
         this.left = new Shape();
         this.right = new Shape();
         super();
         this._width = param1;
         this._height = param2;
         this.method_2068();
         this.draw();
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
         this._width = this._width == -1 ? int(scaleX * 100) : int(this._width);
         this._height = this._height == -1 ? int(scaleY * 100) : int(this._height);
         scaleX = 1;
         scaleY = 1;
         if(numChildren > 0)
         {
            removeChildAt(0);
         }
         addChild(this.bg);
         addChild(this.top);
         addChild(this.bottom);
         addChild(this.left);
         addChild(this.right);
         addChild(this.var_1390);
         addChild(this.var_2609);
         addChild(this.var_2610);
         addChild(this.var_2608);
      }
      
      public function set header(param1:int) : void
      {
         this.var_936 = param1;
         this.var_2635 = new name_2296(param1,this.name_2241);
         addChild(this.var_2635);
         if(param1 > 23)
         {
            this.var_2635.x = -13;
         }
         else
         {
            this.var_2635.y = -13;
         }
         this.draw();
      }
      
      private function draw() : void
      {
         this.bg.graphics.clear();
         this.bg.graphics.beginBitmapFill(this.bgBMP);
         this.bg.graphics.drawRect(7,7,this._width - 14,this._height - 14);
         this.bg.graphics.endFill();
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
            if(this.var_936 > 23 && this.var_936 < 26)
            {
               this.var_2635.y = int(this._height / 2);
            }
            else
            {
               this.var_2635.x = int(this._width / 2);
               if(this.var_936 >= 26)
               {
                  this.var_2635.y = -13;
               }
            }
         }
      }
   }
}
