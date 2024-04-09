package alternativa.tanks.model.shop
{
   import controls.TankWindowInner;
   import fl.containers.ScrollPane;
   import fl.controls.ScrollPolicy;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import forms.name_1139;
   import utils.ScrollStyleUtils;
   
   public class ShopCategorysView extends Sprite
   {
      
      private static const const_2357:int = 20;
      
      private static const const_2222:int = 25;
      
      private static const const_2220:int = 5;
      
      private static const const_2219:int = 15;
      
      private static const const_2221:int = 5;
      
      private static const const_2218:int = 3;
       
      
      private var var_2630:ScrollPane;
      
      private var var_2632:Sprite;
      
      private var var_2861:Sprite;
      
      private var var_1182:TankWindowInner;
      
      private var var_3440:Vector.<name_2907>;
      
      private var categories:Dictionary;
      
      private var _width:int;
      
      private var _height:int;
      
      public function ShopCategorysView()
      {
         super();
         this.categories = new Dictionary();
         this.var_3440 = new Vector.<name_2907>();
         this.var_1182 = new TankWindowInner(0,0,TankWindowInner.GREEN);
         addChild(this.var_1182);
         this.var_2632 = new Sprite();
         this.var_2861 = new Sprite();
         this.var_2632.addChild(this.var_2861);
         this.var_2630 = new ScrollPane();
         ScrollStyleUtils.setGreenStyle(this.var_2630);
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
      
      public function render(param1:int, param2:int) : void
      {
         var _loc3_:name_2907 = null;
         _loc3_ = null;
         _loc3_ = null;
         this._width = param1;
         this._height = param2;
         this.var_2630.y = 5;
         this.var_2630.setSize(param1 + 5,param2 - 5 * 2);
         this.var_1182.width = param1;
         this.var_1182.height = param2;
         var _loc4_:int = -12;
         for each(_loc3_ in this.var_3440)
         {
            _loc3_.x = 25;
            _loc3_.render(this._width - 25 * 2 - (this.var_2630.verticalScrollBar.width - 5 - 1));
            _loc3_.y = _loc4_ + 20;
            _loc4_ = _loc3_.y + _loc3_.height;
         }
         this.method_2690(_loc4_);
         this.var_2630.update();
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
      
      public function name_2251(param1:name_2907) : void
      {
         this.categories[param1.var_3430] = param1;
         this.var_3440.push(param1);
         this.var_2632.addChild(param1);
      }
      
      public function addItem(param1:String, param2:class_214) : void
      {
         name_2907(this.categories[param1]).addItem(param2);
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      public function destroy() : void
      {
         var _loc1_:name_2907 = null;
         for each(_loc1_ in this.categories)
         {
            _loc1_.destroy();
         }
         this.categories = null;
         this.var_3440 = null;
         this.var_2630.removeEventListener(MouseEvent.MOUSE_WHEEL,onMouseWheel,true);
         this.var_2630 = null;
      }
   }
}
