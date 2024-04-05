package controls
{
   import assets.windowinner.bitmaps.name_2752;
   import assets.windowinner.bitmaps.name_2753;
   import assets.windowinner.bitmaps.name_2754;
   import assets.windowinner.bitmaps.name_2755;
   import assets.windowinner.bitmaps.name_2756;
   import assets.windowinner.bitmaps.name_2757;
   import assets.windowinner.elemets.WindowInnerBottomLeftCorner;
   import assets.windowinner.elemets.WindowInnerBottomRightCorner;
   import assets.windowinner.elemets.WindowInnerTopLeftCorner;
   import assets.windowinner.elemets.WindowInnerTopRightCorner;
   import assets.windowinner.elemets.name_2742;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   
   [Embed(source="/_assets/assets.swf", symbol="controls.name_1891")]
   public class name_1891 extends Sprite
   {
      
      public static const RED:uint = 4284618496;
      
      public static const BLUE:uint = 4278201433;
      
      public static const name_1428:uint = 4278985229;
      
      public static const name_2114:uint = 16744512;
       
      
      private var _width:int;
      
      private var _height:int;
      
      private var var_1390:WindowInnerTopLeftCorner;
      
      private var var_2609:WindowInnerTopRightCorner;
      
      private var var_2610:WindowInnerBottomLeftCorner;
      
      private var var_2608:WindowInnerBottomRightCorner;
      
      private var var_2594:name_2742;
      
      private var bgBMP:BitmapData;
      
      private var var_2595:name_2753;
      
      private var var_2602:name_2755;
      
      private var var_2601:name_2754;
      
      private var var_2604:name_2752;
      
      private var bg:Sprite;
      
      private var top:Shape;
      
      private var bottom:Shape;
      
      private var left:Shape;
      
      private var right:Shape;
      
      private var var_2607:uint;
      
      public function name_1891(param1:int = -1, param2:int = -1, param3:uint = 0)
      {
         this.var_1390 = new WindowInnerTopLeftCorner();
         this.var_2609 = new WindowInnerTopRightCorner();
         this.var_2610 = new WindowInnerBottomLeftCorner();
         this.var_2608 = new WindowInnerBottomRightCorner();
         this.var_2594 = new name_2742();
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
         this.bgBMP = param3 == 0 ? new name_2757(0,0) as BitmapData : new BitmapData(5,5,true,param3);
         this.bgBMP = param3 == 100 ? new name_2756(0,0) as BitmapData : new BitmapData(5,5,true,param3);
         this.method_2068();
         this.draw();
         this.var_2607 = param3;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = Math.floor(param1);
         this.draw();
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = Math.floor(param1);
         this.draw();
      }
      
      private function method_2068() : void
      {
         this._width = this._width == -1 ? int(scaleX * 100) : this._width;
         this._height = this._height == -1 ? int(scaleY * 100) : this._height;
         scaleX = 1;
         scaleY = 1;
         removeChildAt(0);
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
      
      private function draw() : void
      {
         var _loc1_:Rectangle = null;
         _loc1_ = new Rectangle(0,0,this._width - 2,this._height - 2);
         this.bg.graphics.clear();
         this.bg.graphics.beginBitmapFill(this.bgBMP);
         this.bg.graphics.drawRect(1,1,this._width - 2,this._height - 2);
         this.bg.graphics.endFill();
         this.top.graphics.clear();
         this.top.graphics.beginBitmapFill(this.var_2595);
         this.top.graphics.drawRect(0,0,this._width - 12,6);
         this.top.graphics.endFill();
         this.top.x = 6;
         this.bottom.graphics.clear();
         this.bottom.graphics.beginBitmapFill(this.var_2602);
         this.bottom.graphics.drawRect(0,0,this._width - 12,6);
         this.bottom.graphics.endFill();
         this.bottom.x = 6;
         this.bottom.y = this._height - 6;
         this.left.graphics.clear();
         this.left.graphics.beginBitmapFill(this.var_2601);
         this.left.graphics.drawRect(0,0,6,this._height - 12);
         this.left.graphics.endFill();
         this.left.x = 0;
         this.left.y = 6;
         this.right.graphics.clear();
         this.right.graphics.beginBitmapFill(this.var_2604);
         this.right.graphics.drawRect(0,0,6,this._height - 12);
         this.right.graphics.endFill();
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
         this.var_2594.width = this._width - 2;
         this.var_2594.height = 174 * ((this._width - 2) / 310);
         this.bg.scrollRect = _loc1_;
      }
      
      public function set name_1895(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1)
         {
            this.bg.addChild(this.var_2594);
            this.var_2594.x = this.var_2594.y = 1;
            switch(this.var_2607)
            {
               case 4278985229:
                  _loc2_ = 1;
                  break;
               case 4278201433:
                  _loc2_ = 2;
                  break;
               case 4284618496:
                  _loc2_ = 3;
            }
            this.var_2594.gotoAndStop(_loc2_);
         }
      }
   }
}
