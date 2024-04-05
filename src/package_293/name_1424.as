package package_293
{
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class name_1424 extends name_2336
   {
       
      
      private var timer:Timer;
      
      private var var_2272:uint;
      
      private var var_2273:Boolean;
      
      public function name_1424(param1:int, param2:int, param3:WinkManager, param4:Boolean)
      {
         super(param1,param2,param3);
         this.var_2273 = param4;
         this.timer = new Timer(1000);
         this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
      }
      
      public function name_1429(param1:int) : void
      {
         this.var_2272 = Math.round(getTimer() / 1000 + param1);
         value = param1;
         if(_value > 0)
         {
            this.timer.stop();
            this.timer.start();
         }
         else
         {
            name_2339();
         }
      }
      
      override protected function method_664() : void
      {
         if(this.var_2273)
         {
            label.text = _value < 10 ? "0" + _value.toString() : _value.toString();
         }
         else
         {
            label.text = this.method_2308(_value) + " : " + this.method_2309(_value);
         }
      }
      
      override protected function method_886(param1:Event) : void
      {
         super.method_886(param1);
         this.timer.stop();
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         var _loc2_:int = 0;
         if(_value > 0)
         {
            _loc2_ = Math.round(this.var_2272 - getTimer() / 1000);
            value = _loc2_ < 0 ? 0 : _loc2_;
         }
         else
         {
            this.timer.stop();
         }
      }
      
      private function method_2308(param1:int) : String
      {
         var _loc2_:int = param1 / 60;
         return _loc2_ > 9 ? _loc2_.toString() : "0" + _loc2_.toString();
      }
      
      private function method_2309(param1:int) : String
      {
         var _loc2_:int = param1 % 60;
         return _loc2_ > 9 ? _loc2_.toString() : "0" + _loc2_.toString();
      }
   }
}
