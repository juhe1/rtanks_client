package package_259
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.utils.clearInterval;
   import flash.utils.getTimer;
   import flash.utils.setInterval;
   
   public class name_795 extends EventDispatcher implements name_807
   {
       
      
      private const const_1596:int = 3600;
      
      private const const_1594:int = 86400;
      
      private const const_1595:int = 60000;
      
      private var var_211:int;
      
      private var var_1522:uint = 0;
      
      public function name_795()
      {
         super();
      }
      
      private function update() : void
      {
         if(!this.var_445())
         {
            dispatchEvent(new Event(Event.CHANGE));
            this.method_1732();
         }
      }
      
      public function var_445() : Boolean
      {
         return getTimer() < this.var_211;
      }
      
      public function method_1729(param1:int) : void
      {
         param1 = Math.min(param1,86400 * 2);
         this.var_211 = getTimer() + param1 * 1000;
         this.method_1732();
         if(param1 > 0)
         {
            this.var_1522 = setInterval(this.update,60000);
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
