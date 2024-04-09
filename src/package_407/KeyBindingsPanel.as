package package_407
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.gui.settings.tabs.SettingsTabView;
   import base.class_122;
   import controls.base.DefaultButtonBase;
   import controls.containers.StackPanel;
   import controls.containers.VerticalStackPanel;
   import flash.events.MouseEvent;
   import package_33.GameActionEnum;
   import package_33.name_276;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class KeyBindingsPanel extends class_122
   {
      
      public static var keysBindingService:name_276 = name_276(OSGi.getInstance().getService(name_276));
      
      public static var localeService:name_102 = name_102(OSGi.getInstance().getService(name_102));
       
      
      private var var_3399:VerticalStackPanel;
      
      private var var_3401:Vector.<KeyBinding>;
      
      private var var_3400:DefaultButtonBase;
      
      public function KeyBindingsPanel()
      {
         this.var_3399 = new VerticalStackPanel();
         this.var_3401 = new Vector.<KeyBinding>();
         this.var_3400 = new DefaultButtonBase();
         super();
         this.var_3400.label = localeService.getText(name_390.const_605);
         this.var_3400.width = 250;
         this.var_3400.addEventListener(MouseEvent.CLICK,this.method_822);
         addChild(this.var_3400);
         this.var_3399.name_2121(SettingsTabView.const_422 * 2);
         this.var_3399.addItem(this.method_3067());
         this.var_3399.addItem(this.method_3069());
         this.var_3399.addItem(this.method_3070());
         this.var_3399.addItem(this.method_3071());
         this.var_3399.addItem(this.method_3066());
         this.var_3399.addItem(this.method_3068());
         this.var_3399.y = SettingsTabView.const_422 + this.var_3400.height;
         addChild(this.var_3399);
      }
      
      private function method_822(param1:MouseEvent) : void
      {
         var _loc2_:KeyBinding = null;
         keysBindingService.method_822();
         for each(_loc2_ in this.var_3401)
         {
            _loc2_.name_3352();
         }
      }
      
      private function method_3067() : StackPanel
      {
         var _loc1_:StackPanel = new VerticalStackPanel();
         _loc1_.addItem(this.method_3065(GameActionEnum.ROTATE_TURRET_LEFT,localeService.getText(name_390.const_1032)));
         _loc1_.addItem(this.method_3065(GameActionEnum.ROTATE_TURRET_RIGHT,localeService.getText(name_390.const_749)));
         _loc1_.addItem(this.method_3065(GameActionEnum.CENTER_TURRET,localeService.getText(name_390.const_1429)));
         _loc1_.addItem(this.method_3065(GameActionEnum.SHOT,localeService.getText(name_390.const_1009)));
         return _loc1_;
      }
      
      private function method_3069() : StackPanel
      {
         var _loc1_:StackPanel = new VerticalStackPanel();
         _loc1_.addItem(this.method_3065(GameActionEnum.CHASSIS_LEFT_MOVEMENT,localeService.getText(name_390.const_1223)));
         _loc1_.addItem(this.method_3065(GameActionEnum.CHASSIS_FORWARD_MOVEMENT,localeService.getText(name_390.const_878)));
         _loc1_.addItem(this.method_3065(GameActionEnum.CHASSIS_RIGHT_MOVEMENT,localeService.getText(name_390.const_1076)));
         _loc1_.addItem(this.method_3065(GameActionEnum.CHASSIS_BACKWARD_MOVEMENT,localeService.getText(name_390.const_1289)));
         return _loc1_;
      }
      
      private function method_3070() : StackPanel
      {
         var _loc1_:StackPanel = new VerticalStackPanel();
         _loc1_.addItem(this.method_3065(GameActionEnum.USE_FIRS_AID,localeService.getText(name_390.const_604)));
         _loc1_.addItem(this.method_3065(GameActionEnum.USE_DOUBLE_ARMOR,localeService.getText(name_390.const_679)));
         _loc1_.addItem(this.method_3065(GameActionEnum.USE_DOUBLE_DAMAGE,localeService.getText(name_390.const_1060)));
         _loc1_.addItem(this.method_3065(GameActionEnum.USE_NITRO,localeService.getText(name_390.const_1292)));
         _loc1_.addItem(this.method_3065(GameActionEnum.USE_MINE,localeService.getText(name_390.const_957)));
         return _loc1_;
      }
      
      private function method_3066() : StackPanel
      {
         var _loc1_:StackPanel = new VerticalStackPanel();
         _loc1_.addItem(this.method_3065(GameActionEnum.BATTLE_VIEW_INCREASE,localeService.getText(name_390.const_1357)));
         _loc1_.addItem(this.method_3065(GameActionEnum.BATTLE_VIEW_DECREASE,localeService.getText(name_390.const_554)));
         _loc1_.addItem(this.method_3065(GameActionEnum.FULL_SCREEN,localeService.getText(name_390.const_1115)));
         _loc1_.addItem(this.method_3065(GameActionEnum.OPEN_GARAGE,localeService.getText(name_390.const_547)));
         return _loc1_;
      }
      
      private function method_3071() : StackPanel
      {
         var _loc1_:StackPanel = new VerticalStackPanel();
         _loc1_.addItem(this.method_3065(GameActionEnum.DROP_FLAG,localeService.getText(name_390.const_735)));
         _loc1_.addItem(this.method_3065(GameActionEnum.BATTLE_PAUSE,localeService.getText(name_390.const_851)));
         _loc1_.addItem(this.method_3065(GameActionEnum.SHOW_TANK_PARAMETERS,localeService.getText(name_390.const_863)));
         return _loc1_;
      }
      
      private function method_3068() : StackPanel
      {
         var _loc1_:StackPanel = new VerticalStackPanel();
         _loc1_.addItem(this.method_3065(GameActionEnum.FOLLOW_CAMERA_UP,localeService.getText(name_390.const_1440)));
         _loc1_.addItem(this.method_3065(GameActionEnum.FOLLOW_CAMERA_DOWN,localeService.getText(name_390.const_1165)));
         return _loc1_;
      }
      
      private function method_3065(param1:GameActionEnum, param2:String) : KeyBinding
      {
         var _loc3_:KeyBinding = new KeyBinding(param1,param2,SettingsTabView.const_422,SettingsWindow.name_2112);
         this.var_3401.push(_loc3_);
         return _loc3_;
      }
      
      public function destroy() : void
      {
         var _loc1_:KeyBinding = null;
         this.var_3400.removeEventListener(MouseEvent.CLICK,this.method_822);
         for each(_loc1_ in this.var_3401)
         {
            _loc1_.destroy();
         }
         this.var_3399 = null;
         this.var_3401 = null;
      }
   }
}
