package package_465
{
   public class name_3180
   {
       
      
      private var track:AnimationTrack;
      
      private var var_1869:int;
      
      private var time:Number;
      
      private var var_3592:name_3512;
      
      public function name_3180(param1:AnimationTrack, param2:name_3512)
      {
         super();
         this.track = param1;
         this.var_3592 = param2;
      }
      
      public function start() : void
      {
         this.time = this.track.method_3209();
         this.var_1869 = 0;
      }
      
      public function name_3182() : Boolean
      {
         return this.var_1869 == this.track.name_2313() - 1;
      }
      
      public function update(param1:Number) : void
      {
         if(!this.name_3182())
         {
            this.time += param1;
            while(this.time > this.track.method_3210(this.var_1869 + 1))
            {
               ++this.var_1869;
               if(this.name_3182())
               {
                  this.time = this.track.method_3211();
                  break;
               }
            }
            this.var_3592.name_3513(this.getValue());
         }
      }
      
      private function getValue() : Number
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this.name_3182())
         {
            return this.track.method_3210(this.var_1869);
         }
         _loc1_ = this.track.method_3210(this.var_1869);
         _loc2_ = this.track.method_3210(this.var_1869 + 1);
         _loc3_ = this.track.method_3208(this.var_1869);
         _loc4_ = this.track.method_3208(this.var_1869 + 1);
         return _loc3_ + (_loc4_ - _loc3_) * (this.time - _loc1_) / (_loc2_ - _loc1_);
      }
   }
}
