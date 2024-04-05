package alternativa.tanks.models.weapon.shaft
{
   public class name_1261
   {
      
      public static const RECHARGE:name_1261 = new name_1261("RECHARGE");
      
      public static const DRAIN:name_1261 = new name_1261("DRAIN");
       
      
      private var value:String;
      
      public function name_1261(param1:String)
      {
         super();
         this.value = param1;
      }
      
      public function toString() : String
      {
         return this.value;
      }
   }
}
