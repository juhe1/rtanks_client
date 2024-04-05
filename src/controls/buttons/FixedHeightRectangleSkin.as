package controls.buttons
{
   import flash.display.BitmapData;
   
   public class FixedHeightRectangleSkin
   {
       
      
      private var var_1435:BitmapData;
      
      private var var_3442:BitmapData;
      
      private var var_1431:BitmapData;
      
      public function FixedHeightRectangleSkin(param1:Class = null, param2:Class = null, param3:Class = null)
      {
         super();
         if(param1 == null || param2 == null || param3 == null)
         {
            return;
         }
         this.var_1435 = new param1().bitmapData;
         this.var_3442 = new param2().bitmapData;
         this.var_1431 = new param3().bitmapData;
      }
      
      public static function method_983(param1:BitmapData, param2:BitmapData, param3:BitmapData) : FixedHeightRectangleSkin
      {
         var _loc4_:FixedHeightRectangleSkin = new FixedHeightRectangleSkin();
         _loc4_.var_1435 = param1;
         _loc4_.var_1431 = param3;
         _loc4_.var_3442 = param2;
         return _loc4_;
      }
      
      public function get left() : BitmapData
      {
         return this.var_1435;
      }
      
      public function get var_2895() : BitmapData
      {
         return this.var_3442;
      }
      
      public function get right() : BitmapData
      {
         return this.var_1431;
      }
   }
}
