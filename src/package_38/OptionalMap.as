package package_38
{
   import flash.utils.ByteArray;
   
   public class OptionalMap
   {
       
      
      private var name_962:int;
      
      private var size:int;
      
      private var map:ByteArray;
      
      public function OptionalMap(param1:int = 0, param2:ByteArray = null)
      {
         super();
         this.init(param1,param2);
      }
      
      public function method_1918() : int
      {
         return this.name_962;
      }
      
      public function method_1917(param1:int) : void
      {
         this.name_962 = param1;
      }
      
      public function reset() : void
      {
         this.name_962 = 0;
      }
      
      public function init(param1:int = 0, param2:ByteArray = null) : void
      {
         this.map = param2;
         if(param2 == null)
         {
            this.map = new ByteArray();
         }
         else
         {
            this.map.position = 0;
         }
         this.size = param1;
         this.name_962 = 0;
      }
      
      public function clear() : void
      {
         this.size = 0;
         this.name_962 = 0;
      }
      
      public function method_1916(param1:Boolean) : void
      {
         this.name_2080(this.size,param1);
         ++this.size;
      }
      
      public function method_1915() : Boolean
      {
         return this.name_962 < this.size;
      }
      
      public function name_1621() : Boolean
      {
         if(this.name_962 >= this.size)
         {
            throw new Error("Index out of bounds: " + this.name_962);
         }
         var _loc1_:Boolean = this.name_2079(this.name_962);
         ++this.name_962;
         return _loc1_;
      }
      
      public function method_1914() : ByteArray
      {
         return this.map;
      }
      
      public function getSize() : int
      {
         return this.size;
      }
      
      private function name_2079(param1:int) : Boolean
      {
         var _loc2_:int = param1 >> 3;
         var _loc3_:int = 7 ^ param1 & 7;
         this.map.position = _loc2_;
         return (this.map.readByte() & 1 << _loc3_) != 0;
      }
      
      private function name_2080(param1:int, param2:Boolean) : void
      {
         var _loc3_:int = param1 >> 3;
         var _loc4_:int = 7 ^ param1 & 7;
         this.map.position = _loc3_;
         if(param2)
         {
            this.map.writeByte(int(this.map[_loc3_] | 1 << _loc4_));
         }
         else
         {
            this.map.writeByte(int(this.map[_loc3_] & (255 ^ 1 << _loc4_)));
         }
      }
      
      private function method_1913(param1:int) : int
      {
         var _loc2_:int = param1 >> 3;
         var _loc3_:int = (param1 & 7) == 0 ? int(0) : int(1);
         return _loc2_ + _loc3_;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "readPosition: " + this.name_962 + " size:" + this.getSize() + " mask:";
         var _loc2_:int = this.name_962;
         var _loc3_:int = this.name_962;
         while(_loc3_ < this.getSize())
         {
            _loc1_ += this.name_1621() ? "1" : "0";
            _loc3_++;
         }
         this.name_962 = _loc2_;
         return _loc1_;
      }
      
      public function clone() : OptionalMap
      {
         var _loc1_:ByteArray = new ByteArray();
         _loc1_.writeBytes(this.map,0,this.method_1913(this.size));
         var _loc2_:OptionalMap = new OptionalMap(this.size,_loc1_);
         _loc2_.name_962 = this.name_962;
         return _loc2_;
      }
   }
}
