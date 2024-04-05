package package_189
{
   import flash.utils.ByteArray;
   import mx.utils.Base64Encoder;
   
   public class name_1870
   {
       
      
      public function name_1870()
      {
         super();
      }
      
      public static function encode(param1:String) : String
      {
         var _loc2_:Base64Encoder = new Base64Encoder();
         _loc2_.insertNewLines = false;
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeUTFBytes(param1);
         _loc2_.encodeUTFBytes(_loc3_.toString());
         return _loc2_.toString();
      }
   }
}
