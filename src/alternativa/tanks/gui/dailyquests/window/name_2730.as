package alternativa.tanks.gui.dailyquests.window
{
   import alternativa.tanks.gui.dailyquests.window.buttons.name_3311;
   import alternativa.tanks.gui.dailyquests.window.buttons.name_3347;
   import controls.base.name_1890;
   import controls.TankWindowInner;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import package_267.name_326;
   import package_402.name_2138;
   import package_402.name_2159;
   
   public class name_2730 extends Sprite
   {
       
      
      private const const_2617:int = 10;
      
      private const const_2601:int = 120;
      
      private const const_2606:int = 280;
      
      private const const_2600:int = 4;
      
      private var var_1737:TankWindowInner;
      
      private var var_3387:DailyQuestItemViewInfoPanel;
      
      private var var_3388:Bitmap;
      
      private var var_1384:name_1890;
      
      private var dailyQuestInfo:name_326;
      
      public function name_2730(param1:name_326)
      {
         super();
         this.dailyQuestInfo = param1;
         this.method_3027();
         this.method_3025();
         this.method_3023();
         this.method_3047();
         this.method_3028();
      }
      
      private function method_3027() : void
      {
         this.var_1737 = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.var_1737.width = QuestWindow.const_2203;
         addChild(this.var_1737);
      }
      
      private function method_3025() : void
      {
         this.var_3388 = new Bitmap();
         this.var_3388.x = int(this.var_1737.width / 2 - 280 / 2);
         this.var_3388.y = 10;
         this.var_3388.bitmapData = this.dailyQuestInfo.image.data;
         this.var_1737.addChild(this.var_3388);
      }
      
      private function method_3023() : void
      {
         this.var_3387 = new DailyQuestItemViewInfoPanel(this.dailyQuestInfo);
         this.var_3387.x = 10;
         this.var_3387.y = 120 + 10 * 2;
         this.var_1737.addChild(this.var_3387);
      }
      
      private function method_3028() : void
      {
         this.var_1384 = this.method_3024();
         addChild(this.var_1384);
         this.method_3029();
      }
      
      private function method_3024() : name_1890
      {
         if(this.dailyQuestInfo.progress >= this.dailyQuestInfo.finishCriteria)
         {
            return this.method_3026();
         }
         return this.method_3042();
      }
      
      private function method_3042() : name_1890
      {
         var _loc1_:name_3311 = new name_3311();
         _loc1_.addEventListener(MouseEvent.CLICK,this.method_3041);
         if(this.dailyQuestInfo.canSkipForFree)
         {
            _loc1_.name_3313();
         }
         else
         {
            _loc1_.showButtonWithCrystals(this.dailyQuestInfo.skipCost);
         }
         return name_1890(_loc1_);
      }
      
      private function method_3041(param1:MouseEvent) : void
      {
         dispatchEvent(new name_2138(name_2138.DAILY_QUEST_CHANGE,this.dailyQuestInfo));
      }
      
      private function method_3026() : name_1890
      {
         var _loc1_:name_1890 = new name_3347();
         _loc1_.addEventListener(MouseEvent.CLICK,this.method_3022);
         return _loc1_;
      }
      
      private function method_3022(param1:MouseEvent) : void
      {
         this.var_1384.removeEventListener(MouseEvent.CLICK,this.method_3022);
         dispatchEvent(new name_2159(name_2159.DAILY_QUEST_GET_PRIZE,this.dailyQuestInfo));
      }
      
      private function method_3029() : void
      {
         this.var_1384.x = int(QuestWindow.const_2203 / 2 - this.var_1384.width / 2);
         this.var_1384.y = this.var_1737.height + QuestWindow.const_1598 - 4;
      }
      
      private function method_3047() : void
      {
         this.var_1737.height = this.var_3387.method_165() + 120 + 10 * 3;
      }
      
      public function name_2732(param1:name_326) : void
      {
         this.dailyQuestInfo = param1;
         this.var_3388.bitmapData = param1.image.data;
         this.var_3387.name_3312(param1);
         this.method_3047();
         this.method_3029();
      }
      
      public function name_2860(param1:int) : void
      {
         this.var_1737.height = param1 - (QuestWindow.const_1598 + this.var_1384.height);
         var _loc2_:int = param1 - this.method_3048();
         this.var_3387.name_3348(_loc2_);
         this.var_1384.y = param1 - this.var_1384.height - 4;
      }
      
      public function name_2733(param1:int) : void
      {
         this.dailyQuestInfo.canSkipForFree = false;
         this.dailyQuestInfo.skipCost = param1;
         name_3311(this.var_1384).showButtonWithCrystals(param1);
      }
      
      public function method_165() : int
      {
         return this.var_3387.method_165() + this.method_3048();
      }
      
      private function method_3048() : int
      {
         return 120 + 10 * 3 + QuestWindow.const_1598 + this.var_1384.height;
      }
      
      public function name_2728() : String
      {
         return this.dailyQuestInfo.questId;
      }
      
      public function name_2861() : void
      {
         var _loc1_:name_3311 = name_3311(this.var_1384);
         _loc1_.removeEventListener(MouseEvent.CLICK,this.method_3041);
         _loc1_.method_91();
      }
      
      public function name_2731() : Boolean
      {
         return this.var_1384 is name_3311;
      }
      
      public function name_2735() : void
      {
         this.var_1384.enabled = false;
      }
      
      public function name_2734() : void
      {
         this.var_1384.enabled = true;
      }
   }
}
