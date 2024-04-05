package alternativa.tanks.models.dom.hud
{
   import alternativa.tanks.models.dom.Point;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.PixelSnapping;
   import flash.display.Sprite;
   import package_37.Vector3;
   import package_410.name_2892;
   import utils.name_2893;
   
   public class name_2231 extends Sprite
   {
       
      
      private var point:Point;
      
      private var var_2872:Bitmap;
      
      private var var_2873:Bitmap;
      
      private var var_2871:name_2893;
      
      private var score:Number = 0;
      
      private var var_170:Sprite;
      
      public function name_2231(param1:Point)
      {
         super();
         this.point = param1;
         this.var_170 = new Sprite();
         this.method_2711();
      }
      
      private static function method_2708(param1:name_2892) : Bitmap
      {
         return new Bitmap(MarkerBitmaps.name_2896(param1),PixelSnapping.AUTO,true);
      }
      
      private function method_2711() : void
      {
         this.var_2872 = method_2708(name_2892.BLUE);
         this.var_2873 = method_2708(name_2892.RED);
         addChild(method_2708(name_2892.name_2895));
         addChild(this.var_170);
         this.var_2871 = new name_2893(this.var_2872.width);
         this.var_170.addChild(this.var_2871);
         addChild(new Bitmap(MarkerBitmaps.name_2894(this.point.id == 0 ? "A" : (this.point.id == 1 ? "B" : (this.point.id == 2 ? "C" : (this.point.id == 3 ? "D" : (this.point.id == 4 ? "E" : (this.point.id == 5 ? "F" : "G"))))))));
         this.method_2709();
      }
      
      public function update() : void
      {
         this.name_2340(this.point.name_2228);
      }
      
      public function name_2880() : Point
      {
         return this.point;
      }
      
      private function name_2340(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         if(param1 < -100)
         {
            param1 = -100;
         }
         else if(param1 > 100)
         {
            param1 = 100;
         }
         if(this.score != param1)
         {
            if(param1 == 0)
            {
               this.method_2709();
            }
            else
            {
               _loc2_ = Math.abs(param1) / 100;
               this.var_2871.method_284(1 - _loc2_,1);
               if(param1 < 0)
               {
                  this.method_2712();
               }
               else if(param1 > 0)
               {
                  this.method_2713();
               }
            }
            this.score = param1;
         }
      }
      
      public function name_2881(param1:Vector3) : void
      {
         this.point.name_2238(param1);
      }
      
      private function method_2709() : void
      {
         this.var_170.visible = false;
      }
      
      private function method_2712() : void
      {
         this.var_170.visible = true;
         this.method_2710(this.var_2872,this.var_2873);
         this.var_170.mask = this.var_2871;
      }
      
      private function method_2713() : void
      {
         this.var_170.visible = true;
         this.method_2710(this.var_2873,this.var_2872);
         this.var_170.mask = this.var_2871;
      }
      
      private function method_2710(param1:DisplayObject, param2:DisplayObject) : void
      {
         if(param2.parent == null)
         {
            if(param1.parent != null)
            {
               this.var_170.removeChild(param1);
            }
            this.var_170.addChild(param2);
         }
      }
   }
}
