package assets.scroller
{
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.Shape;
   
   public class class_203 extends MovieClip
   {
       
      
      private var _height:Number = 30;
      
      private var _width:Number = 14;
      
      public var var_3129:BitmapData;
      
      public var var_3130:BitmapData;
      
      private var top:Shape;
      
      private var bottom:Shape;
      
      public function class_203()
      {
         this.top = new Shape();
         this.bottom = new Shape();
         super();
         this.method_2888();
         this.top.graphics.clear();
         this.top.graphics.beginBitmapFill(this.var_3129);
         this.top.graphics.drawRect(0,0,this._width,1);
         this.top.graphics.endFill();
         this.bottom.graphics.clear();
         this.bottom.graphics.beginBitmapFill(this.var_3129);
         this.bottom.graphics.drawRect(0,0,this._width,1);
         this.bottom.graphics.endFill();
         addChild(this.top);
         addChild(this.bottom);
         this.top.y = -12;
      }
      
      public function method_2888() : void
      {
         this.var_3129 = new name_3094(14,1);
         this.var_3130 = new name_3093(14,1);
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = int(param1);
         this.draw();
      }
      
      override public function set y(param1:Number) : void
      {
         super.y = int(param1);
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      override public function set width(param1:Number) : void
      {
         this.draw();
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      private function draw() : void
      {
         this.bottom.y = this._height + 11;
         graphics.clear();
         graphics.beginBitmapFill(this.var_3130);
         graphics.drawRect(0,-11,this._width,this._height + 22);
         graphics.endFill();
      }
   }
}
