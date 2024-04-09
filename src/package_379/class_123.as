package package_379
{
   import alternativa.osgi.OSGi;
   import base.class_122;
   import flash.display.DisplayObjectContainer;
   import flash.events.KeyboardEvent;
   import package_1.Main;
   import package_177.IDialogsService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.name_1015;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.name_1022;
   
   public class class_123 extends class_122
   {
      
      public static var display:DisplayObjectContainer = Main.dialogsLayer;
      
      public static var var_864:IDialogsService = OSGi.getInstance().getService(IDialogsService) as IDialogsService;
       
      
      public function class_123()
      {
         super();
      }
      
      public function setEventListeners() : void
      {
         display.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp,false,name_1015.name_1833);
      }
      
      protected function onKeyUp(param1:KeyboardEvent) : void
      {
         if(name_1022.name_1036(param1.keyCode))
         {
            param1.stopImmediatePropagation();
            this.method_1319();
         }
         if(name_1022.name_1834(param1.keyCode))
         {
            param1.stopImmediatePropagation();
            this.method_1320();
         }
      }
      
      protected function method_1319() : void
      {
      }
      
      protected function method_1320() : void
      {
      }
      
      public function removeEventListeners() : void
      {
         display.stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
      }
      
      public function method_1307() : void
      {
         this.method_1319();
      }
   }
}
