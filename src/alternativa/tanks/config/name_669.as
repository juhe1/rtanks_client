package alternativa.tanks.config
{
   import alternativa.utils.TaskSequence;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import projects.tanks.clients.flash.resources.resource.MapResource;
   
   public class name_669 extends EventDispatcher
   {
       
      
      public var map:TanksMap;
      
      private var var_1397:TaskSequence;
      
      public function name_669()
      {
         super();
      }
      
      public function load(param1:MapResource) : void
      {
         this.var_1397 = new TaskSequence();
         this.map = new TanksMap(this,param1);
         this.var_1397.name_2066(this.map);
         this.var_1397.addEventListener(Event.COMPLETE,this.method_1620);
         this.var_1397.run();
      }
      
      private function method_1620(param1:Event) : void
      {
         this.var_1397 = null;
         dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}
