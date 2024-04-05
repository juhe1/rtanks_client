package package_404
{
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import package_1.Main;
   import package_445.name_2867;
   
   public class CheatManager extends EventDispatcher
   {
      
      protected static var _instance:CheatManager;
       
      
      private var var_2825:Boolean;
      
      private var var_2826:Array;
      
      private var stage:Stage;
      
      public function CheatManager(param1:Function = null)
      {
         super();
         if(param1 != CheatManager.getInstance)
         {
            throw new Error("CheatManager is a singleton class, use getInstance() instead");
         }
         if(CheatManager._instance != null)
         {
            throw new Error("Only one CheatManager instance should be instantiated");
         }
      }
      
      public static function getInstance() : CheatManager
      {
         if(_instance == null)
         {
            _instance = new CheatManager(arguments.callee);
            _instance.init();
         }
         return _instance;
      }
      
      private function init() : void
      {
         this.var_2826 = new Array();
         this.var_2825 = false;
         this.stage = Main.stage;
         this.stage.addEventListener(Event.DEACTIVATE,this.method_2659);
      }
      
      public function set method_2660(param1:Boolean) : void
      {
         this.var_2825 = param1;
      }
      
      private function method_2659(param1:Event) : void
      {
         if(this.var_2825)
         {
            this.method_2658();
         }
      }
      
      public function method_2658() : void
      {
         trace("* CheatManager : Force Hop Event Dispatched *");
         this.dispatchEvent(new name_2867(name_2867.name_2869));
      }
      
      public function name_2180(param1:String, param2:Object, param3:Object) : void
      {
         trace("* CheatManager : cheat detection in " + param1 + " fake value : " + param2 + " != real value " + param3 + " *");
         var _loc4_:name_2867 = new name_2867(name_2867.name_2868);
         _loc4_.data = {
            "variableName":param1,
            "fakeValue":param2,
            "realValue":param3
         };
         CheatManager.getInstance().dispatchEvent(_loc4_);
      }
   }
}
