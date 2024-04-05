package controls.cellrenderer
{
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   
   public class name_1932 extends Sprite
   {
       
      
      public const l:Shape = new Shape();
      
      public const c:Shape = new Shape();
      
      public const const_1653:Shape = new Shape();
      
      public var name_1933:BitmapData;
      
      public var name_1934:BitmapData;
      
      public var name_1935:BitmapData;
      
      public var _width:int;
      
      public function name_1932()
      {
         this.name_1933 = new BitmapData(1,1);
         this.name_1934 = new BitmapData(1,1);
         this.name_1935 = new BitmapData(1,1);
         super();
         addChild(this.l);
         addChild(this.c);
         addChild(this.const_1653);
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = int(param1);
         this.draw();
      }
      
      public function draw() : void
      {
         var _loc1_:Graphics = null;
         _loc1_ = this.l.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(this.name_1933);
         _loc1_.drawRect(0,0,7,30);
         _loc1_.endFill();
         this.l.x = 0;
         this.l.y = 0;
         _loc1_ = this.c.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(this.name_1934);
         _loc1_.drawRect(0,0,this._width - 14,30);
         _loc1_.endFill();
         this.c.x = 7;
         this.c.y = 0;
         _loc1_ = this.const_1653.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(this.name_1935);
         _loc1_.drawRect(0,0,7,30);
         _loc1_.endFill();
         this.const_1653.x = this._width - 7;
         this.const_1653.y = 0;
      }
   }
}
