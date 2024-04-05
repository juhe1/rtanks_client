package alternativa.tanks.gui.settings.tabs
{
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.service.settings.name_1086;
   import controls.base.name_1134;
   import controls.checkbox.class_195;
   import controls.name_1891;
   import controls.name_2873;
   import package_280.name_2872;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_2871 extends SettingsTabView
   {
       
      
      private var var_3392:name_2873;
      
      public var bgSound:class_195;
      
      public function name_2871()
      {
         var _loc1_:name_1891 = null;
         var _loc2_:name_1134 = null;
         super();
         _loc1_ = new name_1891(SettingsWindow.name_2112 - 20,0,name_1891.name_2114);
         _loc2_ = new name_1134();
         _loc1_.addChild(_loc2_);
         _loc2_.text = localeService.getText(name_390.const_570);
         _loc2_.x = 8;
         this.var_3392 = new name_2873();
         this.var_3392.maxValue = 100;
         this.var_3392.minValue = 0;
         this.var_3392.tickInterval = 5;
         this.var_3392.x = int(_loc2_.x + _loc2_.textWidth + 8);
         this.var_3392.y = 8;
         this.var_3392.width = SettingsWindow.name_2112 - 2 * 8 - _loc2_.width - 30;
         this.var_3392.value = settingsService.soundVolume * 100;
         this.var_3392.addEventListener(name_2872.name_2874,this.method_560);
         _loc1_.addChild(this.var_3392);
         this.bgSound = method_1693(name_1086.name_2214,localeService.getText(name_390.const_1405),settingsService.bgSound,8,0);
         this.bgSound.x = int(8);
         this.bgSound.y = 8 + this.var_3392.y + this.var_3392.height;
         _loc1_.addChild(this.bgSound);
         _loc1_.height = 8 + this.bgSound.y + this.bgSound.height;
         _loc2_.y = this.var_3392.y + Math.round((this.var_3392.height - _loc2_.textHeight) * 0.5) - 2;
         addChild(_loc1_);
      }
      
      private function method_560(param1:name_2872) : void
      {
         settingsService.soundVolume = this.volume / 100;
      }
      
      override public function hide() : void
      {
         super.hide();
      }
      
      public function method_3060() : Boolean
      {
         return this.bgSound.checked;
      }
      
      public function method_3061(param1:Boolean) : void
      {
         this.bgSound.checked = param1;
      }
      
      public function get volume() : Number
      {
         return this.var_3392.value;
      }
      
      public function set volume(param1:Number) : void
      {
         this.var_3392.value = int(param1 * 100);
      }
      
      override public function destroy() : void
      {
         this.var_3392.removeEventListener(name_2872.name_2874,this.method_560);
         super.destroy();
      }
   }
}
