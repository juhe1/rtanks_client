package package_107
{
   import package_115.class_60;
   
   public class name_326 extends class_60
   {
       
      
      private var var_941:Boolean;
      
      private var var_942:int;
      
      public function name_326(param1:Boolean = false, param2:int = 0)
      {
         super();
         this.var_941 = param1;
         this.var_942 = param2;
      }
      
      public function get canSkipForFree() : Boolean
      {
         return this.var_941;
      }
      
      public function set canSkipForFree(param1:Boolean) : void
      {
         this.var_941 = param1;
      }
      
      public function get skipCost() : int
      {
         return this.var_942;
      }
      
      public function set skipCost(param1:int) : void
      {
         this.var_942 = param1;
      }
      
      override public function toString() : String
      {
         var _loc1_:String = "DailyQuestInfo [";
         _loc1_ += "canSkipForFree = " + this.canSkipForFree + " ";
         _loc1_ += "skipCost = " + this.skipCost + " ";
         _loc1_ += super.toString();
         return _loc1_ + "]";
      }
   }
}
