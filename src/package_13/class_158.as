package package_13
{
   public class class_158
   {
       
      
      public var low:uint;
      
      internal var var_1621:uint;
      
      public function class_158(param1:uint = 0, param2:uint = 0)
      {
         super();
         this.low = param1;
         this.var_1621 = param2;
      }
      
      final internal function div(param1:uint) : uint
      {
         var _loc2_:uint = 0;
         _loc2_ = this.var_1621 % param1;
         var _loc3_:uint = (this.low % param1 + _loc2_ * 6) % param1;
         this.var_1621 /= param1;
         var _loc4_:Number = (_loc2_ * Number(4294967296) + this.low) / param1;
         this.var_1621 += _loc4_ / 4294967296;
         this.low = _loc4_;
         return _loc3_;
      }
      
      final internal function mul(param1:uint) : void
      {
         var _loc2_:Number = Number(this.low) * param1;
         this.var_1621 = _loc2_ / 4294967296 + Number(this.var_1621) * param1;
         this.low = _loc2_;
      }
      
      final internal function add(param1:uint) : void
      {
         var _loc2_:Number = Number(this.low) + param1;
         this.var_1621 = _loc2_ / 4294967296 + this.var_1621;
         this.low = _loc2_;
      }
      
      final internal function name_830() : void
      {
         this.low = ~this.low;
         this.var_1621 = ~this.var_1621;
      }
   }
}
