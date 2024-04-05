package alternativa.tanks.utils
{
   public class name_2177
   {
       
      
      public function name_2177()
      {
         super();
      }
      
      public static function name_2179(param1:int, param2:int) : int
      {
         var _loc3_:int = param1 << 32 - param2;
         return (param1 >>> param2) + _loc3_;
      }
      
      public static function name_2178(param1:int, param2:int) : int
      {
         var _loc3_:int = param1 >>> 32 - param2;
         return (param1 << param2) + _loc3_;
      }
   }
}
