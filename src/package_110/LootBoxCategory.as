package package_110
{
   public class LootBoxCategory
   {
      
      public static const COMMON:LootBoxCategory = new LootBoxCategory(0,"COMMON");
      
      public static const UNCOMMON:LootBoxCategory = new LootBoxCategory(1,"UNCOMMON");
      
      public static const RARE:LootBoxCategory = new LootBoxCategory(2,"RARE");
      
      public static const EPIC:LootBoxCategory = new LootBoxCategory(3,"EPIC");
      
      public static const LEGENDARY:LootBoxCategory = new LootBoxCategory(4,"LEGENDARY");
      
      public static const EXOTIC:LootBoxCategory = new LootBoxCategory(5,"EXOTIC");
       
      
      private var _value:int;
      
      private var var_23:String;
      
      public function LootBoxCategory(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this.var_23 = param2;
      }
      
      public static function get method_393() : Vector.<LootBoxCategory>
      {
         var _loc1_:Vector.<LootBoxCategory> = new Vector.<LootBoxCategory>();
         _loc1_.push(COMMON);
         _loc1_.push(UNCOMMON);
         _loc1_.push(RARE);
         _loc1_.push(EPIC);
         _loc1_.push(LEGENDARY);
         _loc1_.push(EXOTIC);
         return _loc1_;
      }
      
      public static function getCategory(param1:String) : LootBoxCategory
      {
         var _loc2_:LootBoxCategory = COMMON;
         switch(param1)
         {
            case "COMMON":
               _loc2_ = COMMON;
               break;
            case "UNCOMMON":
               _loc2_ = UNCOMMON;
               break;
            case "RARE":
               _loc2_ = RARE;
               break;
            case "EPIC":
               _loc2_ = EPIC;
               break;
            case "LEGENDARY":
               _loc2_ = LEGENDARY;
               break;
            case "EXOTIC":
               _loc2_ = EXOTIC;
               break;
            default:
               COMMON;
         }
         return _loc2_;
      }
      
      public function toString() : String
      {
         return "LootBoxCategory [" + this.var_23 + "]";
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
