package package_254
{
   public class class_162 extends name_2100
   {
       
      
      private var A:Number;
      
      private var B:Number;
      
      private var C:Number;
      
      public function class_162(param1:Number, param2:Number, param3:Number)
      {
         super();
         this.A = param1;
         this.B = param2;
         this.C = param3;
         var_601 = 3;
         var_597.y = 25;
      }
      
      override public function align(param1:int, param2:int) : void
      {
         if(param1 < 970)
         {
            param1 = 970;
         }
         var_597.x = int(this.A * (param1 - this.B) + this.C);
         method_1933();
      }
   }
}
