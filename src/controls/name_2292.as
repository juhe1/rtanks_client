package controls
{
   import flash.display.GradientType;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.text.AntiAliasType;
   import flash.text.GridFitType;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   
   public class name_2292 extends Sprite
   {
       
      
      private var var_503:Shape;
      
      private var bg:name_1891;
      
      private const format:TextFormat = new TextFormat("MyriadPro",12,16777215);
      
      public var name_2291:name_2777;
      
      private var _width:int;
      
      private var _height:int;
      
      public function name_2292()
      {
         this.var_503 = new Shape();
         this.bg = new name_1891(0);
         this.name_2291 = new name_2777();
         super();
         addChild(this.var_503);
         this.var_503.x = this.var_503.y = 1;
         addChild(this.bg);
         addChild(this.name_2291);
         this.name_2291.defaultTextFormat = this.format;
         this.name_2291.antiAliasType = AntiAliasType.ADVANCED;
         this.name_2291.gridFitType = GridFitType.PIXEL;
         this.name_2291.embedFonts = true;
         this.name_2291.sharpness = -250;
         this.name_2291.thickness = -200;
         this.name_2291.x = this.name_2291.y = 5;
         this.name_2291.multiline = true;
         this.name_2291.wordWrap = true;
         this.name_2291.type = TextFieldType.INPUT;
         this.name_2291.selectable = true;
         this.name_2291.autoSize = TextFieldAutoSize.NONE;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = int(param1);
         this.bg.width = this._width;
         this.name_2291.width = this._width - 10;
         this.draw();
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = int(param1);
         this.bg.height = this._height;
         this.name_2291.height = this._height - 10;
         this.draw();
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      public function get text() : String
      {
         return this.name_2291.text;
      }
      
      public function set text(param1:String) : void
      {
         this.name_2291.text = param1;
      }
      
      private function draw() : void
      {
         var _loc1_:Graphics = this.var_503.graphics;
         var _loc2_:Matrix = new Matrix();
         _loc2_.createGradientBox(this._width - 2,this._height - 2,Math.PI * 0.5);
         _loc1_.clear();
         _loc1_.beginGradientFill(GradientType.LINEAR,[0,0],[0.8,0],[0,255],_loc2_);
         _loc1_.drawRect(0,0,this._width - 2,this._height - 2);
         _loc1_.endFill();
      }
      
      public function set maxChars(param1:int) : void
      {
         this.name_2291.maxChars = param1;
      }
   }
}
