package package_126
{
   import flash.display.BitmapData;
   
   public class name_338
   {
       
      
      private var var_868:int;
      
      private var var_867:int;
      
      private var var_866:Boolean;
      
      private var var_869:BitmapData;
      
      private var var_865:BitmapData;
      
      public function name_338(param1:int = 0, param2:int = 0, param3:Boolean = false, param4:BitmapData = null, param5:BitmapData = null)
      {
         super();
         this.var_868 = param1;
         this.var_867 = param2;
         this.var_866 = param3;
         this.var_869 = param4;
         this.var_865 = param5;
      }
      
      public function get currentQuestLevel() : int
      {
         return this.var_868;
      }
      
      public function set currentQuestLevel(param1:int) : void
      {
         this.var_868 = param1;
      }
      
      public function get currentQuestStreak() : int
      {
         return this.var_867;
      }
      
      public function set currentQuestStreak(param1:int) : void
      {
         this.var_867 = param1;
      }
      
      public function get doneForToday() : Boolean
      {
         return this.var_866;
      }
      
      public function set doneForToday(param1:Boolean) : void
      {
         this.var_866 = param1;
      }
      
      public function get questImage() : BitmapData
      {
         return this.var_869;
      }
      
      public function set questImage(param1:BitmapData) : void
      {
         this.var_869 = param1;
      }
      
      public function get rewardImage() : BitmapData
      {
         return this.var_865;
      }
      
      public function set rewardImage(param1:BitmapData) : void
      {
         this.var_865 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "WeeklyQuestDescription [";
         _loc1_ += "currentQuestLevel = " + this.currentQuestLevel + " ";
         _loc1_ += "currentQuestStreak = " + this.currentQuestStreak + " ";
         _loc1_ += "doneForToday = " + this.doneForToday + " ";
         _loc1_ += "questImage = " + this.questImage + " ";
         _loc1_ += "rewardImage = " + this.rewardImage + " ";
         return _loc1_ + "]";
      }
   }
}
