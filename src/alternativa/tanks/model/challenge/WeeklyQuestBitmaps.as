package alternativa.tanks.model.challenge
{
   import flash.display.BitmapData;
   
   public class WeeklyQuestBitmaps
   {
      
      private static const questWeek1:Class = WeeklyQuestBitmaps_questWeek1;
      
      private static const questReward1:Class = WeeklyQuestBitmaps_questReward1;
      
      private static const questWeek2:Class = WeeklyQuestBitmaps_questWeek2;
      
      private static const questReward2:Class = WeeklyQuestBitmaps_questReward2;
      
      private static const questWeek3:Class = WeeklyQuestBitmaps_questWeek3;
      
      private static const questReward3:Class = WeeklyQuestBitmaps_questReward3;
      
      private static const questWeek4:Class = WeeklyQuestBitmaps_questWeek4;
      
      private static const questReward4:Class = WeeklyQuestBitmaps_questReward4;
      
      private static const const_1452:Array = [new questWeek1(),new questWeek2(),new questWeek3(),new questWeek4()];
      
      private static const const_1453:Array = [new questReward1(),new questReward2(),new questReward3(),new questReward4()];
       
      
      public function WeeklyQuestBitmaps()
      {
         super();
      }
      
      public static function name_375(param1:int) : BitmapData
      {
         return const_1452[param1].bitmapData;
      }
      
      public static function name_380(param1:int) : BitmapData
      {
         return const_1453[param1].bitmapData;
      }
   }
}
