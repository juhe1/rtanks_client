package package_19
{
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import package_1.Main;
   
   public class AlertService implements name_42
   {
      
      private static var var_169:ServerMessageWindow;
       
      
      private var var_83:DisplayObjectContainer;
      
      public function AlertService()
      {
         super();
         this.var_83 = Main.noticesLayer;
         var_169 = new ServerMessageWindow();
         Main.stage.addEventListener(Event.RESIZE,this.method_161);
      }
      
      private function method_161(param1:Event = null) : void
      {
         if(this.var_83.contains(var_169))
         {
            var_169.x = Math.round((Main.stage.stageWidth - var_169.currentSize.x) * 0.5);
            var_169.y = Math.round((Main.stage.stageHeight - var_169.currentSize.y) * 0.5);
         }
      }
      
      public function showAlert(param1:String) : void
      {
         this.method_205(param1);
      }
      
      public function method_205(param1:String) : void
      {
         var_169.text = param1;
         if(!this.var_83.contains(var_169))
         {
            this.var_83.addChild(var_169);
            this.method_161();
         }
      }
      
      public function hideServerMessageWindow() : void
      {
         if(this.var_83.contains(var_169))
         {
            this.var_83.removeChild(var_169);
         }
      }
   }
}
