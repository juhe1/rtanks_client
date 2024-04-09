package alternativa.tanks.gui.dailyquests.window
{
   import alternativa.osgi.OSGi;
   import controls.base.LabelBase;
   import controls.base.DefaultButtonBase;
   import controls.timer.CountDownTimer;
   import controls.timer.name_2545;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   import forms.TankWindowWithHeader;
   import package_123.name_339;
   import package_126.name_338;
   import package_267.name_326;
   import package_279.class_27;
   import package_379.class_123;
   import package_402.name_2138;
   import package_402.name_2158;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class QuestWindow extends class_123 implements name_2545
   {
      
      public static var localeService:name_102 = OSGi.getInstance().getService(name_102) as name_102;
      
      public static var var_644:class_27 = OSGi.getInstance().getService(class_27) as class_27;
      
      public static var var_2813:name_339 = OSGi.getInstance().getService(name_339) as name_339;
      
      public static const const_2203:int = 280;
      
      public static const const_2201:int = 310;
      
      public static const const_1598:int = 11;
       
      
      private const const_2202:int = 13;
      
      private const const_2044:int = 1000;
      
      private var window:TankWindowWithHeader;
      
      private var name_983:DefaultButtonBase;
      
      private var var_2545:Vector.<name_2730>;
      
      private var var_2812:LabelBase;
      
      private var var_2546:WeeklyQuestInfoPanel;
      
      private var var_2549:CountDownTimer;
      
      private var var_2552:Boolean;
      
      private var var_2551:Boolean;
      
      public function QuestWindow()
      {
         this.var_2545 = new Vector.<name_2730>();
         super();
         this.method_1327();
         this.method_2526();
         this.method_1331();
         this.method_2637();
      }
      
      private function method_2526() : void
      {
         this.var_2546 = new WeeklyQuestInfoPanel();
         this.var_2546.x = 11;
         this.var_2546.y = 11;
         addChild(this.var_2546);
      }
      
      private function method_1327() : void
      {
         this.window = TankWindowWithHeader.createWindow(localeService.getText(name_390.const_1140),280 + 11 * 2,0);
         addChild(this.window);
      }
      
      private function method_1331() : void
      {
         this.name_983 = new DefaultButtonBase();
         this.name_983.label = localeService.getText(name_390.const_1168);
         this.name_983.addEventListener(MouseEvent.CLICK,this.method_1323);
         this.window.addChild(this.name_983);
      }
      
      private function method_2637() : void
      {
         this.var_2812 = new LabelBase();
         this.var_2812.htmlText = localeService.getText(name_390.const_1138);
         this.window.addChild(this.var_2812);
      }
      
      public function init(param1:Vector.<name_326>) : void
      {
         var_2813.hideNotification();
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.method_2640(param1[_loc2_],_loc2_);
            _loc2_++;
         }
         this.method_2631();
      }
      
      private function method_2640(param1:name_326, param2:int) : void
      {
         var _loc3_:name_2730 = new name_2730(param1);
         _loc3_.addEventListener(name_2138.DAILY_QUEST_CHANGE,this.method_1743);
         _loc3_.x = 280 * param2 + 11 + int(11 / 2) * param2;
         _loc3_.y = 11 + WeeklyQuestInfoPanel.const_1532 + 11;
         this.var_2545.push(_loc3_);
         this.window.addChild(_loc3_);
      }
      
      private function method_1743(param1:name_2138) : void
      {
         if(param1.dailyQuestInfo.canSkipForFree || Boolean(var_644.checkEnough(param1.dailyQuestInfo.skipCost)))
         {
            this.var_2552 = false;
            this.method_2531();
         }
         else
         {
            this.method_1323();
         }
      }
      
      private function method_2531() : void
      {
         this.method_2530();
         this.method_2532();
      }
      
      private function method_2532() : void
      {
         this.var_2549 = new CountDownTimer();
         this.var_2549.addListener(name_2545,this);
         this.var_2549.start(getTimer() + 1000);
         this.var_2551 = true;
      }
      
      private function method_2530() : void
      {
         var _loc1_:name_2730 = null;
         for each(_loc1_ in this.var_2545)
         {
            if(_loc1_.name_2731())
            {
               _loc1_.name_2735();
            }
         }
      }
      
      public function name_2164(param1:String, param2:name_326) : void
      {
         var _loc3_:name_2730 = null;
         for each(_loc3_ in this.var_2545)
         {
            if(_loc3_.name_2728() == param1)
            {
               _loc3_.name_2732(param2);
            }
            if(_loc3_.name_2731() && !param2.canSkipForFree)
            {
               _loc3_.name_2733(param2.skipCost);
            }
         }
         this.method_2631();
         this.var_2552 = true;
         if(!this.var_2551)
         {
            this.method_2528();
         }
      }
      
      private function method_2631() : void
      {
         var _loc1_:int = this.method_2636();
         this.method_2635(_loc1_);
         this.method_2641();
         this.method_2632(_loc1_);
      }
      
      private function method_2641() : void
      {
         var _loc1_:uint = this.var_2545.length;
         this.window.width = _loc1_ * 280 + 11 * 2 + int(11 / 2) * (_loc1_ - 1);
         this.method_2634();
      }
      
      private function method_2634() : void
      {
         this.name_983.x = int(this.window.width - this.name_983.width - 11);
         this.var_2812.x = 11;
      }
      
      private function method_2636() : int
      {
         var _loc1_:name_2730 = null;
         var _loc2_:int = 0;
         for each(_loc1_ in this.var_2545)
         {
            _loc2_ = Math.max(_loc2_,_loc1_.method_165());
         }
         return _loc2_;
      }
      
      private function method_2635(param1:int) : void
      {
         var _loc2_:name_2730 = null;
         for each(_loc2_ in this.var_2545)
         {
            _loc2_.name_2860(param1);
         }
      }
      
      public function name_2163() : void
      {
         this.window.width = 310 + 11 * 2;
         this.method_2634();
         var _loc1_:name_2859 = new name_2859();
         _loc1_.x = 11;
         _loc1_.y = 11 + WeeklyQuestInfoPanel.const_1532 + 11;
         this.window.addChild(_loc1_);
         this.method_2632(_loc1_.method_165());
         this.var_2546.method_1791(this.window.width - 2 * 11);
      }
      
      public function name_2161(param1:name_338) : void
      {
         this.var_2546.init(param1);
         this.var_2546.method_1791(this.window.width - 2 * 11);
      }
      
      private function method_2632(param1:int) : void
      {
         this.window.height = 13 + this.name_983.height + 11 + param1 + 11 + WeeklyQuestInfoPanel.const_1532 + 11;
         this.name_983.y = int(this.window.height - this.name_983.height - 11);
         this.var_2812.y = int(this.window.height - this.var_2812.height - 11);
      }
      
      public function show() : void
      {
         var_864.name_1585(this);
      }
      
      public function takePrize(param1:String) : void
      {
         this.method_2639(param1);
         if(this.var_2545.length > 0)
         {
            this.method_2638();
            this.method_2631();
         }
         else
         {
            this.name_2163();
         }
         this.var_2546.name_2862(this.window.width - 2 * 11);
         var_864.method_1370(this);
      }
      
      private function method_2639(param1:String) : void
      {
         var _loc2_:name_2730 = null;
         for each(_loc2_ in this.var_2545)
         {
            if(_loc2_.name_2728() == param1)
            {
               this.method_2633(_loc2_);
               this.window.removeChild(_loc2_);
               this.var_2545.splice(this.var_2545.indexOf(_loc2_),1);
               break;
            }
         }
      }
      
      private function method_2638() : void
      {
         var _loc1_:name_2730 = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_2545.length)
         {
            _loc1_ = this.var_2545[_loc2_];
            _loc1_.x = 280 * _loc2_ + 11 + int(11 / 2) * _loc2_;
            _loc2_++;
         }
      }
      
      private function method_1323(param1:MouseEvent = null) : void
      {
         this.method_91();
         this.method_2529();
         dispatchEvent(new name_2158(name_2158.name_2160));
         var_864.name_1013(this);
      }
      
      private function method_91() : void
      {
         var _loc1_:name_2730 = null;
         this.name_983.removeEventListener(MouseEvent.CLICK,this.method_1323);
         for each(_loc1_ in this.var_2545)
         {
            this.method_2633(_loc1_);
         }
      }
      
      private function method_2633(param1:name_2730) : void
      {
         param1.removeEventListener(name_2138.DAILY_QUEST_CHANGE,this.method_1743);
         if(param1.name_2731())
         {
            param1.name_2861();
         }
      }
      
      override protected function method_1319() : void
      {
         this.method_1323();
      }
      
      override protected function method_1320() : void
      {
         this.method_1323();
      }
      
      public function name_2549(param1:CountDownTimer, param2:Boolean) : void
      {
         this.method_2529();
         if(this.var_2552)
         {
            this.method_2528();
         }
      }
      
      private function method_2529() : void
      {
         if(this.var_2549 != null)
         {
            this.var_2549.removeListener(name_2545,this);
            this.var_2549.destroy();
            this.var_2551 = false;
         }
      }
      
      private function method_2528() : void
      {
         var _loc1_:name_2730 = null;
         for each(_loc1_ in this.var_2545)
         {
            if(_loc1_.name_2731())
            {
               _loc1_.name_2734();
            }
         }
      }
      
      override public function get width() : Number
      {
         return this.window.width;
      }
   }
}
