package package_293
{
   import flash.display.Bitmap;
   
   public class DOMScoreIndicator extends class_198
   {
      
      private static const const_2306:int = 21;
      
      private static const const_2291:int = 9;
      
      private static const const_2305:Class = name_3042;
       
      
      private var icon:Bitmap;
      
      public function DOMScoreIndicator()
      {
         this.icon = new Bitmap(new const_2305().bitmapData);
         super();
         addChild(this.icon);
         this.icon.y = 9;
      }
      
      override protected function method_2825() : int
      {
         var _loc2_:int = var_3035.width > var_3034.width ? int(var_3035.width) : int(var_3034.width);
         var_3035.x = 5 + 5 + (_loc2_ - var_3035.width >> 1);
         this.icon.x = var_3035.x + _loc2_ + 5;
         var_3034.x = this.icon.x + 21 + 5 + (_loc2_ - var_3034.width >> 1);
         return var_3034.x + _loc2_ + 5 + 5;
      }
   }
}
