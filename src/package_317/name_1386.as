package package_317
{
   import alternativa.tanks.battle.name_1384;
   import alternativa.tanks.battle.name_295;
   import alternativa.tanks.models.battlefield.logic.class_23;
   
   public class name_1386 extends name_295 implements name_1384
   {
       
      
      private var var_2242:class_23;
      
      private var add:Boolean;
      
      public function name_1386(param1:class_23, param2:Boolean)
      {
         super();
         this.var_2242 = param1;
         this.add = param2;
      }
      
      public function execute() : void
      {
         if(this.add)
         {
            name_165().name_212(this.var_2242);
         }
         else
         {
            name_165().name_977(this.var_2242);
         }
      }
   }
}
