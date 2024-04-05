package package_258
{
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class name_808 extends EventDispatcher implements name_812
   {
       
      
      private var timer:Timer;
      
      private var var_1603:Boolean = false;
      
      public function name_808()
      {
         super();
      }
      
      public function method_1734() : Boolean
      {
         return this.var_1603;
      }
      
      public function method_1735(param1:int) : void
      {
         if(param1 > 0)
         {
            this.var_1603 = true;
            this.method_1786(param1);
         }
         else
         {
            this.var_1603 = false;
         }
      }
      
      private function method_1786(param1:int) : void
      {
         this.timer = new Timer(this.method_1787(param1),1);
         this.timer.addEventListener(TimerEvent.TIMER,this.method_1785);
         this.timer.start();
      }
      
      private function method_1787(param1:int) : Number
      {
         var _loc2_:Number = int.MAX_VALUE;
         if(int.MAX_VALUE / 1000 > param1)
         {
            _loc2_ = param1 * 1000;
         }
         return _loc2_;
      }
      
      private function method_1785(param1:TimerEvent) : void
      {
         this.timer.removeEventListener(TimerEvent.TIMER,this.method_1785);
         this.timer.stop();
         this.var_1603 = false;
         dispatchEvent(new ProBattleEvent(ProBattleEvent.OVER));
      }
   }
}
