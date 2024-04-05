package alternativa.tanks.gui.settings.tabs
{
   import alternativa.tanks.gui.settings.controls.name_2108;
   import alternativa.tanks.gui.settings.controls.name_2109;
   import alternativa.tanks.service.settings.name_108;
   import alternativa.tanks.service.settings.name_1086;
   import base.class_122;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import package_1.Main;
   import package_54.name_102;
   
   public class SettingsTabView extends class_122
   {
      
      public static const const_422:int = 8;
      
      public static const const_1585:int = 10;
      
      public static const const_1586:int = 3;
      
      public static var localeService:name_102 = Main.osgi.name_6(name_102) as name_102;
      
      public static var settingsService:name_108 = Main.osgi.name_6(name_108) as name_108;
       
      
      protected var var_1498:Vector.<DisplayObject>;
      
      public function SettingsTabView()
      {
         this.var_1498 = new Vector.<DisplayObject>();
         super();
      }
      
      public function show() : void
      {
      }
      
      public function hide() : void
      {
      }
      
      protected function method_1693(param1:name_1086, param2:String, param3:Boolean, param4:int = 0, param5:int = 0) : name_2109
      {
         var _loc6_:name_2109 = new name_2109(param1,param2);
         _loc6_.checked = param3;
         _loc6_.addEventListener(MouseEvent.CLICK,this.method_1692);
         _loc6_.x = param4;
         _loc6_.y = param5;
         this.var_1498.push(_loc6_);
         _loc6_.label = param2;
         return _loc6_;
      }
      
      protected function method_1692(param1:MouseEvent) : void
      {
         var _loc2_:name_2108 = null;
         if(param1.currentTarget is name_2108)
         {
            _loc2_ = name_2108(param1.currentTarget);
            settingsService.method_588(_loc2_.name_1383(),_loc2_.name_2110());
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:DisplayObject = null;
         for each(_loc1_ in this.var_1498)
         {
            _loc1_.removeEventListener(MouseEvent.CLICK,this.method_1692);
         }
      }
   }
}
