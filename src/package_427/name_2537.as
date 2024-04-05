package package_427
{
   import filters.name_1131;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.setTimeout;
   import package_294.name_2538;
   
   public class name_2537 extends Sprite
   {
      
      private static const const_2310:int = 30000;
       
      
      protected var var_3046:Boolean = true;
      
      private var var_3045:Timer;
      
      private var stop:Boolean = false;
      
      private var var_3047:Boolean = false;
      
      protected var var_2577:Sprite;
      
      public function name_2537()
      {
         this.var_2577 = new Sprite();
         super();
         this.var_2577.filters = name_1131.const_1750;
         addChild(this.var_2577);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      public function name_2544() : void
      {
         alpha = 1;
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.stop = true;
      }
      
      public function name_2543() : void
      {
         this.stop = false;
         if(this.var_3047)
         {
            this.method_2830();
         }
      }
      
      public function get alive() : Boolean
      {
         return this.var_3046;
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         setTimeout(this.method_2832,30000);
      }
      
      private function method_2832() : void
      {
         this.var_3047 = true;
         if(!this.stop)
         {
            this.method_2830();
         }
      }
      
      private function method_2830() : void
      {
         this.var_3045 = new Timer(50,20);
         this.var_3045.addEventListener(TimerEvent.TIMER,this.method_2831);
         this.var_3045.addEventListener(TimerEvent.TIMER_COMPLETE,this.method_2833);
         this.var_3045.start();
      }
      
      private function method_2831(param1:TimerEvent) : void
      {
         if(!this.stop)
         {
            alpha -= 0.05;
         }
         else
         {
            this.var_3045.stop();
            alpha = 1;
         }
      }
      
      private function method_2833(param1:TimerEvent) : void
      {
         this.var_3046 = false;
         dispatchEvent(new name_2538(name_2538.name_2539,this));
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
   }
}
