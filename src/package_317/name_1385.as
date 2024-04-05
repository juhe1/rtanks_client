package package_317
{
   import alternativa.tanks.battle.class_19;
   import alternativa.tanks.battle.name_1384;
   import alternativa.tanks.battle.name_295;
   
   public class name_1385 extends name_295 implements name_1384
   {
       
      
      private var var_2241:class_19;
      
      private var add:Boolean;
      
      public function name_1385(param1:class_19, param2:Boolean)
      {
         super();
         this.var_2241 = param1;
         this.add = param2;
      }
      
      public function execute() : void
      {
         if(this.add)
         {
            name_165().name_746(this.var_2241);
         }
         else
         {
            name_165().name_772(this.var_2241);
         }
      }
   }
}
