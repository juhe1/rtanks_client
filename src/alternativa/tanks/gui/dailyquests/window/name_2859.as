package alternativa.tanks.gui.dailyquests.window
{
   import alternativa.osgi.OSGi;
   import controls.base.LabelBase;
   import controls.TankWindowInner;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.text.TextFormatAlign;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_2859 extends Sprite
   {
      
      public static var localeService:name_102 = OSGi.getInstance().getService(name_102) as name_102;
       
      
      private const const_2609:uint = 16777215;
      
      private const const_2601:int = 120;
      
      private const const_2606:int = 280;
      
      private const const_2617:int = 10;
      
      private const const_2618:int = 5;
      
      private var var_1737:TankWindowInner;
      
      private var var_3366:LabelBase;
      
      public function name_2859()
      {
         super();
         this.method_3027();
         this.method_3025();
         this.method_1627();
         this.method_3047();
      }
      
      private function method_3027() : void
      {
         this.var_1737 = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.var_1737.width = QuestWindow.const_2201;
         addChild(this.var_1737);
      }
      
      private function method_3025() : void
      {
         var _loc1_:Bitmap = null;
         _loc1_ = new Bitmap();
         _loc1_.x = int(this.var_1737.width / 2 - 280 / 2);
         _loc1_.y = 10;
         _loc1_.bitmapData = DailyQuestItemViewBitmaps.name_3349;
         this.var_1737.addChild(_loc1_);
      }
      
      private function method_1627() : void
      {
         this.var_3366 = new LabelBase();
         this.var_3366.color = 16777215;
         this.var_3366.align = TextFormatAlign.CENTER;
         this.var_3366.text = localeService.getText(name_390.const_1078);
         this.var_3366.x = int(QuestWindow.const_2201 / 2 - this.var_3366.width / 2);
         this.var_3366.y = 120 + 10 * 2;
         this.var_1737.addChild(this.var_3366);
      }
      
      private function method_3047() : void
      {
         this.var_1737.height = this.var_3366.height + 120 + 10 * 3;
      }
      
      public function method_165() : int
      {
         return this.var_1737.height + 5;
      }
   }
}
