package alternativa.tanks.utils
{
   public class CircularObjectBuffer
   {
       
      
      private var buffer:Array;
      
      private var var_1675:int;
      
      private var var_1619:int;
      
      public function CircularObjectBuffer(param1:int)
      {
         super();
         this.buffer = new Array(param1 + 1);
      }
      
      public function name_884(param1:Object) : void
      {
         this.buffer[this.var_1675] = param1;
         this.var_1675 = this.incIndex(this.var_1675);
         if(this.var_1619 == this.var_1675)
         {
            this.var_1619 = this.incIndex(this.var_1619);
         }
      }
      
      public function clear() : void
      {
         var _loc1_:int = int(this.buffer.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this.buffer[_loc2_] = null;
            _loc2_++;
         }
         this.var_1675 = 0;
         this.var_1619 = 0;
      }
      
      public function method_141() : Array
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc1_:int = this.var_1675 - this.var_1619;
         if(_loc1_ < 0)
         {
            _loc1_ += this.buffer.length;
         }
         var _loc2_:Array = new Array(_loc1_);
         var _loc3_:int = int(this.buffer.length);
         _loc4_ = 0;
         _loc5_ = this.var_1619;
         while(_loc4_ < _loc1_)
         {
            if(_loc5_ == _loc3_)
            {
               _loc5_ = 0;
            }
            _loc2_[_loc4_] = this.buffer[_loc5_];
            _loc4_++;
            _loc5_++;
         }
         return _loc2_;
      }
      
      private function incIndex(param1:int) : int
      {
         return ++param1 == this.buffer.length ? 0 : param1;
      }
   }
}
