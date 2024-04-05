package package_292
{
   import alternativa.tanks.display.name_3035;
   import alternativa.tanks.models.dom.Point;
   import controls.Label;
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   
   public class name_2331 extends Sprite
   {
      
      private static const SIZE:int = 36;
      
      private static const const_2297:uint = 16742221;
      
      private static const const_2298:uint = 4760319;
      
      private static const const_2300:uint = 16777215;
      
      private static const const_2299:uint = 9249024;
      
      private static const const_2296:uint = 16256;
       
      
      private var point:Point;
      
      private var label:Label;
      
      private var var_3030:name_3035;
      
      private var score:Number = 0;
      
      public function name_2331(param1:Point)
      {
         super();
         this.point = param1;
         this.method_2823();
         this.method_582();
         this.update();
      }
      
      public static function name_1308(param1:int) : uint
      {
         if(param1 >= 100)
         {
            return 4760319;
         }
         if(param1 <= -100)
         {
            return 16742221;
         }
         return 16777215;
      }
      
      private function method_2823() : void
      {
         this.var_3030 = new name_3035(36,0,0,0);
         addChild(this.var_3030);
      }
      
      private function method_582() : void
      {
         this.label = new Label();
         this.label.size = 18;
         this.label.bold = true;
         this.label.color = name_1308(this.point.name_2228);
         this.label.text = this.point.id == 0 ? "A" : (this.point.id == 1 ? "B" : (this.point.id == 2 ? "C" : (this.point.id == 3 ? "D" : (this.point.id == 4 ? "E" : (this.point.id == 5 ? "F" : "G")))));
      }
      
      public function name_2075() : Label
      {
         return this.label;
      }
      
      public function update() : void
      {
         this.updateScore();
         this.method_668();
      }
      
      private function method_668() : void
      {
         this.label.visible = true;
         this.var_3030.visible = true;
      }
      
      private function method_2338(param1:uint) : void
      {
         var _loc2_:ColorTransform = this.var_3030.transform.colorTransform;
         _loc2_.redOffset = param1;
         _loc2_.greenOffset = param1;
         _loc2_.blueOffset = param1;
         this.var_3030.transform.colorTransform = _loc2_;
      }
      
      private function method_2824() : uint
      {
         if(this.point.name_2228 >= 100)
         {
            return 4760319;
         }
         if(this.point.name_2228 <= -100)
         {
            return 16742221;
         }
         return 16777215;
      }
      
      private function updateScore() : void
      {
         if(this.score != this.point.name_2228)
         {
            this.score = this.point.name_2228;
            if(this.score < 0)
            {
               this.var_3030.name_2552(9249024,1);
            }
            else if(this.score > 0)
            {
               this.var_3030.name_2552(16256,1);
            }
            else
            {
               this.var_3030.name_2552(0,0);
            }
            this.label.color = this.method_2824();
            this.var_3030.method_284(Math.abs(this.score) / 100);
         }
      }
      
      override public function get width() : Number
      {
         return 36;
      }
      
      override public function get height() : Number
      {
         return 36;
      }
   }
}
