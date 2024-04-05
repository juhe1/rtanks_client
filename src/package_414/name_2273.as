package package_414
{
   import package_412.name_2264;
   import package_413.name_2265;
   
   public class name_2273
   {
       
      
      private var var_2959:Boolean;
      
      private var var_2957:Vector.<name_2264>;
      
      private var var_2963:name_2265;
      
      private var var_2961:name_2265;
      
      private var var_2960:int;
      
      private var var_2962:Boolean;
      
      public function name_2273(param1:Boolean = false, param2:Vector.<name_2264> = null, param3:name_2265 = null, param4:name_2265 = null, param5:int = 0, param6:Boolean = false)
      {
         super();
         this.var_2959 = param1;
         this.var_2957 = param2;
         this.var_2963 = param3;
         this.var_2961 = param4;
         this.var_2960 = param5;
         this.var_2962 = param6;
      }
      
      public function get battleCreationDisabled() : Boolean
      {
         return this.var_2959;
      }
      
      public function set battleCreationDisabled(param1:Boolean) : void
      {
         this.var_2959 = param1;
      }
      
      public function get battlesLimits() : Vector.<name_2264>
      {
         return this.var_2957;
      }
      
      public function set battlesLimits(param1:Vector.<name_2264>) : void
      {
         this.var_2957 = param1;
      }
      
      public function get defaultRange() : name_2265
      {
         return this.var_2963;
      }
      
      public function set defaultRange(param1:name_2265) : void
      {
         this.var_2963 = param1;
      }
      
      public function get maxRange() : name_2265
      {
         return this.var_2961;
      }
      
      public function set maxRange(param1:name_2265) : void
      {
         this.var_2961 = param1;
      }
      
      public function get maxRangeLength() : int
      {
         return this.var_2960;
      }
      
      public function set maxRangeLength(param1:int) : void
      {
         this.var_2960 = param1;
      }
      
      public function get ultimatesEnabled() : Boolean
      {
         return this.var_2962;
      }
      
      public function set ultimatesEnabled(param1:Boolean) : void
      {
         this.var_2962 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BattleCreateCC [";
         _loc1_ += "battleCreationDisabled = " + this.battleCreationDisabled + " ";
         _loc1_ += "battlesLimits = " + this.battlesLimits + " ";
         _loc1_ += "defaultRange = " + this.defaultRange + " ";
         _loc1_ += "maxRange = " + this.maxRange + " ";
         _loc1_ += "maxRangeLength = " + this.maxRangeLength + " ";
         _loc1_ += "ultimatesEnabled = " + this.ultimatesEnabled + " ";
         return _loc1_ + "]";
      }
   }
}
