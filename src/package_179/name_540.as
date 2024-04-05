package package_179
{
   public class name_540 implements name_541
   {
      
      public static const const_1523:RegExp = /^[a-zA-Z0-9]([\-\_\.]?[a-zA-Z0-9\*]+)*@[a-zA-Z0-9]([\-\_\.]?[a-zA-Z0-9*]+)*\.[a-zA-Z]{2,}$/i;
      
      public static const const_1526:String = "[a-z0-9](([\\.\\-\\w](?!(-|_|\\.){2,}))*[a-z0-9])?";
      
      public static const const_1527:String = "[a-z0-9A-Z]";
      
      public static const const_1522:RegExp = new RegExp("^" + "[a-z0-9](([\\.\\-\\w](?!(-|_|\\.){2,}))*[a-z0-9])?" + "$","i");
      
      public static const const_1520:RegExp = /[^0-9a-zA-Z\.\-\_]/gi;
      
      public static const const_1525:RegExp = /[^0-9a-zA-Z@\.\-\_]/gi;
      
      public static const const_1524:RegExp = /[Ѐ-ӿ]+/;
      
      private static const const_1521:RegExp = /^[一-龥]+$/;
       
      
      public function name_540()
      {
         super();
      }
      
      public function method_1343(param1:String) : Boolean
      {
         return param1.search(const_1522) != -1;
      }
      
      public function method_1341(param1:String) : Boolean
      {
         return param1.search(const_1523) != -1;
      }
      
      public function method_1345(param1:String) : Boolean
      {
         return param1.search(const_1520) == -1;
      }
      
      public function method_1342(param1:String) : Boolean
      {
         return param1.search(const_1525) == -1;
      }
      
      public function method_1346(param1:String) : Boolean
      {
         return param1.search("[a-z0-9A-Z]") == 0;
      }
      
      public function method_1340(param1:String) : Boolean
      {
         return ChinaCardIdValidator.name_1852(param1);
      }
      
      public function method_1347(param1:String) : Boolean
      {
         return param1.search(const_1521) != -1;
      }
      
      public function method_1344(param1:String) : int
      {
         var _loc2_:Array = param1.match(const_1520);
         if(_loc2_ != null)
         {
            return _loc2_.join().length;
         }
         return 0;
      }
      
      public function method_1339(param1:String) : int
      {
         var _loc2_:Array = null;
         var _loc3_:Array = param1.match(const_1520);
         if(_loc3_ != null && (_loc2_ = _loc3_.join().match(const_1524)) != null)
         {
            return _loc2_.join().length;
         }
         return 0;
      }
   }
}
