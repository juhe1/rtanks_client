package package_115
{
   import package_118.QuestLevel;
   
   public class class_60 extends class_59
   {
       
      
      private var var_940:QuestLevel;
      
      public function class_60(param1:QuestLevel = null)
      {
         super();
         this.var_940 = param1;
      }
      
      public function get level() : QuestLevel
      {
         return this.var_940;
      }
      
      public function set level(param1:QuestLevel) : void
      {
         this.var_940 = param1;
      }
      
      override public function toString() : String
      {
         var _loc1_:String = "QuestInfoWithLevel [";
         _loc1_ += "level = " + this.level + " ";
         _loc1_ += super.toString();
         return _loc1_ + "]";
      }
   }
}
