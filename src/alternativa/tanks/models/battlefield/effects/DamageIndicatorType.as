package alternativa.tanks.models.battlefield.effects
{
   public class DamageIndicatorType
   {
      
      public static const NORMAL:DamageIndicatorType = new DamageIndicatorType(0,"NORMAL");
      
      public static const CRITICAL:DamageIndicatorType = new DamageIndicatorType(1,"CRITICAL");
      
      public static const FATAL:DamageIndicatorType = new DamageIndicatorType(2,"FATAL");
      
      public static const HEAL:DamageIndicatorType = new DamageIndicatorType(3,"HEAL");
       
      
      private var _value:int;
      
      private var var_23:String;
      
      public function DamageIndicatorType(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this.var_23 = param2;
      }
      
      public static function name_1621(param1:String) : DamageIndicatorType
      {
         var _loc2_:DamageIndicatorType = null;
         switch(param1)
         {
            case "NORMAL":
               _loc2_ = NORMAL;
               break;
            case "CRITICAL":
               _loc2_ = CRITICAL;
               break;
            case "FATAL":
               _loc2_ = FATAL;
               break;
            case "HEAL":
               _loc2_ = HEAL;
         }
         return _loc2_;
      }
      
      public static function get method_393() : Vector.<DamageIndicatorType>
      {
         var _loc1_:Vector.<DamageIndicatorType> = new Vector.<DamageIndicatorType>();
         _loc1_.push(NORMAL);
         _loc1_.push(CRITICAL);
         _loc1_.push(FATAL);
         _loc1_.push(HEAL);
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "DamageIndicatorType [" + this.var_23 + "]";
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
