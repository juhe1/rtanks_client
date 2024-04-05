package platform.client.fp10.core.resource
{
   import flash.display.BitmapData;
   import flash.display.BitmapDataChannel;
   import flash.display.BlendMode;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class ResourceUtils
   {
       
      
      public function ResourceUtils()
      {
         super();
      }
      
      public static function mergeBitmapAlpha(param1:BitmapData, param2:BitmapData, param3:Boolean = false) : BitmapData
      {
         var _loc4_:BitmapData = null;
         var _loc5_:BitmapData = new BitmapData(param1.width,param1.height);
         var _loc6_:Point = new Point();
         _loc5_.copyPixels(param1,param1.rect,_loc6_);
         if(param1.width != param2.width || param1.height != param2.height)
         {
            _loc4_ = param2;
            param2 = new BitmapData(param1.width,param1.height);
            param2.draw(_loc4_,new Matrix(param1.width / _loc4_.width,0,0,param1.height / _loc4_.height),null,BlendMode.NORMAL,null,true);
         }
         _loc5_.copyChannel(param2,param2.rect,_loc6_,BitmapDataChannel.RED,BitmapDataChannel.ALPHA);
         if(_loc4_ != null)
         {
            param2.dispose();
            param2 = _loc4_;
         }
         if(param3)
         {
            param1.dispose();
            param2.dispose();
         }
         return _loc5_;
      }
   }
}
