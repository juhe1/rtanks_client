package package_435
{
   import alternativa.engine3d.core.Object3D;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   
   public class name_3200 implements class_218
   {
      
      private static const const_2757:Number = 0.08726646259971647;
      
      private static const const_2756:Number = 0.08726646259971647;
       
      
      private var var_3179:TankPreviewStateMachine;
      
      private var var_2567:IEventDispatcher;
      
      private var var_1401:Number = 0;
      
      private var var_1034:int;
      
      private var var_3181:Object3D;
      
      public function name_3200(param1:TankPreviewStateMachine, param2:IEventDispatcher, param3:Object3D)
      {
         super();
         this.var_3179 = param1;
         this.var_2567 = param2;
         this.var_3181 = param3;
      }
      
      public function enter() : void
      {
         this.var_2567.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.var_1034 = getTimer();
         this.var_1401 = 0;
      }
      
      public function update() : void
      {
         var _loc1_:Number = this.method_3217();
         this.method_3218(_loc1_);
         this.var_3181.rotationZ += this.var_1401 * _loc1_;
      }
      
      private function method_3217() : Number
      {
         var _loc1_:int = getTimer();
         var _loc2_:Number = (_loc1_ - this.var_1034) / 1000;
         this.var_1034 = _loc1_;
         if(_loc2_ == 0)
         {
            _loc2_ = 0.1;
         }
         return _loc2_;
      }
      
      private function method_3218(param1:Number) : void
      {
         if(this.var_1401 < 0.08726646259971647)
         {
            this.var_1401 += 0.08726646259971647 * param1;
            if(this.var_1401 > 0.08726646259971647)
            {
               this.var_1401 = 0.08726646259971647;
            }
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
