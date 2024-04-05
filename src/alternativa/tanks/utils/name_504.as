package alternativa.tanks.utils
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class name_504
   {
       
      
      public function name_504()
      {
         super();
      }
      
      public static function name_505(param1:BitmapData, param2:BitmapData) : Bitmap
      {
         var _loc3_:Number = param1.width;
         var _loc4_:Number = param1.height;
         var _loc5_:BitmapData = new BitmapData(_loc3_,_loc4_,true,0);
         _loc5_.copyPixels(param1,new Rectangle(0,0,_loc3_,_loc4_),new Point());
         _loc5_.copyChannel(param2,new Rectangle(0,0,_loc3_,_loc4_),new Point(),1,8);
         return new Bitmap(_loc5_);
      }
   }
}
