package alternativa.utils
{
   import flash.display.BitmapData;
   import flash.display.BitmapDataChannel;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class name_1208
   {
       
      
      public function name_1208()
      {
         super();
      }
      
      public static function mergeBitmapAlpha(param1:BitmapData, param2:BitmapData, param3:Boolean = false) : BitmapData
      {
         var _loc4_:BitmapData = new BitmapData(param1.width,param1.height);
         _loc4_.copyPixels(param1,param1.rect,new Point());
         _loc4_.copyChannel(param2,param2.rect,new Point(),BitmapDataChannel.RED,BitmapDataChannel.ALPHA);
         if(param3)
         {
            param1.dispose();
            param2.dispose();
         }
         return _loc4_;
      }
      
      public static function method_2124(param1:BitmapData, param2:Rectangle) : BitmapData
      {
         var _loc3_:BitmapData = new BitmapData(param2.width,param2.height,param1.transparent,0);
         _loc3_.copyPixels(param1,param2,new Point());
         return _loc3_;
      }
      
      public static function method_2123(param1:BitmapData) : Rectangle
      {
         return param1.transparent ? param1.getColorBoundsRect(4278190080,0,false) : param1.rect;
      }
   }
}
