package package_127
{
   import alternativa.osgi.OSGi;
   import controls.buttons.h50px.class_180;
   import flash.display.DisplayObjectContainer;
   import flash.events.MouseEvent;
   import package_31.PanelModel;
   import package_31.name_115;
   import package_54.name_102;
   import platform.client.fp10.core.type.AutoClosable;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_1580 implements AutoClosable
   {
      
      public static var localeService:name_102 = OSGi.getInstance().name_6(name_102) as name_102;
       
      
      private var var_643:class_180;
      
      public var name_1583:class_180;
      
      public function name_1580()
      {
         this.var_643 = new class_180();
         this.name_1583 = new class_180();
         super();
         this.var_643.label = localeService.getText(name_390.name_1366);
         this.name_1583.label = localeService.getText(name_390.const_827);
         this.var_643.addEventListener(MouseEvent.CLICK,method_1092);
      }
      
      private static function method_1092(param1:MouseEvent) : void
      {
         PanelModel(OSGi.getInstance().name_6(name_115)).getShop();
      }
      
      public function name_1581(param1:Boolean) : void
      {
         this.name_1583.enabled = param1;
      }
      
      public function close() : void
      {
         this.var_643.removeEventListener(MouseEvent.CLICK,method_1092);
         this.name_1583.removeEventListener(MouseEvent.CLICK,method_1092);
         this.var_643 = null;
         this.name_1583 = null;
      }
      
      public function updateActionElements(param1:DisplayObjectContainer) : void
      {
         param1.addChild(this.var_643);
         param1.addChild(this.name_1583);
         this.var_643.x = 11;
         this.name_1583.x = this.var_643.x + (this.var_643.width + 15) * 2;
      }
   }
}
