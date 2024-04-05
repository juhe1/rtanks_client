package package_469
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   
   public class name_3306
   {
       
      
      private var state:int;
      
      private var var_3639:DisplayObject;
      
      private var var_3641:Number = 0.15;
      
      private var var_3640:Number = 0.3;
      
      public function name_3306(param1:Number = 0.15, param2:Number = 0.3)
      {
         super();
         this.var_3641 = param1;
         this.var_3640 = param2;
      }
      
      public function start(param1:DisplayObject) : void
      {
         this.stop();
         this.var_3639 = param1;
         this.state = 0;
         param1.alpha = 1;
         param1.addEventListener(Event.ENTER_FRAME,this.method_3261);
      }
      
      public function stop() : void
      {
         if(this.var_3639 != null)
         {
            this.var_3639.removeEventListener(Event.ENTER_FRAME,this.method_3261);
            this.var_3639.alpha = 1;
            this.var_3639 = null;
         }
      }
      
      private function method_3261(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc2_ = Math.ceil(this.var_3641 * 60);
         _loc3_ = Math.ceil(this.var_3640 * 60);
         ++this.state;
         if(this.state < _loc2_)
         {
            this.var_3639.alpha = 1;
         }
         else if(this.state < _loc2_ + _loc3_)
         {
            this.var_3639.alpha = 1 - (this.state - _loc2_) / _loc3_;
         }
         else if(this.state < _loc2_ + _loc3_ + _loc2_)
         {
            this.var_3639.alpha = 0;
         }
         else if(this.state < _loc2_ + _loc3_ + _loc2_ + _loc3_)
         {
            this.var_3639.alpha = (this.state - _loc2_ - _loc3_ - _loc2_) / _loc3_;
         }
         else
         {
            this.var_3639.alpha = 1;
            this.state = 0;
         }
      }
   }
}
