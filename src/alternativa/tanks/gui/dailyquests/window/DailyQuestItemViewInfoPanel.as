package alternativa.tanks.gui.dailyquests.window
{
   import alternativa.osgi.OSGi;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.text.TextFormatAlign;
   import package_267.name_326;
   import package_54.name_102;
   import projects.tanks.client.panel.model.dailyquest.name_2832;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class DailyQuestItemViewInfoPanel extends Sprite
   {
      
      public static var localeService:name_102 = OSGi.getInstance().getService(name_102) as name_102;
       
      
      private var var_3657:Bitmap;
      
      private var var_3660:Bitmap;
      
      private var var_3659:Bitmap;
      
      private var var_3656:Bitmap;
      
      private var var_3661:Bitmap;
      
      private var var_3662:Bitmap;
      
      private var var_3658:Bitmap;
      
      private var var_3649:Bitmap;
      
      private var var_3647:Bitmap;
      
      private var dailyQuestInfo:name_326;
      
      private var _width:int;
      
      private var _height:int;
      
      private var var_3635:LabelBase;
      
      private var var_3634:LabelBase;
      
      private var var_3636:LabelBase;
      
      private var var_3637:LabelBase;
      
      private var var_3638:Vector.<LabelBase>;
      
      private const const_2748:int = 5;
      
      private const const_2811:int = 4;
      
      private const const_2816:int = 14;
      
      private const const_2813:int = 9;
      
      private const const_2819:int = 65;
      
      private const const_2815:int = 14;
      
      private const const_2812:int = 8;
      
      private const const_2814:int = 10;
      
      private const const_1759:uint = 5898034;
      
      private const const_1606:uint = 16777215;
      
      public function DailyQuestItemViewInfoPanel(param1:name_326)
      {
         super();
         this.dailyQuestInfo = param1;
         this._width = QuestWindow.const_2203 - 10 * 2;
         this._height = this.method_165();
         this.var_3638 = new Vector.<LabelBase>();
         this.method_3265();
         this.method_3263();
         this.method_3266();
         this.method_3264();
         this.drawBackground();
         this.method_3259();
         this.method_3257();
      }
      
      private function method_3265() : void
      {
         this.var_3657 = new Bitmap(DailyQuestItemViewBitmaps.name_3566);
         addChild(this.var_3657);
         this.var_3660 = new Bitmap(DailyQuestItemViewBitmaps.name_3572);
         addChild(this.var_3660);
         this.var_3659 = new Bitmap(DailyQuestItemViewBitmaps.name_3567);
         addChild(this.var_3659);
         this.var_3660.x = this.var_3657.width;
         this.var_3659.x = this._width - this.var_3659.width;
         this.var_3660.width = this.var_3659.x - this.var_3660.x;
      }
      
      private function method_3263() : void
      {
         this.var_3656 = new Bitmap(DailyQuestItemViewBitmaps.name_3565);
         this.var_3656.y = this._height - this.var_3656.height;
         addChild(this.var_3656);
         this.var_3661 = new Bitmap(DailyQuestItemViewBitmaps.name_3568);
         this.var_3661.y = this.var_3656.y;
         this.var_3661.x = this.var_3656.width;
         this.var_3661.width = this.var_3660.width;
         addChild(this.var_3661);
         this.var_3662 = new Bitmap(DailyQuestItemViewBitmaps.name_3571);
         this.var_3662.y = this.var_3656.y;
         this.var_3662.x = this.var_3659.x;
         addChild(this.var_3662);
      }
      
      private function method_3266() : void
      {
         this.var_3658 = new Bitmap(DailyQuestItemViewBitmaps.name_3573);
         this.var_3658.y = this.var_3657.height;
         this.var_3658.height = this._height - this.var_3657.height - this.var_3656.height;
         addChild(this.var_3658);
      }
      
      private function method_3264() : void
      {
         this.var_3649 = new Bitmap(DailyQuestItemViewBitmaps.name_3570);
         this.var_3649.y = this.var_3658.y;
         this.var_3649.x = this.var_3662.x;
         this.var_3649.height = this.var_3658.height;
         addChild(this.var_3649);
      }
      
      private function drawBackground() : void
      {
         this.var_3647 = new Bitmap(DailyQuestItemViewBitmaps.name_3569);
         this.var_3647.y = this.var_3657.height + this.var_3657.y;
         this.var_3647.x = this.var_3657.width;
         this.var_3647.height = this._height - this.var_3656.height - this.var_3657.height;
         this.var_3647.width = this._width - this.var_3657.width - this.var_3659.width;
         addChild(this.var_3647);
      }
      
      private function method_3259() : void
      {
         this.method_3255();
         this.method_3256();
         this.method_3258();
      }
      
      private function method_3255() : void
      {
         this.var_3636 = new LabelBase();
         this.var_3636.color = 5898034;
         this.var_3636.align = TextFormatAlign.LEFT;
         this.var_3636.text = localeService.getText(name_390.const_649);
         this.var_3636.x = 5;
         this.var_3636.y = 4;
         addChild(this.var_3636);
      }
      
      private function method_3256() : void
      {
         this.var_3634 = new LabelBase();
         this.var_3634.color = 16777215;
         this.var_3634.align = TextFormatAlign.LEFT;
         this.var_3634.text = this.method_3253();
         this.var_3634.x = this._width - 9 - this.var_3634.textWidth;
         this.var_3634.y = this.var_3636.y + 14;
         addChild(this.var_3634);
      }
      
      private function method_3258() : void
      {
         this.var_3635 = new LabelBase();
         this.var_3635.color = 16777215;
         this.var_3635.align = TextFormatAlign.LEFT;
         this.var_3635.text = this.method_1449();
         this.var_3635.wordWrap = true;
         this.var_3635.width = this.var_3634.x - 10;
         this.var_3635.x = this.var_3636.x;
         this.var_3635.y = this.var_3634.y;
         addChild(this.var_3635);
      }
      
      private function method_1449() : String
      {
         return this.dailyQuestInfo.description.replace("%COUNT%",this.dailyQuestInfo.finishCriteria.toString());
      }
      
      private function method_3253() : String
      {
         return this.dailyQuestInfo.progress + "/" + this.dailyQuestInfo.finishCriteria;
      }
      
      private function method_3257() : void
      {
         this.var_3637 = new LabelBase();
         this.var_3637.color = 5898034;
         this.var_3637.align = TextFormatAlign.LEFT;
         this.var_3637.text = localeService.getText(name_390.const_1028);
         this.var_3637.x = 5;
         this.var_3637.y = 65;
         addChild(this.var_3637);
         this.method_3252();
      }
      
      public function name_3312(param1:name_326) : void
      {
         this.dailyQuestInfo = param1;
         this.var_3635.text = this.method_1449();
         this.var_3634.text = this.method_3253();
         this.var_3634.x = this._width - 9 - this.var_3634.textWidth;
         this.name_3348(this.method_165());
         this.method_3254();
         this.method_3252();
      }
      
      public function name_3348(param1:int) : void
      {
         this.var_3656.y = param1 - this.var_3656.height;
         this.var_3661.y = this.var_3656.y;
         this.var_3662.y = this.var_3656.y;
         this.var_3658.height = param1 - this.var_3657.height - this.var_3656.height;
         this.var_3649.height = this.var_3658.height;
         this.var_3647.height = param1 - this.var_3656.height - this.var_3657.height;
      }
      
      private function method_3254() : void
      {
         var _loc1_:LabelBase = null;
         for each(_loc1_ in this.var_3638)
         {
            removeChild(_loc1_);
         }
         this.var_3638.splice(0,this.var_3638.length);
      }
      
      private function method_3252() : void
      {
         var _loc1_:name_2832 = null;
         var _loc2_:LabelBase = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.dailyQuestInfo.prizes.length)
         {
            _loc1_ = this.dailyQuestInfo.prizes[_loc3_];
            _loc2_ = new LabelBase();
            _loc2_.color = 16777215;
            _loc2_.align = TextFormatAlign.LEFT;
            _loc2_.text = _loc1_.name;
            _loc2_.x = 5;
            _loc2_.y = 65 + 14 + _loc3_ * 14;
            addChild(_loc2_);
            this.var_3638.push(_loc2_);
            _loc3_++;
         }
      }
      
      public function method_165() : int
      {
         return 65 + 14 + 14 * this.dailyQuestInfo.prizes.length + 8;
      }
   }
}
