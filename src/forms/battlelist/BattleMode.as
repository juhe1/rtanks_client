package forms.battlelist
{
   public class BattleMode
   {
      
      public static const DM:BattleMode = new BattleMode(0,"DM");
      
      public static const TDM:BattleMode = new BattleMode(1,"TDM");
      
      public static const CTF:BattleMode = new BattleMode(2,"CTF");
      
      public static const CP:BattleMode = new BattleMode(3,"CP");
       
      
      private var _value:int;
      
      private var var_23:String;
      
      public function BattleMode(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this.var_23 = param2;
      }
      
      public static function method_2227(param1:String) : BattleMode
      {
         var _loc2_:BattleMode = null;
         switch(param1.toUpperCase())
         {
            case "DM":
               _loc2_ = DM;
               break;
            case "TDM":
               _loc2_ = TDM;
               break;
            case "CTF":
               _loc2_ = CTF;
               break;
            case "CP":
               _loc2_ = CP;
               break;
            default:
               _loc2_ = DM;
         }
         return _loc2_;
      }
      
      public static function get method_393() : Vector.<BattleMode>
      {
         var _loc1_:Vector.<BattleMode> = new Vector.<BattleMode>();
         _loc1_.push(DM);
         _loc1_.push(TDM);
         _loc1_.push(CTF);
         _loc1_.push(CP);
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "BattleMode [" + this.var_23 + "]";
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
