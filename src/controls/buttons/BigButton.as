package controls.buttons
{
   import controls.Label;
   import controls.buttons.h50px.class_180;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class BigButton extends class_180
   {
       
      
      protected var var_2222:Label;
      
      protected var _icon:Bitmap;
      
      protected var _width:int = 100;
      
      public function BigButton()
      {
         this.var_2222 = new Label();
         this._icon = new Bitmap();
         super();
         this.configUI();
         enabled = true;
         tabEnabled = false;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = int(param1);
         super.width = this._width;
         this.var_2222.width = this._width - 4;
         if(this._icon.bitmapData != null)
         {
            this._icon.x = this._width - this._icon.width - 6;
            this._icon.y = int(25 - this._icon.height / 2);
            _label.width = this._width - 4 - this._icon.width;
         }
      }
      
      public function set info(param1:String) : void
      {
         this.var_2222.htmlText = param1;
      }
      
      public function set enable(param1:Boolean) : void
      {
      }
      
      public function get enable() : Boolean
      {
         return false;
      }
      
      public function method_2297() : void
      {
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.size = 16;
         _label.defaultTextFormat = _loc1_;
         _label.setTextFormat(_loc1_);
         method_1963 = 14;
      }
      
      public function set icon(param1:BitmapData) : void
      {
         if(param1 != null)
         {
            this._icon.visible = true;
            _label.width = this._width - 4 - this._icon.width;
         }
         else
         {
            _label.width = this._width - 4;
            this._icon.visible = false;
         }
         this._icon.bitmapData = param1;
         this.width = this._width;
      }
      
      private function configUI() : void
      {
         addChild(this._icon);
         this.var_2222.align = TextFormatAlign.CENTER;
         this.var_2222.autoSize = TextFieldAutoSize.NONE;
         this.var_2222.selectable = false;
         this.var_2222.x = 2;
         this.var_2222.y = 24;
         this.var_2222.height = 20;
         this.var_2222.mouseEnabled = false;
         this.var_2222.filters = [new DropShadowFilter(1,45,0,0.7,1,1,1)];
         this.width = 120;
      }
      
      override protected function method_1960() : void
      {
         super.method_1960();
         var _loc1_:int = method_1174() == name_2255.DOWN ? int(1) : int(0);
         this.var_2222.y = 24 + _loc1_;
         this._icon.y = int(25 - this._icon.height / 2) + _loc1_;
      }
   }
}
