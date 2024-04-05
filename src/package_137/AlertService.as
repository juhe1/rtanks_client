package package_137
{
   import flash.display.Sprite;
   import flash.events.EventDispatcher;
   import package_12.name_24;
   import package_124.AlertServiceEvent;
   import package_124.name_42;
   import package_176.DialogWindowsDispatcherServiceEvent;
   import package_176.name_549;
   import package_218.name_637;
   import package_280.name_1011;
   import package_54.name_102;
   import platform.client.fp10.core.network.connection.name_839;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.removeDisplayObject;
   
   public class AlertService extends EventDispatcher implements name_42
   {
      
      public static var localeService:name_102;
      
      public static var display:name_24;
      
      public static var blurService:name_637;
      
      public static var dialogWindowsDispatcherService:name_549;
       
      
      private var var_1148:Alert;
      
      private var var_1133:Vector.<Alert>;
      
      public function AlertService()
      {
         super();
      }
      
      public function init() : void
      {
         this.var_1148 = new Alert();
         this.var_1148 = null;
         this.var_1133 = new Vector.<Alert>();
      }
      
      public function showAlert(param1:String, param2:Vector.<String>) : void
      {
         var _loc3_:Alert = null;
         if(this.method_1399())
         {
            this.var_1148 = new Alert();
            this.var_1148.showAlert(param1,param2);
            this.method_1398();
         }
         else
         {
            _loc3_ = new Alert();
            _loc3_.showAlert(param1,param2);
            this.var_1133.push(_loc3_);
         }
      }
      
      public function name_1056(param1:String, param2:Vector.<String>, param3:Vector.<Sprite>) : void
      {
         var _loc4_:Alert = null;
         if(this.method_1399())
         {
            this.var_1148 = new Alert();
            this.var_1148.name_1056(param1,param2,param3);
            this.method_1398();
         }
         else
         {
            _loc4_ = new Alert();
            _loc4_.name_1056(param1,param2,param3);
            this.var_1133.push(_loc4_);
         }
      }
      
      public function method_1143(param1:String) : void
      {
         this.showAlert(param1,Vector.<String>([localeService.getText(name_358.OK)]));
      }
      
      private function method_1398() : void
      {
         dialogWindowsDispatcherService.open();
         blurService.name_1869();
         display.noticesLayer.addChild(this.var_1148);
         this.var_1148.addEventListener(name_1011.ALERT_BUTTON_PRESSED,this.method_201);
         dialogWindowsDispatcherService.addEventListener(DialogWindowsDispatcherServiceEvent.FORCIBLY_CLOSE,this.method_1400);
      }
      
      public function name_1038(param1:int) : void
      {
         if(this.method_1399())
         {
            this.var_1148 = new Alert(param1);
            this.method_1398();
         }
         else
         {
            this.var_1133.push(new Alert(param1));
         }
      }
      
      private function method_201(param1:name_1011) : void
      {
         this.method_1401();
         dispatchEvent(new AlertServiceEvent(AlertServiceEvent.ALERT_BUTTON_PRESSED,param1.name_982));
      }
      
      private function method_1401() : void
      {
         dialogWindowsDispatcherService.removeEventListener(DialogWindowsDispatcherServiceEvent.FORCIBLY_CLOSE,this.method_1400);
         this.var_1148.removeEventListener(name_1011.ALERT_BUTTON_PRESSED,this.method_201);
         this.var_1148 = null;
         if(this.var_1133.length > 0)
         {
            this.var_1148 = this.var_1133.shift();
            this.method_1398();
         }
         else
         {
            dialogWindowsDispatcherService.close();
            blurService.name_1868();
         }
      }
      
      private function method_1400(param1:DialogWindowsDispatcherServiceEvent) : void
      {
         this.var_1148.name_1867();
      }
      
      public function method_354(param1:name_839) : void
      {
         this.var_1133.length = 0;
         if(Boolean(this.var_1148))
         {
            removeDisplayObject(this.var_1148);
            this.method_1401();
         }
      }
      
      private function method_1399() : Boolean
      {
         return this.var_1148 == null;
      }
   }
}
