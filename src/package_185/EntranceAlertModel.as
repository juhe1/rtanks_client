package package_185
{
   import alternativa.model.IModel;
   import alternativa.tanks.gui.EntranceAlertWindow;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import package_1.Main;
   import package_31.name_115;
   import package_384.class_124;
   import package_384.class_125;
   import package_4.ClientObject;
   import package_7.name_32;
   
   public class EntranceAlertModel extends class_124 implements class_125
   {
       
      
      private var panelModel:name_115;
      
      private var dialogsLayer:DisplayObjectContainer;
      
      private var window:EntranceAlertWindow;
      
      public function EntranceAlertModel()
      {
         super();
         this.dialogsLayer = Main.dialogsLayer;
         var _loc1_:name_32 = Main.osgi.getService(name_32) as name_32;
         this.panelModel = (_loc1_.getModelsByInterface(name_115) as Vector.<IModel>)[0] as name_115;
      }
      
      public function showAlert(param1:ClientObject) : void
      {
         this.panelModel.blur();
         this.window = new EntranceAlertWindow();
         this.dialogsLayer.addChild(this.window);
         this.window.name_983.addEventListener(MouseEvent.CLICK,this.method_1145);
         this.method_1080(null);
         Main.stage.addEventListener(Event.RESIZE,this.method_1080);
      }
      
      private function method_1080(param1:Event) : void
      {
         this.window.x = Math.round((Main.stage.stageWidth - this.window.width) * 0.5);
         this.window.y = Math.round((Main.stage.stageHeight - this.window.height) * 0.5);
      }
      
      private function method_1145(param1:MouseEvent = null) : void
      {
         this.panelModel.unblur();
         this.dialogsLayer.removeChild(this.window);
      }
   }
}
