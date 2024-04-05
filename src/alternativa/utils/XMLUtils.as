package alternativa.utils
{
   import flash.utils.ByteArray;
   
   public class XMLUtils
   {
      
      private static var var_3297:ByteArray = new ByteArray();
       
      
      public function XMLUtils()
      {
         super();
      }
      
      public static function name_2676(param1:String) : String
      {
         var_3297.position = 0;
         var_3297.writeUTF(param1);
         var_3297.position = 0;
         return var_3297.readUTF();
      }
      
      public static function name_2680(param1:XML, param2:String, param3:String = null) : String
      {
         var _loc4_:XML = null;
         var _loc5_:XMLList = param1.attribute(param2);
         if(_loc5_.length() > 0)
         {
            _loc4_ = _loc5_[0];
            return _loc4_.toString();
         }
         return param3;
      }
      
      public static function name_2678(param1:XML, param2:String, param3:Number = NaN) : Number
      {
         var _loc4_:XMLList = param1.attribute(param2);
         if(_loc4_.length() > 0)
         {
            return Number(_loc4_[0]);
         }
         return param3;
      }
   }
}
