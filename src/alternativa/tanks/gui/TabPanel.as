package alternativa.tanks.gui
{
   import base.class_122;
   import controls.base.name_1940;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   
   public class TabPanel extends class_122
   {
      
      private static const const_423:int = 100;
      
      private static const const_1530:int = 30;
      
      private static const const_422:int = 11;
      
      public static const LEFT:String = "LEFT";
      
      public static const RIGHT:String = "RIGHT";
       
      
      private var var_2574:Dictionary;
      
      private var selected:name_1940;
      
      private var var_2573:class_122;
      
      private var var_2572:class_122;
      
      private var var_2575:int;
      
      private var _width:int;
      
      private var _height:int;
      
      private var var_2576:String;
      
      public function TabPanel(param1:String = "LEFT")
      {
         this.var_2574 = new Dictionary();
         this.var_2573 = new class_122();
         this.var_2572 = new class_122();
         super();
         this.var_2576 = param1;
         addChild(this.var_2573);
         addChild(this.var_2572);
         addEventListener(Event.ADDED_TO_STAGE,this.method_1436);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
      }
      
      private function method_1436(param1:Event) : void
      {
         stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize();
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         stage.removeEventListener(Event.RESIZE,this.onResize);
      }
      
      public function onResize(param1:Event = null) : void
      {
         var _loc2_:name_1940 = null;
         var _loc3_:int = 0;
         var _loc4_:* = undefined;
         this.var_2575 = this.width / (11 + 100);
         var _loc5_:int = 0;
         while(_loc5_ < this.var_2573.numChildren)
         {
            _loc2_ = name_1940(this.var_2573.getChildAt(_loc5_));
            _loc2_.width = 100;
            _loc3_ = 11;
            if(_loc5_ + 1 > this.var_2575)
            {
               _loc3_ = 2 * 11 + _loc2_.height;
            }
            if(this.var_2576 == "LEFT")
            {
               _loc2_.x = 11 + _loc5_ % this.var_2575 * (_loc2_.width + 11);
            }
            else
            {
               _loc2_.x = this.width - _loc2_.width - 11 - _loc5_ % this.var_2575 * (_loc2_.width + 11);
            }
            _loc2_.y = _loc3_;
            _loc5_++;
         }
         this.var_2572.y = 30 + 2 * 11;
         if(this.selected != null)
         {
            _loc4_ = this.var_2574[this.selected];
            _loc4_.width = this.width;
            _loc4_.height = this.height - (30 + 2 * 11);
         }
      }
      
      public function name_1876(param1:String, param2:class_122, param3:Class) : Object
      {
         var _loc4_:name_1940 = new param3();
         _loc4_.label = param1;
         _loc4_.width = 100;
         _loc4_.addEventListener(MouseEvent.CLICK,this.method_2553);
         this.var_2573.addChild(_loc4_);
         this.var_2574[_loc4_] = param2;
         this.onResize();
         return _loc4_;
      }
      
      public function name_1879(param1:int) : void
      {
         this.method_1322(name_1940(this.var_2573.getChildAt(param1)));
      }
      
      private function method_1322(param1:name_1940) : void
      {
         if(this.selected != null)
         {
            this.selected.enable = true;
            this.var_2572.removeChild(this.var_2574[this.selected]);
         }
         param1.enable = false;
         var _loc2_:class_122 = this.var_2574[param1];
         this.var_2572.addChild(_loc2_);
         this.selected = param1;
         this.onResize();
      }
      
      private function method_2553(param1:MouseEvent) : void
      {
         var _loc2_:name_1940 = name_1940(param1.currentTarget);
         this.method_1322(_loc2_);
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
      
      public function destroy() : void
      {
         var _loc1_:class_122 = this.var_2574[this.selected];
         if(this.var_2572.contains(_loc1_))
         {
            this.var_2572.removeChild(_loc1_);
         }
         if(this.var_2572 != null && contains(this.var_2572))
         {
            removeChild(this.var_2572);
         }
         if(this.var_2573 != null && contains(this.var_2573))
         {
            removeChild(this.var_2573);
         }
         _loc1_ = null;
      }
   }
}
