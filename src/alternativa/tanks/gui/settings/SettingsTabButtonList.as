package alternativa.tanks.gui.settings
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.gui.settings.controls.name_2515;
   import alternativa.tanks.gui.settings.controls.name_2875;
   import alternativa.tanks.gui.settings.tabs.SettingsTabView;
   import base.class_122;
   import controls.containers.HorizontalStackPanel;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class SettingsTabButtonList extends class_122
   {
      
      public static var localeService:name_102 = OSGi.getInstance().getService(name_102) as name_102;
       
      
      private var var_2863:Dictionary;
      
      private var var_2542:Vector.<name_2875>;
      
      private var name_1552:SettingsCategoryEnum;
      
      private var var_2573:HorizontalStackPanel;
      
      public function SettingsTabButtonList()
      {
         this.var_2863 = new Dictionary();
         this.var_2542 = new Vector.<name_2875>();
         this.var_2573 = new HorizontalStackPanel();
         super();
         this.var_2573.name_2121(SettingsTabView.const_422);
         addChild(this.var_2573);
      }
      
      public function name_1839(param1:SettingsCategoryEnum) : void
      {
         switch(param1)
         {
            case SettingsCategoryEnum.GAME:
               this.var_2573.addItem(this.method_2512(SettingsCategoryEnum.GAME,localeService.getText(name_390.const_726),name_2515.name_2878));
               break;
            case SettingsCategoryEnum.GRAPHIC:
               this.var_2573.addItem(this.method_2512(SettingsCategoryEnum.GRAPHIC,localeService.getText(name_390.const_1217),name_2515.name_2879));
               break;
            case SettingsCategoryEnum.ACCOUNT:
               this.var_2573.addItem(this.method_2512(SettingsCategoryEnum.ACCOUNT,localeService.getText(name_390.const_1301),name_2515.name_2877));
               break;
            case SettingsCategoryEnum.CONTROL:
               this.var_2573.addItem(this.method_2512(SettingsCategoryEnum.CONTROL,localeService.getText(name_390.const_956),name_2515.name_2876));
         }
      }
      
      private function method_2512(param1:SettingsCategoryEnum, param2:String, param3:Class) : name_2875
      {
         var _loc4_:name_2875 = new name_2875(param1,param2,param3);
         this.var_2863[param1] = _loc4_;
         _loc4_.width = SettingsWindow.const_423;
         this.var_2542.push(_loc4_);
         _loc4_.addEventListener(MouseEvent.CLICK,this.method_1582);
         return _loc4_;
      }
      
      private function method_1582(param1:MouseEvent) : void
      {
         var _loc2_:SettingsCategoryEnum = param1.currentTarget.getCategory();
         if(this.name_1552 != _loc2_)
         {
            this.name_1841(_loc2_);
         }
      }
      
      public function name_1841(param1:SettingsCategoryEnum) : void
      {
         if(Boolean(this.name_1552))
         {
            this.var_2863[this.name_1552].enabled = true;
         }
         this.var_2863[param1].enabled = false;
         this.name_1552 = param1;
         dispatchEvent(new SelectTabEvent(param1));
      }
      
      override public function get height() : Number
      {
         return this.var_2542[0].height;
      }
      
      override public function get width() : Number
      {
         return this.var_2573.width;
      }
      
      public function destroy() : void
      {
         var _loc1_:name_2875 = null;
         for each(_loc1_ in this.var_2542)
         {
            _loc1_.removeEventListener(MouseEvent.CLICK,this.method_1582);
         }
      }
   }
}
