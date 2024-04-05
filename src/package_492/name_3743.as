package package_492
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   
   public class name_3743 extends Sprite
   {
      
      private static const const_2944:int = 104;
      
      private static const const_2945:int = 150;
      
      private static const WIDTH:int = 474;
      
      private static const const_2061:Class = name_3747;
      
      private static const const_2941:BitmapData = Bitmap(new const_2061()).bitmapData;
      
      private static const const_2170:Class = name_3748;
      
      private static const const_2942:BitmapData = Bitmap(new const_2170()).bitmapData;
      
      private static const const_2066:Class = name_3746;
      
      private static const const_2943:BitmapData = Bitmap(new const_2066()).bitmapData;
       
      
      public const top:Shape = new Shape();
      
      public const bottom:Shape = new Shape();
      
      public const center:Shape = new Shape();
      
      public function name_3743(param1:int, param2:Boolean)
      {
         var _loc3_:Graphics = null;
         super();
         var _loc4_:int = Math.max(param1,param2 ? Number(104) : Number(150));
         addChild(this.top);
         addChild(this.center);
         addChild(this.bottom);
         _loc3_ = this.top.graphics;
         _loc3_.clear();
         _loc3_.beginBitmapFill(const_2941);
         _loc3_.drawRect(0,0,474,5);
         _loc3_.endFill();
         this.top.x = 0;
         this.top.y = 0;
         _loc3_ = this.center.graphics;
         _loc3_.clear();
         _loc3_.beginBitmapFill(const_2942);
         _loc3_.drawRect(0,0,474,_loc4_ - 10);
         _loc3_.endFill();
         this.center.x = 0;
         this.center.y = 5;
         _loc3_ = this.bottom.graphics;
         _loc3_.clear();
         _loc3_.beginBitmapFill(const_2943);
         _loc3_.drawRect(0,0,474,5);
         _loc3_.endFill();
         this.bottom.x = 0;
         this.bottom.y = _loc4_ - 5;
      }
   }
}
