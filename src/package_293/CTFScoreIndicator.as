package package_293
{
   import controls.Label;
   import controls.resultassets.name_2332;
   import flash.display.Bitmap;
   import flash.display.GradientType;
   import flash.display.Graphics;
   import flash.display.SpreadMethod;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.text.TextFieldAutoSize;
   import flash.utils.getTimer;
   import package_47.BattleTeamType;
   
   public class CTFScoreIndicator extends Sprite
   {
      
      private static var var_3041:Class = name_3048;
      
      private static var var_3042:Class = name_3046;
      
      private static var var_3039:Class = name_3049;
      
      private static var var_3040:Class = name_3050;
      
      private static var var_3038:Class = name_3047;
      
      private static const const_2297:uint = 16742221;
      
      private static const const_2298:uint = 4760319;
      
      private static const const_2299:uint = 9249024;
      
      private static const const_2296:uint = 16256;
      
      private static const const_2306:int = 30;
      
      private static const const_2304:int = 6;
       
      
      private var border:name_2332;
      
      private var var_3037:FlagIndicator;
      
      private var var_3036:FlagIndicator;
      
      private var var_3035:Label;
      
      private var var_3034:Label;
      
      private var time:int;
      
      private var var_3044:ColorInterpolator;
      
      private var var_3043:ColorInterpolator;
      
      private var blinker:CTFScoreIndicatorBlinker;
      
      public function CTFScoreIndicator()
      {
         this.var_3044 = new ColorInterpolator(16742221,16777215);
         this.var_3043 = new ColorInterpolator(4760319,16777215);
         this.blinker = new CTFScoreIndicatorBlinker(0,1,Vector.<int>([200,600]),Vector.<Number>([10,1.1]));
         super();
         this.border = new name_2332();
         addChild(this.border);
         this.var_3035 = this.method_582(16742221);
         this.var_3034 = this.method_582(4760319);
         this.var_3037 = new FlagIndicator(new var_3041(),new var_3039(),new var_3038(),this.blinker);
         this.var_3037.y = 5;
         addChild(this.var_3037);
         this.var_3036 = new FlagIndicator(new var_3042(),new var_3040(),new var_3038(),this.blinker);
         this.var_3036.y = 5;
         addChild(this.var_3036);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.method_886);
      }
      
      public function name_2342(param1:int, param2:int) : void
      {
         this.var_3035.text = param1.toString();
         this.var_3034.text = param2.toString();
         this.var_3036.setState(FlagIndicator.name_3043);
         this.var_3037.setState(FlagIndicator.name_3043);
         this.update();
      }
      
      public function get redScore() : int
      {
         return int(this.var_3035.text);
      }
      
      public function set redScore(param1:int) : void
      {
         if(int(this.var_3035.text) == param1)
         {
            return;
         }
         this.var_3035.text = param1.toString();
         this.var_3037.setState(FlagIndicator.name_3044);
         this.update();
      }
      
      public function get blueScore() : int
      {
         return int(this.var_3034.text);
      }
      
      public function set blueScore(param1:int) : void
      {
         if(int(this.var_3034.text) == param1)
         {
            return;
         }
         this.var_3034.text = param1.toString();
         this.var_3036.setState(FlagIndicator.name_3044);
         this.update();
      }
      
      public function method_2829(param1:BattleTeamType) : void
      {
         var _loc2_:FlagIndicator = this.method_2827(param1);
         _loc2_.setState(FlagIndicator.name_3044);
      }
      
      public function name_2346(param1:BattleTeamType) : void
      {
         var _loc2_:FlagIndicator = this.method_2827(param1);
         _loc2_.setState(FlagIndicator.name_3043);
      }
      
      public function name_2344(param1:BattleTeamType) : void
      {
         var _loc2_:FlagIndicator = this.method_2827(param1);
         _loc2_.setState(FlagIndicator.name_3051);
      }
      
      public function name_2343(param1:BattleTeamType) : void
      {
         var _loc2_:FlagIndicator = this.method_2827(param1);
         _loc2_.setState(FlagIndicator.name_3052);
      }
      
      public function name_1120(param1:BattleTeamType, param2:int) : void
      {
         switch(param1)
         {
            case BattleTeamType.BLUE:
               this.blueScore = param2;
               break;
            case BattleTeamType.RED:
               this.redScore = param2;
         }
      }
      
      private function update() : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = this.var_3035.width > this.var_3034.width ? int(this.var_3035.width) : int(this.var_3034.width);
         this.var_3036.x = 5 + 5;
         _loc3_ = this.var_3036.x + 30 + 5;
         this.var_3035.x = _loc3_ + (_loc2_ - this.var_3035.width >> 1);
         _loc3_ += _loc2_ + 5 + 5;
         this.var_3034.x = _loc3_ + (_loc2_ - this.var_3034.width >> 1);
         _loc3_ += _loc2_ + 5;
         this.var_3037.x = _loc3_;
         _loc3_ += 30 + 5 + 5;
         this.method_2826(_loc3_);
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
         _loc8_.createGradientBox(param1 - 2 * 2,this.border.height - 2 * 2,0,0,0);
         var _loc9_:String = SpreadMethod.PAD;
         var _loc10_:Graphics = graphics;
         _loc10_.clear();
         _loc10_.beginGradientFill(_loc2_,_loc3_,_loc4_,_loc6_,_loc8_,_loc9_);
         _loc10_.drawRect(2,2,param1 - 2 * 2,this.border.height - 2 * 2);
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
         _loc2_.text = "0";
         addChild(_loc2_);
         return _loc2_;
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         this.update();
         this.time = getTimer();
         stage.addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function method_886(param1:Event) : void
      {
         stage.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc2_:int = getTimer();
         var _loc3_:int = _loc2_ - this.time;
         this.time = _loc2_;
         this.blinker.update(_loc2_,_loc3_);
         this.var_3036.update(_loc2_,_loc3_);
         this.var_3037.update(_loc2_,_loc3_);
         this.method_2828(this.var_3035,this.var_3044,this.var_3037.name_3045);
         this.method_2828(this.var_3034,this.var_3043,this.var_3036.name_3045);
      }
      
      private function method_2828(param1:Label, param2:ColorInterpolator, param3:Bitmap) : void
      {
         var _loc4_:uint = 0;
         if(param3.visible)
         {
            _loc4_ = param2.interpolate(param3.alpha);
         }
         else
         {
            _loc4_ = param2.startColor;
         }
         if(_loc4_ != param1.textColor)
         {
            param1.textColor = _loc4_;
         }
      }
      
      private function method_2827(param1:BattleTeamType) : FlagIndicator
      {
         switch(param1)
         {
            case BattleTeamType.BLUE:
               return this.var_3037;
            case BattleTeamType.RED:
               return this.var_3036;
            default:
               throw new ArgumentError("Unsupported team type");
         }
      }
   }
}

