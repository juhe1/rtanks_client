package package_429
{
   import alternativa.tanks.display.name_3508;
   import alternativa.tanks.models.battlefield.gui.inventory.name_2589;
   import alternativa.tanks.sfx.name_2384;
   import flash.utils.getTimer;
   import package_430.class_204;
   import package_430.name_2591;
   import utils.tweener.TweenLite;
   
   public class name_3176
   {
       
      
      private var var_2948:name_2590;
      
      private var var_3106:int;
      
      private var var_3573:int;
      
      private var var_3576:Boolean;
      
      private var var_3584:TweenLite;
      
      private var var_3585:TweenLite;
      
      private var var_3574:Boolean;
      
      private var var_3575:Boolean;
      
      private var var_3581:Function;
      
      private var var_3589:Function;
      
      private var var_3586:name_3507;
      
      private var var_2293:class_204;
      
      private var var_2291:int;
      
      private var var_2290:name_2589;
      
      private var blinker:name_2384;
      
      private var var_3590:int;
      
      private var lastUpdateTime:int = -1;
      
      private var var_3587:Boolean = false;
      
      private var method_36:Boolean = false;
      
      private var var_3588:Boolean = true;
      
      public function name_3176(param1:int, param2:name_2589, param3:name_2590, param4:class_204, param5:Function, param6:Function, param7:Boolean = true)
      {
         super();
         this.var_3588 = param7;
         this.var_2291 = param1;
         this.var_2290 = param2;
         this.var_2948 = param3;
         this.var_2293 = param4;
         this.var_3581 = param5;
         this.var_3589 = param6;
         this.var_3586 = new name_3507();
         this.var_3590 = name_3508.name_3510(this.var_2291);
         this.blinker = name_3508.name_3511(this.var_2291);
      }
      
      public function update(param1:int) : void
      {
         var _loc2_:int = 0;
         if(!this.var_3574)
         {
            return;
         }
         if(this.lastUpdateTime < 0)
         {
            this.lastUpdateTime = param1;
         }
         else
         {
            _loc2_ = param1 - this.lastUpdateTime;
            this.lastUpdateTime = param1;
            if(this.var_3588 && param1 - this.var_3106 > this.var_3573 - this.var_3590)
            {
               if(!this.method_36)
               {
                  this.method_3207(param1,_loc2_);
               }
            }
            else if(this.var_3587)
            {
               this.method_3205();
            }
         }
         if(this.var_3576 || this.var_3575)
         {
            return;
         }
         this.var_3586.progress = this.method_3202(param1,this.var_3106,this.var_3573);
         if(this.var_3586.progress > 1)
         {
            this.var_3586.progress = 1;
            this.finish();
            trace("finish");
         }
         this.var_2948.method_284(this.var_3586.progress,1);
      }
      
      public function get name_1399() : Boolean
      {
         return this.var_3574;
      }
      
      public function destroy() : void
      {
         if(this.var_3574)
         {
            this.var_3574 = false;
            this.var_3576 = false;
            this.var_3575 = false;
            this.var_3106 = -1;
            this.var_3573 = 0;
            this.var_3586.reset();
            this.var_2948.method_284(0,0);
            TweenLite.method_2603(this.var_3586);
            this.method_3205();
         }
      }
      
      public function method_287() : Number
      {
         if(this.var_3575)
         {
            return this.var_3586.addingProgress;
         }
         if(this.var_3576)
         {
            return this.var_3586.fillProgress;
         }
         return this.var_3586.progress;
      }
      
      public function name_3178(param1:int, param2:int, param3:Boolean) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         this.method_36 = false;
         if(this.var_3574)
         {
            _loc4_ = this.method_3200();
            _loc5_ = param2 - _loc4_;
            if(_loc5_ > name_2596.const_2456)
            {
               if(this.var_3576 || this.var_3575)
               {
                  if(this.var_3576)
                  {
                     _loc6_ = param2 - (_loc4_ + name_2596.const_2458 * 1000);
                  }
                  if(this.var_3575)
                  {
                     _loc6_ = param2 - (_loc4_ + name_2596.const_2457 * 1000);
                  }
                  if(_loc6_ > name_2596.const_2456)
                  {
                     this.var_3573 += _loc6_;
                  }
               }
               else
               {
                  this.method_3198(param1,param2,param3);
               }
            }
         }
         else
         {
            this.activate(param1,param2,param3);
         }
      }
      
      public function method_2918() : void
      {
         this.method_3205();
         this.method_36 = true;
         this.var_3106 = -1;
         this.var_3573 = 0;
      }
      
      private function method_3207(param1:int, param2:int) : void
      {
         var _loc3_:Number = NaN;
         if(this.var_3587)
         {
            _loc3_ = this.blinker.name_2390(param1,param2);
            if(_loc3_ != this.var_2290.alpha)
            {
               this.var_2290.alpha = _loc3_;
            }
         }
         else
         {
            this.blinker.name_2389(name_3508.name_3509);
            this.blinker.init(param1);
            this.var_3587 = true;
         }
      }
      
      private function finish() : void
      {
         this.var_3574 = false;
         this.var_3106 = -1;
         this.var_3573 = 0;
         this.method_3205();
         this.var_3586.reset();
         this.var_2948.method_284(this.var_3586.progress,1);
         this.var_3581.apply();
      }
      
      private function method_3202(param1:int, param2:int, param3:int) : Number
      {
         var _loc4_:int = param1 - param2;
         return _loc4_ / param3;
      }
      
      private function activate(param1:int, param2:int, param3:Boolean) : void
      {
         if(this.var_3574 || param2 <= 0)
         {
            return;
         }
         this.var_3574 = true;
         this.method_3206(param1,param2,param3);
      }
      
      public function method_2917() : void
      {
         this.var_3574 = true;
         this.var_3586.progress = 0;
         this.var_3586.fillProgress = 1;
         this.var_3573 = int.MAX_VALUE;
      }
      
      private function method_3206(param1:int, param2:int, param3:Boolean) : void
      {
         if(this.var_3576)
         {
            this.name_3178(param1,param2,param3);
            return;
         }
         var _loc4_:int = param2 - name_2596.const_2458 * 1000;
         if(_loc4_ > name_2596.const_2456)
         {
            this.var_3576 = true;
            this.var_2293.method_2328(name_2591.name_1308(this.var_2291));
            this.var_3106 = param1 + name_2596.const_2458 * 1000;
            this.var_3573 = _loc4_;
            this.var_3586.progress = 0;
            this.var_3586.fillProgress = 1;
            this.var_3584 = TweenLite.name_2095(this.var_3586,name_2596.const_2458,{
               "fillProgress":0,
               "onComplete":this.method_3199
            });
         }
      }
      
      private function method_3199() : void
      {
         this.var_3586.fillProgress = 0;
         this.var_2948.method_284(0,1);
         this.var_3589.apply();
         this.var_3576 = false;
      }
      
      private function method_3200() : int
      {
         if(this.var_3573 == 0 || this.var_3106 == -1)
         {
            return 0;
         }
         return this.var_3573 - (getTimer() - this.var_3106);
      }
      
      private function method_3198(param1:int, param2:int, param3:Boolean) : void
      {
         if(this.var_3575)
         {
            this.name_3178(param1,param2,param3);
            return;
         }
         var _loc4_:int = param2 - name_2596.const_2457 * 1000;
         if(_loc4_ > 0)
         {
            this.var_3575 = true;
            this.var_2293.method_2328(name_2591.name_1308(this.var_2291));
            this.var_3106 = param1 + name_2596.const_2457 * 1000;
            this.var_3573 = _loc4_;
            this.var_3586.addingProgress = this.var_3586.progress;
            this.var_3585 = TweenLite.name_2095(this.var_3586,name_2596.const_2457,{
               "addingProgress":0,
               "onComplete":this.method_3201
            });
         }
      }
      
      private function method_3201() : void
      {
         this.var_3586.addingProgress = 0;
         this.var_2948.method_284(0,1);
         this.var_3575 = false;
      }
      
      private function method_3205() : void
      {
         this.var_2290.alpha = 1;
         this.var_3587 = false;
      }
   }
}
