package package_97
{
   import flash.utils.Dictionary;
   
   public class BonusCache
   {
      
      private static var var_2313:ObjectCache = new ObjectCache();
      
      private static var var_2314:ObjectCache = new ObjectCache();
      
      private static var var_2315:Dictionary = new Dictionary();
       
      
      public function BonusCache()
      {
         super();
      }
      
      public static function name_1492() : Boolean
      {
         return var_2313.name_1400();
      }
      
      public static function name_1478() : name_1461
      {
         return name_1461(var_2313.name_1621());
      }
      
      public static function name_2607(param1:name_1461) : void
      {
         var_2313.name_1237(param1);
      }
      
      public static function name_1484() : Boolean
      {
         return var_2314.name_1400();
      }
      
      public static function name_1487() : Cords
      {
         return Cords(var_2314.name_1621());
      }
      
      public static function method_2344(param1:Cords) : void
      {
         var_2314.name_1237(param1);
      }
      
      public static function name_1488(param1:String) : Boolean
      {
         return method_2343(param1.split("_")[0]).name_1400();
      }
      
      public static function name_1481(param1:String) : BonusMesh
      {
         return BonusMesh(method_2343(param1.split("_")[0]).name_1621());
      }
      
      public static function method_2345(param1:BonusMesh) : void
      {
         method_2343(param1.name_2608().split("_")[0]).name_1237(param1);
      }
      
      private static function method_2343(param1:String) : ObjectCache
      {
         var _loc2_:ObjectCache = var_2315[param1];
         if(_loc2_ == null)
         {
            _loc2_ = new ObjectCache();
            var_2315[param1] = _loc2_;
         }
         return _loc2_;
      }
      
      public static function destroy() : void
      {
         var_2313 = new ObjectCache();
         var_2314 = new ObjectCache();
         var_2315 = new Dictionary();
      }
   }
}
