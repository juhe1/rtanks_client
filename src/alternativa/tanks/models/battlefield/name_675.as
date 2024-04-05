package alternativa.tanks.models.battlefield
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.geom.Matrix;
   
   public class name_675
   {
      
      private static var bmpClassCorner1:Class = ViewportBorder_bmpClassCorner1;
      
      private static var bmdCorner1:BitmapData = Bitmap(new bmpClassCorner1()).bitmapData;
      
      private static var bmpClassCorner2:Class = ViewportBorder_bmpClassCorner2;
      
      private static var bmdCorner2:BitmapData = Bitmap(new bmpClassCorner2()).bitmapData;
      
      private static var bmpClassCorner3:Class = ViewportBorder_bmpClassCorner3;
      
      private static var bmdCorner3:BitmapData = Bitmap(new bmpClassCorner3()).bitmapData;
      
      private static var bmpClassCorner4:Class = ViewportBorder_bmpClassCorner4;
      
      private static var bmdCorner4:BitmapData = Bitmap(new bmpClassCorner4()).bitmapData;
      
      private static var var_1424:Class = name_2083;
      
      private static var var_1419:BitmapData = Bitmap(new var_1424()).bitmapData;
      
      private static var var_1423:Class = name_2084;
      
      private static var var_1420:BitmapData = Bitmap(new var_1423()).bitmapData;
      
      private static var var_1422:Class = name_2081;
      
      private static var var_1418:BitmapData = Bitmap(new var_1422()).bitmapData;
      
      private static var var_1425:Class = name_2082;
      
      private static var var_1421:BitmapData = Bitmap(new var_1425()).bitmapData;
       
      
      public function name_675()
      {
         super();
      }
      
      public function draw(param1:Graphics, param2:int, param3:int) : void
      {
         this.method_1635(param1,bmdCorner1,4 - bmdCorner1.width,4 - bmdCorner1.height,bmdCorner1.width,bmdCorner1.height);
         this.method_1635(param1,bmdCorner2,param2 - 4,4 - bmdCorner2.height,bmdCorner2.width,bmdCorner2.height);
         this.method_1635(param1,bmdCorner3,4 - bmdCorner3.width,param3 - 4,bmdCorner3.width,bmdCorner3.height);
         this.method_1635(param1,bmdCorner4,param2 - 4,param3 - 4,bmdCorner4.width,bmdCorner4.height);
         this.method_1635(param1,var_1418,4,4 - var_1418.height,param2 - 2 * 4,var_1418.height);
         this.method_1635(param1,var_1421,4,param3 - 4,param2 - 2 * 4,var_1421.height);
         this.method_1635(param1,var_1419,4 - var_1419.width,4,var_1419.width,param3 - 2 * 4);
         this.method_1635(param1,var_1420,param2 - 4,4,var_1420.width,param3 - 2 * 4);
      }
      
      private function method_1635(param1:Graphics, param2:BitmapData, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc7_:Matrix = new Matrix();
         _loc7_.tx = param3;
         _loc7_.ty = param4;
         param1.beginBitmapFill(param2,_loc7_);
         param1.drawRect(param3,param4,param5,param6);
         param1.endFill();
      }
   }
}
