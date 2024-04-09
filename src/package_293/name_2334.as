package package_293
{
   import assets.name_2295;
   import controls.Money;
   import package_1.Main;
   import package_54.name_102;
   import package_60.TextConst;
   
   public class name_2334 extends IconField
   {
       
      
      private var var_2994:name_2295;
      
      public function name_2334(param1:int)
      {
         this.var_2994 = new name_2295();
         super(param1);
      }
      
      override protected function init() : void
      {
         super.init();
         addChild(this.var_2994);
         this.var_2994.y = 4;
         this.update();
      }
      
      public function name_2337(param1:int) : void
      {
         var _loc2_:name_102 = name_102(Main.osgi.getService(name_102));
         var _loc3_:String = String(_loc2_.getText(TextConst.BATTLE_FUND));
         label.text = _loc3_ + ": " + Money.name_876(param1,false);
         this.update();
      }
      
      private function update() : void
      {
         this.var_2994.x = label.x + label.width + 2;
      }
   }
}
