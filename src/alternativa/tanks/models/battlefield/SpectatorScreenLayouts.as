package alternativa.tanks.models.battlefield
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.battlefield.gui.chat.BattleChat;
   import alternativa.tanks.service.settings.name_108;
   import alternativa.tanks.utils.name_1398;
   import flash.events.KeyboardEvent;
   import package_1.Main;
   import package_12.name_24;
   import package_246.BattlefieldMessages;
   import package_293.name_1105;
   import package_295.name_1104;
   import package_296.name_1103;
   import package_31.PanelModel;
   import package_31.name_115;
   import package_32.name_245;
   import package_82.name_312;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class SpectatorScreenLayouts implements AutoClosable
   {
      
      public static var display:name_24 = OSGi.getInstance().name_6(name_24) as name_24;
      
      public static var panelView:name_115 = OSGi.getInstance().name_6(name_115) as name_115;
      
      public static var settingsService:name_108 = OSGi.getInstance().name_6(name_108) as name_108;
      
      public static var var_360:name_312 = OSGi.getInstance().name_6(name_312) as name_312;
      
      public static var var_1894:name_245 = OSGi.getInstance().name_6(name_245) as name_245;
      
      public static var var_1895:name_83 = OSGi.getInstance().name_6(name_83) as name_83;
      
      private static const const_1713:uint = 220;
      
      private static const const_1714:int = 1;
      
      private static const const_1712:int = 1 << 1;
      
      private static const name_557:int = 1 << 2;
      
      private static const const_1708:int = 1 << 3;
      
      private static const const_1710:int = 1 << 4;
      
      private static const const_1709:int = 1 << 5;
      
      private static const const_1707:int = 1 << 6;
      
      private static const const_95:int = 1 << 7;
      
      private static const const_1711:Array = [const_95 | const_1708 | const_1710 | const_1709 | const_1707 | name_557 | 1 | const_1712,const_95 | const_1708 | const_1710 | const_1709 | const_1707 | name_557,const_95 | const_1708 | const_1710 | const_1709 | const_1707,const_1707,0];
       
      
      private var chat:BattleChat;
      
      private var var_419:name_1103;
      
      private var var_416:name_1105;
      
      private var var_1896:BattlefieldMessages;
      
      private var var_426:name_1104;
      
      private var var_1893:int;
      
      public function SpectatorScreenLayouts(param1:BattleChat, param2:name_1103, param3:BattlefieldMessages, param4:name_1105, param5:name_1104)
      {
         super();
         this.chat = param1;
         this.var_419 = param2;
         this.var_1896 = param3;
         this.var_416 = param4;
         this.var_426 = param5;
         this.var_1893 = 0;
         this.method_2061(this.var_1893);
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         if(!var_1894.name_727() && param1.keyCode == 220)
         {
            this.method_2062();
         }
      }
      
      private function method_2062() : void
      {
         this.var_1893 = (this.var_1893 + 1) % const_1711.length;
         this.method_2061(this.var_1893);
      }
      
      private function method_2061(param1:int) : void
      {
         var _loc2_:name_1398 = null;
         _loc2_ = null;
         _loc2_ = new name_1398(const_1711[param1]);
         PanelModel(panelView).getPanel().visible = _loc2_.name_1407(1);
         this.var_426.visible = _loc2_.name_1407(const_1712) && Boolean(settingsService.showFPS);
         this.chat.visible = _loc2_.name_1407(name_557);
         this.var_419.visible = _loc2_.name_1407(const_1708);
         this.var_1896.visible = _loc2_.name_1407(const_1710);
         this.var_416.visible = _loc2_.name_1407(const_1709);
         var_360.method_823(_loc2_.name_1407(const_1707));
         var_1895.getBattlefieldData().name_661.visible = _loc2_.name_1407(const_95);
         Main.contentUILayer.visible = _loc2_.name_1407(const_95);
      }
      
      public function close() : void
      {
         display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         PanelModel(panelView).getPanel().visible = true;
         Main.contentUILayer.visible = true;
         this.var_426.visible = true;
         this.chat = null;
         this.var_419 = null;
         this.var_1896 = null;
         this.var_416 = null;
         this.var_426 = null;
      }
   }
}
