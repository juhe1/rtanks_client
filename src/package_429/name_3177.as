package package_429
{
   import flash.utils.getTimer;
   import package_430.class_204;
   import package_430.name_2591;
   import package_49.name_163;
   import utils.tweener.TweenLite;
   
   public class name_3177
   {
       
      
      private var var_2948:name_2590;
      
      private var var_3581:Function;
      
      private var var_3583:Function;
      
      private var var_3106:int;
      
      private var var_3573:int;
      
      private var var_3574:Boolean;
      
      private var var_3576:Boolean;
      
      private var var_3584:TweenLite;
      
      private var var_3585:TweenLite;
      
      private var var_3575:Boolean;
      
      private var var_3572:name_3507;
      
      private var var_2293:class_204;
      
      private var var_3579:Number = 1;
      
      private var var_2291:int;
      
      private var var_3578:* = 0;
      
      private var var_3577:* = 0;
      
      private var var_3582:* = 0;
      
      private var var_3580:* = 0;
      
      public function name_3177(param1:int, param2:name_2590, param3:class_204, param4:Function, param5:Function)
      {
         this.var_3572 = new name_3507();
         super();
         this.var_2948 = param2;
         this.var_2291 = param1;
         this.var_2293 = param3;
         this.var_3581 = param4;
         this.var_3583 = param5;
      }
      
      public function update(param1:int, param2:Number) : void
      {
         this.var_3579 = param2;
         if(!this.var_3574)
         {
            return;
         }
         if(this.var_3576)
         {
            return;
         }
         if(this.var_3575)
         {
            return;
         }
         if(param1 >= this.var_3106)
         {
            this.var_3572.progress = this.method_3202(param1);
            this.var_3580 = param1;
            this.var_3582 = this.var_3572.progress;
            if(this.var_3572.progress > 1)
            {
               this.var_3572.progress = 1;
               this.finish();
            }
         }
         this.method_284(this.var_3572.progress,param2);
      }
      
      private function method_284(param1:Number, param2:Number) : void
      {
         if(param1 < param2)
         {
            this.var_2948.method_284(param1,param2);
         }
         else
         {
            this.var_2948.method_284(0,0);
         }
      }
      
      public function finish() : void
      {
         this.var_3574 = false;
         this.var_3106 = -1;
         this.var_2948.method_284(0,0);
         this.var_3581.apply();
         this.var_3578 = 0;
         this.var_3577 = 0;
      }
      
      private function method_3202(param1:int) : Number
      {
         if(this.var_3578 != 0)
         {
            return (param1 - this.var_3578) * (1 - this.var_3577) / this.var_3573 + this.var_3577;
         }
         return (param1 - this.var_3106) / this.var_3573;
      }
      
      public function get name_1399() : Boolean
      {
         return this.var_3574;
      }
      
      public function method_3203() : Boolean
      {
         return this.var_3572.progress != 0;
      }
      
      public function destroy() : void
      {
         if(this.var_3574)
         {
            this.var_3574 = false;
            this.var_3576 = false;
            this.var_3575 = false;
            this.var_3106 = -1;
            this.var_2948.method_284(0,0);
            this.var_3578 = 0;
            this.var_3577 = 0;
            TweenLite.method_2603(this.var_3572);
         }
      }
      
      public function activate(param1:int, param2:int, param3:Boolean, param4:Boolean) : void
      {
         if(param2 <= 0)
         {
            return;
         }
         this.var_3574 = true;
         this.var_3106 = param1;
         this.var_3573 = param2;
         this.var_3578 = 0;
         this.var_3577 = 0;
         this.method_3196(param3,param4);
      }
      
      private function method_3196(param1:Boolean, param2:Boolean) : void
      {
         if(this.var_3576)
         {
            return;
         }
         this.var_3576 = true;
         if(!param1)
         {
            if(this.method_3197() && !param2)
            {
               this.var_2293.method_2328(name_2591.name_1308(this.var_2291));
            }
            else
            {
               this.var_2293.method_2328(name_2591.const_2374);
            }
         }
         this.var_3572.progress = 0;
         this.var_3572.fillProgress = 1;
         this.var_2948.method_284(this.var_3572.fillProgress,1);
         this.var_3584 = TweenLite.name_2095(this.var_3572,name_2596.const_2458,{
            "fillProgress":0,
            "onComplete":this.method_3199
         });
      }
      
      private function method_3197() : Boolean
      {
         return this.var_2291 == name_163.MINE || this.var_2291 == name_163.const_110;
      }
      
      private function method_3199() : void
      {
         this.var_3572.fillProgress = 0;
         this.method_284(0,this.var_3579);
         this.var_3583.apply();
         this.var_3576 = false;
      }
      
      public function name_3178(param1:int, param2:int, param3:Boolean, param4:Boolean) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         if(this.var_3574)
         {
            _loc5_ = this.method_3200();
            _loc6_ = param2 - _loc5_;
            if(_loc6_ > name_2596.const_2456)
            {
               if(this.var_3576 || this.var_3575)
               {
                  if(this.var_3576)
                  {
                     _loc7_ = param2 - (_loc5_ + name_2596.const_2458 * 1000);
                  }
                  if(this.var_3575)
                  {
                     _loc7_ = param2 - (_loc5_ + name_2596.const_2457 * 1000);
                  }
                  if(_loc7_ > name_2596.const_2456)
                  {
                     this.var_3573 += _loc7_;
                  }
               }
               else
               {
                  this.method_3198(param1,param2,param3,param4);
               }
            }
         }
         else
         {
            _loc8_ = param1 + name_2596.const_2458 * 1000;
            _loc9_ = param2 - name_2596.const_2458 * 1000;
            this.activate(_loc8_,_loc9_,param3,param4);
         }
      }
      
      public function method_2917() : void
      {
         this.var_3574 = true;
         this.var_3106 = 0;
         this.var_3573 = int.MAX_VALUE;
         this.method_3196(true,false);
      }
      
      public function method_2921(param1:int) : *
      {
         this.var_3578 = this.var_3580;
         this.var_3577 = this.var_3582;
         this.var_3573 = param1;
         this.var_3106 = this.var_3580;
      }
      
      public function method_3204(param1:int) : void
      {
         this.destroy();
         this.activate(param1,this.var_3573,false,false);
      }
      
      private function method_3198(param1:int, param2:int, param3:Boolean, param4:Boolean) : void
      {
         if(this.var_3575)
         {
            this.name_3178(param1,param2,param3,param4);
            return;
         }
         var _loc5_:int = param2 - name_2596.const_2457 * 1000;
         if(_loc5_ > name_2596.const_2456)
         {
            this.var_3575 = true;
            if(!param3)
            {
               this.var_2293.method_2328(name_2591.const_2374);
            }
            this.var_3106 = param1 + name_2596.const_2457 * 1000;
            this.var_3573 = _loc5_;
            this.var_3572.addingProgress = this.var_3572.progress;
            this.var_3585 = TweenLite.name_2095(this.var_3572,name_2596.const_2457,{
               "addingProgress":0,
               "onComplete":this.method_3201
            });
         }
      }
      
      private function method_3201() : void
      {
         this.var_3572.addingProgress = 0;
         this.method_284(0,this.var_3579);
         this.var_3575 = false;
      }
      
      private function method_3200() : int
      {
         if(this.var_3573 == 0 || this.var_3106 == -1)
         {
            return 0;
         }
         return this.var_3573 - (getTimer() - this.var_3106);
      }
      
      public function name_3179(param1:Boolean) : void
      {
         this.var_2948.visible = param1;
      }
   }
}
