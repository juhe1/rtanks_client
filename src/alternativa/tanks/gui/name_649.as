package alternativa.tanks.gui
{
   import base.class_122;
   import flash.display.Stage;
   import flash.events.Event;
   import forms.name_1838;
   import package_12.name_24;
   
   public class name_649 extends class_122
   {
      
      public static var display:name_24;
       
      
      protected var var_1169:name_1838;
      
      private var _width:Number;
      
      private var _height:Number;
      
      public function name_649()
      {
         super();
         if(!display.systemLayer.contains(this))
         {
            display.systemLayer.addChild(this);
         }
         this.setEventListeners();
      }
      
      public function onResize(param1:Event = null) : void
      {
         var _loc2_:Stage = display.stage;
         var _loc3_:int = int(Math.max(960,_loc2_.stageWidth));
         this.var_1169.x = Math.round(_loc3_ / 3);
         this.var_1169.y = 60;
         this._width = Math.round(_loc3_ * 2 / 3);
         this._height = Math.max(display.stage.stageHeight - 60,530);
         this.var_1169.width = this._width;
      }
      
      public function destroy() : void
      {
         this.removeEventListeners();
         if(this.var_1169 != null)
         {
            removeChild(this.var_1169);
         }
         this.var_1169 = null;
         if(display.systemLayer.contains(this))
         {
            display.systemLayer.removeChild(this);
         }
      }
      
      private function setEventListeners() : void
      {
         display.stage.addEventListener(Event.RESIZE,this.onResize);
      }
      
      private function removeEventListeners() : void
      {
         display.stage.removeEventListener(Event.RESIZE,this.onResize);
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = param1;
         this.onResize();
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = param1;
         this.onResize();
      }
   }
}
