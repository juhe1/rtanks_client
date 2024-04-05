package package_127
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.PixelSnapping;
   import flash.geom.ColorTransform;
   import package_110.LootBoxCategory;
   
   public class Present
   {
       
      
      public var bitmap:Bitmap;
      
      public var color:ColorTransform;
      
      public var delay:Number;
      
      public var name:String;
      
      public function Present(param1:BitmapData, param2:String, param3:LootBoxCategory)
      {
         this.bitmap = new Bitmap();
         this.color = new ColorTransform();
         super();
         this.bitmap.bitmapData = param1;
         this.bitmap.pixelSnapping = PixelSnapping.NEVER;
         this.bitmap.smoothing = true;
         this.name = param2;
         var _loc4_:Array = method_2966(param3);
         this.color.redMultiplier = _loc4_[0];
         this.color.greenMultiplier = _loc4_[1];
         this.color.blueMultiplier = _loc4_[2];
         this.delay = _loc4_[3];
      }
      
      private static function method_2966(param1:LootBoxCategory) : Array
      {
         if(param1 == LootBoxCategory.COMMON)
         {
            return [0.5,0.5,0.5,0];
         }
         if(param1 == LootBoxCategory.UNCOMMON)
         {
            return [0.3,1,0.3,0];
         }
         if(param1 == LootBoxCategory.RARE)
         {
            return [0,0.8,2,0.5];
         }
         if(param1 == LootBoxCategory.EPIC)
         {
            return [1,0.3,1.5,2];
         }
         if(param1 == LootBoxCategory.LEGENDARY)
         {
            return [2,0.7,0.5,3];
         }
         if(param1 == LootBoxCategory.EXOTIC)
         {
            return [2,0.1,0,4];
         }
         return [0,0,0,0.1];
      }
   }
}
