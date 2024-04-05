package controls
{
   import package_1.Main;
   import package_54.name_102;
   import package_60.TextConst;
   
   public class Rank
   {
      
      public static var var_1673:Array;
       
      
      public function Rank()
      {
         super();
      }
      
      public static function name(param1:int) : String
      {
         var _loc2_:name_102 = null;
         var _loc3_:String = null;
         if(var_1673 == null)
         {
            _loc2_ = Main.osgi.name_6(name_102) as name_102;
            _loc3_ = String(_loc2_.getText(TextConst.RANK_NAMES));
            var_1673 = _loc3_.split(",");
         }
         return var_1673[param1 - 1];
      }
   }
}
