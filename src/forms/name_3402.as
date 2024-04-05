package forms
{
   public class name_3402
   {
       
      
      public function name_3402()
      {
         super();
      }
      
      public static function name_3404(param1:int) : String
      {
         var _loc3_:int = int(param1 / 60);
         var _loc4_:int = param1 - _loc3_ * 60;
         return String(_loc3_) + ":" + (_loc4_ > 9 ? String(_loc4_) : "0" + String(_loc4_));
      }
   }
}
