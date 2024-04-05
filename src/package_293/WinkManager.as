package package_293
{
   import flash.events.TimerEvent;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class WinkManager
   {
      
      private static var _instance:WinkManager;
       
      
      private var timer:Timer;
      
      private var var_1918:Dictionary;
      
      private var var_1917:int;
      
      private var visible:Boolean;
      
      public function WinkManager(param1:int)
      {
         super();
         this.var_1918 = new Dictionary();
         this.timer = new Timer(param1);
         this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
      }
      
      public static function init(param1:int) : void
      {
         if(_instance == null)
         {
            _instance = new WinkManager(param1);
         }
      }
      
      public static function get instance() : WinkManager
      {
         return _instance;
      }
      
      public function method_2066(param1:name_2336) : void
      {
         if(this.var_1918[param1] != null)
         {
            return;
         }
         this.var_1918[param1] = param1;
         ++this.var_1917;
         if(this.var_1917 == 1)
         {
            this.timer.start();
         }
      }
      
      public function method_2067(param1:name_2336) : void
      {
         if(this.var_1918[param1] == null)
         {
            return;
         }
         delete this.var_1918[param1];
         --this.var_1917;
         if(this.var_1917 == 0)
         {
            this.timer.stop();
            this.visible = true;
         }
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         var _loc2_:name_2336 = null;
         if(this.var_1917 == 0)
         {
            return;
         }
         this.visible = !this.visible;
         for each(_loc2_ in this.var_1918)
         {
            _loc2_.textVisible = this.visible;
         }
      }
   }
}
