package package_407
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.gui.settings.tabs.ScrollableSettingsTabView;
   import alternativa.tanks.service.settings.name_1086;
   import base.class_122;
   import controls.base.name_1134;
   import controls.containers.VerticalStackPanel;
   import controls.name_1891;
   import controls.name_2873;
   import package_18.name_34;
   import package_280.name_2872;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_2197 extends ScrollableSettingsTabView
   {
      
      public static const const_2224:int = 1;
      
      public static const const_2223:int = 20;
      
      public static var fullScreenService:name_34 = name_34(OSGi.getInstance().name_6(name_34));
       
      
      private var mouseSensitivity:name_2873;
      
      public function name_2197()
      {
         super();
         var _loc1_:name_1891 = new name_1891(SettingsWindow.name_2112,SettingsWindow.const_1650,name_1891.name_2114);
         addChildAt(_loc1_,0);
         var _loc2_:VerticalStackPanel = new VerticalStackPanel();
         _loc2_.name_2121(8);
         _loc2_.x = 8;
         _loc2_.y = 3;
         if(!fullScreenService.method_293())
         {
            _loc2_.addItem(this.method_2693());
         }
         _loc2_.addItem(method_1693(name_1086.name_2208,localeService.getText(name_390.const_981),settingsService.inverseBackDriving));
         _loc2_.addItem(new KeyBindingsPanel());
         addItem(_loc2_);
      }
      
      private function method_2693() : class_122
      {
         var _loc1_:VerticalStackPanel = new VerticalStackPanel();
         _loc1_.name_2121(8);
         _loc1_.addItem(method_1693(name_1086.name_2212,localeService.getText(name_390.const_925),settingsService.mouseControl));
         _loc1_.addItem(this.method_2692());
         _loc1_.addItem(method_1693(name_1086.name_2213,localeService.getText(name_390.const_1410),settingsService.mouseYInverse));
         _loc1_.addItem(method_1693(name_1086.name_2220,localeService.getText(name_390.const_1179),settingsService.mouseYInverseShaftAim));
         return _loc1_;
      }
      
      private function method_2692() : class_122
      {
         var _loc1_:class_122 = null;
         var _loc2_:name_1134 = null;
         _loc1_ = new class_122();
         _loc2_ = new name_1134();
         _loc2_.text = localeService.getText(name_390.const_770) + ":";
         _loc1_.addChild(_loc2_);
         this.mouseSensitivity = new name_2873();
         this.mouseSensitivity.maxValue = 20;
         this.mouseSensitivity.minValue = 1;
         this.mouseSensitivity.tickInterval = 1;
         this.mouseSensitivity.width = SettingsWindow.name_2112 - 8 * 4 - _loc2_.width;
         this.mouseSensitivity.x = _loc2_.width + 8;
         this.mouseSensitivity.value = settingsService.mouseSensitivity;
         this.mouseSensitivity.addEventListener(name_2872.name_2874,this.method_2691);
         _loc2_.y = Math.round((this.mouseSensitivity.height - _loc2_.textHeight) * 0.5) - 2;
         _loc1_.addChild(this.mouseSensitivity);
         return _loc1_;
      }
      
      private function method_2691(param1:name_2872) : void
      {
         settingsService.method_588(name_1086.name_2219,this.mouseSensitivity.value);
      }
      
      override public function destroy() : void
      {
         if(!fullScreenService.method_293())
         {
            this.mouseSensitivity.removeEventListener(name_2872.name_2874,this.method_2691);
         }
         super.destroy();
      }
   }
}
