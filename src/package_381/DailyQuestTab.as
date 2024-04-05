package package_381
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.quest.common.gui.CommonQuestTab;
   import alternativa.tanks.model.quest.common.gui.window.*;
   import alternativa.tanks.model.quest.daily.DailyQuestEvent;
   import alternativa.tanks.model.quest.daily.name_2138;
   import alternativa.tanks.model.quest.daily.name_548;
   import controls.timer.CountDownTimer;
   import controls.timer.name_2545;
   import flash.utils.getTimer;
   import package_107.name_326;
   import package_115.class_60;
   import package_126.name_338;
   import package_178.name_542;
   import package_279.class_27;
   import projects.tanks.client.panel.model.quest.QuestTypeEnum;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class DailyQuestTab extends CommonQuestTab implements name_2545, name_548
   {
      
      public static var var_2550:name_542 = OSGi.getInstance().name_6(name_542) as name_542;
       
      
      private const const_2044:int = 1000;
      
      private var var_2549:CountDownTimer;
      
      private var var_2552:Boolean;
      
      private var var_2551:Boolean;
      
      public function DailyQuestTab()
      {
         super();
      }
      
      override protected function method_2520(param1:name_2726) : void
      {
         param1.removeEventListener(name_2138.DAILY_QUEST_CHANGE,this.method_1743);
         super.method_2520(param1);
      }
      
      override protected function method_2524(param1:class_60) : name_2726
      {
         var _loc2_:name_2730 = new name_2730(name_326(param1));
         _loc2_.addEventListener(name_2138.DAILY_QUEST_CHANGE,this.method_1743);
         return _loc2_;
      }
      
      private function method_1743(param1:name_2138) : void
      {
         if(param1.dailyQuestInfo.canSkipForFree || Boolean(class_27(OSGi.getInstance().name_6(class_27) as class_27).checkEnough(param1.dailyQuestInfo.skipCost)))
         {
            this.var_2552 = false;
            this.method_2531();
         }
         else
         {
            this.method_2529();
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
         for each(_loc1_ in var_2545)
         {
            if(_loc1_.name_2731())
            {
               _loc1_.name_2735();
            }
         }
      }
      
      public function method_1337(param1:String, param2:name_326) : void
      {
         var _loc3_:name_2730 = null;
         for each(_loc3_ in var_2545)
         {
            if(_loc3_.name_2728() == param1)
            {
               param2.level = _loc3_.name_2729();
               _loc3_.name_2732(param2);
            }
            if(_loc3_.name_2731() && !param2.canSkipForFree)
            {
               _loc3_.name_2733(param2.skipCost);
            }
         }
         this.var_2552 = true;
         if(!this.var_2551)
         {
            this.method_2528();
         }
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
         for each(_loc1_ in var_2545)
         {
            if(_loc1_.name_2731())
            {
               _loc1_.name_2734();
            }
         }
      }
      
      override public function show() : void
      {
         super.show();
         dispatchEvent(new DailyQuestEvent(DailyQuestEvent.REQUEST_DATA));
         var_2550.method_1363(QuestTypeEnum.DAILY);
      }
      
      override protected function method_2523() : String
      {
         return localeService.getText(name_390.const_765);
      }
      
      public function method_1338(param1:Vector.<name_326>, param2:name_338) : void
      {
         var _loc3_:name_326 = null;
         var _loc4_:Vector.<class_60> = new Vector.<class_60>();
         for each(_loc3_ in param1)
         {
            _loc4_.push(_loc3_);
         }
         method_2527(_loc4_,param2);
      }
   }
}
