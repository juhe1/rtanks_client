package alternativa.tanks.models.battlefield
{
   public class name_2466
   {
       
      
      public var const_1653:int;
      
      public var g:int;
      
      public var b:int;
      
      public function name_2466(param1:int)
      {
         super();
         this.name_2552(param1);
      }
      
      private static function method_218(param1:int) : int
      {
         return param1 < 0 ? int(0) : int(param1);
      }
      
      private static function method_2864(param1:int) : int
      {
         return param1 & 255;
      }
      
      public function name_2552(param1:int) : void
      {
         this.const_1653 = method_2864(param1 >> 16);
         this.g = method_2864(param1 >> 8);
         this.b = method_2864(param1);
      }
      
      public function name_1308() : int
      {
         return this.const_1653 << 16 | this.g << 8 | this.b;
      }
      
      public function method_419(param1:name_2466) : void
      {
         this.const_1653 = method_218(this.const_1653 - param1.const_1653);
         this.g = method_218(this.g - param1.g);
         this.b = method_218(this.b - param1.b);
      }
   }
}
