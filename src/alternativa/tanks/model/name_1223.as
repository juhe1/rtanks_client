package alternativa.tanks.model
{
   import alternativa.model.IModel;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import forms.Alert;
   import forms.name_358;
   import package_1.Main;
   import package_4.ClientObject;
   import package_421.class_175;
   import package_421.class_176;
   
   public class name_1223 extends class_175 implements class_176
   {
       
      
      private var clientObject:ClientObject;
      
      private var timer:Timer;
      
      public function name_1223()
      {
         super();
         _interfaces.push(IModel);
         _interfaces.push(class_176);
         this.timer = new Timer(15000,1);
         this.timer.addEventListener(TimerEvent.TIMER,this.method_2180);
      }
      
      public function ping(param1:ClientObject) : void
      {
         this.clientObject = param1;
         this.timer.reset();
         this.timer.start();
      }
      
      public function method_2181(param1:ClientObject, param2:String) : void
      {
         var _loc3_:Alert = new Alert();
         _loc3_.showAlert(param2,[name_358.OK]);
         Main.contentUILayer.addChild(_loc3_);
      }
      
      private function method_2180(param1:TimerEvent) : void
      {
      }
   }
}
