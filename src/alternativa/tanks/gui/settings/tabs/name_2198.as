package alternativa.tanks.gui.settings.tabs
{
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.gui.settings.controls.GridLayout;
   import alternativa.tanks.service.settings.name_1086;
   import controls.checkbox.class_195;
   import controls.name_1891;
   import flash.events.MouseEvent;
   import flash.net.SharedObject;
   import package_1.Main;
   import package_3.GPUCapabilities;
   import package_95.name_298;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_2198 extends SettingsTabView
   {
       
      
      private var var_2847:name_1891;
      
      private var var_2846:class_195;
      
      private var var_2851:class_195;
      
      private var var_2848:class_195;
      
      private var var_2853:class_195;
      
      private var var_2850:class_195;
      
      private var var_2856:class_195;
      
      private var var_2855:class_195;
      
      private var var_2849:class_195;
      
      private var var_2854:class_195;
      
      private var var_2845:class_195;
      
      private var var_2857:class_195;
      
      private var var_2852:class_195;
      
      private var var_2844:class_195;
      
      private var storage:SharedObject;
      
      public function name_2198()
      {
         this.storage = name_298(Main.osgi.name_6(name_298)).getStorage();
         var _loc1_:int = 0;
         super();
         this.var_2847 = new name_1891(0,0,name_1891.name_2114);
         this.var_2847.width = SettingsWindow.name_2112;
         this.var_2847.y = 0;
         this.var_2847.x = 0;
         addChild(this.var_2847);
         this.var_2846 = method_1693(name_1086.name_2215,localeService.getText(name_390.const_785),settingsService.showFPS);
         addChild(this.var_2846);
         this.var_2851 = method_1693(name_1086.name_2206,localeService.getText(name_390.const_1129),settingsService.adaptiveFPS);
         addChild(this.var_2851);
         this.var_2848 = method_1693(name_1086.name_2211,localeService.getText(name_390.const_1144),settingsService.showSkyBox);
         addChild(this.var_2848);
         this.var_2856 = method_1693(name_1086.name_2216,localeService.getText(name_390.const_1177),settingsService.mipMapping);
         addChild(this.var_2856);
         var _loc2_:GridLayout = new GridLayout(8,8,SettingsWindow.name_2112 * 0.5,this.var_2846.height + 8);
         if(this.method_2686())
         {
            this.var_2855 = method_1693(name_1086.FOG,localeService.getText(name_390.const_1183),settingsService.fog);
            addChild(this.var_2855);
            this.var_2849 = method_1693(name_1086.name_2205,localeService.getText(name_390.const_1141),settingsService.shadows);
            addChild(this.var_2849);
            this.var_2854 = method_1693(name_1086.name_2207,localeService.getText(name_390.const_666),settingsService.dynamicShadows);
            addChild(this.var_2854);
            this.var_2845 = method_1693(name_1086.name_2204,localeService.getText(name_390.const_797),settingsService.softParticles);
            addChild(this.var_2845);
            this.var_2845.addEventListener(MouseEvent.CLICK,this.method_2682);
            this.var_2857 = method_1693(name_1086.name_2217,localeService.getText(name_390.const_990),settingsService.dust);
            addChild(this.var_2857);
            this.var_2852 = method_1693(name_1086.SSAO,localeService.getText(name_390.const_643),settingsService.ssao);
            addChild(this.var_2852);
            this.var_2853 = method_1693(name_1086.name_2218,localeService.getText(name_390.const_1374),settingsService.antialiasing);
            addChild(this.var_2853);
            this.var_2850 = method_1693(name_1086.name_2210,localeService.getText(name_390.const_1161),settingsService.dynamicLighting);
            addChild(this.var_2850);
            this.method_2685();
            _loc1_ = this.method_2684(_loc2_);
            if(this.var_2844.checked)
            {
               _loc1_ = this.var_2844.y + this.var_2844.height;
            }
         }
         else
         {
            _loc1_ = this.method_2687(_loc2_);
         }
         this.var_2847.height = _loc1_ + 8;
      }
      
      private function method_2686() : Boolean
      {
         return GPUCapabilities.method_95 && !GPUCapabilities.constrained;
      }
      
      private function method_2682(param1:MouseEvent) : void
      {
         this.method_2683();
      }
      
      private function method_2683() : void
      {
         this.var_2857.visible = Boolean(this.var_2845) && !this.var_2844.checked && this.var_2845.checked;
      }
      
      private function method_2685() : void
      {
         this.var_2844 = method_1693(name_1086.name_2201,localeService.getText(name_390.const_544),settingsService.graphicsAutoQuality);
         addChild(this.var_2844);
         this.method_2681();
         this.var_2844.addEventListener(MouseEvent.CLICK,this.method_2681);
      }
      
      private function method_2681(param1:MouseEvent = null) : void
      {
         var _loc2_:Boolean = !this.var_2844.checked;
         this.var_2855.visible = _loc2_;
         this.var_2849.visible = _loc2_;
         this.var_2854.visible = _loc2_;
         this.var_2845.visible = _loc2_;
         this.var_2852.visible = _loc2_;
         this.var_2850.visible = _loc2_;
         this.var_2853.visible = _loc2_;
         this.var_2847.height = _loc2_ ? Number(7 * this.var_2846.height + 8 * 8) : Number(3 * this.var_2846.height + 4 * 8);
         this.method_2683();
      }
      
      private function method_2687(param1:GridLayout) : int
      {
         return param1.layout([[this.var_2846,this.var_2851],[this.var_2848,this.var_2856]]);
      }
      
      private function method_2684(param1:GridLayout) : int
      {
         return param1.layout([[this.var_2846,this.var_2851],[this.var_2848,this.var_2856],[this.var_2844],[this.var_2854,this.var_2852],[this.var_2850,this.var_2855],[this.var_2849,this.var_2853],[this.var_2845,this.var_2857]]);
      }
      
      override public function destroy() : void
      {
         this.var_2844.removeEventListener(MouseEvent.CLICK,this.method_2681);
         this.var_2845.removeEventListener(MouseEvent.CLICK,this.method_2682);
         super.destroy();
      }
   }
}
