package package_435
{
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   
   public class name_3201 implements class_218
   {
      
      private static const const_2758:int = 10000;
       
      
      private var var_3179:TankPreviewStateMachine;
      
      private var var_2567:IEventDispatcher;
      
      private var var_586:int;
      
      public function name_3201(param1:TankPreviewStateMachine, param2:IEventDispatcher)
      {
         super();
         this.var_3179 = param1;
         this.var_2567 = param2;
      }
      
      public function enter() : void
      {
         this.var_2567.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.var_586 = getTimer() + 10000;
      }
      
      public function update() : void
      {
         if(getTimer() >= this.var_586)
         {
            this.var_3179.name_3517(this,name_3196.name_3202);
         }
      }
      
      public function exit() : void
      {
         this.var_2567.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.var_3179.name_3517(this,name_3196.MOUSE_DOWN);
      }
   }
}
