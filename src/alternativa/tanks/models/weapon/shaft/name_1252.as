package alternativa.tanks.models.weapon.shaft
{
   public class name_1252
   {
       
      
      private var a:Number;
      
      private var b:Number;
      
      public function name_1252(param1:Number = 0, param2:Number = 1)
      {
         super();
         this.a = param1;
         this.b = param2;
      }
      
      public function setInterval(param1:Number, param2:Number) : void
      {
         this.a = param1;
         this.b = param2;
      }
      
      public function interpolate(param1:Number) : Number
      {
         return this.a + (this.b - this.a) * param1;
      }
   }
}
