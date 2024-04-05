package alternativa.utils
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class TaskSequence extends EventDispatcher
   {
       
      
      private var var_2709:Vector.<class_165>;
      
      private var var_2710:int;
      
      public function TaskSequence()
      {
         super();
         this.var_2709 = new Vector.<class_165>();
      }
      
      public function name_2066(param1:class_165) : void
      {
         if(this.var_2709.indexOf(param1) < 0)
         {
            this.var_2709.push(param1);
            param1.var_1397 = this;
         }
      }
      
      public function run() : void
      {
         if(this.var_2709.length > 0)
         {
            this.var_2710 = 0;
            this.method_2587();
         }
         else
         {
            dispatchEvent(new Event(Event.COMPLETE));
         }
      }
      
      private function method_2587() : void
      {
         this.var_2709[this.var_2710].run();
      }
      
      public function name_2310(param1:class_165) : void
      {
         if(++this.var_2710 < this.var_2709.length)
         {
            this.method_2587();
         }
         else
         {
            dispatchEvent(new Event(Event.COMPLETE));
         }
      }
   }
}
