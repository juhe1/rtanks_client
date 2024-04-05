package package_35
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.console.name_25;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.FocusEvent;
   
   public class FocusService implements name_98
   {
       
      
      private var stage:Stage;
      
      private var var_1108:Boolean = true;
      
      private var var_1109:Boolean = false;
      
      private var var_1106:Array;
      
      private var var_1107:Object;
      
      public function FocusService(param1:Stage)
      {
         super();
         this.stage = param1;
         if(param1 == null)
         {
            this.stage = Game.getInstance.stage;
         }
         this.var_1106 = new Array();
         this.stage.addEventListener(FocusEvent.MOUSE_FOCUS_CHANGE,this.method_1301);
         this.stage.addEventListener(FocusEvent.KEY_FOCUS_CHANGE,this.method_1302);
         this.stage.addEventListener(FocusEvent.FOCUS_IN,this.method_890);
         this.stage.addEventListener(FocusEvent.FOCUS_OUT,this.method_883);
         this.stage.addEventListener(Event.ACTIVATE,this.activate);
         this.stage.addEventListener(Event.DEACTIVATE,this.deactivate);
      }
      
      private function activate(param1:Event) : void
      {
         var _loc4_:class_5 = null;
         var _loc2_:name_25 = OSGi.osgi.name_6(name_25) as name_25;
         _loc2_.name_848("FOCUS","activate");
         var _loc3_:int = 0;
         while(_loc3_ < this.var_1106.length)
         {
            _loc4_ = class_5(this.var_1106[_loc3_]);
            _loc4_.activate();
            _loc3_++;
         }
      }
      
      private function deactivate(param1:Event) : void
      {
         var _loc4_:class_5 = null;
         var _loc2_:name_25 = OSGi.osgi.name_6(name_25) as name_25;
         _loc2_.name_848("FOCUS","deactivate");
         var _loc3_:int = 0;
         while(_loc3_ < this.var_1106.length)
         {
            _loc4_ = class_5(this.var_1106[_loc3_]);
            _loc4_.deactivate();
            _loc3_++;
         }
      }
      
      public function name_177(param1:class_5) : void
      {
         this.var_1106.push(param1);
      }
      
      public function name_1119(param1:class_5) : void
      {
         this.var_1106.splice(this.var_1106.indexOf(param1),1);
      }
      
      public function getFocus() : Object
      {
         return this.var_1107;
      }
      
      public function method_740(param1:DisplayObject) : void
      {
         if(this.var_1107 == param1)
         {
            this.var_1107 = this.stage;
            this.stage.focus = this.stage;
         }
      }
      
      private function method_890(param1:FocusEvent) : void
      {
         var _loc3_:class_5 = null;
         this.var_1107 = param1.target;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_1106.length)
         {
            _loc3_ = class_5(this.var_1106[_loc2_]);
            _loc3_.method_29(this.var_1107);
            _loc2_++;
         }
      }
      
      private function method_883(param1:FocusEvent) : void
      {
         var _loc3_:class_5 = null;
         this.var_1107 = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_1106.length)
         {
            _loc3_ = class_5(this.var_1106[_loc2_]);
            _loc3_.method_30(param1.currentTarget);
            _loc2_++;
         }
      }
      
      private function method_1302(param1:FocusEvent) : void
      {
         this.var_1109 = true;
      }
      
      private function method_1301(param1:FocusEvent) : void
      {
         this.var_1108 = true;
      }
   }
}
