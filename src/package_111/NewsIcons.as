package package_111
{
   import flash.display.BitmapData;
   import flash.utils.*;
   
   public class NewsIcons
   {
      
      private static const const_2550:Class = name_3257;
      
      private static const const_2542:Class = name_3255;
      
      private static const fev_14:Class = name_3258;
      
      private static const crystall:Class = name_3256;
      
      private static const const_2547:Class = name_3251;
      
      private static const const_2549:Class = name_3266;
      
      private static const const_2544:Class = name_3267;
      
      private static const const_2546:Class = name_3253;
      
      private static const const_2541:Class = name_3261;
      
      private static const const_2539:Class = name_3262;
      
      private static const shaft:Class = name_3263;
      
      private static const const_2543:Class = name_3264;
      
      private static const sale_20:Class = name_3254;
      
      private static const const_2540:Class = name_3259;
      
      private static const const_2548:Class = name_3260;
      
      private static const const_2545:Class = name_3252;
      
      private static const update:Class = name_3265;
      
      private static const ml5:Class = name_3268;
      
      private static var instance:NewsIcons = new NewsIcons();
      
      private static var Y:int = 100;
       
      
      private var var_3289:BitmapData;
      
      private var var_3288:BitmapData;
      
      private var fev_14_bd:BitmapData;
      
      private var var_3282:BitmapData;
      
      private var var_3284:BitmapData;
      
      private var var_3292:BitmapData;
      
      private var var_3294:BitmapData;
      
      private var var_3286:BitmapData;
      
      private var var_3293:BitmapData;
      
      private var var_3287:BitmapData;
      
      private var var_3283:BitmapData;
      
      private var var_3290:BitmapData;
      
      private var sale_20_bd:BitmapData;
      
      private var var_3295:BitmapData;
      
      private var var_3285:BitmapData;
      
      private var var_3291:BitmapData;
      
      private var var_3281:BitmapData;
      
      private var ml5_bd:BitmapData;
      
      public function NewsIcons()
      {
         this.var_3289 = new const_2550().bitmapData;
         this.var_3288 = new const_2542().bitmapData;
         this.fev_14_bd = new fev_14().bitmapData;
         this.var_3282 = new crystall().bitmapData;
         this.var_3284 = new const_2547().bitmapData;
         this.var_3292 = new const_2549().bitmapData;
         this.var_3294 = new const_2544().bitmapData;
         this.var_3286 = new const_2546().bitmapData;
         this.var_3293 = new const_2541().bitmapData;
         this.var_3287 = new const_2539().bitmapData;
         this.var_3283 = new shaft().bitmapData;
         this.var_3290 = new const_2543().bitmapData;
         this.sale_20_bd = new sale_20().bitmapData;
         this.var_3295 = new const_2540().bitmapData;
         this.var_3285 = new const_2548().bitmapData;
         this.var_3291 = new const_2545().bitmapData;
         this.var_3281 = new update().bitmapData;
         this.ml5_bd = new ml5().bitmapData;
         super();
      }
      
      public static function method_2322(param1:String) : BitmapData
      {
         var id:String = param1;
         var bitmapData:BitmapData = instance.var_3281;
         try
         {
            bitmapData = instance[id + "_bd"];
         }
         catch(e:Error)
         {
            bitmapData = instance.var_3281;
         }
         return bitmapData;
      }
   }
}
