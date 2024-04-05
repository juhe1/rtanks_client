package package_311
{
   import package_47.BattleTeamType;
   
   public final class name_1312
   {
       
      
      private var var_2140:name_1307;
      
      private var var_2139:name_1307;
      
      private var var_2141:name_1307;
      
      private var attenuationBegin:Number;
      
      private var var_2138:Number;
      
      public function name_1312(param1:name_1307, param2:name_1307, param3:name_1307, param4:Number, param5:Number)
      {
         super();
         this.var_2140 = param1;
         this.var_2139 = param2;
         this.var_2141 = param3;
         this.attenuationBegin = param4;
         this.var_2138 = param5;
      }
      
      public function name_1310(param1:BattleTeamType) : name_1307
      {
         switch(param1.getValue())
         {
            case BattleTeamType.BLUE.getValue():
               return this.var_2139;
            case BattleTeamType.NONE.getValue():
               return this.var_2141;
            case BattleTeamType.RED.getValue():
               return this.var_2140;
            default:
               return null;
         }
      }
      
      public function name_1314() : Number
      {
         return this.attenuationBegin;
      }
      
      public function name_1316() : Number
      {
         return this.var_2138;
      }
   }
}
