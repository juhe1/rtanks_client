package alternativa.tanks.gui.settings
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.gui.settings.tabs.SettingsTabView;
   import alternativa.tanks.gui.settings.tabs.name_2198;
   import controls.base.name_998;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import forms.name_1838;
   import package_253.name_789;
   import package_406.name_2196;
   import package_407.name_2197;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class SettingsWindow extends Sprite
   {
      
      public static var localeService:name_102 = name_102(OSGi.getInstance().name_6(name_102));
      
      public static const const_1598:int = 12;
      
      public static const const_1530:int = 33;
      
      public static const const_423:int = 104;
      
      private static const const_1518:int = 775;
      
      public static const name_2112:int = 751;
      
      private static const const_1519:int = 560;
      
      private static const const_422:int = 8;
      
      public static const const_1650:int = 462;
       
      
      private var name_983:name_998;
      
      private var var_1117:SettingsTabButtonList;
      
      private var var_1119:Dictionary;
      
      private var var_1118:SettingsTabView = null;
      
      public function SettingsWindow(param1:String, param2:Boolean, param3:Boolean, param4:Boolean, param5:String, param6:String)
      {
         var _loc8_:name_789 = null;
         var _loc7_:name_1838 = null;
         _loc8_ = null;
         this.var_1119 = new Dictionary();
         super();
         _loc7_ = name_1838.name_1844(localeService.getText(name_390.const_702));
         addChild(_loc7_);
         this.var_1117 = new SettingsTabButtonList();
         this.var_1117.name_1839(SettingsCategoryEnum.GAME);
         this.var_1117.name_1839(SettingsCategoryEnum.GRAPHIC);
         this.var_1117.name_1839(SettingsCategoryEnum.ACCOUNT);
         this.var_1117.name_1839(SettingsCategoryEnum.CONTROL);
         this.var_1117.name_1841(SettingsCategoryEnum.GAME);
         this.var_1117.y = 12;
         this.var_1117.x = 12;
         this.var_1117.addEventListener(SelectTabEvent.name_2199,this.method_1321);
         addChild(this.var_1117);
         var _loc9_:name_2198 = new name_2198();
         _loc9_.y = this.var_1117.y + this.var_1117.height + 8;
         _loc9_.x = 12;
         this.var_1119[SettingsCategoryEnum.GRAPHIC] = _loc9_;
         var _loc10_:name_2196 = new name_2196(param3);
         _loc10_.y = this.var_1117.y + this.var_1117.height + 8;
         _loc10_.x = 12;
         this.var_1119[SettingsCategoryEnum.GAME] = _loc10_;
         _loc8_ = new name_789(param1,param2,param4,param5,param6);
         _loc8_.y = this.var_1117.y + this.var_1117.height + 8;
         _loc8_.x = 12;
         this.var_1119[SettingsCategoryEnum.ACCOUNT] = _loc8_;
         var _loc11_:name_2197 = new name_2197();
         _loc11_.y = this.var_1117.y + this.var_1117.height + 8;
         _loc11_.x = 12;
         this.var_1119[SettingsCategoryEnum.CONTROL] = _loc11_;
         this.var_1117.name_1841(SettingsCategoryEnum.GAME);
         this.name_983 = new name_998();
         addChild(this.name_983);
         this.name_983.label = localeService.getText(name_390.const_1168);
         this.name_983.x = 775 - this.name_983.width - 12;
         this.name_983.y = 560 - this.name_983.height - 12;
         this.name_983.addEventListener(MouseEvent.CLICK,this.method_1475);
         _loc7_.height = 560;
         _loc7_.width = 775;
      }
      
      private function method_1321(param1:SelectTabEvent) : void
      {
         if(this.var_1118 != null && contains(this.var_1118))
         {
            this.var_1118.hide();
            removeChild(this.var_1118);
         }
         var _loc2_:SettingsTabView = this.var_1119[param1.name_2200()];
         if(_loc2_ != null)
         {
            this.var_1118 = _loc2_;
            addChild(this.var_1118);
            this.var_1118.show();
         }
      }
      
      private function method_1475(param1:MouseEvent = null) : void
      {
         this.method_1927();
      }
      
      private function method_1927() : void
      {
         dispatchEvent(new name_997(name_997.name_1030));
      }
      
      public function name_984() : name_789
      {
         return this.var_1119[SettingsCategoryEnum.ACCOUNT];
      }
      
      public function destroy() : void
      {
         var _loc1_:SettingsTabView = null;
         this.name_983.removeEventListener(MouseEvent.CLICK,this.method_1475);
         this.var_1117.removeEventListener(SelectTabEvent.name_2199,this.method_1321);
         this.var_1117.destroy();
         for each(_loc1_ in this.var_1119)
         {
            _loc1_.destroy();
         }
      }
   }
}
