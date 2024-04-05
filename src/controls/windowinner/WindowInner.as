package controls.windowinner
{
   import assets.windowinner.elemets.name_2742;
   import base.class_122;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   
   public class WindowInner extends class_122
   {
      
      private static const const_2069:Class = name_2747;
      
      private static const const_2064:Class = name_2750;
      
      private static const const_2066:Class = name_2743;
      
      private static const const_2061:Class = name_2746;
      
      private static const const_2068:Class = name_2749;
      
      private static const const_2067:Class = name_2745;
      
      private static const const_2062:Class = name_2751;
      
      private static const const_2065:Class = name_2744;
      
      private static const const_2063:Class = name_2748;
      
      public static const RED:uint = 4284618496;
      
      public static const BLUE:uint = 4278201433;
      
      public static const name_1428:uint = 4278985229;
      
      public static const name_2114:uint = 16744512;
      
      private static var var_2595:BitmapData = new const_2061().bitmapData;
      
      private static var var_2602:BitmapData = new const_2066().bitmapData;
      
      private static var var_2601:BitmapData = new const_2069().bitmapData;
      
      private static var var_2604:BitmapData = new const_2064().bitmapData;
      
      private static var var_2599:BitmapData = new const_2068().bitmapData;
      
      private static var var_2596:BitmapData = new const_2067().bitmapData;
      
      private static var var_2598:BitmapData = new const_2062().bitmapData;
      
      private static var var_2597:BitmapData = new const_2065().bitmapData;
       
      
      private var _width:int;
      
      private var _height:int;
      
      private var bgBMP:BitmapData;
      
      private var var_2594:name_2742;
      
      private var bg:Sprite;
      
      private var top:Bitmap;
      
      private var left:Bitmap;
      
      private var right:Bitmap;
      
      private var bottom:Bitmap;
      
      private var var_2605:Bitmap;
      
      private var var_2606:Bitmap;
      
      private var var_2603:Bitmap;
      
      private var var_2600:Bitmap;
      
      private var var_2607:uint;
      
      public function WindowInner(param1:int = -1, param2:int = -1, param3:uint = 0)
      {
         this.var_2594 = new name_2742();
         this.bg = new Sprite();
         super();
         this._width = param1;
         this._height = param2;
         this.bgBMP = param3 == 100 ? new const_2063().bitmapData : new BitmapData(1,1,true,param3);
         this.method_2068();
         this.draw();
         this.var_2607 = param3;
      }
      
      private function method_2068() : void
      {
         this._width = this._width == -1 ? int(scaleX * 100) : int(this._width);
         this._height = this._height == -1 ? int(scaleY * 100) : int(this._height);
         scaleX = 1;
         scaleY = 1;
         addChild(this.bg);
         this.top = new Bitmap(var_2595);
         addChild(this.top);
         this.bottom = new Bitmap(var_2602);
         addChild(this.bottom);
         this.left = new Bitmap(var_2601);
         addChild(this.left);
         this.right = new Bitmap(var_2604);
         addChild(this.right);
         this.var_2605 = new Bitmap(var_2599);
         addChild(this.var_2605);
         this.var_2606 = new Bitmap(var_2596);
         addChild(this.var_2606);
         this.var_2600 = new Bitmap(var_2598);
         addChild(this.var_2600);
         this.var_2603 = new Bitmap(var_2597);
         addChild(this.var_2603);
      }
      
      private function draw() : void
      {
         var _loc1_:Rectangle = new Rectangle(0,0,this._width - 2,this._height - 2);
         graphics.clear();
         graphics.beginBitmapFill(this.bgBMP);
         graphics.drawRect(1,1,this._width - 2,this._height - 2);
         graphics.endFill();
         this.top.x = 6;
         this.top.y = 0;
         this.top.width = this._width - 12;
         this.bottom.x = 6;
         this.bottom.y = this._height - 6;
         this.bottom.width = this._width - 12;
         this.left.x = 0;
         this.left.y = 6;
         this.left.height = this._height - 12;
         this.right.x = this._width - 6;
         this.right.y = 6;
         this.right.height = this._height - 12;
         this.var_2605.x = 0;
         this.var_2606.x = this._width - 6;
         this.var_2603.y = this.var_2600.y = this._height - 6;
         this.var_2600.x = 0;
         this.var_2603.x = this._width - 6;
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
      
      override public function set width(param1:Number) : void
      {
         this._width = Math.floor(param1);
         this.draw();
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = Math.floor(param1);
         this.draw();
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
   }
}
