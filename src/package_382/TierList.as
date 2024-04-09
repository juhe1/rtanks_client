package package_382
{
   import controls.TankWindowInner;
   import fl.controls.ScrollBarDirection;
   import fl.controls.TileList;
   import fl.data.DataProvider;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.system.Capabilities;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import forms.name_1919;
   import package_104.name_327;
   import utils.ScrollStyleUtils;
   
   public class TierList extends TankWindowInner
   {
      
      public static const const_2800:int = 0;
      
      public static const const_2802:int = 1;
      
      public static const const_2801:int = 2;
      
      private static const const_2799:Number = 70;
      
      private static const const_2473:Number = 7;
      
      private static const const_2474:Number = 3;
       
      
      private var list:TileList;
      
      private var var_3174:Number;
      
      private var var_3628:Number;
      
      private var var_3175:Number;
      
      private var var_3178:int;
      
      private var var_3172:int;
      
      private var currentTime:int;
      
      private var var_3171:Number = 0;
      
      private var var_3627:Timer;
      
      public function TierList()
      {
         this.list = new TileList();
         super(0,0,4278985229);
         this.list.x = 3;
         this.list.y = 3;
         this.list.rowCount = 1;
         this.list.rowHeight = 323;
         this.list.columnWidth = 196;
         this.list.focusEnabled = false;
         this.list.horizontalScrollBar.focusEnabled = false;
         this.list.direction = ScrollBarDirection.HORIZONTAL;
         this.list.setStyle(name_1919.name_1920,TierRenderer);
         this.list.dataProvider = new DataProvider();
         ScrollStyleUtils.setGreenStyle(this.list);
         addChild(this.list);
         addEventListener(Event.ADDED_TO_STAGE,this.method_1472);
         addEventListener(Event.REMOVED_FROM_STAGE,this.method_91);
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = Math.ceil(param1);
         this.list.width = width - 5;
      }
      
      override public function set height(param1:Number) : void
      {
         super.height = Math.ceil(param1);
         this.list.height = height + 2;
      }
      
      public function name_3304(param1:Vector.<name_327>, param2:int, param3:int) : void
      {
         var _loc4_:Object = null;
         this.list.dataProvider.removeAll();
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            _loc4_ = new Object();
            _loc4_.number = _loc5_ + 1;
            _loc4_.tier = param1[_loc5_];
            if(_loc5_ < param2)
            {
               _loc4_.state = 2;
            }
            else if(_loc5_ == param2)
            {
               _loc4_.state = 1;
               _loc4_.progress = param3;
               this.stopTimer();
               this.var_3627 = new Timer(800);
               _loc4_.timer = this.var_3627;
            }
            else
            {
               _loc4_.state = 0;
            }
            this.list.dataProvider.addItem(_loc4_);
            _loc5_++;
         }
         this.list.scrollToIndex(Math.min(param2,param1.length - 1));
      }
      
      private function stopTimer() : *
      {
         if(this.var_3627 != null)
         {
            this.var_3627.stop();
            this.var_3627 = null;
         }
      }
      
      private function method_2936(param1:MouseEvent) : void
      {
         this.list.horizontalScrollPosition -= param1.delta * (Boolean(Capabilities.os.search("Linux") != -1) ? 50 : 10);
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.var_3171 = 0;
         var _loc2_:Rectangle = this.list.horizontalScrollBar.getBounds(stage);
         _loc2_.top -= 3;
         if(!_loc2_.contains(param1.stageX,param1.stageY))
         {
            this.var_3175 = 0;
            this.var_3174 = this.var_3628 = param1.stageX;
            this.currentTime = this.var_3172 = getTimer();
            this.var_3178 = this.list.selectedIndex;
            stage.addEventListener(MouseEvent.MOUSE_UP,this.method_1057);
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function method_1057(param1:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.method_1057);
         var _loc2_:Number = (getTimer() - this.var_3172) / 1000;
         if(_loc2_ == 0)
         {
            _loc2_ = 0.1;
         }
         var _loc3_:Number = param1.stageX - this.var_3174;
         this.var_3171 = _loc3_ / _loc2_;
         this.var_3172 = this.currentTime;
         this.currentTime = getTimer();
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         this.var_3172 = this.currentTime;
         this.currentTime = getTimer();
         var _loc2_:Number = (this.currentTime - this.var_3172) / 1000;
         this.list.horizontalScrollPosition -= this.var_3171 * _loc2_;
         var _loc3_:Number = this.list.horizontalScrollPosition;
         var _loc4_:Number = this.list.maxHorizontalScrollPosition;
         if(Math.abs(this.var_3171) > 70 && 0 < _loc3_ && _loc3_ < _loc4_)
         {
            this.var_3171 *= Math.exp(-1.5 * _loc2_);
         }
         else
         {
            this.var_3171 = 0;
            removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         this.var_3174 = this.var_3628;
         this.var_3628 = param1.stageX;
         this.var_3172 = this.currentTime;
         this.currentTime = getTimer();
         var _loc2_:Number = this.var_3628 - this.var_3174;
         this.var_3175 += Math.abs(_loc2_);
         if(this.var_3175 > 7)
         {
            this.list.horizontalScrollPosition -= _loc2_;
         }
         param1.updateAfterEvent();
      }
      
      private function method_1472(param1:Event) : void
      {
         addEventListener(MouseEvent.MOUSE_WHEEL,this.method_2936);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
      }
      
      private function method_91(param1:Event) : void
      {
         removeEventListener(MouseEvent.MOUSE_WHEEL,this.method_2936);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.method_1057);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      public function destroy() : void
      {
         this.stopTimer();
      }
   }
}
