package package_444
{
   import utils.tweener.TweenLite;
   
   public class TweenCore
   {
      
      public static const version:Number = 1.693;
      
      protected static var var_2733:Boolean;
       
      
      protected var var_2729:Number;
      
      protected var var_2742:Boolean;
      
      protected var var_2741:Number = -1;
      
      public var vars:Object;
      
      public var active:Boolean;
      
      public var gc:Boolean;
      
      public var var_2740:Boolean;
      
      public var timeline:name_2795;
      
      public var var_2728:Number;
      
      public var var_2738:Number;
      
      public var var_2727:Number;
      
      public var var_2734:Number;
      
      public var var_2731:Number;
      
      public var var_2736:Number;
      
      public var var_2735:Number;
      
      public var var_2732:Boolean;
      
      public var var_2744:TweenCore;
      
      public var var_2743:TweenCore;
      
      public var var_2739:Boolean;
      
      public var var_2737:Boolean;
      
      public var var_2730:Boolean;
      
      public var data:Object;
      
      public function TweenCore(param1:Number = 0, param2:Object = null)
      {
         super();
         this.vars = param2 != null ? param2 : {};
         if(Boolean(this.vars.isGSVars))
         {
            this.vars = this.vars.vars;
         }
         this.var_2734 = this.var_2731 = param1;
         this.var_2729 = Boolean(this.vars.delay) ? Number(Number(Number(this.vars.delay))) : Number(Number(0));
         this.var_2736 = Boolean(this.vars.timeScale) ? Number(Number(Number(this.vars.timeScale))) : Number(Number(1));
         this.active = Boolean(param1 == 0 && this.var_2729 == 0 && this.vars.immediateRender != false);
         this.var_2727 = this.var_2738 = 0;
         this.data = this.vars.data;
         if(!var_2733)
         {
            if(!isNaN(TweenLite.name_2800))
            {
               return;
            }
            TweenLite.name_2802();
            var_2733 = true;
         }
         var _loc3_:name_2795 = this.vars.timeline is name_2795 ? this.vars.timeline : (Boolean(this.vars.useFrames) ? TweenLite.name_2799 : TweenLite.name_2798);
         _loc3_.name_2796(this,_loc3_.var_2727);
         if(Boolean(this.vars.reversed))
         {
            this.var_2732 = true;
         }
         if(Boolean(this.vars.paused))
         {
            this.paused = true;
         }
      }
      
      public function play() : void
      {
         this.reversed = false;
         this.paused = false;
      }
      
      public function pause() : void
      {
         this.paused = true;
      }
      
      public function resume() : void
      {
         this.paused = false;
      }
      
      public function restart(param1:Boolean = false, param2:Boolean = true) : void
      {
         this.reversed = false;
         this.paused = false;
         this.method_2596(param1 ? Number(Number(-this.var_2729)) : Number(Number(0)),param2);
      }
      
      public function reverse(param1:Boolean = true) : void
      {
         this.reversed = true;
         if(param1)
         {
            this.paused = false;
         }
         else if(this.gc)
         {
            this.setEnabled(true,false);
         }
      }
      
      public function method_2598(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
      {
      }
      
      public function complete(param1:Boolean = false, param2:Boolean = false) : void
      {
         if(!param1)
         {
            this.method_2598(this.totalDuration,param2,false);
            return;
         }
         if(this.timeline.name_2801)
         {
            this.setEnabled(false,false);
         }
         else
         {
            this.active = false;
         }
         if(!param2)
         {
            if(this.vars.onComplete && this.var_2727 >= this.var_2731 && !this.var_2732)
            {
               this.vars.onComplete.apply(null,this.vars.onCompleteParams);
            }
            else if(this.var_2732 && this.var_2727 == 0 && Boolean(this.vars.onReverseComplete))
            {
               this.vars.onReverseComplete.apply(null,this.vars.onReverseCompleteParams);
            }
         }
      }
      
      public function invalidate() : void
      {
      }
      
      public function setEnabled(param1:Boolean, param2:Boolean = false) : Boolean
      {
         this.gc = !param1;
         if(param1)
         {
            this.active = Boolean(!this.var_2730 && this.var_2727 > 0 && this.var_2727 < this.var_2731);
            if(!param2 && this.var_2739)
            {
               this.timeline.name_2796(this,this.var_2728 - this.var_2729);
            }
         }
         else
         {
            this.active = false;
            if(!param2 && !this.var_2739)
            {
               this.timeline.remove(this,true);
            }
         }
         return false;
      }
      
      public function kill() : void
      {
         this.setEnabled(false,false);
      }
      
      protected function method_2597(param1:Boolean = true) : void
      {
         var _loc2_:TweenCore = param1 ? this : this.timeline;
         while(Boolean(_loc2_))
         {
            _loc2_.var_2737 = true;
            _loc2_ = _loc2_.timeline;
         }
      }
      
      protected function method_2596(param1:Number, param2:Boolean = false) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(Boolean(this.timeline))
         {
            _loc3_ = this.var_2730 ? Number(Number(this.var_2735)) : Number(Number(this.timeline.var_2727));
            if(this.var_2732)
            {
               _loc4_ = this.var_2737 ? Number(Number(this.totalDuration)) : Number(Number(this.var_2731));
               this.var_2728 = _loc3_ - (_loc4_ - param1) / this.var_2736;
            }
            else
            {
               this.var_2728 = _loc3_ - param1 / this.var_2736;
            }
            if(!this.timeline.var_2737)
            {
               this.method_2597(false);
            }
            if(this.var_2727 != param1)
            {
               this.method_2598(param1,param2,false);
            }
         }
      }
      
      public function get delay() : Number
      {
         return this.var_2729;
      }
      
      public function set delay(param1:Number) : void
      {
         this.startTime += param1 - this.var_2729;
         this.var_2729 = param1;
      }
      
      public function get duration() : Number
      {
         return this.var_2734;
      }
      
      public function set duration(param1:Number) : void
      {
         var _loc2_:Number = param1 / this.var_2734;
         this.var_2734 = this.var_2731 = param1;
         this.method_2597(true);
         if(this.active && !this.var_2730 && param1 != 0)
         {
            this.method_2596(this.var_2727 * _loc2_,true);
         }
      }
      
      public function get totalDuration() : Number
      {
         return this.var_2731;
      }
      
      public function set totalDuration(param1:Number) : void
      {
         this.duration = param1;
      }
      
      public function get currentTime() : Number
      {
         return this.var_2738;
      }
      
      public function set currentTime(param1:Number) : void
      {
         this.method_2596(param1,false);
      }
      
      public function get totalTime() : Number
      {
         return this.var_2727;
      }
      
      public function set totalTime(param1:Number) : void
      {
         this.method_2596(param1,false);
      }
      
      public function get startTime() : Number
      {
         return this.var_2728;
      }
      
      public function set startTime(param1:Number) : void
      {
         if(this.timeline != null && (param1 != this.var_2728 || this.gc))
         {
            this.timeline.name_2796(this,param1 - this.var_2729);
         }
         else
         {
            this.var_2728 = param1;
         }
      }
      
      public function get reversed() : Boolean
      {
         return this.var_2732;
      }
      
      public function set reversed(param1:Boolean) : void
      {
         if(param1 != this.var_2732)
         {
            this.var_2732 = param1;
            this.method_2596(this.var_2727,true);
         }
      }
      
      public function get paused() : Boolean
      {
         return this.var_2730;
      }
      
      public function set paused(param1:Boolean) : void
      {
         if(param1 != this.var_2730 && Boolean(this.timeline))
         {
            if(param1)
            {
               this.var_2735 = this.timeline.name_2797;
            }
            else
            {
               this.var_2728 += this.timeline.name_2797 - this.var_2735;
               this.var_2735 = NaN;
               this.method_2597(false);
            }
            this.var_2730 = param1;
            this.active = Boolean(!this.var_2730 && this.var_2727 > 0 && this.var_2727 < this.var_2731);
         }
         if(!param1 && this.gc)
         {
            this.setEnabled(true,false);
         }
      }
   }
}
