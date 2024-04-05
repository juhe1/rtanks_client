package alternativa.tanks.model.quest.common.gui.window
{
   import alternativa.tanks.model.quest.common.gui.CommonQuestTab;
   import alternativa.tanks.model.quest.common.gui.NoQuestBitmap;
   import alternativa.tanks.model.quest.common.gui.window.buttons.name_3310;
   import controls.base.name_1134;
   import controls.name_1891;
   import controls.timer.CountDownTimer;
   import controls.timer.name_3298;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.text.TextFormatAlign;
   import package_470.name_3309;
   
   public class name_2727 extends Sprite
   {
       
      
      private const const_2609:uint = 16777215;
      
      private var var_1737:name_1891;
      
      private var var_3366:name_1134;
      
      private var var_3367:name_3309;
      
      private var _width:int;
      
      private var _height:int;
      
      private var timer:CountDownTimer;
      
      public function name_2727(param1:int, param2:int, param3:String, param4:int)
      {
         super();
         this._width = param1;
         this._height = param2;
         this.method_3027();
         this.method_3038(param4);
         this.method_3025();
         this.method_3039();
         this.method_1627(param3);
         this.method_3037();
      }
      
      private function method_3027() : void
      {
         this.var_1737 = new name_1891(0,0,name_1891.name_1428);
         this.var_1737.width = CommonQuestTab.const_2043;
         this.var_1737.height = CommonQuestTab.const_2042;
         addChild(this.var_1737);
      }
      
      private function method_3038(param1:int) : void
      {
         this.timer = new CountDownTimer();
         this.timer.start(param1 * 1000);
         var _loc2_:name_3298 = new name_3298(false);
         _loc2_.y = QuestWindow.const_1516;
         this.var_1737.addChild(_loc2_);
         _loc2_.start(this.timer);
         _loc2_.x = QuestWindow.const_1516;
      }
      
      private function method_3025() : void
      {
         var _loc1_:Bitmap = null;
         _loc1_ = null;
         _loc1_ = new Bitmap();
         _loc1_.x = int(this.var_1737.width / 2 - CommonQuestTab.const_2043 / 2);
         _loc1_.y = name_2726.const_2602;
         _loc1_.bitmapData = NoQuestBitmap.DATA;
         this.var_1737.addChild(_loc1_);
      }
      
      private function method_3039() : void
      {
         var _loc1_:int = name_2726.const_2601 + name_2726.const_2602 * 2;
         var _loc2_:int = CommonQuestTab.const_2042 - QuestWindow.const_1516 - _loc1_;
         this.var_3367 = new name_3309(this.width - QuestWindow.const_1516 * 2,_loc2_);
         this.var_3367.x = QuestWindow.const_1516;
         this.var_3367.y = _loc1_;
         this.var_1737.addChild(this.var_3367);
      }
      
      private function method_1627(param1:String) : void
      {
         this.var_3366 = new name_1134();
         this.var_3366.color = 16777215;
         this.var_3366.align = TextFormatAlign.CENTER;
         this.var_3366.wordWrap = true;
         this.var_3366.htmlText = param1;
         this.var_3366.width = this.var_3367.width - QuestWindow.const_1516 * 2;
         this.var_3366.height = this.var_3367.height;
         this.var_3366.x = int(this.var_3367.width / 2 - this.var_3366.width / 2);
         this.var_3366.y = int((this.var_3367.height - this.var_3366.height) / 2);
         this.var_3367.addChild(this.var_3366);
      }
      
      private function method_3037() : void
      {
         var _loc1_:name_3310 = new name_3310();
         _loc1_.y = CommonQuestTab.const_2042 + QuestWindow.const_1516;
         _loc1_.x = int(CommonQuestTab.const_2043 / 2 - _loc1_.width / 2);
         _loc1_.enabled = false;
         addChild(_loc1_);
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      public function destroy() : void
      {
         if(this.timer != null)
         {
            this.timer.destroy();
            this.timer = null;
         }
      }
   }
}
