package package_293
{
   public class CTFScoreIndicatorBlinker
   {
       
      
      public var method_393:Vector.<Number>;
      
      private var maxValue:Number;
      
      private var minValue:Number;
      
      private var var_3550:Vector.<int>;
      
      private var var_3554:Vector.<Number>;
      
      private var var_3551:int;
      
      private var speeds:Vector.<Number>;
      
      private var var_3553:Vector.<int>;
      
      private var var_3065:Number;
      
      private var var_3552:int = 0;
      
      public function CTFScoreIndicatorBlinker(param1:Number, param2:Number, param3:Vector.<int>, param4:Vector.<Number>)
      {
         super();
         this.minValue = param1;
         this.maxValue = param2;
         this.var_3550 = param3;
         this.var_3554 = param4;
         this.var_3065 = param2 - param1;
         this.var_3551 = param3.length;
         this.speeds = new Vector.<Number>(this.var_3551);
         this.var_3553 = new Vector.<int>(this.var_3551);
         this.method_393 = new Vector.<Number>(this.var_3551);
      }
      
      public function start(param1:int) : void
      {
         if(this.var_3552 == 0)
         {
            this.init(param1);
         }
         ++this.var_3552;
      }
      
      public function stop() : void
      {
         --this.var_3552;
      }
      
      public function update(param1:int, param2:int) : void
      {
         if(this.var_3552 <= 0)
         {
            return;
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.var_3551)
         {
            this.method_393[_loc3_] += this.speeds[_loc3_] * param2;
            if(this.method_393[_loc3_] > this.maxValue)
            {
               this.method_393[_loc3_] = this.maxValue;
            }
            if(this.method_393[_loc3_] < this.minValue)
            {
               this.method_393[_loc3_] = this.minValue;
            }
            if(param1 >= this.var_3553[_loc3_])
            {
               this.var_3553[_loc3_] += this.var_3550[_loc3_];
               if(this.speeds[_loc3_] < 0)
               {
                  this.speeds[_loc3_] = this.method_2836(1,this.var_3554[_loc3_],this.var_3550[_loc3_]);
               }
               else
               {
                  this.speeds[_loc3_] = this.method_2836(-1,this.var_3554[_loc3_],this.var_3550[_loc3_]);
               }
            }
            _loc3_++;
         }
      }
      
      private function init(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.var_3551)
         {
            this.speeds[_loc2_] = this.method_2836(-1,this.var_3554[_loc2_],this.var_3550[_loc2_]);
            this.method_393[_loc2_] = this.maxValue;
            this.var_3553[_loc2_] = param1 + this.var_3550[_loc2_];
            _loc2_++;
         }
      }
      
      private function method_2836(param1:Number, param2:Number, param3:int) : Number
      {
         return param1 * param2 * this.var_3065 / param3;
      }
   }
}
