package package_179
{
   public class ChinaCardIdValidator
   {
      
      private static const KEY:Vector.<int> = Vector.<int>([7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2]);
      
      private static const AUTH:Vector.<String> = Vector.<String>(["1","0","x","9","8","7","6","5","4","3","2"]);
      
      private static const const_2053:Vector.<String> = Vector.<String>(["11","12","13","14","15","21","22","23","31","32","33","34","35","36","37","41","42","43","44","45","46","50","51","52","53","54","61","62","63","64","65","71","81","82","91"]);
      
      private static const const_2054:int = 18;
      
      private static const const_2055:int = 11;
       
      
      public function ChinaCardIdValidator()
      {
         super();
      }
      
      public static function name_1852(param1:String) : Boolean
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = param1.length;
         if(_loc3_ != 18)
         {
            return false;
         }
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1.charCodeAt(_loc4_);
            if(_loc2_ < 48 || _loc2_ > 57)
            {
               return false;
            }
            _loc4_++;
         }
         var _loc5_:String = param1.substr(0,2);
         if(const_2053.indexOf(_loc5_) == -1)
         {
            return false;
         }
         var _loc6_:Date = new Date();
         var _loc7_:Number = _loc6_.fullYear;
         var _loc8_:int = parseInt(param1.substr(6,4));
         if(_loc8_ < 1900 || _loc8_ > _loc7_)
         {
            return false;
         }
         var _loc9_:int = parseInt(param1.substr(10,2));
         var _loc10_:int = parseInt(param1.substr(12,2));
         if(_loc9_ < 1 || _loc9_ > 12 || _loc10_ < 1 || _loc10_ > 31)
         {
            return false;
         }
         var _loc11_:int = 0;
         var _loc12_:int = _loc3_ - 1;
         var _loc13_:int = 0;
         while(_loc13_ < _loc12_)
         {
            _loc11_ += KEY[_loc13_] * parseInt(param1.substr(_loc13_,1));
            _loc13_++;
         }
         if(param1.charAt(_loc12_).toLowerCase() != AUTH[_loc11_ % 11])
         {
            return false;
         }
         return true;
      }
   }
}
