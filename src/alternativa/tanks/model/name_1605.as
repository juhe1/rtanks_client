package alternativa.tanks.model
{
   import flash.utils.getTimer;
   
   public class name_1605
   {
      
      private static var ping:int;
      
      private static var var_2370:int;
      
      private static var var_2371:int;
       
      
      public function name_1605()
      {
         super();
      }
      
      public static function name_2350() : void
      {
         var_2370 = getTimer();
      }
      
      public static function name_2349() : int
      {
         return var_2371;
      }
      
      public static function name_1627() : void
      {
         ping = getTimer() - var_2370;
         var_2371 = getTimer();
      }
      
      public static function name_2348() : int
      {
         return ping;
      }
   }
}
