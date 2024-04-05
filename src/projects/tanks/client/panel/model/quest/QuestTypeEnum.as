package projects.tanks.client.panel.model.quest
{
   public class QuestTypeEnum
   {
      
      public static const MAIN:QuestTypeEnum = new QuestTypeEnum(0,"MAIN");
      
      public static const DAILY:QuestTypeEnum = new QuestTypeEnum(1,"DAILY");
      
      public static const WEEKLY:QuestTypeEnum = new QuestTypeEnum(2,"WEEKLY");
      
      public static const CHALLENGE:QuestTypeEnum = new QuestTypeEnum(3,"CHALLENGE");
       
      
      private var _value:int;
      
      private var var_23:String;
      
      public function QuestTypeEnum(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this.var_23 = param2;
      }
      
      public static function get method_393() : Vector.<QuestTypeEnum>
      {
         var _loc1_:Vector.<QuestTypeEnum> = new Vector.<QuestTypeEnum>();
         _loc1_.push(MAIN);
         _loc1_.push(DAILY);
         _loc1_.push(WEEKLY);
         _loc1_.push(CHALLENGE);
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "QuestTypeEnum [" + this.var_23 + "]";
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function get name() : String
      {
         return this.var_23;
      }
   }
}
