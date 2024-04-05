package package_260
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.utils.clearInterval;
   import flash.utils.getTimer;
   import flash.utils.setInterval;
   
   public class name_804 extends EventDispatcher implements name_816
   {
       
      
      private const const_1591:int = 172800;
      
      private const const_1581:int = 1000;
      
      private var var_211:int;
      
      private var var_1522:uint = 0;
      
      public function name_804()
      {
         super();
      }
      
      private function update() : void
      {
         if(!this.method_1730())
         {
            dispatchEvent(new Event(Event.CHANGE));
            this.method_1732();
         }
      }
      
      public function method_1730() : Boolean
      {
         return getTimer() < this.var_211;
      }
      
      public function method_1729(param1:int) : void
      {
         param1 = Math.min(param1,172800);
         this.var_211 = getTimer() + param1 * 1000;
         this.method_1732();
         if(param1 > 0)
         {
            this.var_1522 = setInterval(this.update,param1);
         }
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function method_1731() : int
      {
         return this.var_211 - getTimer();
      }
      
      public function destroy() : void
      {
         this.method_1732();
      }
      
      private function method_1732() : void
      {
         if(this.var_1522 != 0)
         {
            clearInterval(this.var_1522);
            this.var_1522 = 0;
         }
      }
   }
}
