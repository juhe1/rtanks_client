package alternativa.tanks.models.dom.hud
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import package_410.name_2892;
   
   public class MarkerBitmaps
   {
      
      private static const const_2625:Class = name_3357;
      
      private static const const_2624:BitmapData = new const_2625().bitmapData;
      
      private static const const_2626:Class = name_3360;
      
      private static const const_2629:BitmapData = new const_2626().bitmapData;
      
      private static const const_2628:Class = name_3358;
      
      private static const const_2622:BitmapData = new const_2628().bitmapData;
      
      private static const const_2627:Class = name_3359;
      
      private static const const_2619:Dictionary = new Dictionary();
      
      private static const const_2621:int = const_2622.width;
      
      private static const const_2620:BitmapData = new const_2627().bitmapData;
      
      private static const const_2623:Dictionary = new Dictionary();
      
      {
         const_2619[name_2892.name_2895] = const_2629;
         const_2619[name_2892.BLUE] = const_2624;
         const_2619[name_2892.RED] = const_2622;
      }
      
      public function MarkerBitmaps()
      {
         super();
      }
      
      public static function name_2896(param1:name_2892) : BitmapData
      {
         return const_2619[param1];
      }
      
      public static function name_2894(param1:String) : BitmapData
      {
         var _loc2_:Number = param1.charCodeAt(0) - "A".charCodeAt(0);
         var _loc3_:BitmapData = const_2623[_loc2_];
         if(_loc3_ == null)
         {
            _loc3_ = new BitmapData(const_2621,const_2620.height,true,0);
            _loc3_.copyPixels(const_2620,new Rectangle(_loc2_ * const_2621,0,const_2621,const_2620.height),new Point());
            const_2623[_loc2_] = _loc3_;
         }
         return _loc3_;
      }
   }
}
