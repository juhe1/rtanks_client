package package_318
{
   import alternativa.tanks.battle.name_1384;
   import alternativa.tanks.battle.name_712;
   
   public class name_2561 implements name_1384
   {
       
      
      private var var_3144:Triggers;
      
      private var var_743:name_712;
      
      public function name_2561(param1:Triggers, param2:name_712)
      {
         super();
         this.var_3144 = param1;
         this.var_743 = param2;
      }
      
      public function execute() : void
      {
         this.var_3144.add(this.var_743);
      }
   }
}
