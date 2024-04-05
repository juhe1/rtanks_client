package package_252
{
   import package_267.name_326;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.type.name_70;
   
   public class DailyQuestEvents implements name_792
   {
       
      
      private var object:name_70;
      
      private var impl:Vector.<name_792>;
      
      public function DailyQuestEvents(param1:name_70, param2:Vector.<name_66>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<name_792>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function skipDailyQuest(param1:name_326) : void
      {
         var i:int = 0;
         var m:name_792 = null;
         var dailyQuestInfo:name_326 = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.skipDailyQuest(dailyQuestInfo);
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function takePrize(param1:name_326) : void
      {
         var i:int = 0;
         var m:name_792 = null;
         var dailyQuestInfo:name_326 = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.takePrize(dailyQuestInfo);
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
   }
}
