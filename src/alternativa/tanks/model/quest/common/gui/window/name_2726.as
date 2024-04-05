package alternativa.tanks.model.quest.common.gui.window
{
   import alternativa.tanks.model.quest.common.gui.CommonQuestTab;
   import alternativa.tanks.model.quest.common.gui.window.buttons.name_3305;
   import controls.base.name_1890;
   import controls.name_1891;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import package_115.class_60;
   import package_118.QuestLevel;
   import package_383.name_2137;
   import projects.tanks.client.panel.model.quest.QuestTypeEnum;
   
   public class name_2726 extends Sprite
   {
      
      public static const const_2602:int = 30;
      
      public static const const_2601:int = 120;
       
      
      public const const_2600:int = 4;
      
      protected var var_1737:name_1891;
      
      protected var var_3357:QuestItemViewInfoPanel;
      
      protected var questImage:Bitmap;
      
      protected var var_1384:name_1890;
      
      protected var var_3356:class_60;
      
      public function name_2726(param1:class_60)
      {
         super();
         this.var_3356 = param1;
         this.method_3027();
         this.method_3025();
         this.method_3023();
         this.method_3028();
      }
      
      private function method_3027() : void
      {
         this.var_1737 = new name_1891(0,0,name_1891.name_1428);
         this.var_1737.width = CommonQuestTab.const_2043;
         this.var_1737.height = CommonQuestTab.const_2042;
         addChild(this.var_1737);
      }
      
      private function method_3025() : void
      {
         this.questImage = new Bitmap();
         this.questImage.x = int(this.var_1737.width / 2 - CommonQuestTab.const_2043 / 2);
         this.questImage.y = 30;
         this.questImage.bitmapData = this.var_3356.image.data;
         this.var_1737.addChild(this.questImage);
      }
      
      private function method_3023() : void
      {
         var _loc1_:int = CommonQuestTab.const_2042 - QuestWindow.const_1516 - 120 - 30 * 2;
         var _loc2_:int = CommonQuestTab.const_2043 - 2 * QuestWindow.const_1516;
         this.var_3357 = new QuestItemViewInfoPanel(this.var_3356,_loc2_,_loc1_);
         this.var_3357.x = QuestWindow.const_1516;
         this.var_3357.y = 120 + 30 * 2;
         this.var_1737.addChild(this.var_3357);
      }
      
      private function method_3028() : void
      {
         this.var_1384 = this.method_3024();
         addChild(this.var_1384);
         this.method_3029();
      }
      
      protected function method_3024() : name_1890
      {
         return this.method_3026();
      }
      
      protected function method_3026() : name_1890
      {
         var _loc1_:name_1890 = new name_3305();
         _loc1_.addEventListener(MouseEvent.CLICK,this.method_3022);
         return _loc1_;
      }
      
      private function method_3022(param1:MouseEvent) : void
      {
         this.var_1384.removeEventListener(MouseEvent.CLICK,this.method_3022);
         dispatchEvent(new name_2137(name_2137.name_2139,this.var_3356.questId));
      }
      
      private function method_3029() : void
      {
         this.var_1384.x = int(CommonQuestTab.const_2043 / 2 - this.var_1384.width / 2);
         this.var_1384.y = this.var_1737.height + QuestWindow.const_1517 - 4;
      }
      
      public function name_2728() : String
      {
         return this.var_3356.questId;
      }
      
      public function name_2729() : QuestLevel
      {
         return this.var_3356.level;
      }
      
      public function getQuestType() : QuestTypeEnum
      {
         return null;
      }
      
      public function destroy() : void
      {
         if(this.var_1384 is name_3305 && this.var_1384.hasEventListener(MouseEvent.CLICK))
         {
            this.var_1384.removeEventListener(MouseEvent.CLICK,this.method_3022);
         }
      }
   }
}
