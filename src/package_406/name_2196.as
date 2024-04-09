package package_406
{
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.gui.settings.tabs.SettingsTabView;
   import alternativa.tanks.gui.settings.tabs.name_2871;
   import alternativa.tanks.service.settings.name_1086;
   import controls.Label;
   import controls.checkbox.CheckBoxBase;
   import controls.containers.StackPanel;
   import controls.containers.VerticalStackPanel;
   import controls.TankWindowInner;
   import flash.net.SharedObject;
   import package_1.Main;
   import package_95.IStorageService;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_2196 extends SettingsTabView
   {
       
      
      private var storage:SharedObject;
      
      private var var_2858:name_2871;
      
      private var var_2860:CheckBoxBase;
      
      private var var_2859:CheckBoxBase;
      
      public function name_2196(param1:Boolean)
      {
         var _loc5_:StackPanel = null;
         super();
         this.storage = IStorageService(Main.osgi.getService(IStorageService)).getStorage();
         var _loc2_:VerticalStackPanel = new VerticalStackPanel();
         _loc2_.x = 8;
         _loc2_.y = 8;
         _loc2_.name_2121(8);
         this.var_2860 = method_1693(name_1086.SHOW_DAMAGE,localeService.getText(name_390.const_1294),settingsService.showDamage);
         _loc2_.addItem(this.var_2860);
         _loc2_.addItem(method_1693(name_1086.name_2202,localeService.getText(name_390.const_992),settingsService.showDropZones));
         _loc2_.addItem(method_1693(name_1086.name_1381,localeService.getText(name_390.const_1250),settingsService.alternateCamera));
         var _loc3_:VerticalStackPanel = new VerticalStackPanel();
         _loc3_.name_2121(8);
         _loc3_.y = 8;
         _loc3_.x = SettingsWindow.name_2112 * 0.5;
         this.var_2859 = method_1693(name_1086.name_2209,localeService.getText(name_390.const_843),settingsService.showChat);
         _loc3_.addItem(this.var_2859);
         var _loc4_:TankWindowInner = new TankWindowInner(SettingsWindow.name_2112,_loc2_.height + 2 * 8,TankWindowInner.name_2114);
         _loc4_.addChild(_loc2_);
         _loc4_.addChild(_loc3_);
         addChild(_loc4_);
         _loc5_ = new StackPanel();
         _loc5_ = this.method_2688();
         _loc5_.y = _loc4_.y + _loc4_.height + 10;
         addChild(_loc5_);
      }
      
      private function method_2688() : StackPanel
      {
         var _loc1_:VerticalStackPanel = new VerticalStackPanel();
         _loc1_.name_2121(3);
         var _loc2_:Label = new Label();
         _loc2_.text = localeService.getText(name_390.const_570);
         _loc1_.addItem(_loc2_);
         this.var_2858 = new name_2871();
         _loc1_.addItem(this.var_2858);
         return _loc1_;
      }
      
      protected function method_2689(param1:String, param2:Boolean, param3:int = 0, param4:int = 0) : CheckBoxBase
      {
         var _loc5_:CheckBoxBase = new CheckBoxBase();
         _loc5_.checked = param2;
         _loc5_.x = param3;
         _loc5_.y = param4;
         _loc5_.label = param1;
         return _loc5_;
      }
      
      override public function destroy() : void
      {
         this.var_2858.destroy();
         super.destroy();
      }
   }
}
