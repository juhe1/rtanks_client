package assets.scroller
{
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   
   public class class_199 extends MovieClip
   {
       
      
      private var _height:Number = 30;
      
      private var _width:Number = 15;
      
      public var var_3113:BitmapData;
      
      public function class_199()
      {
         super();
         this.method_2888();
         graphics.clear();
         graphics.beginBitmapFill(this.var_3113);
         graphics.drawRect(0,0,15,3);
         graphics.endFill();
      }
      
      public function method_2888() : void
      {
         this.var_3113 = new name_3077(15,3);
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
      
      override public function set width(param1:Number) : void
      {
         this._height = int(param1);
         this.draw();
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      private function draw() : void
      {
         graphics.clear();
         graphics.beginBitmapFill(this.var_3113);
         graphics.drawRect(0,0,this._width,this._height);
         graphics.endFill();
      }
   }
}
