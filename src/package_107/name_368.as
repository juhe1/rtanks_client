package package_107
{
   public class name_368
   {
       
      
      private var var_811:Boolean;
      
      private var var_810:int;
      
      public function name_368(param1:Boolean = false, param2:int = 0)
      {
         super();
         this.var_811 = param1;
         this.var_810 = param2;
      }
      
      public function get hasNewQuests() : Boolean
      {
         return this.var_811;
      }
      
      public function set hasNewQuests(param1:Boolean) : void
      {
         this.var_811 = param1;
      }
      
      public function get timeToNextQuest() : int
      {
         return this.var_810;
      }
      
      public function set timeToNextQuest(param1:int) : void
      {
         this.var_810 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "DailyQuestShowingCC [";
         _loc1_ += "hasNewQuests = " + this.hasNewQuests + " ";
         _loc1_ += "timeToNextQuest = " + this.timeToNextQuest + " ";
         return _loc1_ + "]";
      }
   }
}
