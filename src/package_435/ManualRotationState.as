package package_435
{
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Object3D;
   import flash.display.Stage;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   
   public class ManualRotationState implements class_218
   {
       
      
      private var var_3179:TankPreviewStateMachine;
      
      private var stage:Stage;
      
      private var context:name_3199;
      
      private var camera:Camera3D;
      
      private var var_3594:Number;
      
      private var var_3595:Number;
      
      private var const_2460:Vector.<int>;
      
      private var var_3593:Vector.<Number>;
      
      private var var_3181:Object3D;
      
      public function ManualRotationState(param1:TankPreviewStateMachine, param2:Stage, param3:name_3199, param4:Camera3D, param5:Object3D)
      {
         this.const_2460 = new Vector.<int>(2);
         this.var_3593 = new Vector.<Number>(2);
         super();
         this.var_3179 = param1;
         this.stage = param2;
         this.context = param3;
         this.camera = param4;
         this.var_3181 = param5;
      }
      
      public function enter() : void
      {
         this.stage.addEventListener(MouseEvent.MOUSE_UP,this.method_3214);
         this.var_3594 = this.var_3181.rotationZ;
         this.var_3595 = this.stage.mouseX;
         this.const_2460[0] = getTimer();
         this.const_2460[1] = this.const_2460[0];
         this.var_3593[0] = this.var_3181.rotationZ;
         this.var_3593[1] = this.var_3593[0];
      }
      
      public function update() : void
      {
         this.var_3181.rotationZ = this.method_3215();
         this.const_2460[1] = this.const_2460[0];
         this.const_2460[0] = getTimer();
         this.var_3593[1] = this.var_3593[0];
         this.var_3593[0] = this.var_3181.rotationZ;
      }
      
      public function exit() : void
      {
         this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.method_3214);
      }
      
      private function method_3214(param1:MouseEvent) : void
      {
         this.var_3181.rotationZ = this.method_3215();
         var _loc2_:Number = (getTimer() - this.const_2460[1]) / 1000;
         if(_loc2_ == 0)
         {
            _loc2_ = 0.1;
         }
         this.context.var_1401 = (this.var_3181.rotationZ - this.var_3593[1]) / _loc2_;
         this.var_3179.name_3517(this,name_3196.name_3205);
      }
      
      private function method_3215() : Number
      {
         var _loc1_:Number = 2 * Math.PI / this.camera.view.width;
         return this.var_3594 + (this.var_3595 - this.stage.mouseX) * _loc1_;
      }
   }
}
