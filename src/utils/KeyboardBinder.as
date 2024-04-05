package utils
{
   import flash.display.InteractiveObject;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   
   public class KeyboardBinder
   {
       
      
      protected var var_2566:Object;
      
      private var var_2567:InteractiveObject;
      
      public function KeyboardBinder(param1:InteractiveObject)
      {
         super();
         this.var_2567 = param1;
         this.var_2566 = {};
      }
      
      public function enable() : void
      {
         this.var_2567.addEventListener(KeyboardEvent.KEY_DOWN,this.method_160);
         this.var_2567.addEventListener(KeyboardEvent.KEY_UP,this.method_160);
      }
      
      public function disable() : void
      {
         this.var_2567.removeEventListener(KeyboardEvent.KEY_DOWN,this.method_160);
         this.var_2567.removeEventListener(KeyboardEvent.KEY_UP,this.method_160);
      }
      
      private function method_160(param1:KeyboardEvent) : void
      {
         var _loc2_:Function = this.var_2566[param1.keyCode];
         if(_loc2_ != null)
         {
            _loc2_.call(this,param1.type == KeyboardEvent.KEY_DOWN);
         }
      }
      
      public function method_2539(param1:uint, param2:Function) : void
      {
         if(param2 != null)
         {
            this.var_2566[param1] = param2;
         }
      }
      
      public function name_1865(param1:String, param2:Function) : void
      {
         if(param2 != null)
         {
            this.var_2566[Keyboard[param1]] = param2;
         }
      }
      
      public function method_2540(param1:uint) : void
      {
         delete this.var_2566[param1];
      }
      
      public function name_1866() : void
      {
         var _loc1_:* = null;
         for(_loc1_ in this.var_2566)
         {
            delete this.var_2566[_loc1_];
         }
      }
   }
}
