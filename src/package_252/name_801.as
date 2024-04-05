package package_252
{
   import alternativa.tanks.gui.dailyquests.window.QuestWindow;
   import package_126.name_338;
   import package_267.class_157;
   import package_267.name_326;
   import package_267.name_803;
   import package_280.MainButtonBarEvents;
   import package_402.ShowWeeklyQuestRewardEvent;
   import package_402.name_2138;
   import package_402.name_2158;
   import package_402.name_2159;
   import platform.client.fp10.core.model.name_141;
   import platform.client.fp10.core.model.name_805;
   
   public class name_801 extends class_157 implements name_803, name_141, name_805
   {
       
      
      private var var_1601:QuestWindow;
      
      private var var_1602:Boolean;
      
      public function name_801()
      {
         super();
      }
      
      public function method_1746(param1:name_338) : void
      {
         if(!this.var_1602)
         {
            this.var_1601 = new QuestWindow();
            this.var_1601.addEventListener(name_2158.name_2160,method_39(this.method_1782));
            this.var_1601.name_2161(param1);
            this.var_1601.name_2163();
            this.var_1601.show();
            this.var_1602 = true;
         }
      }
      
      public function method_1745(param1:Vector.<name_326>, param2:name_338) : void
      {
         if(!this.var_1602)
         {
            this.var_1601 = new QuestWindow();
            this.var_1601.addEventListener(name_2138.DAILY_QUEST_CHANGE,method_39(this.method_1743));
            this.var_1601.addEventListener(name_2159.DAILY_QUEST_GET_PRIZE,method_39(this.method_1783));
            this.var_1601.addEventListener(ShowWeeklyQuestRewardEvent.name_497,method_39(this.method_1784));
            this.var_1601.addEventListener(name_2158.name_2160,method_39(this.method_1782));
            this.var_1602 = true;
            this.var_1601.init(param1);
            this.var_1601.name_2161(param2);
            this.var_1601.show();
         }
      }
      
      private function method_1784(param1:ShowWeeklyQuestRewardEvent) : void
      {
         server.name_2165();
      }
      
      private function method_1782(param1:name_2158) : void
      {
         this.var_1601.removeEventListener(name_2138.DAILY_QUEST_CHANGE,method_39(this.method_1743));
         this.var_1601.removeEventListener(name_2159.DAILY_QUEST_GET_PRIZE,method_39(this.method_1783));
         this.var_1601.removeEventListener(ShowWeeklyQuestRewardEvent.name_497,method_39(this.method_1784));
         this.var_1601.removeEventListener(name_2158.name_2160,method_39(this.method_1782));
         this.var_1602 = false;
      }
      
      private function method_1783(param1:name_2159) : void
      {
         name_792(object.name_176(name_792)).takePrize(param1.dailyQuestInfo);
      }
      
      private function method_1743(param1:name_2138) : void
      {
         name_792(object.name_176(name_792)).skipDailyQuest(param1.dailyQuestInfo);
      }
      
      public function skipDailyQuest(param1:String, param2:name_326) : void
      {
         if(this.var_1602)
         {
            this.var_1601.name_2164(param1,param2);
         }
      }
      
      public function method_1747(param1:String) : void
      {
         if(this.var_1602)
         {
            this.var_1601.takePrize(param1);
         }
      }
      
      public function objectLoadedPost() : void
      {
      }
      
      public function objectUnloadedPost() : void
      {
      }
      
      private function method_515(param1:MainButtonBarEvents) : void
      {
         if(param1.name_982 == MainButtonBarEvents.name_1046)
         {
            server.name_2162();
         }
      }
   }
}
