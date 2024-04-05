package alternativa.utils
{
   import flash.utils.ByteArray;
   
   public class name_1679
   {
      
      private static const const_1995:String = "/";
       
      
      public function name_1679()
      {
         super();
      }
      
      public static function name_1680(param1:ByteArray, param2:ByteArray) : String
      {
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         _loc3_ = param2.readUnsignedInt();
         _loc4_ = param2.readUnsignedInt();
         var _loc5_:String = new Long(_loc3_,_loc4_).name_2675();
         return "/" + param1.readUnsignedInt().toString(8) + "/" + param1.readUnsignedShort().toString(8) + "/" + param1.readUnsignedByte().toString(8) + "/" + param1.readUnsignedByte().toString(8) + "/" + _loc5_ + "/";
      }
   }
}
