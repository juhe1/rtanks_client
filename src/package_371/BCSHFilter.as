package package_371
{
   import flash.filters.ColorMatrixFilter;
   import flash.utils.Dictionary;
   
   public class BCSHFilter
   {
      
      private static const const_2030:Number = 0.01;
      
      private static var filters:Dictionary = new Dictionary();
       
      
      public function BCSHFilter()
      {
         super();
      }
      
      public static function name_1776(param1:Number, param2:Number, param3:Number, param4:Number) : ColorMatrixFilter
      {
         var _loc5_:* = null;
         var _loc6_:AdjustColor = null;
         var _loc7_:ColorMatrixFilter = null;
         var _loc8_:Object = null;
         for(_loc5_ in filters)
         {
            if(method_2500(param1,_loc5_.b) && method_2500(param2,_loc5_.c) && method_2500(param3,_loc5_.s) && method_2500(param4,_loc5_.h))
            {
               return filters[_loc5_];
            }
         }
         _loc6_ = new AdjustColor();
         _loc6_.brightness = param1;
         _loc6_.contrast = param2;
         _loc6_.saturation = param3;
         _loc6_.hue = param4;
         _loc7_ = new ColorMatrixFilter();
         _loc7_.matrix = _loc6_.name_2712();
         _loc8_ = {
            "b":param1,
            "c":param2,
            "s":param3,
            "h":param4
         };
         filters[_loc8_] = _loc7_;
         return _loc7_;
      }
      
      private static function method_2500(param1:Number, param2:Number) : Boolean
      {
         return Math.abs(param1 - param2) < 0.01;
      }
   }
}
