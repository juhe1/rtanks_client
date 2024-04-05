package package_470
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   
   public class name_3309 extends Sprite
   {
       
      
      private var var_3642:Bitmap;
      
      private var var_3646:Bitmap;
      
      private var var_3644:Bitmap;
      
      private var var_3643:Bitmap;
      
      private var var_3650:Bitmap;
      
      private var var_3648:Bitmap;
      
      private var var_3645:Bitmap;
      
      private var var_3649:Bitmap;
      
      private var var_3647:Bitmap;
      
      private var _width:int;
      
      private var _height:int;
      
      public function name_3309(param1:int, param2:int)
      {
         super();
         this._width = param1;
         this._height = param2;
         this.method_3265();
         this.method_3263();
         this.method_3266();
         this.method_3264();
         this.drawBackground();
         this.method_3262();
      }
      
      private function method_3265() : void
      {
         this.var_3642 = new Bitmap(GreenPanelBitmaps.name_3566);
         addChild(this.var_3642);
         this.var_3646 = new Bitmap(GreenPanelBitmaps.name_3572);
         addChild(this.var_3646);
         this.var_3644 = new Bitmap(GreenPanelBitmaps.name_3567);
         addChild(this.var_3644);
      }
      
      private function method_3263() : void
      {
         this.var_3643 = new Bitmap(GreenPanelBitmaps.name_3565);
         addChild(this.var_3643);
         this.var_3650 = new Bitmap(GreenPanelBitmaps.name_3568);
         addChild(this.var_3650);
         this.var_3648 = new Bitmap(GreenPanelBitmaps.name_3571);
         addChild(this.var_3648);
      }
      
      private function method_3266() : void
      {
         this.var_3645 = new Bitmap(GreenPanelBitmaps.name_3573);
         addChild(this.var_3645);
      }
      
      private function method_3264() : void
      {
         this.var_3649 = new Bitmap(GreenPanelBitmaps.name_3570);
         addChild(this.var_3649);
      }
      
      private function drawBackground() : void
      {
         this.var_3647 = new Bitmap(GreenPanelBitmaps.name_3569);
         addChild(this.var_3647);
      }
      
      private function method_3262() : void
      {
         this.var_3646.x = this.var_3642.width;
         this.var_3644.x = this._width - this.var_3644.width;
         this.var_3646.width = this.var_3644.x - this.var_3646.x;
         this.var_3643.y = this._height - this.var_3643.height;
         this.var_3650.y = this.var_3643.y;
         this.var_3650.x = this.var_3643.width;
         this.var_3650.width = this.var_3646.width;
         this.var_3648.y = this.var_3643.y;
         this.var_3648.x = this.var_3644.x;
         this.var_3645.y = this.var_3642.height;
         this.var_3645.height = this._height - this.var_3642.height - this.var_3643.height;
         this.var_3649.y = this.var_3645.y;
         this.var_3649.x = this.var_3648.x;
         this.var_3649.height = this.var_3645.height;
         this.var_3647.y = this.var_3642.height + this.var_3642.y;
         this.var_3647.x = this.var_3642.width;
         this.var_3647.height = this._height - this.var_3643.height - this.var_3642.height;
         this.var_3647.width = this._width - this.var_3642.width - this.var_3644.width;
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = param1;
         this.method_3262();
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = param1;
         this.method_3262();
      }
   }
}
