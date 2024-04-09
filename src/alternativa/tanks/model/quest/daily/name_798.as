package alternativa.tanks.model.quest.daily
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.quest.common.name_551;
   import package_107.DailyQuestShowingModelBase;
   import package_107.name_326;
   import package_107.name_335;
   import package_126.name_338;
   import package_279.class_27;
   import package_383.name_2137;
   import platform.client.fp10.core.model.name_170;
   import platform.client.fp10.core.model.name_805;
   import projects.tanks.client.panel.model.quest.QuestTypeEnum;
   
   public class name_798 extends DailyQuestShowingModelBase implements name_335, name_170, name_805
   {
      
      public static var var_644:class_27 = OSGi.getInstance().getService(class_27) as class_27;
      
      public static var var_1548:name_548 = OSGi.getInstance().getService(name_548) as name_548;
      
      public static var var_1549:name_551 = OSGi.getInstance().getService(name_551) as name_551;
       
      
      public function name_798()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         var_1548.addEventListener(name_2138.DAILY_QUEST_CHANGE,method_39(this.method_1743));
         var_1548.addEventListener(name_2137.name_2139,method_39(this.method_1742));
         var_1548.addEventListener(DailyQuestEvent.REQUEST_DATA,method_39(this.method_1744));
         var_1548.method_1336(method_771().timeToNextQuest);
         var_1549.method_1317();
         if(method_771().hasNewQuests && !var_1549.isWindowOpen())
         {
            var_1549.method_1318(QuestTypeEnum.DAILY);
         }
      }
      
      private function method_1743(param1:name_2138) : void
      {
         var _loc2_:name_326 = param1.dailyQuestInfo;
         if(_loc2_.canSkipForFree)
         {
            server.name_2130(_loc2_.questId);
         }
         else
         {
            server.name_2131(_loc2_.questId,_loc2_.skipCost);
         }
      }
      
      private function method_1742(param1:name_2137) : void
      {
         server.name_2140(param1.questId);
      }
      
      private function method_1744(param1:DailyQuestEvent) : void
      {
         server.openWindow();
      }
      
      public function openDailyQuest(param1:Vector.<name_326>, param2:name_338) : void
      {
         var_1548.method_1338(param1,param2);
         var_1549.method_1318(QuestTypeEnum.DAILY);
      }
      
      public function prizeGiven(param1:String) : void
      {
         var_1548.takePrize(param1);
      }
      
      public function skipQuest(param1:String, param2:name_326) : void
      {
         var_1548.method_1337(param1,param2);
      }
      
      public function objectUnloadedPost() : void
      {
         var_1548.removeEventListener(name_2138.DAILY_QUEST_CHANGE,method_39(this.method_1743));
         var_1548.removeEventListener(name_2137.name_2139,method_39(this.method_1742));
         var_1548.removeEventListener(DailyQuestEvent.REQUEST_DATA,method_39(this.method_1744));
      }
   }
}
