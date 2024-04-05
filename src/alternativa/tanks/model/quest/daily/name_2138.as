package alternativa.tanks.model.quest.daily
{
   import flash.events.Event;
   import package_107.name_326;
   
   public class name_2138 extends Event
   {
      
      public static const DAILY_QUEST_CHANGE:String = "DailyQuestChange";
       
      
      public var dailyQuestInfo:name_326;
      
      public function name_2138(param1:String, param2:name_326)
      {
         super(param1,true);
         this.dailyQuestInfo = param2;
      }
   }
}
