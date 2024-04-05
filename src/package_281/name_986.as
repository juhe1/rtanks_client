package package_281
{
   import controls.DefaultButton;
   import controls.Label;
   import controls.TankInput;
   import controls.name_1922;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.BitmapFilter;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.BlurFilter;
   
   public class name_986 extends Sprite
   {
       
      
      private var text:String;
      
      private var callback:Function;
      
      private var window:name_1922;
      
      private var var_1777:Label;
      
      private var var_1776:TankInput;
      
      private var name_1568:DefaultButton;
      
      private var bg:Sprite;
      
      private var var_1747:Bitmap;
      
      public function name_986(param1:String, param2:Function)
      {
         this.window = new name_1922();
         this.var_1777 = new Label();
         this.var_1776 = new TankInput();
         this.name_1568 = new DefaultButton();
         this.bg = new Sprite();
         this.var_1747 = new Bitmap();
         super();
         this.text = param1;
         this.callback = param2;
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function draw() : void
      {
         addChild(this.bg);
         this.drawBg();
         addChild(this.window);
         this.window.width = 400;
         this.window.height = 115;
         this.window.addChild(this.var_1777);
         this.var_1777.text = this.text;
         this.var_1777.x = 15;
         this.var_1777.y = 15;
         this.window.addChild(this.var_1776);
         this.var_1776.maxChars = 32;
         this.var_1776.x = 15;
         this.var_1776.y = 35;
         this.var_1776.width = this.window.width - 30;
         this.window.addChild(this.name_1568);
         this.name_1568.label = "OK";
         this.name_1568.x = this.window.width - this.name_1568.width - 15;
         this.name_1568.y = 35 * 2;
         this.name_1568.addEventListener(MouseEvent.CLICK,this.method_1957);
      }
      
      private function method_1957(param1:Event) : void
      {
         var _loc2_:String = null;
         _loc2_ = this.var_1776.value;
         if(_loc2_ == null || _loc2_.length != 32 || _loc2_.length > 32)
         {
            this.var_1776.validValue = false;
            return;
         }
         this.var_1776.validValue = true;
         this.callback.call(null,_loc2_);
         this.name_1568.removeEventListener(MouseEvent.CLICK,this.method_1957);
         stage.removeEventListener(Event.RESIZE,this.resize);
         removeChildren(0,numChildren - 1);
      }
      
      private function drawBg() : void
      {
         var _loc1_:BitmapData = null;
         var _loc2_:BitmapFilter = new BlurFilter(5,5,BitmapFilterQuality.HIGH);
         var _loc3_:Array = new Array();
         _loc3_.push(_loc2_);
         _loc1_ = new BitmapData(stage.stageWidth,stage.stageHeight,true,0);
         this.var_1747.visible = false;
         _loc1_.draw(stage);
         this.var_1747.visible = true;
         this.var_1747.filters = _loc3_;
         this.var_1747.bitmapData = _loc1_;
         this.bg.addChild(this.var_1747);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         this.draw();
         stage.addEventListener(Event.RESIZE,this.resize);
         this.resize(null);
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function resize(param1:Event) : void
      {
         this.window.x = stage.stageWidth / 2 - this.window.width / 2;
         this.window.y = stage.stageHeight / 2 - this.window.height / 2;
         this.drawBg();
      }
   }
}
