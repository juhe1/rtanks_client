package package_252
{
   import package_267.name_326;
   import package_279.class_27;
   import projects.tanks.client.panel.model.dailyquest.class_155;
   import projects.tanks.client.panel.model.dailyquest.name_796;
   
   public class name_802 extends class_155 implements name_796, name_792
   {
      
      public static var var_644:class_27;
       
      
      public function name_802()
      {
         super();
      }
      
      public function skipDailyQuest(param1:name_326) : void
      {
         if(param1.canSkipForFree)
         {
            server.name_2130(param1.questId);
         }
         else
         {
            server.name_2131(param1.questId,param1.skipCost);
         }
      }
      
      public function takePrize(param1:name_326) : void
      {
         server.takePrize(param1.questId);
      }
   }
}
