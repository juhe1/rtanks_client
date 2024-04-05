package package_435
{
   import alternativa.engine3d.core.Object3D;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   
   public class name_3198 implements class_218
   {
      
      private static const const_2755:Number = 0.02;
       
      
      private var var_3179:TankPreviewStateMachine;
      
      private var var_2567:IEventDispatcher;
      
      private var context:name_3199;
      
      private var var_1034:int;
      
      private var var_3181:Object3D;
      
      public function name_3198(param1:TankPreviewStateMachine, param2:IEventDispatcher, param3:name_3199, param4:Object3D)
      {
         super();
         this.var_3179 = param1;
         this.var_2567 = param2;
         this.context = param3;
         this.var_3181 = param4;
      }
      
      public function enter() : void
      {
         this.var_2567.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.var_1034 = getTimer();
      }
      
      public function update() : void
      {
         var _loc1_:int = getTimer();
         var _loc2_:Number = (_loc1_ - this.var_1034) / 1000;
         this.var_1034 = _loc1_;
         this.var_3181.rotationZ += this.context.var_1401 * _loc2_;
         if(Math.abs(this.context.var_1401) > 0.02)
         {
            this.context.var_1401 *= Math.exp(-1.5 * _loc2_);
         }
         else
         {
            this.context.var_1401 = 0;
            this.var_3179.name_3517(this,name_3196.name_3203);
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
