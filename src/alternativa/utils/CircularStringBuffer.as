package alternativa.utils
{
   public class CircularStringBuffer implements name_827
   {
       
      
      public var const_387:Vector.<String>;
      
      public var var_1619:int;
      
      public var var_1618:int;
      
      private var var_1620:int;
      
      public function CircularStringBuffer(param1:int)
      {
         super();
         this.var_1620 = param1;
         this.const_387 = new Vector.<String>(this.var_1620 + 1);
      }
      
      public function add(param1:String) : void
      {
         this.const_387[this.var_1618] = param1;
         this.var_1618 = this.incIndex(this.var_1618);
         if(this.var_1618 == this.var_1619)
         {
            this.var_1619 = this.incIndex(this.var_1619);
         }
      }
      
      public function clear() : void
      {
         this.var_1619 = 0;
         this.var_1618 = 0;
         var _loc1_:int = int(this.const_387.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this.const_387[_loc2_] = null;
            _loc2_++;
         }
      }
      
      public function get size() : int
      {
         var _loc1_:int = this.var_1618 - this.var_1619;
         if(_loc1_ < 0)
         {
            _loc1_ += this.const_387.length;
         }
         return _loc1_;
      }
      
      public function get capacity() : int
      {
         return this.var_1620;
      }
      
      public function method_1793() : Vector.<String>
      {
         var _loc1_:Vector.<String> = new Vector.<String>();
         var _loc2_:int = this.var_1619;
         while(_loc2_ != this.var_1618)
         {
            _loc1_.push(this.const_387[_loc2_]);
            _loc2_ = this.incIndex(_loc2_);
         }
         return _loc1_;
      }
      
      public function set capacity(param1:int) : void
      {
         throw new Error("Unimplemented");
      }
      
      public function name_825(param1:int) : name_824
      {
         return new Iterator(this,param1);
      }
      
      private function incIndex(param1:int) : int
      {
         return ++param1 >= this.const_387.length ? int(int(0)) : int(int(param1));
      }
   }
}

import alternativa.utils.CircularStringBuffer;
import alternativa.utils.name_824;

class Iterator implements name_824
{
    
   
   private var buffer:CircularStringBuffer;
   
   private var index:int;
   
   public function Iterator(param1:CircularStringBuffer, param2:int)
   {
      super();
      if(param2 < 0 || param2 > param1.size)
      {
         throw new Error("Index " + param2 + " is out of range [0, " + param1.size + "]");
      }
      this.buffer = param1;
      var _loc3_:uint = param1.const_387.length;
      this.index = param1.var_1619 + param2 - 1;
      if(this.index < 0)
      {
         this.index = _loc3_ - 1;
      }
      if(this.index >= _loc3_)
      {
         this.index -= _loc3_;
      }
   }
   
   public function hasNext() : Boolean
   {
      return this.incIndex(this.index) != this.buffer.var_1618;
   }
   
   public function getNext() : String
   {
      this.index = this.incIndex(this.index);
      if(this.index == this.buffer.var_1618)
      {
         throw new Error("End of buffer");
      }
      return this.buffer.const_387[this.index];
   }
   
   private function incIndex(param1:int) : int
   {
      return ++param1 >= this.buffer.const_387.length ? int(int(0)) : int(int(param1));
   }
}
