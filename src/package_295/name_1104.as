package package_295
{
   import alternativa.tanks.model.name_1605;
   import controls.Label;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import package_1.Main;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class name_1104 extends Sprite
   {
      
      private static const const_1724:int = 60;
      
      private static const const_1723:int = 0;
      
      private static const const_1720:int = 999;
      
      private static const const_1725:int = 19;
      
      private static const const_1719:int = 58;
      
      private static const const_1721:int = 93;
      
      private static const const_1722:int = 48;
      
      private static const const_1726:int = 10;
      
      private static const const_1718:GlowFilter = new GlowFilter(0,0.8,4,4,3);
       
      
      private var var_1916:Label;
      
      private var var_1914:Label;
      
      private var var_1915:Label;
      
      private var var_1913:Label;
      
      private var counter:int;
      
      private var time:int;
      
      private var var_1121:Boolean = false;
      
      private var timer:Timer;
      
      public function name_1104(param1:Boolean = false)
      {
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.method_886);
      }
      
      private function init() : void
      {
         if(!this.var_1121)
         {
            this.var_1916 = new Label();
            this.var_1916.autoSize = TextFieldAutoSize.LEFT;
            this.var_1916.color = 16777215;
            this.var_1916.text = "FPS: ";
            this.var_1916.selectable = false;
            addChild(this.var_1916);
            this.var_1914 = new Label();
            this.var_1914.autoSize = TextFieldAutoSize.LEFT;
            this.var_1914.color = 65280;
            this.var_1914.text = (60).toString();
            this.var_1914.selectable = false;
            addChild(this.var_1914);
            this.var_1915 = new Label();
            this.var_1915.autoSize = TextFieldAutoSize.LEFT;
            this.var_1915.color = 16777215;
            this.var_1915.text = "PING: ";
            this.var_1915.selectable = false;
            this.var_1915.x = -7;
            this.var_1915.y = 19;
            addChild(this.var_1915);
            this.var_1913 = new Label();
            this.var_1913.autoSize = TextFieldAutoSize.LEFT;
            this.var_1913.color = 65280;
            this.var_1913.text = (0).toString();
            this.var_1913.selectable = false;
            this.var_1913.y = 19;
            addChild(this.var_1913);
            filters = [const_1718];
            this.var_1121 = true;
         }
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         this.init();
         this.onResize(null);
         this.counter = 0;
         this.time = getTimer();
         this.timer = new Timer(1000);
         this.timer.addEventListener(TimerEvent.TIMER,this.method_347);
         this.timer.start();
         stage.addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         stage.addEventListener(Event.RESIZE,this.onResize);
      }
      
      private function method_886(param1:Event) : void
      {
         this.timer.removeEventListener(TimerEvent.TIMER,this.method_347);
         this.timer.stop();
         stage.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         stage.removeEventListener(Event.RESIZE,this.onResize);
      }
      
      private function method_347(param1:TimerEvent) : void
      {
         Network(Main.osgi.name_6(name_2)).send("battle;ping");
         name_1605.name_2350();
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         if(++this.counter >= 10)
         {
            _loc2_ = getTimer();
            _loc3_ = 1000 * this.counter / (_loc2_ - this.time);
            if(_loc3_ > 60)
            {
               _loc3_ = 60;
            }
            this.var_1914.text = Math.round(_loc3_).toString();
            this.var_1914.x = 48 - this.var_1914.width;
            if(_loc3_ > 30)
            {
               if(_loc3_ < 60)
               {
                  this.var_1914.color = this.method_2065(int("0xFFFF00"),int("0x00FF00"),(_loc3_ - 30) / (60 - 30));
               }
               else
               {
                  this.var_1914.color = int("0x00FF00");
               }
            }
            else if(_loc3_ > 15)
            {
               this.var_1914.color = this.method_2065(int("0XF03416"),int("0XFFFF00"),(_loc3_ - 15) / (30 - 15));
            }
            else
            {
               this.var_1914.color = int("0XF03416");
            }
            this.time = _loc2_;
            this.counter = 0;
            _loc4_ = getTimer();
            _loc5_ = _loc4_ - name_1605.name_2349();
            _loc6_ = name_1605.name_2348();
            if(_loc6_ > 2000)
            {
               _loc6_ = 999;
            }
            this.var_1913.text = Math.round(_loc6_).toString();
            this.var_1913.x = 48 - this.var_1913.width;
            if(_loc6_ < 200)
            {
               if(_loc6_ > 100)
               {
                  this.var_1913.color = this.method_2065(int("0x00FF00"),int("0xFFFF00"),(_loc6_ - 100) / (200 - 100));
               }
               else
               {
                  this.var_1913.color = int("0x00FF00");
               }
            }
            else if(_loc6_ < 500)
            {
               this.var_1913.color = this.method_2065(int("0xFFFF00"),int("0XF03416"),(_loc6_ - 200) / (500 - 200));
            }
            else
            {
               this.var_1913.color = int("0XF03416");
            }
         }
      }
      
      private function method_2065(param1:int, param2:int, param3:Number) : int
      {
         var _loc4_:int = param1 >> 16 & 255;
         var _loc5_:int = param1 >> 8 & 255;
         var _loc6_:int = param1 & 255;
         var _loc7_:int = param2 >> 16 & 255;
         var _loc8_:int = param2 >> 8 & 255;
         var _loc9_:int = param2 & 255;
         if(param3 > 1)
         {
            param3 = 1;
         }
         return _loc4_ + (_loc7_ - _loc4_) * param3 << 16 | _loc5_ + (_loc8_ - _loc5_) * param3 << 8 | int(_loc6_ + (_loc9_ - _loc6_) * param3);
      }
      
      private function onResize(param1:Event) : void
      {
         x = stage.stageWidth - 58;
         y = stage.stageHeight - 93;
         this.var_1914.x = 48 - this.var_1914.width;
         this.var_1913.x = 48 - this.var_1913.width;
      }
   }
}
