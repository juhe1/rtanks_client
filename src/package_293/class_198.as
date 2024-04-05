package package_293
{
   import controls.Label;
   import controls.resultassets.name_2332;
   import flash.display.GradientType;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.SpreadMethod;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.text.TextFieldAutoSize;
   import package_47.BattleTeamType;
   
   public class class_198 extends Sprite
   {
      
      private static const const_2304:int = 6;
      
      protected static const const_2299:uint = 9249024;
      
      protected static const const_2297:uint = 16742221;
      
      protected static const const_2296:uint = 16256;
      
      protected static const const_2298:uint = 4760319;
       
      
      protected var var_3032:int;
      
      protected var var_3033:int;
      
      protected var var_3035:Label;
      
      protected var var_3034:Label;
      
      private var background:Shape;
      
      protected var border:name_2332;
      
      public function class_198()
      {
         super();
         addChild(this.background = new Shape());
         addChild(this.border = new name_2332());
         this.var_3035 = this.method_582(16742221);
         this.var_3034 = this.method_582(4760319);
      }
      
      public function name_2340(param1:int, param2:int) : void
      {
         this.var_3032 = param1;
         this.var_3035.text = param1.toString();
         this.var_3033 = param2;
         this.var_3034.text = param2.toString();
         this.update();
      }
      
      public function name_1120(param1:BattleTeamType, param2:int) : void
      {
         switch(param1)
         {
            case BattleTeamType.RED:
               this.scoreRed = param2;
               break;
            case BattleTeamType.BLUE:
               this.scoreBlue = param2;
         }
         this.update();
      }
      
      public function get scoreRed() : int
      {
         return this.var_3032;
      }
      
      public function set scoreRed(param1:int) : void
      {
         this.var_3032 = param1;
         this.var_3035.text = param1.toString();
         this.update();
      }
      
      public function get scoreBlue() : int
      {
         return this.var_3033;
      }
      
      public function set scoreBlue(param1:int) : void
      {
         this.var_3033 = param1;
         this.var_3034.text = param1.toString();
         this.update();
      }
      
      public function update() : void
      {
         this.method_2826(this.method_2825());
      }
      
      protected function method_2825() : int
      {
         return 0;
      }
      
      private function method_2826(param1:int) : void
      {
         this.border.width = param1;
         var _loc2_:String = GradientType.LINEAR;
         var _loc3_:Array = [9249024,16256];
         var _loc4_:Array = [1,1];
         var _loc5_:int = 8 / param1 * 255;
         var _loc6_:Array = [127 - _loc5_,127 + _loc5_];
         var _loc8_:Matrix = new Matrix();
         _loc8_.createGradientBox(param1 - 2,this.border.height - 2,0,0,0);
         var _loc9_:String = SpreadMethod.PAD;
         var _loc10_:Graphics = this.background.graphics;
         _loc10_.clear();
         _loc10_.beginGradientFill(_loc2_,_loc3_,_loc4_,_loc6_,_loc8_,_loc9_);
         _loc10_.drawRect(2,2,param1 - 2 * 2,this.border.height - 2 - 1);
         _loc10_.endFill();
      }
      
      private function method_582(param1:uint) : Label
      {
         var _loc2_:Label = new Label();
         _loc2_.color = param1;
         _loc2_.size = 18;
         _loc2_.bold = true;
         _loc2_.autoSize = TextFieldAutoSize.CENTER;
         _loc2_.y = 6;
         addChild(_loc2_);
         return _loc2_;
      }
   }
}
