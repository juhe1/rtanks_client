package package_296
{
   import flash.display.Sprite;
   import flash.events.Event;
   import package_1.Main;
   import package_291.name_1099;
   import package_67.DamageType;
   
   public class name_1103 extends Sprite
   {
       
      
      private var var_633:name_2351;
      
      public function name_1103()
      {
         this.var_633 = new name_2351();
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.method_2068);
         addEventListener(Event.ADDED_TO_STAGE,this.method_1436);
         addEventListener(Event.REMOVED_FROM_STAGE,this.method_2069);
      }
      
      public function method_2068(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.method_2068);
         addChild(this.var_633);
         this.var_633.tabEnabled = false;
         this.var_633.tabChildren = false;
      }
      
      private function method_1436(param1:Event) : void
      {
         stage.addEventListener(Event.RESIZE,this.onResize);
      }
      
      private function method_2069(param1:Event) : void
      {
         stage.removeEventListener(Event.RESIZE,this.onResize);
      }
      
      public function onResize(param1:Event) : void
      {
         this.var_633.x = Main.stage.stageWidth;
         this.var_633.y = 50;
      }
      
      public function addMessage(param1:name_1099, param2:String, param3:name_1099 = null) : void
      {
         this.var_633.method_223(new name_2352(param1,param2,param3));
         this.onResize(null);
      }
      
      public function name_1115(param1:name_1099, param2:DamageType, param3:name_1099 = null) : void
      {
         this.var_633.method_223(new KillMessageOutputLine(param1,param3,param2));
         this.onResize(null);
      }
   }
}