class ColorInterpolator
{
    
   
   public var startColor:uint;
   
   private var endColor:uint;
   
   private var deltaRed:Number;
   
   private var deltaGreen:Number;
   
   private var deltaBlue:Number;
   
   public function ColorInterpolator(param1:uint, param2:uint)
   {
      super();
      this.startColor = param1;
      this.endColor = param2;
      this.deltaRed = (param2 >> 16 & 255) - (param1 >> 16 & 255);
      this.deltaGreen = (param2 >> 8 & 255) - (param1 >> 8 & 255);
      this.deltaBlue = (param2 & 255) - (param1 & 255);
   }
   
   public function interpolate(param1:Number) : uint
   {
      var _loc2_:int = (this.startColor >> 16 & 255) + param1 * this.deltaRed;
      var _loc3_:int = (this.startColor >> 8 & 255) + param1 * this.deltaGreen;
      var _loc4_:int = (this.startColor & 255) + param1 * this.deltaBlue;
      return _loc2_ << 16 | _loc3_ << 8 | _loc4_;
   }
}

import flash.display.GradientType;
import flash.display.Graphics;
import flash.display.Shape;
import flash.geom.Matrix;

class FlashMask extends Shape
{
   
   private static const STATE_GROW:int = 1;
   
   private static const STATE_WAIT:int = 2;
   
   private static const STATE_FADE:int = 3;
   
   private static const GROW_SPEED:Number = 10 / 1000;
   
   private static const FADE_SPEED:Number = 1 / 1000;
   
   private static const MAX_WAIT_TIME:int = 200;
    
   
   private var m:Matrix;
   
   private var state:int;
   
   private var waitTime:int;
   
   public function FlashMask()
   {
      this.m = new Matrix();
      super();
      blendMode = "add";
      visible = false;
   }
   
   public function init(param1:int, param2:int, param3:int, param4:int, param5:uint) : void
   {
      this.x = param1;
      this.y = param2;
      this.m.createGradientBox(param3,param4);
      var _loc6_:Graphics = graphics;
      _loc6_.clear();
      _loc6_.beginGradientFill(GradientType.RADIAL,[param5,0],[1,1],[127,255],this.m);
      _loc6_.drawRect(0,0,param3,param4);
      _loc6_.endFill();
      visible = true;
      alpha = 0;
      this.state = STATE_GROW;
   }
   
   public function update(param1:int) : Boolean
   {
      switch(this.state)
      {
         case STATE_GROW:
            alpha += GROW_SPEED * param1;
            if(alpha >= 1)
            {
               alpha = 1;
               this.state = STATE_WAIT;
               this.waitTime = MAX_WAIT_TIME;
            }
            break;
         case STATE_WAIT:
            this.waitTime -= param1;
            if(this.waitTime <= 0)
            {
               this.state = STATE_FADE;
            }
            break;
         case STATE_FADE:
            alpha -= FADE_SPEED * param1;
            if(alpha <= 0)
            {
               visible = false;
               return false;
            }
            break;
      }
      return true;
   }
}
