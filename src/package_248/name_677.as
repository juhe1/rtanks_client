package package_248
{
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import package_278.name_1288;
   
   public class name_677
   {
       
      
      private const checkInterval:name_1288 = new name_1288("checkInterval");
      
      private const threshold:name_1288 = new name_1288("threshold");
      
      private const maxErrors:name_1288 = new name_1288("maxErrors");
      
      private var errorCounter:name_1288;
      
      private var battleEventDispatcher:BattlefieldModel;
      
      private var timer:Timer;
      
      private var var_1440:int;
      
      private var var_1438:Number;
      
      private var var_1439:Array;
      
      public function name_677(param1:BattlefieldModel)
      {
         this.errorCounter = new name_1288("errorCounter");
         super();
         this.checkInterval.value = 5000;
         this.threshold.value = 300;
         this.maxErrors.value = 3;
         this.errorCounter.value = 0;
         this.var_1439 = [];
         this.battleEventDispatcher = param1;
         this.var_1440 = getTimer();
         this.var_1438 = new Date().time;
         this.timer = new Timer(this.checkInterval.value);
         this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this.timer.start();
      }
      
      public function stop() : void
      {
         this.timer.stop();
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         var _loc2_:int = getTimer();
         var _loc3_:Number = new Date().time;
         var _loc4_:Number = _loc2_ - this.var_1440 - _loc3_ + this.var_1438;
         if(Math.abs(_loc4_) > this.threshold.value)
         {
            this.var_1439.push(_loc4_);
            this.errorCounter.value += 1;
            if(this.errorCounter.value >= this.maxErrors.value)
            {
               this.stop();
               this.battleEventDispatcher.method_197();
            }
         }
         else
         {
            this.errorCounter.value = 0;
            this.var_1439.length = 0;
         }
         this.var_1440 = _loc2_;
         this.var_1438 = _loc3_;
      }
   }
}
