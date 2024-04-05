package package_293
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   
   public class FlagIndicator extends Sprite
   {
      
      public static const name_3043:int = 1;
      
      public static const name_3051:int = 2;
      
      public static const name_3052:int = 3;
      
      public static const name_3044:int = 4;
       
      
      public var var_3555:Bitmap;
      
      public var var_3556:Bitmap;
      
      public var name_3045:Bitmap;
      
      private var var_2426:Dictionary;
      
      private var var_1784:IFlagIndicatorState;
      
      public function FlagIndicator(param1:Bitmap, param2:Bitmap, param3:Bitmap, param4:CTFScoreIndicatorBlinker)
      {
         this.var_2426 = new Dictionary();
         super();
         this.var_3555 = param1;
         this.var_3556 = param2;
         this.name_3045 = param3;
         addChild(param1);
         addChild(param2);
         addChild(param3);
         this.var_2426[1] = new StateAtBase(1,this);
         this.var_2426[4] = new StateFlash(4,this,10 / 1000,1 / 1000,300);
         this.var_2426[2] = new StateLost(2,this,param4,0);
         this.var_2426[3] = new StateLost(3,this,param4,1);
         this.var_1784 = this.var_2426[1];
         this.var_1784.start();
      }
      
      public function setState(param1:int) : void
      {
         if(this.var_1784.getType() == param1)
         {
            return;
         }
         this.var_1784.stop();
         this.var_1784 = this.var_2426[param1];
         this.var_1784.start();
      }
      
      public function update(param1:int, param2:int) : void
      {
         this.var_1784.update(param1,param2);
      }
   }
}

interface IFlagIndicatorState
{
    
   
   function getType() : int;
   
   function start() : void;
   
   function stop() : void;
   
   function update(param1:int, param2:int) : void;
}

import package_293.FlagIndicator;

class StateAtBase implements IFlagIndicatorState
{
    
   
   private var type:int;
   
   private var indicator:FlagIndicator;
   
   public function StateAtBase(param1:int, param2:FlagIndicator)
   {
      super();
      this.type = param1;
      this.indicator = param2;
   }
   
   public function getType() : int
   {
      return this.type;
   }
   
   public function start() : void
   {
      this.indicator.var_3555.visible = true;
      this.indicator.var_3555.alpha = 1;
      this.indicator.name_3045.visible = false;
      this.indicator.var_3556.visible = false;
   }
   
   public function stop() : void
   {
   }
   
   public function update(param1:int, param2:int) : void
   {
   }
}

import package_293.FlagIndicator;

class StateFlash implements IFlagIndicatorState
{
   
   private static const STATE_FADE_IN:int = 1;
   
   private static const STATE_WAIT:int = 2;
   
   private static const STATE_FADE_OUT:int = 3;
    
   
   private var type:int;
   
   private var indicator:FlagIndicator;
   
   private var waitTime:int;
   
   private var time:int;
   
   private var fadeInSpeed:Number = 0.01;
   
   private var fadeOutSpeed:Number = 0.001;
   
   private var state:int;
   
   public function StateFlash(param1:int, param2:FlagIndicator, param3:Number, param4:Number, param5:int)
   {
      super();
      this.type = param1;
      this.indicator = param2;
      this.fadeInSpeed = param3;
      this.fadeOutSpeed = param4;
      this.waitTime = param5;
   }
   
   public function getType() : int
   {
      return this.type;
   }
   
   public function start() : void
   {
      this.indicator.var_3555.visible = true;
      this.indicator.var_3555.alpha = 1;
      this.indicator.var_3556.visible = false;
      this.indicator.name_3045.visible = true;
      this.indicator.name_3045.alpha = 0;
      this.state = STATE_FADE_IN;
   }
   
   public function stop() : void
   {
   }
   
   public function update(param1:int, param2:int) : void
   {
      var _loc3_:Number = Number(this.indicator.var_3555.alpha);
      switch(this.state)
      {
         case STATE_FADE_IN:
            _loc3_ -= this.fadeInSpeed * param2;
            if(_loc3_ <= 0)
            {
               _loc3_ = 0;
               this.state = STATE_WAIT;
               this.time = this.waitTime;
            }
            break;
         case STATE_WAIT:
            this.time -= param2;
            if(this.time <= 0)
            {
               this.state = STATE_FADE_OUT;
            }
            break;
         case STATE_FADE_OUT:
            _loc3_ += this.fadeOutSpeed * param2;
            if(_loc3_ >= 1)
            {
               this.indicator.setState(FlagIndicator.name_3043);
               break;
            }
      }
      this.indicator.var_3555.alpha = _loc3_;
      this.indicator.name_3045.alpha = 1 - _loc3_;
   }
}

import flash.utils.getTimer;
import package_293.CTFScoreIndicatorBlinker;
import package_293.FlagIndicator;

class StateLost implements IFlagIndicatorState
{
    
   
   private var type:int;
   
   private var indicator:FlagIndicator;
   
   private var blinker:CTFScoreIndicatorBlinker;
   
   private var valueIndex:int;
   
   public function StateLost(param1:int, param2:FlagIndicator, param3:CTFScoreIndicatorBlinker, param4:int)
   {
      super();
      this.type = param1;
      this.indicator = param2;
      this.blinker = param3;
      this.valueIndex = param4;
   }
   
   public function getType() : int
   {
      return this.type;
   }
   
   public function start() : void
   {
      this.blinker.start(getTimer());
      this.indicator.var_3555.visible = true;
      this.indicator.var_3555.alpha = 1;
      this.indicator.name_3045.visible = false;
      this.indicator.var_3556.visible = true;
      this.indicator.var_3556.alpha = 0;
   }
   
   public function stop() : void
   {
      this.blinker.stop();
   }
   
   public function update(param1:int, param2:int) : void
   {
      var _loc3_:Number = Number(this.blinker.method_393[this.valueIndex]);
      this.indicator.var_3555.alpha = _loc3_;
      this.indicator.var_3556.alpha = 1 - _loc3_;
   }
}
