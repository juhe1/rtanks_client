package package_24
{
   public class LogLevel
   {
      
      public static const const_389:int = 0;
      
      public static const const_392:int = 1;
      
      public static const const_391:int = 2;
      
      public static const const_390:int = 3;
      
      public static const const_388:int = 4;
      
      public static const name_79:int = 5;
      
      private static const const_387:Array = ["NONE","TRACE","DEBUG","INFO","WARNING","ERROR"];
       
      
      public function LogLevel()
      {
         super();
      }
      
      public static function toString(param1:int) : String
      {
         return const_387[param1];
      }
   }
}
