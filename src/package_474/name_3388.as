package package_474
{
   import package_1.Main;
   import package_54.name_102;
   
   public class name_3388
   {
       
      
      public function name_3388()
      {
         super();
      }
      
      private static function method_3287(param1:int, param2:int, param3:int) : name_3588
      {
         var _loc4_:name_3588 = new name_3588();
         param3 %= 100;
         if(param3 >= 11 && param3 <= 19)
         {
            _loc4_.name_3589 = "дней";
         }
         else
         {
            param3 %= 10;
            if(param3 == 1)
            {
               _loc4_.name_3589 = "день";
            }
            else if(param3 >= 2 && param3 <= 4)
            {
               _loc4_.name_3589 = "дня";
            }
            else
            {
               _loc4_.name_3589 = "дней";
            }
         }
         if(param2 == 1 || param2 == 21)
         {
            _loc4_.name_3591 = "час";
         }
         else if(param2 >= 2 && param2 <= 4 || param2 >= 22 && param2 <= 24)
         {
            _loc4_.name_3591 = "часа";
         }
         else if(param2 >= 5 && param2 <= 20)
         {
            _loc4_.name_3591 = "часов";
         }
         if(param1 == 0 || param1 == 1 || param1 == 21 || param1 == 31 || param1 == 41 || param1 == 51)
         {
            _loc4_.name_3590 = "минуту";
         }
         else if(param1 >= 2 && param1 <= 4 || param1 >= 22 && param1 <= 24 || param1 >= 32 && param1 <= 34 || param1 >= 42 && param1 <= 44 || param1 >= 52 && param1 <= 54)
         {
            _loc4_.name_3590 = "минуты";
         }
         else if(param1 >= 5 && param1 <= 20 || param1 >= 25 && param1 <= 30 || param1 >= 35 && param1 <= 40 || param1 >= 45 && param1 <= 50 || param1 >= 55 && param1 <= 60)
         {
            _loc4_.name_3590 = "минут";
         }
         return _loc4_;
      }
      
      private static function method_3288(param1:int, param2:int, param3:int) : name_3588
      {
         var _loc4_:name_3588 = new name_3588();
         if(param3 == 1)
         {
            _loc4_.name_3589 = "day";
         }
         else
         {
            _loc4_.name_3589 = "days";
         }
         if(param2 == 1)
         {
            _loc4_.name_3591 = "hour";
         }
         else
         {
            _loc4_.name_3591 = "hours";
         }
         if(param1 == 1 || param1 == 0)
         {
            _loc4_.name_3590 = "minute";
         }
         else
         {
            _loc4_.name_3590 = "minutes";
         }
         return _loc4_;
      }
      
      public static function method_3289(param1:int, param2:int, param3:int) : String
      {
         var _loc4_:String = "";
         var _loc5_:name_3588 = method_3286(param1,param2,param3);
         if(param3 == 0 && param2 == 0 && param1 == 0)
         {
            return "1 " + _loc5_.name_3590;
         }
         if(param3 != 0)
         {
            _loc4_ = param3 + " " + _loc5_.name_3589;
         }
         if(param2 != 0)
         {
            _loc4_ = _loc4_ + " " + param2 + " " + _loc5_.name_3591;
         }
         if(param1 != 0)
         {
            _loc4_ = _loc4_ + " " + param1 + " " + _loc5_.name_3590;
         }
         return _loc4_;
      }
      
      public static function name_3389(param1:int) : String
      {
         return param1 + " " + name_3399(param1);
      }
      
      public static function name_3399(param1:int) : String
      {
         return method_3286(0,0,param1).name_3589;
      }
      
      public static function method_3286(param1:int, param2:int, param3:int) : name_3588
      {
         var _loc4_:String = String((Main.osgi.getService(name_102) as name_102).language);
         switch(_loc4_.toLowerCase())
         {
            case "ru":
               return method_3287(param1,param2,param3);
            case "en":
               return method_3288(param1,param2,param3);
            default:
               return method_3287(param1,param2,param3);
         }
      }
   }
}
