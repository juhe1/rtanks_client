package package_106
{
   public class Achievement
   {
      
      public static const FIRST_PURCHASE:Achievement = new Achievement(0,"FIRST_PURCHASE");
      
      public static const SET_EMAIL:Achievement = new Achievement(1,"SET_EMAIL");
       
      
      private var _value:int;
      
      private var var_23:String;
      
      public function Achievement(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this.var_23 = param2;
      }
      
      public static function get method_393() : Vector.<Achievement>
      {
         var _loc1_:Vector.<Achievement> = new Vector.<Achievement>();
         _loc1_.push(FIRST_PURCHASE);
         _loc1_.push(SET_EMAIL);
         return _loc1_;
      }
      
      public static function name_378(param1:int) : Achievement
      {
         if(param1 == 0)
         {
            return FIRST_PURCHASE;
         }
         return SET_EMAIL;
      }
      
      public function toString() : String
      {
         return "Achievement [" + this.var_23 + "]";
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
