package alternativa.tanks.models.battlefield
{
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.PerformanceController;
   import flash.display.Stage;
   import flash.events.Event;
   
   public class name_1226 extends PerformanceController
   {
       
      
      private var stage:Stage;
      
      private var var_1121:Boolean = false;
      
      public function name_1226()
      {
         super();
      }
      
      private function init() : void
      {
         if(!this.var_1121)
         {
            addFeature(PerformanceController.SHADOWS,0.2,true);
            addFeature(PerformanceController.SHADOW_MAP,0.2,false);
            addFeature(PerformanceController.DEFERRED_LIGHTING,0.2,false);
            addFeature(PerformanceController.FOG,0.2,true);
            addFeature(PerformanceController.SOFT_TRANSPARENCY,0.2,false);
            addFeature(PerformanceController.SSAO,0.2,false);
            addFeature(PerformanceController.ANTI_ALIAS,0.2,false);
            this.var_1121 = true;
         }
      }
      
      public function name_1232(param1:Stage, param2:Camera3D, param3:String) : void
      {
         this.init();
         this.stage = param1;
         param1.addEventListener(Event.ACTIVATE,this.method_506);
         param1.addEventListener(Event.DEACTIVATE,this.method_505);
         start(param1,param2,30,0.15,20,5,1,param3);
      }
      
      private function method_506(param1:Event) : void
      {
         block = false;
      }
      
      private function method_505(param1:Event) : void
      {
         block = true;
      }
      
      override public function stop() : void
      {
         super.stop();
         this.stage.removeEventListener(Event.ACTIVATE,this.method_506);
         this.stage.removeEventListener(Event.DEACTIVATE,this.method_505);
         this.stage = null;
      }
   }
}
