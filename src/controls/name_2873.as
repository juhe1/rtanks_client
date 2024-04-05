package controls
{
   import controls.slider.name_3350;
   import controls.slider.name_3351;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import package_280.name_2872;
   
   public class name_2873 extends Sprite
   {
       
      
      protected var track:name_3350;
      
      protected var thumb:name_3351;
      
      protected var var_3395:int = 30;
      
      protected var var_3398:int;
      
      protected var var_3397:Sprite;
      
      public var _width:int;
      
      protected var var_3393:Number = 0;
      
      protected var var_3394:Number = 100;
      
      protected var _value:Number = 0;
      
      protected var var_3396:Number = 10;
      
      public function name_2873()
      {
         this.track = new name_3350();
         this.thumb = new name_3351();
         super();
         addChild(this.track);
         addChild(this.thumb);
         this.thumb.width = this.var_3395;
         addEventListener(Event.ADDED_TO_STAGE,this.method_2068);
         addEventListener(Event.REMOVED_FROM_STAGE,this.method_3064);
      }
      
      protected function method_3064(param1:Event) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.method_1057);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.method_3062);
      }
      
      protected function method_2068(param1:Event) : void
      {
         this.thumb.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.method_1057);
      }
      
      protected function onMouseDown(param1:MouseEvent) : void
      {
         this.var_3397 = Sprite(param1.currentTarget);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.method_3062);
         this.var_3398 = this.var_3397.mouseX;
      }
      
      protected function method_1057(param1:MouseEvent) : void
      {
         if(param1 != null)
         {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.method_3062);
         }
         this.var_3397 = null;
      }
      
      protected function method_3062(param1:MouseEvent) : void
      {
         var _loc2_:Number = NaN;
         this.thumb.x += this.thumb.mouseX - this.var_3398;
         if(this.thumb.x < 0)
         {
            this.thumb.x = 0;
         }
         if(this.thumb.x > this._width - this.var_3395)
         {
            this.thumb.x = this._width - this.var_3395;
         }
         _loc2_ = this.var_3393 + this.thumb.x * (this.var_3394 - this.var_3393) / (width - this.var_3395);
         this._value = _loc2_;
         dispatchEvent(new name_2872(_loc2_));
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = int(param1);
         this.track.width = this._width;
      }
      
      public function get minValue() : Number
      {
         return this.var_3393;
      }
      
      public function set minValue(param1:Number) : void
      {
         this.var_3393 = param1;
         this.track.minValue = this.var_3393;
      }
      
      public function get maxValue() : Number
      {
         return this.var_3394;
      }
      
      public function set maxValue(param1:Number) : void
      {
         this.var_3394 = param1;
         this.track.maxValue = this.var_3394;
      }
      
      public function get value() : Number
      {
         return this._value;
      }
      
      public function set value(param1:Number) : void
      {
         this._value = param1;
         this.method_3063();
      }
      
      public function get tickInterval() : Number
      {
         return this.var_3396;
      }
      
      public function set tickInterval(param1:Number) : void
      {
         this.var_3396 = param1;
         this.track.tickInterval = this.var_3396;
      }
      
      protected function method_3063() : void
      {
         this.thumb.x = int((this._value - this.var_3393) * (this._width - this.var_3395) / (this.var_3394 - this.var_3393));
      }
   }
}
