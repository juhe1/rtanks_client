package utils.tweener
{
   import flash.display.Shape;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import package_444.TweenCore;
   import package_444.name_2795;
   import package_444.name_2803;
   
   public class TweenLite extends TweenCore
   {
      
      public static var var_119:Object = {};
      
      public static var var_2749:Function;
      
      public static var var_2753:Function = TweenLite.method_2593;
      
      public static var var_2748:Object;
      
      public static var name_2800:Number;
      
      public static var name_2798:name_2795;
      
      public static var name_2799:name_2795;
      
      public static var var_2746:Dictionary = new Dictionary(false);
      
      private static var var_2754:Shape = new Shape();
      
      protected static var var_2752:Object = {
         "ease":1,
         "delay":1,
         "overwrite":1,
         "onComplete":1,
         "onCompleteParams":1,
         "useFrames":1,
         "runBackwards":1,
         "startAt":1,
         "onUpdate":1,
         "onUpdateParams":1,
         "onStart":1,
         "onStartParams":1,
         "onInit":1,
         "onInitParams":1,
         "onReverseComplete":1,
         "onReverseCompleteParams":1,
         "onRepeat":1,
         "onRepeatParams":1,
         "proxiedEase":1,
         "easeParams":1,
         "yoyo":1,
         "onCompleteListener":1,
         "onUpdateListener":1,
         "onStartListener":1,
         "onReverseCompleteListener":1,
         "onRepeatListener":1,
         "orientToBezier":1,
         "timeScale":1,
         "immediateRender":1,
         "repeat":1,
         "repeatDelay":1,
         "timeline":1,
         "data":1,
         "paused":1,
         "reversed":1
      };
       
      
      public var target:Object;
      
      public var var_2747:Object;
      
      public var ratio:Number = 0;
      
      public var var_2745:name_2803;
      
      protected var var_2751:Function;
      
      protected var var_2755:int;
      
      protected var var_2750:Object;
      
      protected var var_2757:Boolean;
      
      protected var var_2756:Boolean;
      
      public function TweenLite(param1:Object, param2:Number, param3:Object)
      {
         var _loc4_:TweenLite = null;
         super(param2,param3);
         if(param1 == null)
         {
            throw new Error("Cannot tween a null object.");
         }
         this.target = param1;
         if(this.target is TweenCore && Boolean(this.vars.timeScale))
         {
            this.var_2736 = 1;
         }
         this.var_2747 = {};
         this.var_2751 = var_2753;
         this.var_2755 = Number(param3.overwrite) <= -1 || !var_2748.enabled && param3.overwrite > 1 ? int(int(var_2748.mode)) : int(int(int(param3.overwrite)));
         var _loc5_:Array = var_2746[param1];
         if(!_loc5_)
         {
            var_2746[param1] = [this];
         }
         else if(this.var_2755 == 1)
         {
            for each(_loc4_ in _loc5_)
            {
               if(!_loc4_.gc)
               {
                  _loc4_.setEnabled(false,false);
               }
            }
            var_2746[param1] = [this];
         }
         else
         {
            _loc5_[_loc5_.length] = this;
         }
         if(this.active || Boolean(this.vars.immediateRender))
         {
            this.method_2598(0,false,true);
         }
      }
      
      public static function name_2802() : void
      {
         name_2800 = 0;
         name_2798 = new name_2795(null);
         name_2799 = new name_2795(null);
         name_2798.var_2728 = getTimer() * 0.001;
         name_2799.var_2728 = name_2800;
         name_2798.name_2801 = true;
         name_2799.name_2801 = true;
         var_2754.addEventListener(Event.ENTER_FRAME,method_2599,false,0,true);
         if(var_2748 == null)
         {
            var_2748 = {
               "mode":1,
               "enabled":false
            };
         }
      }
      
      public static function name_2095(param1:Object, param2:Number, param3:Object) : TweenLite
      {
         return new TweenLite(param1,param2,param3);
      }
      
      public static function method_2602(param1:Object, param2:Number, param3:Object) : TweenLite
      {
         if(Boolean(param3.isGSVars))
         {
            param3 = param3.vars;
         }
         param3.runBackwards = true;
         if(!("immediateRender" in param3))
         {
            param3.immediateRender = true;
         }
         return new TweenLite(param1,param2,param3);
      }
      
      protected static function method_2599(param1:Event = null) : void
      {
         var _loc2_:Dictionary = null;
         var _loc3_:* = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         name_2798.method_2598((getTimer() * 0.001 - name_2798.var_2728) * name_2798.var_2736,false,false);
         name_2800 += 1;
         name_2799.method_2598((name_2800 - name_2799.var_2728) * name_2799.var_2736,false,false);
         if(!(name_2800 % 60))
         {
            _loc2_ = var_2746;
            for(_loc3_ in _loc2_)
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = int(_loc4_.length);
               while(--_loc5_ > -1)
               {
                  if(TweenLite(_loc4_[_loc5_]).gc)
                  {
                     _loc4_.splice(_loc5_,1);
                  }
               }
               if(_loc4_.length == 0)
               {
                  delete _loc2_[_loc3_];
               }
            }
         }
      }
      
      public static function method_2603(param1:Object, param2:Boolean = false, param3:Object = null) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:TweenLite = null;
         if(param1 in var_2746)
         {
            _loc4_ = var_2746[param1];
            _loc5_ = int(_loc4_.length);
            while(--_loc5_ > -1)
            {
               _loc6_ = _loc4_[_loc5_];
               if(!_loc6_.gc)
               {
                  if(param2)
                  {
                     _loc6_.complete(false,false);
                  }
                  if(param3 != null)
                  {
                     _loc6_.method_2600(param3);
                  }
                  if(param3 == null || _loc6_.var_2745 == null && _loc6_.var_2740)
                  {
                     _loc6_.setEnabled(false,false);
                  }
               }
            }
            if(param3 == null)
            {
               delete var_2746[param1];
            }
         }
      }
      
      protected static function method_2593(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return 1 - (param1 = 1 - param1 / param4) * param1;
      }
      
      protected function init() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = undefined;
         var _loc4_:Boolean = false;
         var _loc5_:Array = null;
         var _loc6_:name_2803 = null;
         if(Boolean(this.vars.onInit))
         {
            this.vars.onInit.apply(null,this.vars.onInitParams);
         }
         if(typeof this.vars.ease == "function")
         {
            this.var_2751 = this.vars.ease;
         }
         if(Boolean(this.vars.easeParams))
         {
            this.vars.proxiedEase = this.var_2751;
            this.var_2751 = this.method_2601;
         }
         this.var_2745 = null;
         this.var_2747 = {};
         for(_loc1_ in this.vars)
         {
            if(!(_loc1_ in var_2752 && !(_loc1_ == "timeScale" && this.target is TweenCore)))
            {
               if(_loc1_ in var_119 && Boolean((_loc3_ = new (var_119[_loc1_] as Class)()).onInitTween(this.target,this.vars[_loc1_],this)))
               {
                  this.var_2745 = new name_2803(_loc3_,"changeFactor",0,1,_loc3_.overwriteProps.length == 1 ? String(_loc3_.overwriteProps[0]) : "_MULTIPLE_",true,this.var_2745);
                  if(this.var_2745.name == "_MULTIPLE_")
                  {
                     _loc2_ = int(_loc3_.overwriteProps.length);
                     while(--_loc2_ > -1)
                     {
                        this.var_2747[_loc3_.overwriteProps[_loc2_]] = this.var_2745;
                     }
                  }
                  else
                  {
                     this.var_2747[this.var_2745.name] = this.var_2745;
                  }
                  if(Boolean(_loc3_.priority))
                  {
                     this.var_2745.priority = _loc3_.priority;
                     _loc4_ = true;
                  }
                  if(Boolean(_loc3_.onDisable) || Boolean(_loc3_.onEnable))
                  {
                     this.var_2756 = true;
                  }
                  this.var_2757 = true;
               }
               else
               {
                  this.var_2745 = new name_2803(this.target,_loc1_,Number(this.target[_loc1_]),typeof this.vars[_loc1_] == "number" ? Number(Number(Number(this.vars[_loc1_]) - this.target[_loc1_])) : Number(Number(Number(this.vars[_loc1_]))),_loc1_,false,this.var_2745);
                  this.var_2747[_loc1_] = this.var_2745;
               }
            }
         }
         if(_loc4_)
         {
            var_2749("onInitAllProps",this);
         }
         if(Boolean(this.vars.runBackwards))
         {
            _loc6_ = this.var_2745;
            while(Boolean(_loc6_))
            {
               _loc6_.start += _loc6_.change;
               _loc6_.change = -_loc6_.change;
               _loc6_ = _loc6_.var_2744;
            }
         }
         var_2742 = Boolean(this.vars.onUpdate != null);
         if(Boolean(this.var_2750))
         {
            this.method_2600(this.var_2750);
            if(this.var_2745 == null)
            {
               this.setEnabled(false,false);
            }
         }
         if(this.var_2755 > 1 && this.var_2745 && (_loc5_ = var_2746[this.target]) && _loc5_.length > 1)
         {
            if(Boolean(var_2748.manageOverwrites(this,this.var_2747,_loc5_,this.var_2755)))
            {
               this.init();
            }
         }
         this.var_2740 = true;
      }
      
      override public function method_2598(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
      {
         var _loc4_:* = false;
         var _loc5_:Number = this.var_2738;
         if(param1 >= this.var_2734)
         {
            this.var_2727 = this.var_2738 = this.var_2734;
            this.ratio = 1;
            _loc4_ = !this.var_2732;
            if(this.var_2734 == 0)
            {
               if((param1 == 0 || var_2741 < 0) && var_2741 != param1)
               {
                  param3 = true;
               }
               var_2741 = param1;
            }
         }
         else if(param1 <= 0)
         {
            this.var_2727 = this.var_2738 = this.ratio = 0;
            if(param1 < 0)
            {
               this.active = false;
               if(this.var_2734 == 0)
               {
                  if(var_2741 >= 0)
                  {
                     param3 = true;
                     _loc4_ = var_2741 > 0;
                  }
                  var_2741 = param1;
               }
            }
            if(this.var_2732 && _loc5_ != 0)
            {
               _loc4_ = true;
            }
         }
         else
         {
            this.var_2727 = this.var_2738 = param1;
            this.ratio = this.var_2751(param1,0,1,this.var_2734);
         }
         if(this.var_2738 == _loc5_ && !param3)
         {
            return;
         }
         if(!this.var_2740)
         {
            this.init();
            if(!_loc4_ && Boolean(this.var_2738))
            {
               this.ratio = this.var_2751(this.var_2738,0,1,this.var_2734);
            }
         }
         if(!this.active && !this.var_2730)
         {
            this.active = true;
         }
         if(_loc5_ == 0 && this.vars.onStart && (this.var_2738 != 0 || this.var_2734 == 0) && !param2)
         {
            this.vars.onStart.apply(null,this.vars.onStartParams);
         }
         var _loc6_:name_2803 = this.var_2745;
         while(Boolean(_loc6_))
         {
            _loc6_.target[_loc6_.property] = _loc6_.start + this.ratio * _loc6_.change;
            _loc6_ = _loc6_.var_2744;
         }
         if(var_2742 && !param2)
         {
            this.vars.onUpdate.apply(null,this.vars.onUpdateParams);
         }
         if(_loc4_ && !this.gc)
         {
            if(this.var_2757 && Boolean(this.var_2745))
            {
               var_2749("onComplete",this);
            }
            complete(true,param2);
         }
      }
      
      public function method_2600(param1:Object, param2:Boolean = true) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:name_2803 = null;
         var _loc5_:Boolean = false;
         if(this.var_2750 == null)
         {
            this.var_2750 = {};
         }
         for(_loc3_ in param1)
         {
            if(_loc3_ in this.var_2747)
            {
               _loc4_ = this.var_2747[_loc3_];
               if(_loc4_.name_2804 && _loc4_.name == "_MULTIPLE_")
               {
                  _loc4_.target.killProps(param1);
                  if(_loc4_.target.overwriteProps.length == 0)
                  {
                     _loc4_.name = "";
                  }
                  if(_loc3_ != _loc4_.target.propName || _loc4_.name == "")
                  {
                     delete this.var_2747[_loc3_];
                  }
               }
               if(_loc4_.name != "_MULTIPLE_")
               {
                  if(Boolean(_loc4_.var_2744))
                  {
                     _loc4_.var_2744.var_2743 = _loc4_.var_2743;
                  }
                  if(Boolean(_loc4_.var_2743))
                  {
                     _loc4_.var_2743.var_2744 = _loc4_.var_2744;
                  }
                  else if(this.var_2745 == _loc4_)
                  {
                     this.var_2745 = _loc4_.var_2744;
                  }
                  if(_loc4_.name_2804 && Boolean(_loc4_.target.onDisable))
                  {
                     _loc4_.target.onDisable();
                     if(Boolean(_loc4_.target.activeDisable))
                     {
                        _loc5_ = true;
                     }
                  }
                  delete this.var_2747[_loc3_];
               }
            }
            if(param2 && param1 != this.var_2750)
            {
               this.var_2750[_loc3_] = 1;
            }
         }
         return _loc5_;
      }
      
      override public function invalidate() : void
      {
         if(this.var_2756 && Boolean(this.var_2745))
         {
            var_2749("onDisable",this);
         }
         this.var_2745 = null;
         this.var_2750 = null;
         var_2742 = this.var_2740 = this.active = this.var_2756 = false;
         this.var_2747 = {};
      }
      
      override public function setEnabled(param1:Boolean, param2:Boolean = false) : Boolean
      {
         var _loc3_:Array = null;
         if(param1)
         {
            _loc3_ = TweenLite.var_2746[this.target];
            if(!_loc3_)
            {
               TweenLite.var_2746[this.target] = [this];
            }
            else if(_loc3_.indexOf(this) == -1)
            {
               _loc3_[_loc3_.length] = this;
            }
         }
         super.setEnabled(param1,param2);
         if(this.var_2756 && Boolean(this.var_2745))
         {
            return var_2749(param1 ? "onEnable" : "onDisable",this);
         }
         return false;
      }
      
      protected function method_2601(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return this.vars.proxiedEase.apply(null,arguments.concat(this.vars.easeParams));
      }
   }
}
