package alternativa.tanks.gui.settings.tabs
{
   import alternativa.tanks.gui.settings.SettingsWindow;
   import fl.containers.ScrollPane;
   import fl.controls.ScrollPolicy;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import forms.name_1139;
   import utils.name_1915;
   
   public class ScrollableSettingsTabView extends SettingsTabView
   {
      
      private static const const_2222:int = 25;
      
      private static const const_2220:int = 5;
      
      public static const const_2217:int = 3;
      
      private static const const_2219:int = 15;
      
      private static const const_2221:int = 5;
      
      private static const const_2218:int = 3;
       
      
      protected var var_2630:ScrollPane;
      
      private var var_2632:Sprite;
      
      private var var_2861:Sprite;
      
      private var _width:int;
      
      private var _height:int;
      
      private var items:Vector.<DisplayObject>;
      
      public function ScrollableSettingsTabView()
      {
         this.items = new Vector.<DisplayObject>();
         super();
         this.var_2632 = new Sprite();
         this.var_2861 = new Sprite();
         this.var_2632.addChild(this.var_2861);
         this.var_2630 = new ScrollPane();
         name_1915.name_2035(this.var_2630);
         this.var_2630.horizontalScrollPolicy = ScrollPolicy.OFF;
         this.var_2630.verticalScrollPolicy = ScrollPolicy.AUTO;
         this.var_2630.source = this.var_2632;
         this.var_2630.update();
         this.var_2630.focusEnabled = false;
         this.var_2630.addEventListener(MouseEvent.MOUSE_WHEEL,onMouseWheel,true);
         addChild(this.var_2630);
      }
      
      private static function onMouseWheel(param1:MouseEvent) : void
      {
         param1.delta *= 3;
      }
      
      protected function addItem(param1:DisplayObject) : void
      {
         this.items.push(param1);
         this.var_2632.addChild(param1);
      }
      
      public function render(param1:int, param2:int) : void
      {
         var _loc3_:DisplayObject = null;
         this._width = param1;
         this._height = param2;
         this.var_2630.y = 5;
         this.var_2630.setSize(param1 + 5,param2 - 5 * 2);
         var _loc4_:int = 0;
         for each(_loc3_ in this.items)
         {
            _loc4_ += _loc3_.height;
         }
         this.method_2690(_loc4_);
         this.var_2630.update();
      }
      
      override public function show() : void
      {
         this.render(SettingsWindow.name_2112,SettingsWindow.const_1650);
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      private function method_2690(param1:int) : void
      {
         this.var_2861.graphics.lineStyle(1,name_1139.name_2012,0);
         this.var_2861.graphics.beginFill(name_1139.name_2012,0);
         this.var_2861.graphics.drawRect(0,0,1,15);
         this.var_2861.graphics.endFill();
         this.var_2861.x = 25;
         this.var_2861.y = param1;
      }
      
      override public function destroy() : void
      {
         this.var_2630.removeEventListener(MouseEvent.MOUSE_WHEEL,onMouseWheel,true);
         this.var_2630 = null;
         super.destroy();
      }
   }
}
