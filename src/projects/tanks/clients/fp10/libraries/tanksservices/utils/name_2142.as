package projects.tanks.clients.fp10.libraries.tanksservices.utils
{
   public class name_2142
   {
       
      
      public function name_2142()
      {
         super();
      }
      
      public static function name_2143(param1:String) : String
      {
         var _loc2_:int = param1.indexOf("] ");
         if(_loc2_ > 0)
         {
            return param1.substr(_loc2_ + 2);
         }
         return param1;
      }
   }
}
