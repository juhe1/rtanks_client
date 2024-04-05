package utils
{
   import flash.display.BitmapData;
   
   public class name_3535
   {
       
      
      public function name_3535()
      {
         super();
      }
      
      public static function name_3541(param1:BitmapData) : BitmapData
      {
         var _loc2_:int = 0;
         var _loc3_:BitmapData = new BitmapData(param1.width,param1.height,true);
         var _loc4_:int = 0;
         while(_loc4_ < param1.width)
         {
            _loc2_ = 0;
            while(_loc2_ < param1.height)
            {
               _loc3_.setPixel32(_loc4_,_loc2_,param1.getPixel32(param1.width - 1 - _loc4_,_loc2_));
               _loc2_++;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function name_3580(param1:BitmapData) : BitmapData
      {
         var _loc2_:int = 0;
         var _loc3_:BitmapData = new BitmapData(param1.width,param1.height,true);
         var _loc4_:int = 0;
         while(_loc4_ < param1.width)
         {
            _loc2_ = 0;
            while(_loc2_ < param1.height)
            {
               _loc3_.setPixel32(_loc4_,_loc2_,param1.getPixel32(_loc4_,param1.height - 1 - _loc2_));
               _loc2_++;
            }
            _loc4_++;
         }
         return _loc3_;
      }
   }
}
