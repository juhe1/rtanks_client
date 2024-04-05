package utils
{
   import alternativa.osgi.OSGi;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_1952
   {
      
      public static var localeService:name_102 = OSGi.getInstance().name_6(name_102) as name_102;
      
      private static const const_2081:int = 60;
      
      private static const const_2080:int = 3600;
      
      private static const DAY:int = 86400;
       
      
      public function name_1952()
      {
         super();
      }
      
      public static function format(param1:int) : String
      {
         var _loc2_:int = param1 / 86400;
         param1 %= 86400;
         var _loc3_:int = param1 / 3600;
         param1 %= 3600;
         var _loc4_:int = param1 / 60;
         param1 %= 60;
         return method_2575(_loc2_,_loc3_,_loc4_,param1);
      }
      
      public static function method_2575(param1:int, param2:int, param3:int, param4:int) : String
      {
         var _loc5_:String = "";
         var _loc6_:Boolean = localeService.language == "cn";
         if(param1 > 0)
         {
            _loc5_ = add(param1,name_390.const_1102,_loc5_);
            if(!_loc6_)
            {
               _loc5_ = add(param2,name_390.const_656,_loc5_);
            }
         }
         else if(param2 > 0)
         {
            _loc5_ = add(param2,name_390.const_656,_loc5_);
            if(!_loc6_)
            {
               _loc5_ = add(param3,name_390.const_1012,_loc5_);
            }
         }
         else if(param3 > 0)
         {
            _loc5_ = add(param3,name_390.const_1012,_loc5_);
            if(!_loc6_)
            {
               _loc5_ = add(param4,name_390.const_805,_loc5_);
            }
         }
         else
         {
            _loc5_ = add(param4,name_390.const_805,_loc5_);
         }
         return _loc5_;
      }
      
      private static function add(param1:int, param2:String, param3:String) : String
      {
         if(param1 > 0)
         {
            if(param3.length > 0)
            {
               param3 += " ";
            }
            param3 += param1 + localeService.getText(param2);
         }
         return param3;
      }
   }
}
