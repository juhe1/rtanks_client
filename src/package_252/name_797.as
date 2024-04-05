package package_252
{
   import package_267.name_326;
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class name_797 implements name_792
   {
       
      
      private var object:name_70;
      
      private var impl:name_792;
      
      public function name_797(param1:name_70, param2:name_792)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function skipDailyQuest(param1:name_326) : void
      {
         var dailyQuestInfo:name_326 = param1;
         try
         {
            Model.object = this.object;
            this.impl.skipDailyQuest(dailyQuestInfo);
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function takePrize(param1:name_326) : void
      {
         var dailyQuestInfo:name_326 = param1;
         try
         {
            Model.object = this.object;
            this.impl.takePrize(dailyQuestInfo);
         }
         finally
         {
            Model.method_38();
         }
      }
   }
}
