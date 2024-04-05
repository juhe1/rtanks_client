package alternativa.tanks.model.quest.common.gui.window.buttons
{
   import alternativa.osgi.OSGi;
   import assets.name_2295;
   import controls.Money;
   import controls.base.name_1890;
   import controls.labels.name_2551;
   import flash.display.Sprite;
   import package_279.class_27;
   import package_279.name_979;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_3311 extends name_1890 implements name_979
   {
      
      public static var localeService:name_102 = OSGi.getInstance().name_6(name_102) as name_102;
      
      public static var var_644:class_27 = OSGi.getInstance().name_6(class_27) as class_27;
      
      private static const const_2818:int = 16731648;
      
      private static const const_2817:int = 16777215;
       
      
      private var var_2229:name_2551;
      
      private var crystals:int;
      
      public function name_3311()
      {
         super();
         this.var_2229 = new name_2551();
         this.var_2229.size = 11;
         super.name_1342(localeService.getText(name_390.const_1194));
         var_644.addListener(this);
      }
      
      public function showButtonWithCrystals(param1:int) : void
      {
         this.crystals = param1;
         var _loc2_:name_2295 = new name_2295();
         _loc2_.y = 3;
         var _loc3_:Sprite = new Sprite();
         _loc3_.addChild(this.var_2229);
         _loc3_.addChild(_loc2_);
         addChild(_loc3_);
         this.var_2229.text = Money.name_876(param1,false);
         this.var_2229.x = int(_width / 2 - (this.var_2229.width + _loc2_.width) / 2);
         _loc2_.x = this.var_2229.x + this.var_2229.textWidth + 7;
         this.method_3267();
         super.method_2300(var_2223,_loc3_);
      }
      
      public function name_3313() : void
      {
         super.method_2298(var_2223);
      }
      
      public function name_1054(param1:int) : void
      {
         this.method_3267();
      }
      
      private function method_3267() : void
      {
         this.var_2229.textColor = var_644.crystal < this.crystals ? uint(16731648) : uint(16777215);
      }
      
      public function method_91() : void
      {
         var_644.removeListener(this);
      }
   }
}
