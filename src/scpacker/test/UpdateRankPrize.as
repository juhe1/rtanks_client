package scpacker.test
{
   public class UpdateRankPrize
   {
      
      private static var crystalls:Array = [0,10,40,120,230,420,740,950,1400,2000,2500,3100,3900,4600,5600,6600,7900,8900,10000,12000,14000,16000,17000,20000,22000,24000,28000,31000,34000,37000];
       
      
      public function UpdateRankPrize()
      {
         super();
      }
      
      public static function getCount(param1:int) : int
      {
         return crystalls[param1 - 1];
      }
   }
}
