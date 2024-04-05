package package_13
{
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   
   public final class Long
   {
      
      private static var var_194:Dictionary = new Dictionary();
       
      
      private var _low:int;
      
      private var _high:int;
      
      public function Long(param1:int, param2:int)
      {
         super();
         this._high = param1;
         this._low = param2;
      }
      
      public static function getLong(param1:int, param2:int) : Long
      {
         var _loc3_:Long = null;
         var _loc4_:Dictionary = var_194[param2];
         if(_loc4_ != null)
         {
            _loc3_ = _loc4_[param1];
            if(_loc3_ == null)
            {
               _loc3_ = new Long(param1,param2);
               _loc4_[param1] = _loc3_;
            }
         }
         else
         {
            var_194[param2] = new Dictionary();
            _loc3_ = new Long(param1,param2);
            var_194[param2][param1] = _loc3_;
         }
         return _loc3_;
      }
      
      public static function method_268(param1:String) : Long
      {
         var _loc2_:int = param1.length;
         if(_loc2_ <= 8)
         {
            return getLong(0,int("0x" + param1));
         }
         return getLong(int("0x" + param1.substr(0,_loc2_ - 8)),int("0x" + param1.substr(_loc2_ - 8)));
      }
      
      public static function method_270(param1:int) : Long
      {
         if(param1 < 0)
         {
            return getLong(4294967295,param1);
         }
         return getLong(0,param1);
      }
      
      public static function method_271(param1:Long, param2:Long) : int
      {
         if(param1 == param2)
         {
            return 0;
         }
         if(param1.high != param2.high)
         {
            return param1.high < param2.high ? int(int(-1)) : int(int(1));
         }
         if(param1.low != param2.low)
         {
            return param1.low < param2.low ? int(int(-1)) : int(int(1));
         }
         return 0;
      }
      
      public function get low() : int
      {
         return this._low;
      }
      
      public function get high() : int
      {
         return this._high;
      }
      
      final public function toString(param1:uint = 10) : String
      {
         var _loc2_:Array = null;
         var _loc3_:UInt64 = null;
         var _loc4_:uint = 0;
         if(param1 < 2 || param1 > 36)
         {
            throw new ArgumentError();
         }
         switch(this.high)
         {
            case 0:
               return this.low.toString(param1);
            case -1:
               return int(this.low).toString(param1);
            default:
               if(this.low == 0 && this.high == 0)
               {
                  return "0";
               }
               _loc2_ = [];
               _loc3_ = new UInt64(this.low,this.high);
               if(this.high < 0)
               {
                  _loc3_.name_830();
                  _loc3_.add(1);
               }
               do
               {
                  _loc4_ = uint(_loc3_.div(param1));
                  _loc2_.push((_loc4_ < 10 ? "0" : "a").charCodeAt() + _loc4_);
               }
               while(_loc3_.high != 0);
               
               if(this.high < 0)
               {
                  return "-" + _loc3_.low.toString(param1) + String.fromCharCode.apply(String,_loc2_.reverse());
               }
               return _loc3_.low.toString(param1) + String.fromCharCode.apply(String,_loc2_.reverse());
         }
      }
      
      public function method_269(param1:ByteArray = null) : ByteArray
      {
         if(param1 == null)
         {
            param1 = new ByteArray();
         }
         param1.position = 0;
         param1.writeInt(this._high);
         param1.writeInt(this._low);
         param1.position = 0;
         return param1;
      }
      
      private function method_267(param1:int) : String
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         if(param1 >= 0)
         {
            _loc2_ = param1.toString(16);
            _loc3_ = 8 - _loc2_.length;
            while(_loc3_ > 0)
            {
               _loc2_ = "0" + _loc2_;
               _loc3_--;
            }
         }
         else
         {
            _loc2_ = uint(param1).toString(16);
         }
         return _loc2_;
      }
   }
}
