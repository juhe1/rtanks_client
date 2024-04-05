package package_13
{
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   
   public class LongFactory
   {
      
      private static var var_207:Dictionary = new Dictionary(false);
      
      private static var var_208:ByteArray = new ByteArray();
       
      
      public function LongFactory()
      {
         super();
      }
      
      public static function name_31(param1:int, param2:int) : Long
      {
         var _loc3_:Long = null;
         if(var_207[param2] != null)
         {
            if(var_207[param2][param1] != null)
            {
               _loc3_ = var_207[param2][param1];
            }
            else
            {
               _loc3_ = new Long(param2,param1);
               var_207[param2][param1] = _loc3_;
            }
         }
         else
         {
            var_207[param2] = new Dictionary(false);
            _loc3_ = new Long(param2,param1);
            var_207[param2][param1] = _loc3_;
         }
         return _loc3_;
      }
      
      public static function method_299(param1:String) : Long
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(param1.length < 16)
         {
            param1 = "0" + param1;
         }
         _loc2_ = int("0x" + param1.substr(0,8));
         _loc3_ = int("0x" + param1.substr(8,16));
         return name_31(_loc2_,_loc3_);
      }
      
      public static function method_298(param1:Long) : ByteArray
      {
         var_208.position = 0;
         var_208.writeInt(param1.high);
         var_208.writeInt(param1.low);
         var_208.position = 0;
         return var_208;
      }
      
      public static function method_300(param1:int) : Long
      {
         if(param1 < 0)
         {
            return LongFactory.name_31(2147483648,param1);
         }
         return LongFactory.name_31(0,param1);
      }
   }
}
