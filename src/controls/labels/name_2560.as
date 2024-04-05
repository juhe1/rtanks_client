package controls.labels
{
   import controls.timer.CountDownTimer;
   import controls.timer.name_2546;
   import controls.timer.name_2547;
   import flash.events.Event;
   import utils.name_1952;
   
   public class name_2560 extends name_2551 implements name_2546, name_2547
   {
       
      
      private var timer:CountDownTimer = null;
      
      public function name_2560()
      {
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.method_1601);
         addEventListener(Event.REMOVED_FROM_STAGE,this.method_1408);
      }
      
      private static function method_2583(param1:int) : String
      {
         if(param1 <= 0)
         {
            return "";
         }
         return name_1952.format(param1);
      }
      
      public function start(param1:CountDownTimer) : void
      {
         this.stop();
         this.timer = param1;
         if(stage != null)
         {
            this.method_1472();
         }
         this.method_2294(param1);
      }
      
      public function stop() : void
      {
         if(this.timer != null)
         {
            if(stage != null)
            {
               this.method_91();
            }
            this.timer = null;
            text = "";
         }
      }
      
      public function method_2294(param1:CountDownTimer) : void
      {
         text = method_2583(param1.name_1368());
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function name_2548(param1:CountDownTimer, param2:Boolean) : void
      {
         if(param1 == this.timer)
         {
            this.timer = null;
            text = "";
         }
      }
      
      public function method_2909() : CountDownTimer
      {
         return this.timer;
      }
      
      private function method_1472() : void
      {
         this.timer.addListener(name_2546,this);
         this.timer.addListener(name_2547,this);
      }
      
      private function method_91() : void
      {
         this.timer.removeListener(name_2546,this);
         this.timer.removeListener(name_2547,this);
      }
      
      private function method_1408(param1:Event) : void
      {
         if(this.timer != null)
         {
            this.method_91();
         }
      }
      
      private function method_1601(param1:Event) : void
      {
         if(this.timer != null)
         {
            this.method_1472();
            this.method_2294(this.timer);
         }
      }
   }
}
