package package_343
{
   import flash.display.Bitmap;
   import flash.display.DisplayObjectContainer;
   import package_41.name_320;
   
   public class ResistancesIconsUtils
   {
       
      
      public function ResistancesIconsUtils()
      {
         super();
      }
      
      public static function method_3212(param1:Bitmap, param2:Vector.<name_320>) : void
      {
         var _loc3_:name_320 = null;
         var _loc4_:Bitmap = null;
         var _loc5_:DisplayObjectContainer = param1.parent;
         var _loc6_:uint = param2.length;
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc3_ = param2[_loc7_];
            _loc4_ = new Bitmap(ResistancesIcons.name_2096(_loc3_));
            _loc4_.x = (param1.width - _loc4_.width + 1 >> 1) + param1.x;
            _loc4_.y = (param1.height - _loc4_.height - 7 >> 1) + param1.y;
            _loc5_.addChild(_loc4_);
            _loc7_++;
         }
      }
      
      public static function name_3194(param1:name_320) : Bitmap
      {
         return new Bitmap(ResistancesIcons.method_2607(param1));
      }
   }
}
