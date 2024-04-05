package alternativa.tanks.models.sfx
{
   import flash.utils.Dictionary;
   import package_311.name_1307;
   import package_97.name_1790;
   
   public class LightDataManager
   {
      
      private static var data:Dictionary = new Dictionary();
      
      private static var var_1889:Dictionary = new Dictionary();
       
      
      public function LightDataManager()
      {
         super();
      }
      
      public static function init(param1:String) : void
      {
         var _loc8_:name_1790 = null;
         var _loc2_:Object = null;
         var _loc3_:String = null;
         var _loc4_:Vector.<name_2330> = null;
         var _loc5_:Object = null;
         var _loc6_:Object = JSON.parse(param1);
         var _loc7_:Array = _loc6_.data;
         for each(_loc2_ in _loc7_)
         {
            if(_loc2_.turret.split("_")[0] == "bonus")
            {
               _loc8_ = new name_1790(new name_1307(_loc2_.color,_loc2_.intensity),_loc2_.attenuationBegin,_loc2_.attenuationEnd);
               var_1889[_loc2_.turret] = _loc8_;
            }
            else
            {
               _loc3_ = String(_loc2_.turret);
               _loc4_ = new Vector.<name_2330>();
               for each(_loc5_ in _loc2_.animation)
               {
                  _loc4_.push(new name_2330(_loc5_.attenuationBegin,_loc5_.attenuationEnd,_loc5_.color,_loc5_.intensity,_loc5_.time));
               }
               data[_loc3_] = new LightAnimation(_loc4_);
            }
         }
      }
      
      public static function name_1250(param1:String) : LightAnimation
      {
         return data[param1 + "_muzzle"];
      }
      
      public static function name_1723(param1:String) : LightAnimation
      {
         return data[param1 + "_shot"];
      }
      
      public static function name_1098(param1:String) : LightAnimation
      {
         return data[param1 + "_explosion"];
      }
      
      public static function method_2056(param1:String, param2:String) : LightAnimation
      {
         return data[param1 + "_" + param2];
      }
      
      public static function name_1791(param1:String) : name_1790
      {
         return var_1889["bonus_" + param1];
      }
      
      public static function destroy() : void
      {
         var _loc1_:Object = null;
         for(_loc1_ in data)
         {
            delete data[_loc1_];
         }
         for(_loc1_ in var_1889)
         {
            delete var_1889[_loc1_];
         }
         data = new Dictionary();
         var_1889 = new Dictionary();
      }
   }
}
